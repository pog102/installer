//--------------------------------------------------------------------------------------------------
// Krepšinio mokykloje treniruotes lankančių sąrašas yra tekstiniame faile: būsimo krepšininko vardas
// ir pavardė, amžius ir ūgis. Pirmoje eilutėje yra krepšinio mokyklos pavadinimas. Sukurkite klasę
// Krepšininkas, kuri turėtų kintamuosius vardui su pavarde, amžiui bei ūgiui saugoti. Raskite, koks
// būsimų krepšininkų amžiaus vidurkis ir koks ūgio vidurkis.
// Papildykite programą veiksmais su dviejų krepšinio mokyklų duomenimis. Kiekvienos mokyklos
// duomenys saugomi atskiruose failuose. Kurioje mokykloje aukščiausias sportininkas? Surašykite į
// atskirą rinkinį visus abiejų mokyklų sportininkus, kurių ūgis didesnis už vidurkį.
//--------------------------------------------------------------------------------------------------

using System;
//-------------------------------------------------------------
using System.IO; // reikalinga skaitymui iš failo (StreamReader)
namespace Project
{
    /// <summary>
    /// Klases Krepšininkas duomenys aprašyti
    /// </summary>
    class Krepsininkas
    {
        private string vardpavar; // krepšininko vardas ir pavardė
        private int amzius,       // amžius
                    ugis;         // ūgis

        /// <summary>
        /// Konstruktorius su parametrais
        /// </summary>
        /// <param name="vrdPav"> vardas ir pavardė </param>
        /// <param name="amzius"> amžius </param>
        /// <param name="ugis"> ūgis </param>
        public Krepsininkas(string vrdPav, int amzius, int ugis)
        {
            vardpavar = vrdPav;
            this.amzius = amzius;
            this.ugis = ugis;
        }

        /// <summary>
        /// Gražina vardą ir pavardę
        /// </summary>
        /// <returns>Vardą ir pavardę</returns>
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
        const string CFd1 = "mokykla1.txt";  // 1-os mokyklos duomenų failo vardas
        const string CFd2 = "mokykla2.txt";  // 1-os mokyklos duomenų failo vardas
        const string CFr = "Rezultatai.txt"; // rezultatų failo vardas

        static void Main(string[] args)
        {
            Krepsininkas[] grupe = new Krepsininkas[CMax];    // 1-os mokyklos krepšininkų objektų masyvas
            int kiek = 0;                                     // 1-os mokyklos krepšininkų skaičius

            Krepsininkas[] grupe2 = new Krepsininkas[CMax];   // 2-os mokyklos krepšininkų objektų masyvas
            int kiek2 = 0;                                    // 2-os mokyklos krepšininkų skaičius

            Krepsininkas[] grupes = new Krepsininkas[2 * CMax]; // krepšininkų objektų masyvas (naujas)
            int kiekgr = 0;                                   // krepšininkų skaičius



            string mokykla;  // 1-os mokyklos pavadinimas
            string mokykla2; // 2-os mokyklos pavadinimas
            int maxugis = 0; // aukščiausio krepšininko ūgio kintamasis

            // Rezultatų failo išvalymas
            if (File.Exists(CFr))
                File.Delete(CFr);

            // --- Veiksmai su 1-a mokyklos grupe ---------------------
            Skaityti(CFd1, grupe, ref kiek, out mokykla);
            Spausdinti(CFr, grupe, kiek, mokykla);
            double vidAmz = vidurkisAmziaus(grupe, kiek);
            double vidUg = vidurkisUgis(grupe, kiek);
            using (var fr = File.AppendText(CFr))
            {
                fr.WriteLine("mokyklos amziaus vidurkis yra {0, 1}", vidAmz);
                fr.WriteLine("mokyklos aukcio vidurkis yra {0, 1:f}\n", vidUg);
            }

            // --- Veiksmai su 2-a mokyklos grupe ---------------------
            Skaityti(CFd2, grupe2, ref kiek2, out mokykla2);
            Spausdinti(CFr, grupe2, kiek2, mokykla2);
            Formuoti(grupe, grupes, kiek, vidUg, ref kiekgr);
            int kiek1gr = kiekgr;
            Formuoti(grupe2, grupes, kiek2, vidUg, ref kiekgr);
            MaxUgis(CFr, grupes, kiekgr, kiek, kiek1gr, maxugis, mokykla, mokykla2);
            Spausdinti(CFr, grupes, kiekgr, "abiejų mokyklų sportininkus, kurių ūgis didesnis už vidurkį");
        }

        /// <summary>
        /// Skaito duomenis iš failo į objektų rinkinį
        /// </summary>
        /// <param name="failoVrd">Duomenų failo vardas</param>
        /// <param name="grupe">Objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">Krepšinikų skaičius rinkinyje</param>
        /// <param name="mokykla">Krepšinikų mokyklos pavadinimas</param>
        static void Skaityti(string failoVrd, Krepsininkas[] grupe, ref int kiek, out string mokykla)
        {
            string line,
                   vardpavar;   // Krepšiniko vardas ir pavardę
            int amzius,         // Krepšininko amžius
                ugis;           // Krepšiniko ūgis

            using (StreamReader srautas = new StreamReader(failoVrd))
            {
                mokykla = srautas.ReadLine();
                while ((line = srautas.ReadLine()) != null)
                {
                    string[] dalys = line.Split(";");
                    vardpavar = dalys[0];
                    amzius = int.Parse(dalys[1]);
                    ugis = int.Parse(dalys[2]);
                    grupe[kiek] = new Krepsininkas(vardpavar, amzius, ugis);
                    kiek++;
                }
            }
        }

        /// <summary>
        /// Ieško amžiaus vidurkį
        /// </summary>
        /// <param name="grupe">Objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">Krepšinikų skaičius rinkinyje</param>
        /// <returns>amžiaus vidurkis</returns>
        static double vidurkisAmziaus(Krepsininkas[] grupe, int kiek)
        {
            double sum = 0.0;
            for (int i = 0; i < kiek; i++)
                sum += grupe[i].ImtiAmziu();
            if (kiek != 0)
                return (sum / kiek);
            else
                return 0.0;
        }

        /// <summary>
        /// Ieško ūgio vidurkį
        /// </summary>
        /// <param name="grupe">Objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="kiek">Krepšinikų skaičius rinkinyje</param>
        /// <returns>ūgio vidurkis</returns>
        static double vidurkisUgis(Krepsininkas[] grupe, int kiek)
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
        /// Suformuoja naują rinkinį pagal nurodytą požymį ( ūgis >= vidurkis))
        /// </summary>
        /// <param name="grupe">1-os mokyklos objektų rinkinys krepšinikų duomenims saugoti</param>
        /// <param name="grupes">Suformuotas objektų rinkinys</param>
        /// <param name="kiek">1-os mokyklos Krepšinikų skaičius rinkinyje</param>
        /// <param name="vidurkis">Krepšininkų ūgio vidurkis</param>
        /// <param name="kiekgr">Krepšininkų skaičius rinkinyje</param>
        static void Formuoti(Krepsininkas[] grupe, Krepsininkas[] grupes, int kiek,
                double vidurkis, ref int kiekgr)
        {
            for (int i = 0; i < kiek; i++)
            {
                if (grupe[i].ImtiUgi() >= vidurkis)
                {
                    grupes[kiekgr++] = grupe[i];
                }
            }
        }

        /// <summary>
        /// Ieško aukščiausio krepšininko ūgį mokykoje
        /// </summary>
        /// <param name="failoVrd">Rezultatų failo vardas</param>
        /// <param name="grupes">Suformuotas objektų rinkinys</param>
        /// <param name="kiekgr">visų mokyklos krepšininkų skaičius</param>
        /// <param name="kiek">mokyklos Krepšinikų skaičius rinkinyje</param>
        /// <param name="kiek1gr">antros mokyklos pradedamasis skaičius</param>
        /// <param name="maxugis">aukščiausio krepšininko ūgis</param>
        /// <param name="mokykla">1-os mokyklos pavadinimas</param>
        /// <param name="mokykla2">2-os mokyklos pavadinimas</param>
        static void MaxUgis(string failoVrd, Krepsininkas[] grupes, int kiekgr, int kiek, int kiek1gr, int maxugis, string mokykla, string mokykla2)
        {
            string kuriMokykla = "";
            for (int i = 0; i < kiekgr; i++)
            {
                if (grupes[i].ImtiUgi() >= maxugis)
                {
                    maxugis = grupes[i].ImtiUgi();
                    if (i < kiek1gr)
                    {
                        kuriMokykla = mokykla;
                    }
                    else
                    {
                        kuriMokykla = mokykla2;
                    }
                }
            }
            using (var fr = File.AppendText(failoVrd))
            {
                fr.WriteLine("auksciausias yra {0, 1}cm {1, 3}\n", maxugis, kuriMokykla);
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
        static void Spausdinti(string failoVrd, Krepsininkas[] grupe, int kiek, string mokykla)
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
            }
        }
    }
}
