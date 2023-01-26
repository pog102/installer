// --------------------------------------------------------------------------------------
// Objective(lt): 
// --------------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;


namespace lab6
{
    class Komanda
    {
        private string komanda,
                miestas,
                pavarde,
                vardas;

        public Komanda(string komanda, string miestas, string pavarde,
                string vardas)
        {
            this.komanda = komanda;
            this.miestas = miestas;
            this.pavarde = pavarde;
            this.vardas = vardas;
        }
        public string ImtiKomanda() { return komanda; }
        public string ImtiMiestas() { return miestas; }
        public string ImtiPavarde() { return pavarde; }
        public string ImtiVarda() { return vardas; }


    }

    class Matrica
    {
        const int CMaxEil = 10;
        const int CMaxSt = 100;
        private int[,] A;
        public int n { get; set; } // eilučių skaičius (kasų skaičius)
        public int m { get; set; }
        public Matrica()
        {
            n = 0;
            m = 0;
            A = new int[CMaxEil, CMaxSt];
        }
        public void Deti(int i, int j, int pirk)
        {
            A[i, j] = pirk;
        }
        public int ImtiReiksme(int i, int j)
        {
            return A[i, j];
        }
    }
    /// <summary>
    /// Program class for caculations purposes
    /// </summary>
    internal class Program
    {

        const string CFd = "Data.txt";
        const string CFr = "Results.txt";
        const int CMax = 12;                         // maksimalus krepšininko skaičius grupėje

        static void Main(string[] args)
        {
            Komanda[] grupe = new Komanda[CMax];
            Komanda[] grupe_copy = new Komanda[CMax];
            Komanda[] grupeA = new Komanda[CMax];

            Matrica ivarciai = new Matrica();
            int[] taskai = new int[CMax];
            int[] kiek_ivarciu = new int[CMax];
            Skaityti(CFd, grupe, ref ivarciai);
            Spausdinti(CFr, grupe, ivarciai);
            Formuoti(grupe, grupe_copy, ivarciai);
            TaskuSuma(ivarciai, taskai, kiek_ivarciu);
            Surikiuoti(ivarciai, taskai, grupe_copy, grupeA);
            string virselis =   " --------------------------------\r\n"
                + " Komanda                   taskai\r\n"
                + " --------------------------------";
            Console.WriteLine("");
            Console.WriteLine(" Surikiuota komanda");
            Console.WriteLine(virselis);
            for (int k=0; k < ivarciai.n; k++)
            {
                Console.WriteLine(" {0,-14} {1,16}",grupe_copy[k].ImtiKomanda() ,taskai[k]);
            }
            int jo = Pelniausia_Komanda(ivarciai,kiek_ivarciu);

            Console.WriteLine();
            Console.WriteLine(" Pelningiausia komanda yra {0} {1} tasku",grupe_copy[jo].ImtiKomanda() ,taskai[jo]);
            Console.WriteLine();
            Console.WriteLine(" Komandos kurios nepraleido ivarciu");
            string virselis2 =   " --------------------------\r\n"
                + " Komanda           Ivarciai\r\n"
                + " --------------------------";
            Console.WriteLine(virselis2);
            Daugiausia_nepraleido(ivarciai, grupe);
        }
        
        static void Formuoti(Komanda[] grupe,Komanda[] grupe_copy, Matrica ivarciai)
        {
            for  (int i = 0; i < ivarciai.n; i++)
            {
                grupe_copy[i] = grupe[i];
            }
        }
        static void Daugiausia_nepraleido(Matrica ivarciai, Komanda[] grupe)
        {
            for  (int i = 0; i < ivarciai.n; i++)
            {
                if(ivarciai.ImtiReiksme(i, 0) > 0 && ivarciai.ImtiReiksme(i, 1) > 0)
                {
                    Console.WriteLine(" {0,-17} {1,3} {2,3}",grupe[i].ImtiKomanda() ,ivarciai.ImtiReiksme(i, 0),ivarciai.ImtiReiksme(i, 1));
                }
            }
        }
        static void TaskuSuma(Matrica ivarciai, int[] Komandos_taskai, int[] kiek_ivarciu)
        {
            for  (int i = 0; i < ivarciai.n; i++)
            {
                Komandos_taskai[i] = ivarciai.ImtiReiksme(i, 0) * 3 + ivarciai.ImtiReiksme(i, 1);
                kiek_ivarciu[i] = ivarciai.ImtiReiksme(i, 0) + ivarciai.ImtiReiksme(i, 1);
            }
        }
        static int Pelniausia_Komanda(Matrica ivarciai,int[] kiek_ivarciu){

            int max_skaic = kiek_ivarciu[0];
            int index = 0;
            for (int i=1; i < ivarciai.n; i++)
            {
                if (kiek_ivarciu[i] > max_skaic){
                    max_skaic = kiek_ivarciu[i];
                    index = i;
                }
            }
            return index;

        }

        static void Surikiuoti(Matrica ivarciai, int[] Komandos_taskai, Komanda[] grupe, Komanda[] grupeA)
        {
            for (int i=0; i < ivarciai.n - 1; i++)
            {
                for (int j=i; j < ivarciai.n; j++)
                {
                    if(Komandos_taskai[i] < Komandos_taskai[j])
                    {
                        int temp=Komandos_taskai[i];
                        Komandos_taskai[i] = Komandos_taskai[j];
                        Komandos_taskai[j] = temp;

                        grupeA[i] = grupe[i];
                        grupe[i] = grupe[j];
                        grupe[j] = grupeA[i];

                    }
                    else if (Komandos_taskai[i] == Komandos_taskai[j])
                    {
                        if(ivarciai.ImtiReiksme(i, 0) < ivarciai.ImtiReiksme(j, 0))
                        {
                            grupeA[i] = grupe[i];
                            grupe[i] = grupe[j];
                            grupe[j] = grupeA[i];
                        }
                    }

                }
            }
        }

        static void Skaityti(string failoVrd, Komanda[] grupe, ref Matrica ivarciai)
        {

            int nn, skaic;
            string komanda,
                   miestas,
                   pavarde,
                   vardas;

            using (StreamReader srautas = new StreamReader(failoVrd))
            {
                nn = int.Parse(srautas.ReadLine());
                ivarciai.n = nn;
                ivarciai.m = 2;
                for (int i =0; i < nn; i++)
                {
                    string[] dalys = srautas.ReadLine().Split(';');
                    komanda = dalys[0];
                    miestas = dalys[1];
                    pavarde = dalys[2];
                    vardas = dalys[3];
                    grupe[i] = new Komanda(komanda, miestas, pavarde, vardas);
                }
                for (int i = 0; i < nn; i++)
                {
                    string[] dalys = srautas.ReadLine().Split(';');
                    for (int j = 0; j < 2; j++)
                    {
                        skaic = int.Parse(dalys[j]);
                        ivarciai.Deti(i, j, skaic);
                    }
                }
            }
        }

        static void Spausdinti(string fv, Komanda[] grupe, Matrica ivarciai)
        {

            using (var fr = File.AppendText(fv))
            {

                string virsus1 = " ------------------------------------------------------------------------ \r\n"
                    + " Komanda               Miestas             Pavarde              Varas     \r\n"
                    + " ------------------------------------------------------------------------";

                string virsus2 = " I rato rezultatai \r\n"
                    + " ----------------------------------------------------------------- \r\n"
                    + " Komanda           Pergales skaicius            Lygiasias skaicius\r\n"
                    + " -----------------------------------------------------------------";

                Console.WriteLine(" Komandu skaicius {0}", ivarciai.n);
                Console.WriteLine(virsus1);
                for (int i = 0; i < ivarciai.n; i++)
                {
                    Console.WriteLine(" {0,-20} {1,-19} {2,-20} {3,-7}",grupe[i].ImtiKomanda(),grupe[i].ImtiMiestas(),grupe[i].ImtiPavarde(),grupe[i].ImtiVarda());
                }
                Console.WriteLine();
                Console.WriteLine(virsus2);
                for (int i = 0; i < ivarciai.n; i++)
                {
                    Console.WriteLine(" {0,-20} {1,6} {2,28}",grupe[i].ImtiKomanda() , ivarciai.ImtiReiksme(i, 0),ivarciai.ImtiReiksme(i, 1));
                }

            }

        }
    }
}
