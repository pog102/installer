using System;
using System.Text;
//-----------------------------------------------
using System.IO;

namespace Project
{

  /// <summary>
  /// Klasė užduotyje nuridytiems skaičiavimams atlikti
  /// </summary>
  class Program
  {
    const string CFd = "U1.txt";          // duomenų failo vardas
    const string CFr = "Rezultatai.txt";  // rezultatų failo vardas
    const string CFa = "Analize.txt";     // analizės failo vardas

    static void Main(string[] args)
    {
      char[] skyrikliai = { ' ', '.', ',', '!', '?', ':', ';', '(', ')', '-', '\t' };
      Apdoroti(CFd, CFr, CFa, skyrikliai);
      Console.WriteLine("Programa baigė darbą!");
    }

    /// <summary>
    /// Tikrina ar žodis nelyginis
    /// </summary>
    /// <param name="zodis">eilutės žodis</param>
    /// <returns>true, kai nelyginis</returns>
    static bool Nelyginis(string zodis)
    {
      if (zodis.Length % 2 != 0)
        return true;
      else
        return false;
    }

    /// <summary>
    /// Skaito failą, analizuoja eilutes, kuria rezultatų ir analizės failus
    /// </summary>
    /// <param name="fd">duomenų failo vardas</param>
    /// <param name="fr">rezultatų failo vardas</param>
    /// <param name="fa">analizės failo vardas</param>
    /// <param name="skyrikliai">žodžių skyrikliai</param>
    static void Apdoroti(string fd, string fr, string fa, char[] skyrikliai)
    {
      string[] lines = File.ReadAllLines(fd, Encoding.GetEncoding(65001));
      string eilute = new string('-', 30);
      using (var far = File.CreateText(fr))
      {
        using (var faa = File.CreateText(fa))
        {
          faa.WriteLine(eilute);
          faa.WriteLine("| nelyginis žodis | skaicius |");
          faa.WriteLine(eilute);
          foreach (string line in lines)
            if (line.Length > 0)
            {
              string nauja = line;
              string[] parts = line.Split(skyrikliai,
                  StringSplitOptions.RemoveEmptyEntries);
              foreach (string zodis in parts)
              {
                if (Nelyginis(zodis)){
                  faa.WriteLine("| {0,-15} | {1, 8:d} |",
                      zodis, zodis.Length);
                  nauja = nauja.Replace(zodis, "xxooxx");
                }
              }
                far.WriteLine(nauja);
            }
          faa.WriteLine(eilute);
        }
      }
    }
  }
}
