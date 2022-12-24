//--------------------------------------------------------------------------------------------------
// Krepšinio mokykloje treniruotes lankančių sąrašas yra tekstiniame faile: būsimo krepšininko vardas
// ir pavardė, amžius ir ūgis. Pirmoje eilutėje yra krepšinio mokyklos pavadinimas. Sukurkite klasę
// Krepšininkas, kuri turėtų kintamuosius vardui su pavarde, amžiui bei ūgiui saugoti. Raskite, koks
// būsimų krepšininkų amžiaus vidurkis ir koks ūgio vidurkis.
// Papildykite programą veiksmais su dviejų krepšinio mokyklų duomenimis. Kiekvienos mokyklos
// duomenys saugomi atskiruose failuose. Kurioje mokykloje aukščiausias sportininkas? Surašykite į
// atskirą rinkinį visus abiejų mokyklų sportininkus, kurių ūgis didesnis už vidurkį.
//--------------------------------------------------------------------------------------------------
/// <summary> /// Klases Krepšininkas duomenys aprašyti /// </summary>
///
using System;
//-------------------------------------------------------------
using System.IO; // reikalinga skaitymui iš failo (StreamReader)

namespace Project
{
    /// <summary>
    /// 
    /// </summary>
    class Krepsininkas
    {
        private string vardpavar; // krepšininko vardas ir pavardė
        private int amzius,       // amžius
                    ugis;         // ūgis

        /// <summary>
        /// ass 
        /// </summary>
        /// <param name="vrdPav"></param>
        /// <param name="amzius"></param>
        /// <param name="ugis"></param>
        public Krepsininkas(string vrdPav, int amzius, int ugis)
        {
            vardpavar = vrdPav;
            this.amzius = amzius;
            this.ugis = ugis;
        }

        /// <summary>
        /// dsad   
        /// </summary>
        /// <returns></returns>
        public string ImtiVardaPavarde()
        {
            return vardpavar;
        }

        /// <summary>
        /// Gražina amžių
        /// </summary>
        /// <returns>amžių</returns>
        public int ImtiAmziu()
        {
            return amzius;
        }

        /// <summary>
        /// Gražina ūgį
        /// </summary>
        /// <returns>ūgį</returns>
        public int ImtiUgi()
        {
            return ugis;
        }

    }

    /// <summary>
    /// Klasė užduotyje nurodytiems skaičiavimams atlikti
    /// </summary>
    class Program
    {
        const int CMax = 50;                 // maksimalus krepšininko skaičius grupėje
        const string CFd1 = "..\\..\\mokykla1.txt";  // 1-os mokyklos duomenų failo vardas
        const string CFd2 = "..\\..\\mokykla2.txt";  // 1-os mokyklos duomenų failo vardas
        const string CFr = "..\\..\\Rezultatai.txt"; // rezultatų failo vardas

        static void Main(string[] args)
        {
            Krepsininkas[] grupe = new Krepsininkas[CMax]; // 1-os mokyklos krepšininkų objektų masyvas
            int kiek;                                      // 1-os mokyklos krepšininkų skaičius

            Krepsininkas[] grupe2 = new Krepsininkas[CMax]; // 2-os mokyklos krepšininkų objektų masyvas
            int kiek2;                                      // 2-os mokyklos krepšininkų skaičius

            string mokykla;  // 1-os mokyklos pavadinimas
            string mokykla2; // 2-os mokyklos pavadinimas

            // Rezultatų failo išvalymas
            if (File.Exists(CFr))
                File.Delete(CFr);

            // --- Veiksmai su 1-a mokyklos grupe ---------------------
            Skaityti(CFd1, grupe, out kiek, out mokykla);
            double AmzVid = vidurkisAmziaus(grupe, kiek);
            double UgioVid = vidurkisUgis(grupe, kiek);
            Spausdinti(CFr, grupe, kiek, UgioVid, AmzVid, null, mokykla);

            // --- Veiksmai su 2-a mokyklos grupe ---------------------
            Skaityti(CFd2, grupe2, out kiek2, out mokykla2);
            string Maxugis=MaxUgis(grupe, grupe2, kiek, kiek2, mokykla, mokykla2);
            Spausdinti(CFr, grupe2, kiek2, 0, 0, Maxugis, mokykla2);
            VirsVidurkis(CFr, grupe, grupe2, kiek, kiek2, UgioVid, mokykla, mokykla2);



        }

        /// <summary>
        /// Skaito duomenis iš failo į objektų rinkinį
        /// </summary>
        /// <param name="failoVrd">Duomenų failo vardas</param>
        /// <param name="grupe">Objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">Krepšinikų skaičius rinkinyje</param>
        /// <param name="mokykla">Krepšinikų mokyklos pavadinimas</param>
        static void Skaityti(string failoVrd, Krepsininkas[] grupe, out int kiek, out string mokykla)
        {
            string vardpavar,   // Krepšiniko vardas ir pavardę
                   eilute;      // duomenų failo eilutė
            int amzius,         // Krepšininko amžius
                ugis;           // Krepšiniko ūgis

            using (StreamReader srautas = new StreamReader(failoVrd))
            {
                eilute = srautas.ReadLine();
                string[] parts;
                mokykla = eilute;
                eilute = srautas.ReadLine();
                kiek = int.Parse(eilute);
                for (int i = 0; i < kiek; i++)
                {
                    eilute = srautas.ReadLine();
                    parts = eilute.Split(';');
                    vardpavar = parts[0];
                    amzius = int.Parse(parts[1]);
                    ugis = int.Parse(parts[2]);
                    grupe[i] = new Krepsininkas(vardpavar, amzius, ugis);
                }
            }
        }

        /// <summary>
        /// Ieško amžiaus vidurkį
        /// </summary>
        /// <param name="grupe">Objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">Krepšinikų skaičius rinkinyje</param>
        static double vidurkisAmziaus (Krepsininkas[] grupe, int kiek)
        {
            double sum = 0.0;
                for (int i = 0; i < kiek; i++)
                    sum += grupe[i].ImtiAmziu();
                if (kiek != 0)
                    return sum / kiek;
                else
                    return 0.0;

        }

        /// <summary>
        /// Ieško ūgio vidurkį
        /// </summary>
        /// <param name="grupe">Objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">Krepšinikų skaičius rinkinyje</param>
        static double vidurkisUgis (Krepsininkas[] grupe, int kiek)
        {
            double sum = 0.0;
                for (int i = 0; i < kiek; i++)
                    sum += grupe[i].ImtiUgi();
                if (kiek != 0)
                    return sum / kiek;
                else
                    return 0.0;
        }

        /// <summary>
        /// suskaičiuoja aukščiausio krepšiniko ūgį iš dviejų mokyklų
        /// </summary>
        /// <param name="grupe">1-os mokyklos objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="grupe2">2-os mokyklos objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">1-os mokyklos Krepšinikų skaičius rinkinyje</param>
        /// <param name="kiek2">2-os mokyklos Krepšinikų skaičius rinkinyje</param>
        /// <param name="mokykla">1-os mokyklos pavadinimas</param>
        /// <param name="mokykla2">2-os mokyklos pavadinimas</param>
        /// <returns>mokyklos pavadinimą</returns>
        public static string MaxUgis(Krepsininkas[] grupe, Krepsininkas[] grupe2, int kiek, int kiek2, string mokykla, string mokykla2)
        {
                string KuriMokykla="";

                int maxUgis = grupe[0].ImtiUgi();
                for (int i = 1; i < kiek; i++)
                {
                    if(maxUgis < grupe[i].ImtiUgi())
                    {
                        maxUgis=grupe[i].ImtiUgi();
                    }
                }
                for (int i = 0; i < kiek2; i++)
                {
                    if(maxUgis <= grupe2[i].ImtiUgi())
                    {
                        maxUgis=grupe2[i].ImtiUgi();
                        KuriMokykla = "mokykla " + mokykla2 + " turi auksciausia sportininka" ;
                    }
                    else
                    {
                        KuriMokykla = "mokykla " + mokykla + " turi auksciausia sportininka" ;
                    }
                }
                return KuriMokykla;
        }

        /// <summary>
        /// Spausdina studentų rinkinio duomenis lentele faile
        /// </summary>
        /// <param name="failoVrd">Rezultatų failo vardas</param>
        /// <param name="grupe">1-os mokyklos objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="grupe2">2-os mokyklos objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">1-os mokyklos Krepšinikų skaičius rinkinyje</param>
        /// <param name="kiek2">2-os mokyklos Krepšinikų skaičius rinkinyje</param>
        /// <param name="average">1-os mokyklos ūgio vidurkis</param>
        /// <param name="mokykla">1-os mokyklos pavadinimas</param>
        /// <param name="mokykla2">2-os mokyklos pavadinimas</param>
        public static void VirsVidurkis(string failoVrd, Krepsininkas[] grupe, Krepsininkas[] grupe2, int kiek, int kiek2, double average,
                string mokykla, string mokykla2)
        {
            const string virsus2 =
                "Dvieju mokyklu studentu ugiai kuriu yra diesnis uz 1-os mokyklos vidurki\n"
                +  "------------------------------------------------------\n"
                + " Mokykla                   Vardas Pavardė        Ugis \n"
                + "------------------------------------------------------";
            using (var fr = File.AppendText(failoVrd))
            {
                fr.WriteLine(virsus2);
                for (int i = 0; i < kiek; i++)
                {
                    if(average <= grupe[i].ImtiUgi())
                    {
                        fr.WriteLine("{0, -26} {1, -21} {2, -3}", mokykla, grupe[i].ImtiVardaPavarde(), grupe[i].ImtiUgi());
                    }
                }
                for (int i = 0; i < kiek2; i++)
                {
                    if(average <= grupe2[i].ImtiUgi())
                    {
                        fr.WriteLine("{0, -26} {1, -21} {2, -3}", mokykla2, grupe2[i].ImtiVardaPavarde(), grupe2[i].ImtiUgi());
                    }
                }
            fr.WriteLine("------------------------------------------------------\n");
            }

        }

        /// <summary>
        /// Spausdina studentų rinkinio duomenis lentele faile
        /// </summary>
        /// <param name="failoVrd">Rezultatų failo vardas</param>
        /// <param name="grupe">1-os mokyklos objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">mokyklos Krepšinikų skaičius rinkinyje</param>
        /// <param name="ugisvid">ugio vidurkis</param>
        /// <param name="amziovid">amžiaus vidurkis</param>
        /// <param name="maxi">studentų ūgis, kur yra virš ūgio vidurkio</param>
        /// <param name="mokykla">mokyklos pavadinimas</param>
        static void Spausdinti(string failoVrd, Krepsininkas[] grupe, int kiek, double ugisvid, double amziovid, string maxi, string mokykla)
        {
            const string virsus =
                  "-------------------------------------\n"
                + " Nr. Vardas Pavardė      Amzius Ugis\n"
                + "-------------------------------------";
            using (var fr = File.AppendText(failoVrd))
            {
                fr.WriteLine("{0, 24}", mokykla);
                fr.WriteLine(virsus);
                for (int i = 0; i < kiek; i++)
                    fr.WriteLine("{0, 3} {1, -19} {2, 3} {3, 7}",
                             i + 1, grupe[i].ImtiVardaPavarde(),
                             grupe[i].ImtiAmziu(),
                             grupe[i].ImtiUgi());
                fr.WriteLine("-------------------------------------\n");

                if (ugisvid != 0 || amziovid != 0)
                {
                    fr.WriteLine("Ugio vidurkis yra {0, 3:f2}", ugisvid);
                    fr.WriteLine("amziaus vidurkis yra {0, 3}", amziovid);
                    fr.WriteLine("");
                }

                if (maxi != null)
                {
                    fr.WriteLine(maxi);
                    fr.WriteLine("");
                }
            }
        }
    }
}
