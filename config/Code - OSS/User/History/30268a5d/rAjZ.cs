namespace obj2
{
	/// <summary>
	/// Klasė mokytoju duomenims aprašyti
	/// </summary>
	class Mokytojas
	{
		private int diena,   // klases dienos darbo skaicius
					kelinta; // kelinta pamoka prasideda 
		private string uzimtumas; // uzimtumo statusas

		/// <summary>
		/// Konstruktorius su parametrais
		/// </summary>
		/// <param name="diena">ienos darbo skaicius</param>
		/// <param name="kelinta">kelinta pamoka prasideda</param>
		/// <param name="uzimtumas">uzimtumo statusas</param>
		public Mokytojas(int diena, int kelinta, string uzimtumas)
		{
			this.diena = diena;
			this.kelinta = kelinta;
			this.uzimtumas = uzimtumas;
		}

		/// <summary>
		/// Grazina Diena
		/// </summary>
		/// <returns>Diena</returns>
		public int ImtiDiena() { return diena; }

		/// <summary>
		/// Grazina kelinta pamoka
		/// </summary>
		/// <returns>kelinta pamoka</returns>
		public int ImtiKelinta() { return kelinta; }

		/// <summary>
		/// Grazina Uzimtumo statusa
		/// </summary>
		/// <returns>uzimtuma</returns>
		public string Imtiuzimtumas() { return uzimtumas; }
		
		/// <summary>
		/// Užklotas operatorius
		/// </summary>
		/// <returns>suformatuotą eilutę</returns>
		public override string ToString()
		{
			string eilute;
			eilute = string.Format("{0} {1} {2}",
					diena, kelinta, uzimtumas);
			return eilute;
		}
	}

	/// <summary>
	/// Klasė mokyklos klases duomenims aprašyti
	/// </summary>
	class Klase
	{
		private int diena, // klases dienos darbo skaicius
				  kelinta; // kelinta pamoka prasideda
		private string klase, // klases grupe
					 dalykas;  // klases pamoka
		
		/// <summary>
		/// Konstruktorius su parametrais
		/// </summary>
		/// <param name="klase">klases grupe</param>
		/// <param name="diena">klases dienos darbo skaicius</param>
		/// <param name="kelinta">kelinta pamoka</param>
		/// <param name="dalykas">pamoka</param>
		public Klase(string klase, int diena, int kelinta, string dalykas)
		{
			this.diena = diena;
			this.kelinta = kelinta;
			this.dalykas = dalykas;
			this.klase = klase;
		}

		/// <summary>
		/// Grazina Diena
		/// </summary>
		/// <returns>Diena</returns>
		public int ImtiDiena() { return diena; }

		/// <summary>
		/// Grazina pamokos pavadinima
		/// </summary>
		/// <returns>pamoka</returns>
		public string ImtiDalyka() { return dalykas; }

		/// <summary>
		/// Grazina mokyklos klases grupe
		/// </summary>
		/// <returns>klases grupe</returns>
		public string ImtiKlase() { return klase; }

		/// <summary>
		/// Grazina kelinta pamoka
		/// </summary>
		/// <returns>kelinta pamoka</returns>
		public int ImtiKelinta() { return kelinta; }

		/// <summary>
		/// Užklotas operatorius
		/// </summary>
		/// <returns>suformatuotą eilutę</returns>
		public override string ToString()
		{
			string eilute;
			eilute = string.Format("{0} {1} {2} {3}",
					klase, diena, kelinta, dalykas);
			return eilute;
		}
	}

	/// <summary>
 	/// Klasė užduotyje nurodytiems skaičiavimams atlikti
	 /// </summary>
	class Program
	{
		const string CFd = "Klases.txt"; // Klases duomenų failo vardas
		const string CFd1 = "Mokytojai.txt"; // Mokytoju duomenų failo vardas
		const int Cn = 100; // maksimalus elementu skaičius grupėje

		static void Main(string[] args)
		{
			Klase[] pamokos = new Klase[Cn]; // Klases objektų masyvas
			Mokytojas[] mokytojai = new Mokytojas[Cn]; // Mokytojos objektų masyvas

			
			SkaitytiKlase(CFd, pamokos, out int n1);
			SkaitytiMok(CFd1, mokytojai, out int n2);
			SpausdintiKlase(pamokos, n1, "Klases Duomenys");
			SpausdintiMok(mokytojai, n2, "Mokytojos Duomenys");
			
			if (mokytojai[0].Imtiuzimtumas().IndexOf("x") != -1 ||
			mokytojai[1].Imtiuzimtumas().IndexOf("x") != -1 ||
			mokytojai[0].Imtiuzimtumas().IndexOf("1") != -1 ||
			mokytojai[1].Imtiuzimtumas().IndexOf("1") != -1)
			{
				Console.WriteLine("visi arba vienas uzimtas");
			    
			}
			else
			{
		         Tvarkarastis(pamokos, mokytojai, n1, n2);

			}
		}

		/// <summary>
		/// Iesko pamokos, kurios vykti negali
		/// ir uzima pamoka pagal kuno kulturos kriterijos
		/// </summary>
		/// <param name="K">>Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="M">Objektų mokytojos Klases duomenims saugoti</param>
		/// <param name="n1">klases skaicius</param>
		/// <param name="n2">mokytoju skaicius</param>
		static void Tvarkarastis(Klase[] K, Mokytojas[] M, int n1, int n2)
		{
			int kiek=0;
			string line = "";
			for (int i = 0; i < n2; i++)
			{
				kiek=0;
				line="";

				for (int k = 0; k < n1; k++)
				{
					if (M[i].ImtiDiena() == K[k].ImtiDiena() && //iesko diena
					(M[i].ImtiKelinta() == K[k].ImtiKelinta() && K[k].ImtiDalyka().IndexOf("x") != -1 )) //tikrina ar ta kelinta pa,oka uzimta
					{
					line= line + K[k].ImtiKlase() + " " +
						K[k].ImtiDiena() + " " + 
						K[k].ImtiKelinta() +  " " +
						" Kuno kultura" + "\n";
						kiek++;
					}
				}
				if (kiek > 1)
				{
					Console.WriteLine("{0} mokytojo tvarkarastis", i+1);
					Console.WriteLine(line);
				}
				else
				{
					Console.WriteLine("{0} mokytojo tvarkarastis", i+1);
				}
			}
		}

		/// <summary>
		/// Spausdina klases rinkinio duomenis konsole
		/// </summary>
		/// <param name="D">Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="n">klases skaicius</param>
		/// <param name="antraste">užrašas virš duomenys</param>
		static void SpausdintiKlase(Klase[] D, int n, string antraste)
		{
			Console.WriteLine(antraste);
			for (int i = 0; i < n; i++)
			{
				Console.WriteLine(D[i].ToString());
			}
			Console.WriteLine("");
		}

		/// <summary>
		/// Skaito duomenis iš failo į objektų rinkinį
		/// </summary>
		/// <param name="fd">>Duomenų failo vardas</param>
		/// <param name="D">Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="i">klases skaicius</param>
		static void SkaitytiKlase(string fd, Klase[] D, out int i)
		{
			string klase, dalykas;
			int diena, kelinta;
			i=0;
			string line;
			using (StreamReader reader = new StreamReader(fd))
			{
			string[] parts;
			while ((line = reader.ReadLine()) != null)
			{

				parts = line.Split(' ');
				klase = parts[0];
				diena = int.Parse(parts[1]);
				kelinta = int.Parse(parts[2]);
				dalykas = (parts[3]);
				D[i] = new Klase(klase, diena, kelinta, dalykas);
				i++;
				}
			
			}

		}
		
		/// <summary>
		/// Skaito duomenis iš failo į objektų rinkinį
		/// </summary>
		/// <param name="fd">>Duomenų failo vardas</param>
		/// <param name="D">Objektų rinkinys mokytoju duomenims saugoti</param>
		/// <param name="i">mokytoju skaicius</param>
		static void SkaitytiMok(string fd, Mokytojas[] D, out int i)
		{
			int diena, kelinta;
			i=0;
			string line, uzimtumas;
			using (StreamReader reader = new StreamReader(fd))
			{
			string[] parts;
			while ((line = reader.ReadLine()) != null)
			{

				parts = line.Split(' ');
				diena = int.Parse(parts[0]);
				kelinta = int.Parse(parts[1]);
				uzimtumas = parts[2];
				D[i] = new Mokytojas(diena, kelinta, uzimtumas);
				i++;
				}
			
			}
		}

		/// <summary>
		/// Spausdina mokytojos rinkinio duomenis konsole
		/// </summary>
		/// <param name="D">Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="n">klases skaicius</param>
		/// <param name="antraste">užrašas virš duomenys</param>
		static void SpausdintiMok(Mokytojas[] D, int n, string antraste)
		{
			Console.WriteLine(antraste);
			for (int i = 0; i < n; i++)
			{
				Console.WriteLine(D[i].ToString());
			}
			Console.WriteLine("");
		}
	}
}
