static char normbgcolor[]           = "{color0}";
static char normbordercolor[]       = "{color3}";
static char normfgcolor[]           = "{color2}";
static char selfgcolor[]            = "{color0}";
static char selbordercolor[]        = "{color0}";
static char selbgcolor[]            = "{color6}";

static char *colors[][3]      = {{
    /*               fg           bg         border                         */
	[SchemeNorm] = {{ normfgcolor, normbgcolor, normbordercolor }},
       [SchemeSel]  = {{ selfgcolor,  selbgcolor,  selbordercolor  }},
}};
