// --------------------------------------------------------------------------------------
// Objective(lt): Pirmoje failo eilutėje nurodytas futbolo komandų skaičius. 
// Tolesnėse eilutėse pateikta informacija apie futbolo komandas: pavadinimas, miestas, 
// trenerio pavardė, vardas. Žemiau pateikta I rato rezultatų lentelė, išreikšta pelnytais
// įvarčiais. Suskaičiuokite kiekvienos komandos surinktų taškų skaičių, jei už pergalę 
// skiriami 3 taškai, o už lygiąsias – 1 taškas. Sudarykite komandų turnyrinę 
// lentelę – surikiuokite surinktų taškų mažėjimo tvarka. Jei komandos surinko taškų 
// vienodai, aukščiau ta komanda, kuri turi daugiau pergalių. Suraskite daugiausiai 
// įvarčių pelniusią komandą. Suraskite komandas, kurios daugiausiai rungtynių nepraleido
// įvarčių. 
// --------------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace lab6
{
    /// <summary>
    /// Class to write Team's data
    /// </summary>
    class Team
    {
        private string team,    // team's name
                       city,    // team's city
                       surname, // surname of the coach
                       name;    // name of the coach
        /// <summary>
        /// Constructor with parameters
        /// </summary>
        /// <param name="team">new team's name value</param>
        /// <param name="city">new team's city value</param>
        /// <param name="surname">new surname of the coach value</param>
        /// <param name="name">new name of the coach value</param>
        public Team(string team, string city, string surname,
                string name)
        {
            this.team = team;
            this.city = city;
            this.surname = surname;
            this.name = name;
        }

        /// <summary>
        /// returns team's name
        /// </summary>
        /// <returns>string</returns>
        public string TakeTeam() 
        { 
            return team; 
        }

        /// <summary>
        /// returns city's name
        /// </summary>
        /// <returns>string</returns>
        public string TakeCity() 
        { 
            return city; 
        }

        /// <summary>
        /// return coach's surname
        /// </summary>
        /// <returns>string</returns>
        public string TakeSurname() 
        { 
            return surname; 
        }

        /// <summary>
        /// returns coach's name
        /// </summary>
        /// <returns>string</returns>
        public string TakeName() 
        { 
            return name; 
        }
    }
    
    /// <summary>
    /// Class for saving matrix data
    /// </summary>
    class Matrix
    {
        const int CMaxEil = 10; // the max number of lines
        const int CMaxSt = 10;  // the max number of collums
        private int[,] A;       // data matrix
        public int n { get; set; } // line number
        public int m { get; set; } // collum number

        public Matrix()
        {
            n = 0;
            m = 0;
            A = new int[CMaxEil, CMaxSt];
        }

        /// <summary>
        /// Assigns the matrix value 
        /// </summary>
        /// <param name="i">line index</param>
        /// <param name="j">collum index</param>
        /// <param name="goal">the team's goal number</param>
        public void Put(int i, int j, int goal)
        {
            A[i, j] = goal;
        }

        /// <summary>
        /// return the matrix value
        /// </summary>
        /// <param name="i">line index</param>
        /// <param name="j">collum index</param>
        /// <returns>goal number</returns>
        public int TakeValue(int i, int j)
        {
            return A[i, j];
        }
    }

    /// <summary>
    ///  Class for caculations purposes
    /// </summary>
    internal class Program
    {

        const string CFd = "Data.txt";      /// data file name
        const string CFr = "Results.txt";   /// result file name
        const int CMax = 12;       

        static void Main(string[] args)
        {
            Team[] group = new Team[CMax];    // group object array
            Team[] groupB = new Team[CMax];   // a copy of group object array
            Team[] groupA = new Team[CMax];   // a temporary array for sorting purposes

            Matrix goals = new Matrix();            // a matrix object goals array
            int[] points = new int[CMax];           // a int object array for saving points 
            int[] number_of_goals = new int[CMax];  // a int object array for saving the number of goals 
            Read(CFd, group, ref goals);
            Print(CFr, group, goals);
            Format(group, groupB, goals);
            PointSum(goals, points, number_of_goals);
            Sort(goals, points, groupB, groupA);
            string cover =   " --------------------------------\r\n"
                + " Team                      points\r\n"
                + " --------------------------------";
            Console.WriteLine("");
            Console.WriteLine(" Team sorted by points");
            Console.WriteLine(cover);
            for (int k=0; k < goals.n; k++)
            {
                Console.WriteLine(" {0,-14} {1,16}",groupB[k].TakeTeam() ,points[k]);
            }
            int index = Team_who_scored_the_most(goals,number_of_goals);

            Console.WriteLine();
            Console.WriteLine(" The highest score is from {0} {1} points",groupB[index].TakeTeam() ,points[index]);
            Console.WriteLine();
            Console.WriteLine(" Teams who didnt missed the goals the most");
            string cover2 =   " --------------------------\r\n"
                + " Team                Goals\r\n"
                + " --------------------------";
            Console.WriteLine(cover2);
            Teams_who_didnt_missed(goals, group);
        }
        
        /// <summary>
        /// Copys one group's object set to groupB
        /// </summary>
        /// <param name="group">a object set for saving team's data</param>
        /// <param name="groupB">a copy of group's object set</param>
        /// <param name="goals">using class Matrix for the number of teams there are</param>
        static void Format(Team[] group,Team[] groupB, Matrix goals)
        {
            for  (int i = 0; i < goals.n; i++)
            {
                groupB[i] = group[i];
            }
        }
        /// <summary>
        /// Prints the teams who didn't missed the most
        /// </summary>
        /// <param name="goals">object set of team's goals</param>
        /// <param name="group">team's object set</param>
        static void Teams_who_didnt_missed(Matrix goals, Team[] group)
        {
            for  (int i = 0; i < goals.n; i++)
            {
                if(goals.TakeValue(i, 0) > 0 && goals.TakeValue(i, 1) > 0)
                {
                    Console.WriteLine(" {0,-17} {1,3} {2,3}",group[i].TakeTeam() ,goals.TakeValue(i, 0),goals.TakeValue(i, 1));
                }
            }
        }

        /// <summary>
        /// Sums the teams points and goals to an array
        /// </summary>
        /// <param name="goals">object set of team's goals</param>
        /// <param name="Komandos_points">object array of team's total points</param>
        /// <param name="number_of_goals">object array of team's total goals</param>
        static void PointSum(Matrix goals, int[] Komandos_points, int[] number_of_goals)
        {
            for  (int i = 0; i < goals.n; i++)
            {
                Komandos_points[i] = goals.TakeValue(i, 0) * 3 + goals.TakeValue(i, 1);
                number_of_goals[i] = goals.TakeValue(i, 0) + goals.TakeValue(i, 1);
            }
        }

        /// <summary>
        /// Finds the index of a team who did the most goals
        /// </summary>
        /// <param name="goals">object set of team's goals</param>
        /// <param name="number_of_goals">object array of team's total goals</param>
        /// <returns>index number</returns>
        static int Team_who_scored_the_most(Matrix goals,int[] number_of_goals){

            int max_goal = number_of_goals[0];
            int index = 0;
            for (int i=1; i < goals.n; i++)
            {
                if (number_of_goals[i] > max_goal){
                    max_goal = number_of_goals[i];
                    index = i;
                }
            }
            return index;

        }

        /// <summary>
        /// Sorts teams points via desending order
        /// </summary>
        /// <param name="goals">object set of team's goals</param>
        /// <param name="Komandos_points">Team's overall points</param>
        /// <param name="group">team's object set</param>
        /// <param name="groupA">a temporary object set</param>
        static void Sort(Matrix goals, int[] Komandos_points, Team[] group, Team[] groupA)
        {
            for (int i=0; i < goals.n - 1; i++)
            {
                for (int j=i; j < goals.n; j++)
                {
                    if(Komandos_points[i] < Komandos_points[j])
                    {
                        int temp=Komandos_points[i];
                        Komandos_points[i] = Komandos_points[j];
                        Komandos_points[j] = temp;

                        groupA[i] = group[i];
                        group[i] = group[j];
                        group[j] = groupA[i];

                    }
                    else if (Komandos_points[i] == Komandos_points[j])
                    {
                        if(goals.TakeValue(i, 0) < goals.TakeValue(j, 0))
                        {
                            groupA[i] = group[i];
                            group[i] = group[j];
                            group[j] = groupA[i];
                        }
                    }

                }
            }
        }
        
        /// <summary>
        /// Reads the data from a file
        /// </summary>
        /// <param name="failoVrd">data name of the file</param>
        /// <param name="group">a object set for saving team's data</param>
        /// <param name="goals">object set of team's goals</param>
        static void Read(string failoVrd, Team[] group, ref Matrix goals)
        {

            int nn, goal;
            string team,
                   city,
                   surname,
                   name;

            using (StreamReader reader = new StreamReader(failoVrd))
            {
                nn = int.Parse(reader.ReadLine());
                goals.n = nn;
                goals.m = 2;
                for (int i =0; i < nn; i++)
                {
                    string[] dalys = reader.ReadLine().Split(';');
                    team = dalys[0];
                    city = dalys[1];
                    surname = dalys[2];
                    name = dalys[3];
                    group[i] = new Team(team, city, surname, name);
                }
                for (int i = 0; i < nn; i++)
                {
                    string[] dalys = reader.ReadLine().Split(';');
                    for (int j = 0; j < 2; j++)
                    {
                        goal = int.Parse(dalys[j]);
                        goals.Put(i, j, goal);
                    }
                }
            }
        }

        /// <summary>
        /// Prints the results on console
        /// </summary>
        /// <param name="fv">remove this</param>
        /// <param name="group">team's object set</param>
        /// <param name="goals">object set of team's goals</param>
        static void Print(string fv, Team[] group, Matrix goals)
        {

            using (var fr = File.AppendText(fv))
            {

                string cover1 = " ------------------------------------------------------------------------ \r\n"
                    + " team                  city                surname              name     \r\n"
                    + " ------------------------------------------------------------------------";

                string cover2 = " I round results \r\n"
                    + " ----------------------------------------------------------------- \r\n"
                    + " team                 winning score                 even score\r\n"
                    + " -----------------------------------------------------------------";

                Console.WriteLine(" Teams: {0}", goals.n);
                Console.WriteLine(cover1);
                for (int i = 0; i < goals.n; i++)
                {
                    Console.WriteLine(" {0,-20} {1,-19} {2,-20} {3,-7}",group[i].TakeTeam(),group[i].TakeCity(),group[i].TakeSurname(),group[i].TakeName());
                }
                Console.WriteLine();
                Console.WriteLine(cover2);
                for (int i = 0; i < goals.n; i++)
                {
                    Console.WriteLine(" {0,-20} {1,6} {2,28}",group[i].TakeTeam() , goals.TakeValue(i, 0),goals.TakeValue(i, 1));
                }

            }

        }
    }
}
