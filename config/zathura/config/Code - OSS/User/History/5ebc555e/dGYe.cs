//--------------------------------------------------------------------------------------------------------------
// Sukurkite klasę Studentas, kuri turėtų kintamuosius amžiui ir ūgiui saugoti. Trys studentai nutarė
// treniruotis žaisti krepšinį. Raskite, koks aukščiausio studento amžius ir koks jauniausio studento
// ūgis.
// Papildykite klasę Studentas kintamuoju, skirtu studento svoriui saugoti. Sukurkite klasę Liftas,
// kuri turėtų kintamuosius lifto keliamosios galios reikšmei ir talpai saugoti. Per kelis kartus visi
// studentai pakils liftu į reikiamą aukštą?
// Papildykite klasę Liftas metodais Dėti(), kurie leistų keisti lifto keliamąją galią ir talpą. Ar visi studentai
// vienu metu bus pakelti į reikiamą aukštį, jeigu lifto keliamoji galia bus padvigubinta? O
// jeigu talpa bus padvigubinta?
//--------------------------------------------------------------------------------------------------------------
using System;
namespace Project
{

/// <summary>
/// Klases Studentas duomenys aprašyti
/// </summary>
class Studentas
{
private int amzius,
ugis,
svoris;

/// <summary>
/// Konstruktorius su parametrais
/// </summary>
public Studentas(int amzius, int ugioReiksme, int svoris)
{
this.amzius = amzius;
ugis = ugioReiksme;
this.svoris = svoris;
}

/// <summary>
/// Gražina amziu
/// </summary>
public int imtiAmziu()
{
return amzius;
}

/// <summary>
/// Gražina ugi
/// </summary>
public int imtiUgis()
{
return ugis;
}

/// <summary>
/// Gražina svori
/// </summary>
public int imtisvori()
{
return svoris;
}
}

/// <summary>
/// Klases Liftas duomenys aprašyti
/// </summary>
class Liftas
{
private int galia,
talpa;

/// <summary>
/// Konstruktorius su parametrais
/// </summary>
public Liftas(int galia, int talpa)
{
this.galia = galia;
this.talpa = talpa;
}

/// <summary>
/// keicia Lifto duomenys
/// </summary>
public void DetiGalia(int skaicius)
{
galia = skaicius;
}

/// <summary>
/// keicia talpos duomenys
/// </summary>
public void DetiTalpa(int skaicius)
{
talpa = skaicius;
}

/// <summary>
/// Gražina galia
/// </summary>
public int ImtiGalia()
{
return galia;
}

/// <summary>
/// Gražina talpa
/// </summary>
public int ImtiTalpa()
{
return talpa;
}
}

/// <summary>
/// Klasė užduotyje nurodytiems skaičiavimams atlikti
/// </summary>
class Program
{
static void Main(string[] args)
{
int h1=163, //studentu aukstis
h2=180,
h3=160,
a1=20, //studentu amzius
a2=19,
a3=16,
g1=800, // studentu svorus
g2=900,
g3=880,
k1, //liftos padvigubinta galia
k2,//liftos padvigubinta talpa
l1=222, // lifto talpa
t1=22; // lifto galia
Studentas Jonas = new Studentas(a1, h1, g1); // kuriamas studento Objektas Jonas
Studentas Simas = new Studentas(a2, h2, g2); // kuriamas studento Objektas Simas
Studentas Matas = new Studentas(a3, h3, g3); // kuriamas studento Objektas Matas
Liftas m1;
m1 = new Liftas(l1, t1); // kuriamas lifto objektas m1
Spausdinti(h1,a1,g1,h2,a2,g2,h3,a3,g3,l1,t1,m1); //Spausdina ivestos duomenys


//---- Iesko auksciausio studento amziu ------------------------
Console.Write("aukščiausio studento amžius yra ");
if (Jonas.imtiUgis() > Simas.imtiUgis() && Jonas.imtiUgis() > Matas.imtiUgis())
{
Console.Write(Jonas.imtiAmziu());
}
else if (Simas.imtiUgis() > Matas.imtiUgis())
{
Console.Write(Simas.imtiAmziu());
}
else
{
Console.Write(Matas.imtiAmziu());
}
Console.WriteLine("");

//--- Iesko jauniausio studento ugi ---------------------------------------
Console.Write("jauniausio studento ūgis yra ");
if (Jonas.imtiAmziu() < Simas.imtiAmziu() && Jonas.imtiAmziu() < Matas.imtiAmziu())
{
Console.Write(Jonas.imtiUgis());
}
else if (Simas.imtiAmziu() < Matas.imtiAmziu())
{
Console.Write(Simas.imtiUgis());
}
else
{
Console.Write(Matas.imtiUgis());
}
Console.WriteLine("\n");

//----iesko per kelis kartus pakilo studentai--------------------------
if (m1.ImtiGalia() >= Simas.imtisvori()/10 && m1.ImtiTalpa() >= 1)
{
if(m1.ImtiGalia() >= (Simas.imtisvori()+Matas.imtisvori())/10 && m1.ImtiTalpa() >= 2)
{
if(m1.ImtiGalia() >= (Simas.imtisvori()+Matas.imtisvori()+Jonas.imtisvori())/10 &&
m1.ImtiTalpa() >= 3)
{
Console.WriteLine("visi pakilo 1 karta i reikiama auksti");
}
else
{
Console.WriteLine("visi pakilo 2 kartus i reikiama auksti");
}
}
else
{
Console.WriteLine("visi pakilo 3 kartus i reikiama auksti");
}

}
else
{
Console.WriteLine("visi ne vienu metu pakilo i reikiama auksti");
}
Console.WriteLine("");

//---- iesko ar visi pakilo kai yra padvigubinta galia-----------
k1 = 2 * m1.ImtiGalia(); // padaugina galios skaiciu
m1.DetiGalia(k1); // deda galios duomeni
if (m1.ImtiGalia() >= Simas.imtisvori()/10 && m1.ImtiTalpa() >= 1)
{
if(m1.ImtiGalia() >= (Simas.imtisvori()+Matas.imtisvori())/10 && m1.ImtiTalpa() >= 2)
{
if(m1.ImtiGalia() >= (Simas.imtisvori()+Matas.imtisvori()+Jonas.imtisvori())/10 && m1.ImtiTalpa() >= 3)
{
Console.WriteLine("visi vienu metu pakilo i reikiama auksti, kai galia yra padvigubinta");
}
else
{
Console.WriteLine("visi ne vienu metu pakilo i reikiama auksti, kai galia yra padvigubinta");
}
}
else
{
Console.WriteLine("visi ne vienu metu pakilo i reikiama auksti, kai galia yra padvigubinta");
}
}
else
{
Console.WriteLine("visi ne vienu metu pakilo i reikiama auksti");
}

//---- iesko ar visi pakilo kai yra padvigubinta talpa-----------
k2 = 2 * m1.ImtiTalpa(); // padaugina talpos skaiciu
m1.DetiTalpa(k2); // deda talpos duomeni
if (m1.ImtiGalia() >= Simas.imtisvori()/10 && m1.ImtiTalpa() >= 1)
{
if(m1.ImtiGalia() >= (Simas.imtisvori()+Matas.imtisvori())/10 && m1.ImtiTalpa() >= 2)
{
if(m1.ImtiGalia() >= (Simas.imtisvori()+Matas.imtisvori()+Jonas.imtisvori())/10 &&
m1.ImtiTalpa() >= 3)
{
Console.WriteLine("visi vienu metu pakilo i reikiama auksti, kai talpa yra padvigubinta");
}
else
{
Console.WriteLine("visi ne vienu metu pakilo i reikiama auksti, kai talpa yra padvigubinta");
}

}
else
{
Console.WriteLine("visi ne vienu metu pakilo i reikiama auksti, kai talpa yra padvigubinta");
}
}
else
{
Console.WriteLine("visi ne vienu metu pakilo i reikiama auksti");
}
}

/// <summary>
/// Metodas kuris spausdina duomenis
/// </summary>
public static void Spausdinti(int h1,int a1, int g1,int h2,int a2, int g2,int h3,int a3, int g3, int
l1, int t1, Liftas m1)
{

  //Spausdinama konsolėje studentu pradiniu duomenų lentelė
const string virsus1 =
"|---------|-------|------|------|\n"
+ "|Studentas|aukstis|amzius|svoris|\n"
+ "|---------|-------|------|------|";
Console.WriteLine(virsus1);
Console.WriteLine("|Jonas |{0, -7}|{1, -6}|{2,-6}|",h1,a1,g1);
Console.Write("|---------|-------|------|------|\n");
Console.WriteLine("|Simas |{0, -7}|{1, -6}|{2,-6}|",h2,a2,g2);
Console.Write("|---------|-------|------|------|\n");
Console.WriteLine("|Matas |{0, -7}|{1, -6}|{2,-6}|",h3,a3,g3);
Console.Write("|---------|-------|------|------|\n");

//Spausdinamą modifikuota lifto duomenys
const string virsus2 =
"|-------------|-----|-----|\n"
+ "|Objektas |galia|talpa|\n"
+ "|-------------|-----|-----|";
Console.WriteLine(virsus2);
Console.WriteLine("|Liftas(pries)|{0, -5}|{1, -5}|",l1,t1);
Console.WriteLine("|-------------|-----|-----|");
Console.WriteLine("|Liftas(po) |{0, -5}|{1, -5}|",l1*2,t1*2);
Console.WriteLine("|-------------|-----|-----|\n");
}
}
}
