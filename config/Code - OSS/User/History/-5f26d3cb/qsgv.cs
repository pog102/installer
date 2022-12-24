//-----------------------------------------------------------------------------------------------------------
//UŽDUOTIS
//Norėdamas palyginti mobiliojo ryšio operatorių siūlomas išankstinio mokėjimo korteles Sirvydas
//surinko šią informaciją į tekstinį failą. Faile eilutėmis yra kortelių duomenys: kortelės (tinklo)
//pavadinimas, pradinė suma kortelėje, tarifas savame tinkle, tarifas į kitus tinklus, SMS žinučių tarifas
//savame tinkle ir į kitus tinklus. Parašykite programą, kuri spausdintų kortelių duomenis lentele, surastų
//kortelę, kurios SMS žinučių tarifai į kitus tinklus mažiausi. Papildykite programą veiksmais, kurie leistų
//atrinkti korteles, kurios leidžia skambinti ir siųsti SMS žinutes savame tinkle nemokamai, ir šį sąrašą
//surikiuoti pagal pradinę sumą mažėjimo tvarka ir kortelės pavadinimą abėcėliškai.
//-----------------------------------------------------------------------------------------------------------

using System;
//-----------------------------------------------
using System.IO;

namespace Project
{
    /// <summary>
    /// Klasė Mobilasis duomenims aprašyti
    /// </summary>
    class Mobilasis
    {
        private string kort_pavad; // kortelės pavadinimas
        private int prad_sum,       // pradinė suma kortelėje
                tarifas_sav_tinkle, // tarifas savame tinkle
                tarifas_kitur, // tarifas į kitus tinklus
                sms_tarifas, // SMS žinučių tarifas savame tinkle
                sms_tarif_kit; // SMS žinučių tarifas į kitus tinklus
        /// <summary>
        /// Pradiniai Kortelės duomenys
        /// </summary>
        public Mobilasis()
        {
            kort_pavad = "";
            prad_sum = 2000;
            tarifas_sav_tinkle = 222;
            tarifas_kitur = 120;
            sms_tarifas = 112;
            sms_tarif_kit = 133;

        }
        /// <summary>
        /// Kortelės duomenų įrašymas
        /// </summary>
        /// <param name="kort_pavad">nauja kortelės pavadinimo reikšmė</param>
        /// <param name="prad_sum">nauja pradinės sumos reikšmė</param>
        /// <param name="tarifas_sav_tinkle">nauja tarifo savamo tinklo reikšmė</param>
        /// <param name="tarifas_kitur">nauja tarifo į kitus tinklus reikšmė</param>
        /// <param name="sms_tarifas">nauja SMS žinučių tarifas savame reikšmė</param>
        /// <param name="sms_tarif_kit">nauja SMS žinučių tarifas į kitus tinklus reikšmė</param>
        public void Deti(string kort_pavad, int prad_sum,
            int tarifas_sav_tinkle, int tarifas_kitur, int sms_tarifas,
            int sms_tarif_kit)
        {
            this.kort_pavad = kort_pavad;
            this.prad_sum = prad_sum;
            this.tarifas_sav_tinkle = tarifas_sav_tinkle;
            this.tarifas_kitur = tarifas_kitur;
            this.sms_tarifas = sms_tarifas;
            this.sms_tarif_kit = sms_tarif_kit;
        }

        /// <summary>
        /// Užklotas operatorius
        /// </summary>
        /// <returns></returns>
        public override string ToString()
        {
            string eilute;
            eilute = string.Format("{0, 7:d} {1, 15:d} {2, 14:d} {3, 19:d} {4, 12:d} {5, 12:d}",
                kort_pavad, prad_sum, tarifas_sav_tinkle,
                tarifas_kitur, sms_tarifas, sms_tarif_kit);
            return eilute;
        }

        public int Min()
        {
            return sms_tarif_kit;
        }
        public int Nemokamai()
        {
            return sms_tarifas;
        }
        public int Suma()
        {
            return prad_sum;
        }
        /// <summary>
        /// Kuriamas rikiavimo operatorius
        /// </summary>
        /// <param name="st1">naujo objekto rinkinys</param>
        /// <param name="st2">naujo objekto rinkinys</param>
        /// <returns>true jeigu st1_pavad yra mažesnis už st2V</returns>
        public static bool operator <=(Mobilasis st1, Mobilasis st2)
        {
            int p = String.Compare(st1.kort_pavad, st2.kort_pavad,
            StringComparison.CurrentCulture);
            int k = st1.prad_sum - st2.prad_sum;
            return (k < 0 && p < 0);
        }

        /// <summary>
        /// Kuriamas rikiavimo operatorius
        /// </summary>
        /// <param name="st1">naujo objekto rinkinys</param>
        /// <param name="st2">naujo objekto rinkinys</param>
        /// <returns>true jeigu st1_pavad yra didesnis už st2V</returns>
        public static bool operator >=(Mobilasis st1, Mobilasis st2)
        {
            int p = String.Compare(st1.kort_pavad, st2.kort_pavad,
            StringComparison.CurrentCulture);
            int k = st1.prad_sum - st2.prad_sum;
            return (k > 0 && p > 0);
        }

    }
    /// <summary>
    /// Klasė kortelės grupės duomenims saugoti
    /// </summary>
    class Sarasas
    {
        const int CMaxi = 100;  // maksimalus kortelės skaičius
        private Mobilasis[] mob; // kortelės duomenys
        private int n;          // kortelės skaičius
        public Sarasas()
        {
            n = 0;
            mob = new Mobilasis[CMaxi];

        }
        /// <summary>
        /// Grąžina nurodyto indekso studento objektą
        /// </summary>
        /// <param name="i"></param>
        /// <returns></returns>
        public Mobilasis Imti(int i)
        {
            return mob[i];
        }

        /// <summary>
        /// Gražina kortelės skaičių
        /// </summary>
        /// <param name="i">kortelės indeksas</param>
        /// <returns>skaičiu</returns>
        public int Imti()
        {
            return n;
        }

        /// <summary>
        /// Padeda į kortelės objektų masyvą naują kortelės ir 
        /// masyvo dydį padida vienetu
        /// </summary>
        /// <param name="ob">kortelės objektas</param>
        public void Deti(Mobilasis ob)
        {
            mob[n++] = ob;
        }

        /// <summary>
        /// Surikiuoja kortelės masyvą išrinkimo metodu pagal pradinę sumą ir 
        /// kortelės pavadinimą
        /// </summary>
        public void Rikiuoti()
        {
            for (int i = 0; i < n - 1; i++)
            {
                Mobilasis min = mob[i];
                int im = i;
                for (int j = i + 1; j < n; j++)
                    if (mob[j] <= min)
                    {
                        min = mob[j];
                        im = j;
                    }
                mob[im] = mob[i];
                mob[i] = min;
            }
        }
    }
    class Program
    {
        const string CFd = "U1.txt";   //duomenų failo vardas
        static void Main(string[] args) 
        {


            Sarasas mob = new Sarasas();    // kortelės objektų masyvas 
            Sarasas mobn = new Sarasas();   //  kortelės objektų masyvas (naujas)
            Skaityti(ref mob, CFd);
            Spausdinti(mob, "informacija apie mobilusis");
            skaiciuoti(mob);
            Formuoti(mob, ref mobn);
            if (mobn.Imti() > 0)
            {
                mobn.Rikiuoti();
                Spausdinti(mobn, "informacija apie mobilusis 2");
            }
            else
            {
                Console.Write("nera kur butu nemokamai");
            }


        }

        /// <summary>
        /// Sakito duomenys iš failo į objektų rinkinį
        /// </summary>
        /// <param name="mob">Objektų rinkinys kortelės duomenims saugoti</param>
        /// <param name="fv">Duomenų failo vardas</param>
        static void Skaityti(ref Sarasas mob, string fv)
        {
            string kort_pavad;
            int prad_sum,
             tarifas_sav_tinkle,
             tarifas_kitur,
             sms_tarifas,
             sms_tarif_kit;

            string line;
            using (StreamReader reader = new StreamReader(fv))
            {
                while ((line = reader.ReadLine()) != null)
                {
                    string[] parts = line.Split(';');
                    kort_pavad = parts[0];
                    prad_sum = int.Parse(parts[1]);
                    tarifas_sav_tinkle = int.Parse(parts[2]);
                    tarifas_kitur = int.Parse(parts[3]);
                    sms_tarifas = int.Parse(parts[4]);
                    sms_tarif_kit = int.Parse(parts[5]);
                    Mobilasis ob = new Mobilasis();
                    ob.Deti(kort_pavad, prad_sum,
                        tarifas_sav_tinkle, tarifas_kitur, sms_tarifas, sms_tarif_kit);
                    mob.Deti(ob);
                }
            }
        }
        
        /// <summary>
        /// Spausdina kortelės rinkinio duomenis lentele konsole
        /// </summary>
        /// <param name="mob">Objektų rinkinys kortelės duomenims saugoti</param>
        /// <param name="titulas">užrašas virš lentelės</param>
        static void Spausdinti(Sarasas mob, string titulas)
        {
            {
                string virsus = " ---------------------------------------------------------------------------------------------- \r\n"
                              + " Nr. pavavdinimas| pradine suma| tarifas savame tinkle| tarifas kitur| smstarifas sms| sms savame tinkle \r\n"
                              + " ---------------------------------------------------------------------------------------------- ";
                Console.WriteLine(" {0}", titulas);
                Console.WriteLine(virsus);
                for (int i = 0; i < mob.Imti(); i++)
                    Console.WriteLine("{0, 4:d} {1}", i + 1, mob.Imti(i).ToString());
                Console.WriteLine(" ---------------------------------------------------------------------------------- \n");
            }
        }
        /// <summary>
        /// Ieško mažiausią SMS žinučių tarifą į kitus tinklus
        /// </summary>
        /// <param name="mob">Objektų rinkinys kortelės duomenims saugoti</param>
        static void skaiciuoti(Sarasas mob)
        {
            int min = mob.Imti(0).Min();
            int k = 0;
            int p = 0;
            for (int i = 1; i < mob.Imti(); i++)
            {
                if (mob.Imti(i).Min() < min)
                {
                    min = mob.Imti(i).Min();
                    k = i;
                    p++;
                }
            }
            if (p > 0)
            {
                Console.WriteLine("Maziausias sms vartojimas yra");
                Console.WriteLine(mob.Imti(k));
            }
            else
                Console.WriteLine("Nera maziausio");

        }
        /// <summary>
        /// Suformuoja naują rinkinį pagal nurodytą požymį (nemokami SMS žinutės savame tinkle)
        /// </summary>
        /// <param name="mob">Objektų rinkinys kortelės duomenims saugoti</param>
        /// <param name="mobn">naujas objektų rinkinys kortelės duomenims saugoti</param>
        static void Formuoti(Sarasas mob, ref Sarasas mobn)
        {
            for (int i = 0; i < mob.Imti(); i++)
            {
                if (mob.Imti(i).Nemokamai() == 0)
                    mobn.Deti(mob.Imti(i));
            }
        }
    }
}
