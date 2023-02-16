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
		const string CFd = "Klases.txt";	// Klases duomenų failo vardas
		const string CFd1 = "Mokytojai.txt";	// Mokytoju duomenų failo vardas
		const int Cn = 100;			// maksimalus elementu skaičius grupėje

		static void Main(string[] args)
		{
			Klase[] pamokos = new Klase[Cn];	   // Klases objektų masyvas
			Mokytojas[] mokytojai = new Mokytojas[Cn]; // Mokytojos objektų masyvas

			
			SkaitytiKlase(CFd, pamokos, out int kiek_klasiu);
			SkaitytiMok(CFd1, mokytojai, out int kiek_mok);
			SpausdintiKlase(pamokos, kiek_klasiu, "Klases Duomenys");
			SpausdintiMok(mokytojai, kiek_mok, "Mokytojos Duomenys");
			
		         Tvarkarastis(pamokos, mokytojai, kiek_klasiu, kiek_mok);
		}

		/// <summary>
		/// Apdorojamas kuno kulturos tvarkarastis
		/// </summary>
		/// <param name="K">>Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="M">Objektų mokytojos Klases duomenims saugoti</param>
		/// <param name="kiek_klasiu">klases skaicius</param>
		/// <param name="kiek_mok">mokytoju skaicius</param>
		static void Tvarkarastis(Klase[] K, Mokytojas[] M, int kiek_klasiu, int kiek_mok)
		{
			int kiek;
			string line;
			Console.WriteLine("mokytojo tvarkarastis");
			for (int i = 0; i < kiek_mok; i++)
			{

			kiek=0;
			line="";

			if (M[i].Imtiuzimtumas().IndexOf("x") == -1) //jeigu gali dirbti
			{
				Rekursija(kiek_klasiu,i,K,M,line,kiek);
			}
			
			}
		}

		/// <summary>
		/// Rekursija iesko pamokos uzimtuma
		/// ir keicia i kuno kulturos pamoka
		/// </summary>
		/// <param name="kiek_klasiu">klases skaicius</param>
		/// <param name="i">mokytoju indeksas</param>
		/// <param name="K">Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="M">Objektų mokytojos Klases duomenims saugoti</param>
		/// <param name="line">tvarkarascio eilute</param>
		/// <param name="kiek">klases grupiu skaicius (grazina 1 arba 2)</param>
		static void Rekursija(int kiek_klasiu, int i, Klase[] K, Mokytojas[] M, string line, int kiek)
		{
			if(kiek_klasiu <= -1)
			{

				if (kiek == 2)
				{
					Console.Write(line);
				}
			}
			else
			{
					if ( M[i].ImtiDiena() == K[kiek_klasiu].ImtiDiena() && 
					(M[i].ImtiKelinta() == K[kiek_klasiu].ImtiKelinta())) //tikrina laika
					{
						if ((M[i].Imtiuzimtumas().IndexOf("1") != -1) || (K[kiek_klasiu].ImtiDalyka().IndexOf("x") != -1)) // tikrina uzimtuma
						{
					line= line + K[kiek_klasiu].ImtiKlase() + " " +
						K[kiek_klasiu].ImtiDiena() + " " + 
						K[kiek_klasiu].ImtiKelinta() +  " " +
						" Kuno kultura" + "\n";
						kiek++;
						    
						}
					}

			Rekursija(kiek_klasiu-1, i, K,M,line,kiek);   
			}

		}

		/// <summary>
		/// Spausdina klases rinkinio duomenis konsole
		/// </summary>
		/// <param name="K">Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="n">klases skaicius</param>
		/// <param name="antraste">užrašas virš duomenys</param>
		static void SpausdintiKlase(Klase[] K, int n, string antraste)
		{
			Console.WriteLine(antraste);
			for (int i = 0; i < n; i++)
			{
				Console.WriteLine(K[i].ToString());
			}
			Console.WriteLine("");
		}

		/// <summary>
		/// Skaito duomenis iš failo į objektų rinkinį
		/// </summary>
		/// <param name="fd">>Duomenų failo vardas</param>
		/// <param name="K">Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="i">klases skaicius</param>
		static void SkaitytiKlase(string fd, Klase[] K, out int i)
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
				K[i] = new Klase(klase, diena, kelinta, dalykas);
				i++;
				}
			
			}
			i--;

		}
		
		/// <summary>
		/// Skaito duomenis iš failo į objektų rinkinį
		/// </summary>
		/// <param name="fd">>Duomenų failo vardas</param>
		/// <param name="M">Objektų rinkinys mokytoju duomenims saugoti</param>
		/// <param name="i">mokytoju skaicius</param>
		static void SkaitytiMok(string fd, Mokytojas[] M, out int i)
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
				M[i] = new Mokytojas(diena, kelinta, uzimtumas);
				i++;
				}
			
			}
		}

		/// <summary>
		/// Spausdina mokytojos rinkinio duomenis konsole
		/// </summary>
		/// <param name="M">Objektų rinkinys klases duomenims saugoti</param>
		/// <param name="n">klases skaicius</param>
		/// <param name="antraste">užrašas virš duomenys</param>
		static void SpausdintiMok(Mokytojas[] M, int n, string antraste)
		{
			Console.WriteLine(antraste);
			for (int i = 0; i < n; i++)
			{
				Console.WriteLine(M[i].ToString());
			}
			Console.WriteLine("");
		}
	}
}
