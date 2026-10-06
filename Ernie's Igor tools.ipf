#pragma TextEncoding = "UTF-8"
#pragma rtGlobals=3				// Use modern global access method and strict wave access
#pragma DefaultTab={3,20,4}		// Set default tab width in Igor Pro 9 and later
// eee to do later: #pragma hide=1 // this hides the procedure so that it is not accessible to the user
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Ernie_Igor_tools.ipf
//
//
// written by Ernie Lewis
// last revision 2026-10-01
//
//
// Description: This is a set of routines to display information and perform calculations.
// These were written by me, Ernie Lewis, for my personal use, and I will be continually updating
//		them and adding more.
// Please contact me at ernielewis@optonline.net for any questions or issues, to have a tutorial,
//		or to be on the list for updates.
// More information is in the "About" section, which can be called from the menu.
//
//
//////////////////////////////////////////////////////////////////////////
///////////// Set up Menus
Menu "Ernie's Igor Tools"
	"About",/Q, Print_About_Ernies_Igor_tools()
	Submenu "Display stuff"
		"Print symbols",/Q, Print_symbols()
		"Display Greek alphahet",/Q, Display_Greek_alphabet()
		"Print Greek alphahet",/Q, Print_Greek_alphabet()
		"Display SI prefixes",/Q, Display_SI_prefixes()
		"Display physical constants", /Q, Display_physical_constants()
		"Display Gaussian integrals",/Q, Display_Gaussian_integrals()
		"Display Earth-moon-sun info",/Q, Display_Earth_moon_sun_info()
		"Display Standard Atmosphere",/Q, Display_Standard_Atmosphere()
		"Display Conversions",/Q, Display_conversions()
		"Display all", /Q, Display_Greek_alphabet(); Display_SI_prefixes(); Display_physical_constants(); Display_Gaussian_integrals(); Display_Earth_moon_sun_info(); Display_Standard_Atmosphere(); Display_conversions()
		"Clear all", /Q, Clear_all_display_windows()
	End
	Submenu "Formula weight stuff"
		"Find formula weight",/Q, Make_Input_chemical_formula_panel()
		"Display elements",/Q, Display_Elements()
	End
	Submenu "Substance properties"
		"Dry air properties",/Q, Set_defaults_for_property_panels(); Make_Input_Temp_panel(); Make_Input_Pres_panel(); Make_Air_properties_panel()
		"Water vapor in air properties",/Q, Set_defaults_for_property_panels(); Make_Input_Temp_panel(); Make_Input_Pres_panel(); Make_Water_vapor_in_air_properties_panel()
		"Water properties",/Q, Set_defaults_for_property_panels(); Make_Input_Temp_panel(); Make_Input_Pres_panel(); Make_Water_properties_panel()
		// eee include ice properties here (to be done)
	End
	Submenu "Particle properties"
		"Particle dynamic properties",/Q, Set_defaults_for_property_panels(); Make_Input_Temp_panel(); Make_Input_Pres_panel(); Make_particle_properties_panel()
		"Knudsen-Cunningham relations",/Q, Make_Kn_Cunningham_relations_panel()
		"Mass-diameter-density relations",/Q, Make_Mass_Diam_Density_panel()
		"Coagulation",/Q, Set_defaults_for_property_panels(); Make_Input_Temp_panel(); Make_Input_Pres_panel(); Make_coagulation_panel()
		"Coagulate size distribution",/Q, Coagulate_size_distribution()
		// eee do I need Set_defaults... here?
		"Particle charging properies",/Q, Set_defaults_for_property_panels(); Make_Input_Temp_panel(); Make_Input_Pres_panel(); Make_Charging_efficiencies_for_equal_Dmob_panel(); Make_Charging_efficiencies_for_same_Dp_panel(); Make_Query_for_Graph_charging_efficiencies_info_panel()
		"Dcrit-supersat-kappa relations",/Q, Make_Dcrit_supersat_kappa_panel()
		"Core-shell activation",/Q, Make_core_shell_activation_panel()
		"Daero-Dgeo-density relations",/Q, Make_Daero_Dgeo_relations_panel()
		"Cd(Re) relations",/Q, Make_Re_Cd_relations_panel()
	End
	Submenu "Misc tools"
		"Wavelength relations",/Q, Make_Wavelength_freq_wavenumber_panel()
		"Color temperature, ratio calculatons",/Q, Make_color_temp_panel()
		"Show wavelengths of optical instruments",/Q, Display_Optical_instrument_wavelengths()
		"Tube flow relations",/Q, Make_Tube_flow_panel()
		"Convert temperatures",/Q,Set_defaults_for_property_panels(); Make_Input_Temp_panel()
		"Convert pressures",/Q,Set_defaults_for_property_panels(); Make_Input_Pres_panel()
		"PSL refractive index",/Q,Make_PSL_refractive_index_panel()
		"Ellipsiodal shape factors",/Q,ShapeFactor_Ellipsoid()
		"Fit data to different orders",/Q,Fit_data_to_different_orders()
	End
	"List of functions",/Q, Print_List_of_functions_in_Ernies_Igor_tools()
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_About_Ernies_Igor_tools()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2026-01-13
//
//
// Description: This prints information about Ernie's Igor Tools
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String About_Ernies_Igor_tools_text
//
//
	About_Ernies_Igor_tools_text = "------------------------ Top of page ------------------------\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "About Ernie's Igor Tools\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "------------------------\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "\"Ernie's Igor tools.ipf\" is a collection of routines on various topics that I wrote for my personal use.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "I got tired of reinventing the wheel every time I wanted to do something so I decided to create these routines\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   and make them thorough and documented so I could depend on them and have confidence that they are correct.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "This is not a complete, finished product as I am continually adding routines, and it is, and probably always\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   will be, a work in progress, but I am confident that the routines that are here can be relied upon.\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "These routines fall into several basic categories:\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   Display information, which prints or makes panels of information that I often want and find useful\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   Formula weight information, which calculates formula weights and displays the periodic table\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   Substance properties: dry air, water vapor in air, and liquid water (I will include ice at some point)\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   Particle properties: dynamics, coagulation, charging, and activation\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   Miscellaneous tools - a hodgepodge of routines on various topics\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   A list of all functions.\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "The routines require Igor 8 or later; earlier versions will be incompatible, mostly because of long names.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "Some of the routines can be used as stand-alone procedures, but many are designed to be used together.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "As they were coded using my user preferences, they might look different on other computers.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "On a PC, the Igor window must be expanded to the full extent possible to view all of the windows.\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "Feel free to share with anyone who might be interested, but if you do so, please make sure I have their email\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   address so that I can notify them of any errors or of updates, as new routines are continually being added\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "Please contact me, Ernie Lewis (ernielewis@optonline.net), with any issues or questions or to get a tutorial.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "This version is dated 2026-10-02.\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "I also have a set of routines on Mie scattering, \"Ernie's Mie routines.ipf\", which is available upon request.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "It requires a tutorial.\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "If this file (or an alias of it) is placed in the Igor Procedure folder, then the routines will compile and a\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   menu of selections will be available when Igor opens.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "The location on a Mac is \"Applications/Igor Pro XXX Folder/Igor Procedures/\", where XXX is the Igor version number.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "The location on a PC is \"C:\Users\<username>\Documents\WaveMetrics\Igor Pro XXX User Files\Igor Procedures\",\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   but be aware there are several aliases that point to the same location.\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "To view the source code, select \"Windows\" in the upper Igor menu, then \"Show\", then \"All procedure windows\";\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "   doing so will open ALL procedure windows, not just this one.\r"
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "This option is recommended; if you open this procedure in Igor it will cause issues because it will be already open.\r\r"
//
	About_Ernies_Igor_tools_text = About_Ernies_Igor_tools_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z About_Ernies_Igor_tools_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(50,100,900,750)/N=About_Ernies_Igor_tools_info_notebook
	Notebook About_Ernies_Igor_tools_info_notebook, text=About_Ernies_Igor_tools_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_symbols()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints mathematical and other symbols to the command line so they can be selected
//		and used in graphs, legends, etc.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
	Print " "
	Print "These symbols can be copied and used for axis labels, in annotations, or elsewhere."
	Print "≈ ≡ ≅ ∝ ≠ ≤ ≥ ± ∓ × ÷ ⋅ · • ⊗ ⊕ ∂ ° ∞ ‰ ∃ ∏ ∑ ∫ √ ∴ ⊥ ∇′↔ ← ↑ → ↓ ⇔ ⇐ ⇑ ⇒ ⇓ Å Ö å ö □ ★"
	Print " "
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_Greek_alphabet()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This sets up a panel that displays the Greek alphabet.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Print_Greek_alphabet_button (when "Print" button is hit)
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make Greek alphabet panel
	KillWindow/Z Greek_alphabet_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(50,50,200,670) /N=Greek_alphabet_panel as "Greek Alphabet"
//
//
/////////////////////////////////////
//	set up title box doe Greek alphabet
	TitleBox Greek_alphabet_title title="\Z25   Greek\rAlphabet", size={100, 50}, pos={20, 15},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
	DrawText 10, 115, "\Z16 Α     α     alpha"
	DrawText 10, 135, "\Z16 Β     β     beta"
	DrawText 10, 155, "\Z16 Γ     γ      gamma"
	DrawText 10, 175, "\Z16 Δ     δ     delta"
	DrawText 10, 195, "\Z16 Ε     ε     epsilon"
	DrawText 10, 215, "\Z16 Ζ     ζ      zeta"
	DrawText 10, 235, "\Z16 Η     η     eta"
	DrawText 10, 255, "\Z16 Θ     θ     theta"
	DrawText 10, 275, "\Z16 Ι       ι      iota"
	DrawText 10, 295, "\Z16 Κ     κ      kappa"
	DrawText 10, 315, "\Z16 Λ     λ      lambda"
	DrawText 10, 335, "\Z16 Μ     µ     mu"
	DrawText 10, 355, "\Z16 Ν     ν      nu"
	DrawText 10, 375, "\Z16 Ξ     ξ       xi"
	DrawText 10, 395, "\Z16 Ο     ο     omicron"
	DrawText 10, 415, "\Z16 Π     π      pi"
	DrawText 10, 435, "\Z16 Ρ     ρ      rho"
	DrawText 10, 455, "\Z16 Σ     σ      sigma"
	DrawText 10, 475, "\Z16 Τ     τ      tau"
	DrawText 10, 495, "\Z16 Υ     υ      upsilon"
	DrawText 10, 515, "\Z16 Φ     ϕ     phi"
	DrawText 10, 535, "\Z16 Χ     χ      chi"
	DrawText 10, 555, "\Z16 Ψ     ψ     psi"
	DrawText 10, 575, "\Z16 Ω     ω     omega"
//
//
//	set up print button
	Button Print_Greek_alphabet_box, pos={45, 585}, size={50, 25}, proc=Print_Greek_alphabet_button, title="\Z20\K(0, 0, 65535)Print",fcolor=(5000,5000,5000)
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Greek_alphabet_button(Print_Greek_alphabet_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This is called when the "Print" button is hit in Display_Greek_alphabet().
//	It calls Print_Greek_alphabet, which prints the Greek alphabet.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Print_Greek_alphabet_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Greek_alphabet()
//
// Calls required previously: none
//
// Called by: Display_Greek_alphabet (when "Print" button is hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Print_Greek_alphabet_Struct
//
//
	If (Print_Greek_alphabet_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Greek_alphabet()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Greek_alphabet()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints the Greek alphabet on the command line so that the symbols can be copied
//		for axes labels, for instance.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Print_Greek_alphabet_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
	Print " "
	Print "Α α Β β Γ γ Δ δ Ε ε Ζ ζ Η η Θ θ Ι ι Κ κ Λ λ Μ µ Ν ν Ξ ξ Ο ο Π π Ρ ρ Σ σ Τ τ Υ υ Φ ϕ Χ χ Ψ ψ Ω ω"
	Print " "
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_SI_prefixes()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This creates a panel that displays SI prefixes and the powers they represent.
// These are from p. 43 of the brochure "International System of Units - 9th Edition (2019)"
//		from the Bureau International des Poids et Mesures (BIPM), which can be found at
//		https://www.bipm.org/en/publications/si-brochure/.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Do_SI_prefixes_info_button (when "i" button hit)
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make SI prefixes panel
	KillWindow/Z SI_prefixes_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(210,50,350,785) /N=SI_prefixes_panel as "SI Prefixes"
//
//
/////////////////////////////////////
//	set up title box for SI prefixes
	TitleBox SI_prefixes_title title="\Z25SI Prefixes", size={200, 50}, pos={10, 15},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up SI prefixes info button
	Button SI_prefixes_info_button,pos={50,685},size={40,40},proc=Do_SI_prefixes_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
	DrawText 10, 85, "\Z16 Q    quetta  10\S30\M"
	DrawText 10, 110, "\Z16 R    ronna   10\S27\M"
	DrawText 10, 135, "\Z16 Y    yotta    10\S24\M"
	DrawText 10, 160, "\Z16 Z    zetta    10\S21\M"
	DrawText 10, 185, "\Z16 E    exa      10\S18\M"
	DrawText 10, 210, "\Z16 P    peta     10\S15\M"
	DrawText 10, 235, "\Z16 T    tera      10\S12\M"
	DrawText 10, 260, "\Z16 G    giga     10\S9\M"
	DrawText 10, 285, "\Z16 M    mega   10\S6\M"
	DrawText 10, 310, "\Z16 k     kilo      10\S3\M"
	DrawText 10, 335, "\Z16 h     hecto   10\S2\M"
	DrawText 10, 360, "\Z16 da   deka    10\S1\M"
//
	DrawLine 25, 370, 110, 370
//
	DrawText 10, 400, "\Z16 d    deci      10\S-1\M"
	DrawText 10, 425, "\Z16 c    centi     10\S-2\M"
	DrawText 10, 450, "\Z16 m   milli      10\S-3\M"
	DrawText 10, 475, "\Z16 µ    micro   10\S-6\M"
	DrawText 10, 500, "\Z16 n    nano    10\S-9\M"
	DrawText 10, 525, "\Z16 p    pico     10\S-12\M"
	DrawText 10, 550, "\Z16 f     femto   10\S-15\M"
	DrawText 10, 575, "\Z16 a    atto      10\S-18\M"
	DrawText 10, 600, "\Z16 z    zepto    10\S-21\M"
	DrawText 10, 625, "\Z16 y    yocto    10\S-24\M"
	DrawText 10, 650, "\Z16 r    ronto     10\S-27\M"
	DrawText 10, 675, "\Z16 q   quecto   10\S-30\M"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_SI_prefixes_info_button(SI_prefixes_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calls Print_SI_prefixes_info which prints information on the SI prefixes.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		SI_prefixes_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_SI_prefixes_info()
//
// Calls required previously: none
//
// Called by: Display_SI_prefixes_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &SI_prefixes_info_Struct
//
//
	If (SI_prefixes_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_SI_prefixes_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_SI_prefixes_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the SI prefixes displayed in SI_prefixes_panel
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_SI_prefixes_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String SI_prefixes_info_text
//
//
	SI_prefixes_info_text = "------------------------ Top of page ------------------------\r\r"
//
	SI_prefixes_info_text = SI_prefixes_info_text + "SI Prefixes\r"
	SI_prefixes_info_text = SI_prefixes_info_text + "-----------\r\r"
//
	SI_prefixes_info_text = SI_prefixes_info_text + "The SI prefixes displayed are described on p. 43 of the brochure\r"
	SI_prefixes_info_text = SI_prefixes_info_text + "  	'International System of Units - 9th Edition (2019)' of the Bureau International des Poids et Mesures (BIPM),\r"
	SI_prefixes_info_text = SI_prefixes_info_text + "   which can be found at https://www.bipm.org/en/publications/si-brochure/. \r\r"
//
	SI_prefixes_info_text = SI_prefixes_info_text + "Another reference is https://physics.nist.gov/cuu/Units/prefixes.html. \r\r"
//
//
	SI_prefixes_info_text = SI_prefixes_info_text + "The two largest and two smallest were added in November, 2022; see \r"
	SI_prefixes_info_text = SI_prefixes_info_text + "   https://www.bipm.org/documents/20126/77765681/Resolutions-2022.pdf/281f3160-fc56-3e63-dbf7-77b76500990f\r\r"
//
	SI_prefixes_info_text = SI_prefixes_info_text + "----------------------- Bottom of Page ----------------------"   
//
//
// print information
	KillWindow/Z SI_prefixes_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(370,50,1200,315)/N=SI_prefixes_info_notebook
	Notebook SI_prefixes_info_notebook, text=SI_prefixes_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_physical_constants()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-08-01
//
//
// Description: This creates a panel that displays physical constants.
// SI is based on seven constants which have invariant numerical values; those listed in the panel are N_A, k, c, e, and h.
//		Other quantities such as the Faraday constant, F, and the gas constant, R, are derived from these.
//	
// References are:
//		The brochure 'International System of Units - 9th Edition (2019)' of the Bureau International des Poids et Mesures (BIPM), https://www.bipm.org/en/publications/si-brochure/.
//		Tiesinga et al., 'CODATA recommended values of the fundamental physical constants, 2018', Rev. Mod. Phys., 93, 025010, 2021.
//		Tiesinga et al., 'CODATA recommended values of the fundamental constants: 2018', J. Phys. Chem. Reference data, 50, 033105, 2021.
//		Two NIST websites: https://physics.nist.gov/cuu/Constants/ and https://www.nist.gov/pml/fundamental-physical-constants.
//		Thompson, A., and B. N. Taylor (2008), 'Guide for the use of the international system of units (SI)', NIST Special Publication 811, 2008 Edition.
//			Although a bit dated, it has much useful information. It can be obtained at https://physics.nist.gov/cuu/pdf/sp811.pdf.
//
//	The value of the standard acceleration due to gravity, g, of 9.80665 m/s^2 was adopted in 1901 by the 3rd General Conference on Weights and Measures (CGPM); 
//		this is listed on p. 159 of the BIPM brochure.
//	The definition of 1 atmosphere as 101325 Pa was adopted in 1954 at the 10th CGPM (see p. 163 of the BIPM brochure).
//	The definition of a yard as 0.9144 m was given in the [US] Federal Register, v. 24, No. 128, p. 5348, July 1, 1959; see Thompson and Taylor, p. 43 for extensive discussion of this.
//	This means that one inch is exactly 25.4 mm.
//	One pound (avoirdupois) is exactly 0.45359237 kg; see Thomspon and Taylor (2008).
//	The definition of the thermochemical calorie as 4184 J is given in Thompson and Taylor, pp. 45 and 47 (footnotes 9 and 10); 
//		see also Stimson, H. F. (1955), 'Heat units and temperature scales for calorimetry', Amer. J. Phys., 23, 614-622.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Do_physical_constants_info_button (when "i" button hit)
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make physical constants panel
	KillWindow/Z Physical_constants_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(360,50,600,890) /N=Physical_constants_panel as "Physical_constants"
//
//
/////////////////////////////////////
//	set up title box for Physical constants
	TitleBox Physical_constants_title title="\Z25Physical Constants", size={220, 50}, pos={10, 15},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Physical constants info button
	Button Physical_constants_info_button,pos={95,790},size={40,40},proc=Do_Physical_constants_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
	DrawLine 30,65,195,65
	DrawText 55,90, "\Z18       Exact"
	DrawText 10,115, "\Z14\f02N\f00\BA\M\Z14 ≡ 6.022 140 76 × 10\S23\M\Z14 mol\S-1"
	DrawText 10,135, "\Z14\f02k\f00 ≡ 1.380 649 × 10\S-23\M\Z14 J K\S-1"
	DrawText 10,155, "\Z14   ≡ 1.380 649 × 10\S-23\M\Z14 kg m\S2\M\Z14 s\S-2\M\Z14 K\S-1"
	DrawText 10,175, "\Z14   ≡ 1.380 649 × 10\S-16\M\Z14 erg K\S-1"
	DrawText 10,195, "\Z14\f02c\f00 ≡ 2.997 924 58 × 10\S8\M\Z14 m s\S-1"
	DrawText 10,215, "\Z14\f02e\f00 ≡ 1.602 176 634 × 10\S-19\M\Z14 C"
	DrawText 10,235, "\Z14\f02h\f00 ≡ 6.626 070 15 × 10\S-34\M\Z14 J s"
	DrawText 10,255, "\Z14   ≡ 6.626 070 15 × 10\S-34\M\Z14 kg m\S2\M\Z14 s\S-1"
	DrawText 10,275, "\Z14   ≡ 6.626 070 15 × 10\S-27\M\Z14 erg s"
	DrawText 10,295, "\Z14\f02g\f00 ≡ 9.806 65 m s\S-2"
//
	DrawLine 30,305,195,305
	DrawText 55,330, "\Z18     Derived"
	DrawText 10,355, "\Z14\f02F\f00 ≡ \f02N\f00\BA\M\Z14\f02e\f00 = 9.649 ... × 10\S3\M\Z14 C mol\S-1"
	DrawText 10,375, "\Z14\f02R\f00 ≡ \f02N\f00\BA\M\Z14\f02k\f00"
	DrawText 10,395, "\Z14   = 8.314 463 ... kg m\S2\M\Z14 s\S-2\M\Z14 K\S-1\M\Z14 mol\S-1"
	DrawText 10,415, "\Z14   = 8.314 ... ×10\S7\M\Z14 g cm\S2\M\Z14 s\S-2\M\Z14 K\S-1\M\Z14 mol\S-1"
	DrawText 10,435, "\Z14   = 82.058 ... atm cm\S3\M\Z14 K\S-1\M\Z14 mol\S-1"
	DrawText 10,455, "\Z14   = 62.364 ... torr lit K\S-1\M\Z14 mol\S-1"
	DrawText 10,475, "\Z14   = 1.206 ... psi lit K\S-1\M\Z14 mol\S-1"
	DrawText 10,500, "\Z14\f02σ\f00\BSB\M\Z14 ≡ 2π\S5\M\Z14\f02k\f00\S4\M\Z14/(15\f02h\f00\S3\M\Z14\f02c\f00\S2\M\Z14)"
	DrawText 10,520, "\Z14        = 5.67037... × 10\S-8\M\Z14 kg s\S-3\M\Z14 K\S-4"
	DrawText 2.5,545, "\Z141 eV ≡ 1.602 176 634 × 10\S-19\M\Z14 J"
	DrawText 2.5,565, "\Z14     ≡ \f02N\f00\BA\M\Z14\f02e\f00/(kcal/J) ≈ 23.1 kcal mol\S-1"
//
	DrawLine 30,575,195,575
	DrawText 55,600, "\Z18    Measured"
	DrawText 10,625, "\Z14\f02ε\f00\B0\M\Z14 ≈ 8.8542 × 10\S-12\M\Z14 C\S2\M\Z14 s\S2\M\Z14 kg\S-1\M\Z14 m\S-3"
	DrawText 10,645, "\Z14\f02G\f00 ≈ 6.67430 × 10\S-11\M\Z14 m\S3\M\Z14 kg\S-1\M\Z14 s\S-2"
//
	DrawLine 30,655,195,655
	DrawText 40,680, "\Z18Exact conversions"
	DrawText 10,705, "\Z141 atm ≡ 101325 Pa"
	DrawText 10,725, "\Z141 yard ≡ 0.9144 m"
	DrawText 10,745, "\Z141 inch ≡ 0.0254 m"
	DrawText 10,765, "\Z141 lb ≡ 0.45359237 kg"
	DrawText 10,785, "\Z141 cal ≡ 4.184 J"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Physical_constants_info_button(Physical_constants_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calls Print_Physical_constants_info which prints information on the physical constants.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Physical_constants_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_physical_constants_info()
//
// Calls required previously: none
//
// Called by: Display_physical_constants_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Physical_constants_info_Struct
//
//
	If (Physical_constants_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_physical_constants_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_physical_constants_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the physical constants displayed in Physical_constants_panel
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_physical_constants_info_button
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Physical_constants_info_text
//
//
	Physical_constants_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Physical_constants_info_text = Physical_constants_info_text + "Physical Constants information\r"
	Physical_constants_info_text = Physical_constants_info_text + "------------------------------\r\r"
//
	Physical_constants_info_text = Physical_constants_info_text + "The International System of Units (SI) is described in the brochure 'International System of Units - 9th Edition (2019)' \r"
	Physical_constants_info_text = Physical_constants_info_text + "   of the Bureau International des Poids et Mesures (BIPM), available at https://www.bipm.org/en/publications/si-brochure/. \r"
	Physical_constants_info_text = Physical_constants_info_text + "It is based on seven constants which have invariant numerical values; those listed in the panel are N_A, k, c, e, and h.  \r"
	Physical_constants_info_text = Physical_constants_info_text + "Other quantities such as the Faraday constant, F, and the gas constant, R, are derived from these. \r\r"
//	
	Physical_constants_info_text = Physical_constants_info_text + "Tiesinga et al., 'CODATA recommended values of the fundamental physical constants, 2018', Rev. Mod. Phys., 93, 025010, 2021, \r"
	Physical_constants_info_text = Physical_constants_info_text + "   (in which recommended values of  ε_0 and G, are listed on pp 44 and 42), and Tiesinga et al., 'CODATA recommended values \r"
	Physical_constants_info_text = Physical_constants_info_text + "   of the fundamental constants: 2018', J. Phys. Chem. Reference data, 50, 033105, 2021 are also good references. \r\r"
// 
	Physical_constants_info_text = Physical_constants_info_text + "The recommended values of physical constants can also be found at https://physics.nist.gov/cuu/Constants/ \r"
	Physical_constants_info_text = Physical_constants_info_text + "   and at https://www.nist.gov/pml/fundamental-physical-constants. \r"
	Physical_constants_info_text = Physical_constants_info_text + "Another good reference on SI, a bit dated now (although much of the information is still valid), is \r"
	Physical_constants_info_text = Physical_constants_info_text + "   Thompson, A., and B. N. Taylor (2008), 'Guide for the use of the international system of units (SI)', \r"
	Physical_constants_info_text = Physical_constants_info_text + "   NIST Special Publication 811, 2008 Edition, which can be found at https://physics.nist.gov/cuu/pdf/sp811.pdf. \r\r"
//
	Physical_constants_info_text = Physical_constants_info_text + "The value of the standard acceleration due to gravity, g, of 9.80665 m/s^2 was adopted in 1901 by the \r"
	Physical_constants_info_text = Physical_constants_info_text + "   3rd General Conference on Weights and Measures (CGPM); this is listed on p. 159 of the BIPM brochure. \r"
	Physical_constants_info_text = Physical_constants_info_text + "The definition of 1 atmosphere as 101325 Pa was adopted in 1954 at the 10th CGPM (see p. 163 of the BIPM brochure). \r"
	Physical_constants_info_text = Physical_constants_info_text + "The definition of a yard as 0.9144 m was given in the [US] Federal Register, v. 24, No. 128, p. 5348, July 1, 1959, \r"
	Physical_constants_info_text = Physical_constants_info_text + "   which also defined the standard inch as 2.54 cm; see Thompson and Taylor, p. 43 for extensive discussion of this. \r\r"
//
	Physical_constants_info_text = Physical_constants_info_text + "The definition of the thermochemical calorie (Cal, or kcal) as 4184 J is given in Thompson and Taylor, pp. 45 and 47 (footnotes 9 and 10); \r"
	Physical_constants_info_text = Physical_constants_info_text + "   see also Stimson, H. F. (1955), 'Heat units and temperature scales for calorimetry', Amer. J. Phys., 23, 614-622. \r\r"
//
	Physical_constants_info_text = Physical_constants_info_text + "----------------------- Bottom of Page ----------------------"   
//
//
// print information
	KillWindow/Z Physical_constants_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(610,50,1520,520)/N=Physical_constants_info_notebook
	Notebook Physical_constants_info_notebook, text=Physical_constants_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_Gaussian_integrals()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This creates a panel that displays various integrals from 0 to ∞ of a power times a gaussian.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make Gaussian integrals panel
	KillWindow/Z Gaussian_integrals_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(610,50,850,630) /N=Gaussian_integrals_panel as "Gaussian integrals"
//
//
/////////////////////////////////////
//	set up Gaussian integrals title box
	TitleBox Gaussian_integrals_title title="\Z25Gaussian Integrals", size={120, 50}, pos={15,15},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
	DrawText 30, 85,  "\Z18∫\Z14\M x\Sp\M\Z14exp(-ax\S2\M\Z14) dx from 0 to ∞"
	DrawText 50, 110,  "\Z14\f02p\f00     value"
	DrawLine 50, 110, 60, 110
	DrawLine 75, 110, 110, 110
	DrawText 50, 135,  "\Z140     π\S1/2\M\Z14/(2a\S1/2\M\Z14)"
	DrawText 50, 155, "\Z141     1/(2a)"
	DrawText 50, 175, "\Z142     π\S1/2\M\Z14/(2\S2\M\Z14a\S3/2\M\Z14)"
	DrawText 50, 195, "\Z143     1/(2a\S2\M\Z14)"
	DrawText 50, 215, "\Z144     3π\S1/2\M\Z14/(2\S3\M\Z14a\S5/2\M\Z14)"
	DrawText 50, 235, "\Z145     1/a\S3"
	DrawText 50, 255, "\Z146     15π\S1/2\M\Z14/(2\S4\M\Z14a\S7/2\Z14)"
//
	DrawText 10, 285, "\Z14p even: π\S1/2\M\Z14/[2a\S(p+1)/2\M\Z14]×(1/2)…(p-1)/2"
	DrawText 10, 310, "\Z14p odd: [(p-1)/2]! / [2a\S(p+1)/2\M\Z14]"
	DrawLine 10, 315, 230, 315
//
//
/////////////////////////////////////
	DrawText 20, 345,  "\Z18∫\Z14\M x\Sp\M\Z14exp[-x\S2\M\Z14/(2b\S2\M\Z14)] dx from 0 to ∞"
	DrawText 50, 375,  "\Z14\f02p\f00     value"
	DrawLine 50, 375, 60, 375
	DrawLine 75, 375, 110, 375
	DrawText 50, 400, "\Z140     (π/2)\S1/2\M\Z14b"
	DrawText 50, 420, "\Z141     b\S2"
	DrawText 50, 440, "\Z142     (π/2)\S1/2\M\Z14b\S3"
	DrawText 50, 460, "\Z143     2b\S4"
	DrawText 50, 480, "\Z144     3(π/2)\S1/2\M\Z14b\S5"
	DrawText 50, 500, "\Z145     8b\S6"
	DrawText 50, 520, "\Z146     15(π/2)\S1/2\M\Z14b\S7"
//
	DrawText 15, 550, "\Z14p even: (π/2)\S1/2\M\Z14b\S(p+1)\M\Z14 × (1)(3)…(p-1)"
	DrawText 15, 575, "\Z14p odd: [(p-1)/2]! × 2\S(p-1)/2\M\Z14b\S(p+1)"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_Earth_moon_sun_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This creates a panel that displays basic Earth/moon/sun information.
// Most of this information is from Yoder, C. F. (1995), Astrometric and Geodetic Properties of Earth and the Solar System, 
//		Chapter 1, pp. 1-31 in Global Earth Physics: A Handbook of Physical Constants, Volume 1, Ed. T. J. Ahrens, American Geophysical Union.
// See in particular, Table 2 (pp. 8-9), Table 3a (p. 9), and Table 19 (p. 26).
//
// The total mean mass and dry air mass of the atmosphere is From Trenberth, K. E., and L. Smith (2005), 
//		The mass of the atmosphere: A constraint on global analyses, J. Clim., 18, 864-875.
//	They give the total mean mass as 5.1480e18 kg, and the dry air mass as 5.1352e18 kg.
//		The latter value is used for CO2 calculations, together with 28.966 g/mol as the mean molecular weight of air, from 
//		Gatley, D. P, S. Herrmann, & H.-J. Kretzschmar (2008), A twenty-first century molar mass for dry air, HVAC&R Research, 14, 655-662.
//		This corresponds to 1.773e20 moles of dry air.
//
//
// Version history: This was originally called "Do_Earth_info()".
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Do_Earth_moon_sun_info_button (when "i" button hit)
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make Earth/sun/moon info panel
	KillWindow/Z Earth_moon_sun_info_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(860,50,1100,885) /N=Earth_moon_sun_info_panel as "Earth-moon-sun info"
//
//
/////////////////////////////////////
//	set up title box for Earth/moon/sun info
	TitleBox Earth_moon_sun_info_title title="\Z25Earth/moon/sun Info", size={200, 50}, pos={10, 15},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Earth/moon/sun info button
	Button Earth_moon_sun_info_button,pos={95,785},size={40,40},proc=Do_Earth_moon_sun_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// display information
	DrawLine 20,65,220,65
	DrawText 60,90, "\Z16        Earth"
 	DrawText 30, 110, "\Z14 Radius: 6.37 × 10\S3\M\Z14 km"
 	DrawText 15, 130, "\Z14Total area: 5.10 × 10\S8\M\Z14 km\S2"
 	DrawText 15, 150, "\Z14         land: 1.48 × 10\S8\M\Z14 km\S2"
 	DrawText 15, 170, "\Z14      ocean: 3.62 × 10\S8\M\Z14 km\S2"
	DrawText 15, 190, "\Z14Total mass:  5.97 × 10\S24\M\Z14 kg"
	DrawText 15, 210, "\Z14         ocean:  1.4  × 10\S21\M\Z14 kg"
	DrawText 15, 230, "\Z14         atmos: 5.15 × 10\S18\M\Z14 kg"
	DrawText 15, 250, "\Z14         (1.77 × 10\S20\M\Z14 mol dry air)"
//
	DrawLine 20,260,220,260
	DrawText 60, 285, "\Z16       Moon"
	DrawText 15, 305, "\Z14Radius:  1.74 × 10\S3\M\Z14 km"
	DrawText 15, 325, "\Z14Mass:     7.35 × 10\S22\M\Z14 kg"
	DrawText 15, 345, "\Z14Mean distance:  3.85 × 10\S5\M\Z14 km"
//
	DrawLine 20, 355, 220, 355
	DrawText 60, 380, "\Z16        Sun"
	DrawText 15, 400, "\Z14Radius: 6.95 × 10\S5\M\Z14 km"
	DrawText 15, 420, "\Z14Mass:    1.99 × 10\S30\M\Z14 kg"
	DrawText 15, 440, "\Z14Mean distance: 1.496 × 10\S8\M\Z14 km"
	DrawText 14, 460, "\Z14Effective temperature: 5778 K"
//
	DrawLine 20, 470, 220, 470
	DrawText 60, 495, "\Z16Concentrations"
	DrawText 52.5, 512.5, "\Z14(at 20 ºC and 1 atm)"
	DrawText 10, 535, "\Z141 cm\S3\M\Z14 contains 2.5×10\S19\M\Z14 molecules"
	DrawText 10, 555, "\Z141 ppm is 2.5×10\S13\M\Z14 molecules cm\S-3"
	DrawText 10, 575, "\Z141 ppb  is 2.5×10\S10\M\Z14 molecules cm\S-3"
	DrawText 10, 595, "\Z141 ppt   is 2.5×10\S7\M\Z14   molecules cm\S-3"
//
//
	DrawLine 20, 600, 220, 600
	DrawText 60, 630, "\Z16 Atmospheric CO\B2\M"
	DrawText 10, 650, "\Z141 ppm CO\B2\M\Z14 = 1.77 × 10\S14\M\Z14 mol C"
	DrawText 10, 670, "\Z14                    = 2.13 × 10\S12\M\Z14 kg C"
	DrawText 10, 690, "\Z14                    = 7.79 × 10\S12\M\Z14 kg CO\B2"
	DrawText 10, 715, "\Z14400 ppm CO\B2\M\Z14 = 7.08 × 10\S16\M\Z14 mol C"
	DrawText 15, 735, "\Z14                      = 8.50 × 10\S14\M\Z14 kg C"
	DrawText 15, 755, "\Z14                      = 3.12 × 10\S15\M\Z14 kg CO\B2"
	DrawText 10, 775, "\Z141 petagram (10\S12\M\Z14 kg) = 1 gigaton"
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Earth_moon_sun_info_button(Earth_moon_sun_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calls Print_Earth_moon_sun_info which prints information on the Earth/moon/sun information displayed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Earth_moon_sun_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Earth_moon_sun_info()
//
// Calls required previously: none
//
// Called by: Display_Earth_moon_sun_info_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Earth_moon_sun_info_Struct
//
//
	If (Earth_moon_sun_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Earth_moon_sun_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Earth_moon_sun_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the Earth/moon/sun information displayed in Earth_moon_sun_info_panel
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Earth_moon_sun_info_button (when "i" is hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Earth_moon_sun_info_text	
//
//
	Earth_moon_sun_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "Earth/Moon/Sun Information\r"
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "--------------------------\r\r"
//
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "Most of the information listed is from Yoder, C. F. (1995), 'Astrometric and Geodetic Properties\r" 
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   of Earth and the Solar System', Chapter 1, pp. 1-31 in Global Earth Physics: A Handbook of\r" 
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   Physical Constants, Volume 1, Ed. T. J. Ahrens, American Geophysical Union.\r"
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   See in particular, Table 2 (pp. 8-9), Table 3a (p. 9), and Table 19 (p. 26).\r\r"
//
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "Trenberth, K. E., & L. Smith (2005), 'The mass of the atmosphere: A constraint on global analyses', \r" 
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   J. Clim., 18, 864-875, give the total mean mass of the atmosphere as 5.1480e18 kg \r"
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   and the dry air mass as 5.1352e18 kg. The latter is used for the CO2 calculations, together with \r"
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   28.966 g/mol as the mean molecular weight of dry air, the value from Gatley et al., \r"
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   'A twenty-first century molar mass for dry air,' HVAC&R Research, 14, 655-662.\r"
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "   These values yield 1.773e20 moles of dry air. \r\r"
//
	Earth_moon_sun_info_text = Earth_moon_sun_info_text + "----------------------- Bottom of Page ----------------------"   
//
//
// print information
	KillWindow/Z Earth_moon_sun_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(10,50,750,350)/N=Earth_moon_sun_info_notebook
	Notebook Earth_moon_sun_info_notebook, text=Earth_moon_sun_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_Standard_Atmosphere()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This creates a panel that displays T, P, and rho from 0 to 50 km for the US Standard Atmosphere, 1976.
// Data are from Table 1 (pp. 50-73) in U.S. Standard Atmosphere, 1976, NOAA, NASA, US Air Force.
// It is available online at https://www.ngdc.noaa.gov/stp/space-weather/online-publications/miscellaneous/us-standard-atmosphere-1976/us-standard-atmosphere_st76-1562_noaa.pdf
// This routine also creates the following waves (each 20 long):
//		z_km_SA, TK_SA, p_hPa_SA, pbyp0_SA, rho_SA, rhobyrho0_SA
//


/// eeeee I need to revise this to show boundaries of the different regios



//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make Standard Atmosphere panel
	KillWindow/Z Standard_Atmosphere_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(1110,50,1460,585) /N=Standard_Atmosphere_panel as "Standard Atmosphere"
//
//
/////////////////////////////////////
//	set up Standard Atmosphere title box
	TitleBox Standard_Atmosphere_title title="\Z24US Standard Atmosphere 1976", size={320, 50}, pos={10, 15}, fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
	DrawText 15, 85, " \f02z\f00/km";   DrawText 50, 85, "   \f02T\f00/K";    DrawText 110, 85, "  \f02p\f00/hPa";     DrawText 170, 85, "    \f02p\f00/\f02p\f00\B0"
	DrawText 225, 85, "\f02ρ\f00/(kg m\S-3\M)";		DrawText 290, 85, "   \f02ρ\f00/\f02ρ\f00\B0"
	DrawText 15, 95, " -----";  DrawText 50, 95, "   -----";  DrawText 110, 95, "  --------";  DrawText 170, 95, "    -----";   DrawText 225, 95, "-------------";    DrawText 290, 95, "   ------"
	DrawText 15, 110, "  0";    DrawText 50, 110, "288.150";  DrawText 110, 110, "1013.25",    DrawText 170, 110, "1.00000";    DrawText 230, 110, "1.2250";         DrawText 290, 110, "1.00000"
	DrawText 15, 125, "  1";    DrawText 50, 125, "281.651";  DrawText 110, 125, "  898.76",   DrawText 170, 125, "0.88700";    DrawText 230, 125, "1.1117";         DrawText 290, 125, "0.90748"
	DrawText 15, 140, "  2";    DrawText 50, 140, "275.154";  DrawText 110, 140, "  795.01",   DrawText 170, 140, "0.78461";    DrawText 230, 140, "1.0066";         DrawText 290, 140, "0.82168"
	DrawText 15, 155, "  3";    DrawText 50, 155, "268.659";  DrawText 110, 155, "  701.21",   DrawText 170, 155, "0.69204";    DrawText 230, 155, "0.90925";        DrawText 290, 155, "0.74225"
	DrawText 15, 170, "  4";    DrawText 50, 170, "262.166";  DrawText 110, 170, "  616.60",   DrawText 170, 170, "0.60854";    DrawText 230, 170, "0.81935";        DrawText 290, 170, "0.66885"
	DrawText 15, 185, "  5";    DrawText 50, 185, "255.676";  DrawText 110, 185, "  540.48",   DrawText 170, 185, "0.53341";    DrawText 230, 185, "0.73643";        DrawText 290, 185, "0.60117"
	DrawText 15, 200, "  6";    DrawText 50, 200, "249.187";  DrawText 110, 200, "  472.17",   DrawText 170, 200, "0.46600";    DrawText 230, 200, "0.66022";        DrawText 290, 200, "0.53887"
	DrawText 15, 215, "  7";    DrawText 50, 215, "242.700";  DrawText 110, 215, "  411.05",   DrawText 170, 215, "0.40567";    DrawText 230, 215, "0.59002";        DrawText 290, 215, "0.48165"
	DrawText 15, 230, "  8";    DrawText 50, 230, "236.215";  DrawText 110, 230, "  356.51",   DrawText 170, 230, "0.35185";    DrawText 230, 230, "0.52579";        DrawText 290, 230, "0.42921"
	DrawText 15, 245, "  9";    DrawText 50, 245, "229.733";  DrawText 110, 245, "  308.00",   DrawText 170, 245, "0.30397";    DrawText 230, 245, "0.46706";        DrawText 290, 245, "0.38128"
	DrawText 15, 260, "10";     DrawText 50, 260, "223.252";  DrawText 110, 260, "  264.99",   DrawText 170, 260, "0.26153";    DrawText 230, 260, "0.41351";        DrawText 290, 260, "0.33756"
	DrawText 15, 275, "12";     DrawText 50, 275, "216.650";  DrawText 110, 275, "  193.99",   DrawText 170, 275, "0.19145";    DrawText 230, 275, "0.31194";        DrawText 290, 275, "0.25464"
	DrawText 15, 290, "14";     DrawText 50, 290, "216.650";  DrawText 110, 290, "  141.70",   DrawText 170, 290, "0.13985";    DrawText 230, 290, "0.22786";        DrawText 290, 290, "0.18601"
	DrawText 15, 305, "16";     DrawText 50, 305, "216.650";  DrawText 110, 305, "  103.52",   DrawText 170, 305, "0.10217";    DrawText 230, 305, "0.16647";        DrawText 290, 305, "0.13589"
	DrawText 15, 320, "18";     DrawText 50, 320, "216.650";  DrawText 110, 320, "    75.65",  DrawText 170, 320, "0.07584";    DrawText 230, 320, "0.12165";        DrawText 290, 320, "0.09930"
	DrawText 15, 335, "20";     DrawText 50, 335, "216.650";  DrawText 110, 335, "    55.29",  DrawText 170, 335, "0.05457";    DrawText 230, 335, "0.08891";        DrawText 290, 335, "0.07258"
	DrawText 15, 350, "25";     DrawText 50, 350, "221.552";  DrawText 110, 350, "    25.49",  DrawText 170, 350, "0.02516";    DrawText 230, 350, "0.04008";        DrawText 290, 350, "0.03272"
	DrawText 15, 365, "30";     DrawText 50, 365, "226.509";  DrawText 110, 365, "    11.97",  DrawText 170, 365, "0.01181";    DrawText 230, 365, "0.01841";        DrawText 290, 365, "0.01503"
	DrawText 15, 380, "40";     DrawText 50, 380, "250.350";  DrawText 110, 380, "      2.87", DrawText 170, 380, "0.00283";    DrawText 230, 380, "0.00400";        DrawText 290, 380, "0.00326"
	DrawText 15, 395, "50";     DrawText 50, 395, "270.650";  DrawText 110, 395, "      0.80", DrawText 170, 395, "0.00079";    DrawText 230, 395, "0.00103";        DrawText 290, 395, "0.00084"
//
//
	Make/O/D/N=20 z_km_SA, TK_SA, p_hPa_SA, pbyp0_SA, rho_SA, rhobyrho0_SA
	z_km_SA={0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 16, 18, 20, 25, 30, 40, 50}
	TK_SA={288.150, 281.651, 275.154, 268.659, 262.166, 255.676, 249.187, 242.700, 236.215, 229.733, 223.252, 216.650, 216.650, 216.650, 216.650, 216.650, 221.552, 226.509, 250.350, 270.650}
	p_hPa_SA={1013.25, 898.76, 795.01, 701.21, 616.60, 540.48, 472.17, 411.05, 356.51, 308.00, 264.99, 193.99, 141.70, 103.52, 75.65, 55.29, 25.49, 11.97, 2.87, 0.80}
	pbyp0_SA={1.00000, 0.88700, 0.78461, 0.69204, 0.60854, 0.53341, 0.46600, 0.40567, 0.35185, 0.30397, 0.26153, 0.19145, 0.13985, 0.10217, 0.07584, 0.05457, 0.02516, 0.01181, 0.00283, 0.00079}
	rho_SA={1.2250, 1.1117, 1.0066, 0.90925, 0.81935, 0.73643, 0.66022, 0.59002, 0.52579, 0.46706, 0.41351, 0.31194, 0.22786, 0.16647, 0.12165, 0.08891, 0.04008, 0.01841, 0.00400, 0.00103}
	rhobyrho0_SA={1.00000, 0.90748, 0.82168, 0.74225, 0.66885, 0.60117, 0.53887, 0.48165, 0.42921, 0.38128, 0.33756, 0.25464, 0.18601, 0.13589, 0.09930, 0.07258, 0.03272, 0.01503, 0.00326, 0.00084}
//
//
/////////////////////////////////////
// print reference
	DrawLine 10, 405, 340, 405
	DrawText 15, 430, "From Table 1 (pp. 50-73), U.S. Standard Atmosphere, 1976,"
	DrawText 15, 445, "Published by NOAA, NASA, US Air Force."
//
//
/////////////////////////////////////
// group waves available
	GroupBox Group_Standard_Atmosphere_waves pos={75, 455}, size={205, 65}, labelBack=(50000, 50000, 50000)
//
	DrawText 90, 475, "Waves available (dimension 20):"
	DrawLine 90, 475, 262.5, 475
	DrawText 85, 495, "z_km_SA, TK_SA, p_hPa_SA"
	DrawText 85, 515, "pbyp0_SA, rho_SA, rhobyrho0_SA"
//
//
/////////////////////////////////////
//		approximate
//		P/hPa	z/m
//		1000		100
//		900		990
//		800		1951
//		700		3010
//		600		4205
//		500		5580
//		400		7200
//		300		9180
//		200		11800
//		100		16200
//		50			20650
//		25			25100
//		10			31200
//		5			36000
//		2			42800
//		1			48100
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_conversions()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-06-07
//
//
// Description: This creates a panel that displays some common conversions.
//		M/(µg/m^3) = 1e-9 × V/(nm^3/cm^3) × ρ/(g/cm^3)
//		(extenction/scattering/absorption) coefficient/(Mm^-1) = 1e-6 × particle cross section/nm^2) × Number concentration/cm^3
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make Conversions panel
	KillWindow/Z Conversions_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(1110,625,1460,795) /N=Conversions_panel as "Conversions"
//
//
/////////////////////////////////////
//	set up title box for Conversions
	TitleBox Conversions_title title="\Z25Conversions", size={220, 50}, pos={110, 15},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
	DrawText 10,90, "\Z16 \f02M\f00/(µg m\S-3\M\Z16) = 10\S-9\M\Z16 × \f02V\f00/(nm\S3\M\Z16 cm\S-3\M\Z16) × \f02ρ\f00/(g cm\S-3\M\Z16)"
	DrawText 10, 120, "\Z16                    =          \f02V\f00/(µm\S3\M\Z16 cm\S-3\M\Z16) × \f02ρ\f00/(g cm\S-3\M\Z16)"
	DrawText 10,160, "\Z16 \f02σ\f00\Baerosol\M\Z16/(Mm\S-1\M\Z16) = 10\S-6\M\Z16 × \f02σ\f00\Bparticle\M\Z16/(nm\S2\M\Z16) × \f02N\f00/(cm\S-3\M\Z16)"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Clear_all_display_windows()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-11-13
//
//
// Description: This kills all display windows
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
	KillWindow/Z Greek_alphabet_panel // get rid of previous panel if it exists
	KillWindow/Z SI_prefixes_panel // get rid of previous panel if it exists
	KillWindow/Z SI_prefixes_info_notebook // get rid of window if it exists
	KillWindow/Z Physical_constants_panel // get rid of previous panel if it exists
	KillWindow/Z Physical_constants_info_notebook // get rid of window if it exists
	KillWindow/Z Gaussian_integrals_panel // get rid of previous panel if it exists
	KillWindow/Z Earth_moon_sun_info_panel // get rid of previous panel if it exists
	KillWindow/Z Earth_moon_sun_info_notebook // get rid of window if it exists
	KillWindow/Z Standard_Atmosphere_panel // get rid of previous panel if it exists
	KillWindow/Z Conversions_panel // get rid of previous panel if it exists
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Input_chemical_formula_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This sets up a panel to input a chemical formula that allows the user to calculate formula weights.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Update_for_Input_chemical_formula_panel
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	String/G Chemical_formula
//
//
/////////////////////////////////////
//	make Input Formula panel
	KillWindow/Z Input_chemical_formula_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(50, 50, 350, 300) /N=Input_chemical_formula_panel as "Input Formula"
//
//
/////////////////////////////////////
//	set up Input formula title box
	TitleBox Input_chemical_formula_title title="\Z25Find Formula Weight", size={120, 40}, pos={35,5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
	Chemical_Formula="" // so that it is blank if the panel is remade (otherwise, as ChemicalFormula is a global, any previous value would have been displayed)
//
//
/////////////////////////////////////
// group Formula input boxes
	GroupBox Group_Formula_inputs pos={15, 95}, size={270, 30}, labelBack=(65535, 50000, 50000)
//
// set up input boxes
	DrawText 75,70, "\Z16Input chemical formula:"
	DrawText 75,90,"\Z16(max 100 parentheses)"
	SetVariable TheInputFormula, pos={20,99}, size={260,20}, bodyWidth=0, proc=Update_for_Input_chemical_formula_panel, title=" ", fsize=14, value=Chemical_Formula
//
//
Return 0
//
//
END
//////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Input_chemical_formula_panel(Calculate_chemical_formula_Struct) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This provides the control for SetVariables in Make_Input_chemical_formula_panel by updating everything
//		shown in that panel whenever an input is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: Chemical_Formula
//
// Calls: Calculate_Formula_Weight()
//
// Calls required previously: none
//
// Called by: Make_Input_chemical_formula_panel (when a SetVariable TheInputFormula is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &Calculate_chemical_formula_Struct
	SVAR Chemical_Formula
	String Formula_Weight_String
//
//
	If (Calculate_chemical_formula_Struct.eventcode == 2) // do only when compound is entered (eventcode = 2)
// print formula weight
		DrawAction getgroup=Group_chemical_formula_outputs_group, delete // get rid of previous text and rewrite
		SetDrawEnv gstart, gname=Group_chemical_formula_outputs_group
			GroupBox Group_chemical_formula_outputs pos={15, 130}, size={270,30}, labelBack=(50000, 50000, 50000)
			Formula_Weight_String=Calculate_Formula_Weight(Chemical_Formula)
			DrawText 20, 155, Formula_Weight_String
		SetDrawEnv gstop
//
//
// print waves available
		DrawAction getgroup=Group_element_waves_available_group, delete // get rid of previous text and rewrite
		SetDrawEnv gstart, gname=Group_element_waves_available_group
			GroupBox Element_waves pos={5, 170}, size={290,65}, labelBack=(50000, 50000, 50000)
			DrawText 45, 190, "\Z14Waves available (dimension 119):"
			DrawLine 45, 190, 255, 190
			DrawText 7.5, 210, "\Z14Text waves: Element_symbol, Element_name"
			DrawText 7.5, 230, "\Z14Numeric wave: Atomic_Weight"
		SetDrawEnv gstop
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
Function/S Calculate_Formula_Weight(Compound_String)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calculates the formula weight of a user-entered chemical formula.
// I tried to make it bombproof, but there might be a way to get around that.
//
//
// Version history: There are no previous versions.
// 		This is based on a QBasic version I wrote (“SUB FindFormulaWeight, version 01.01”) in 1997.
//
// Explanation of call parameters: Compound_String is the chemical formula input by the user
//
// Quantities required for function: Compound_String, Element_Symbol, Formula_Weight
//
// Calls: Make_Elements_Waves
//
// Calls required previously: none
//
// Called by: Update_for_Input_chemical_formula_panel
//
// Return: TheString (which is a string that will be printed later), or ErrorString (an error message)
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	String Compound_String
	Variable NParentheses, NParenthesesMax, i, Number_of_Elements, Atomic_Number
	NParenthesesMax = 100
	Number_of_Elements=118
	String C_String, Lowercase_String, Try_String, Success_String, ErrorString
	Lowercase_String = ""
	Success_String = "yes"
//
//
	Make_Elements_Waves() // generate the text waves Element_symbol and Element_name, and the wave Atomic_Weight
//
//
	Wave/T Element_Symbol
	Wave Atomic_Weight
//
//
	Make/O/D/N=(NparenthesesMax+1) Formula_Weight=0
	Make/O/T/N=(NparenthesesMax+1) Number_String="" // these are the numbers that multiply what's in parentheses
//
//
/////////////////////////
// EnterCompound
	Compound_String = TrimString(Compound_String) // get rid of leading or trailing spaces
	IF (StringMatch("()",Compound_String))
		ErrorString = "There are empty parentheses."
		Return ErrorString
	EndIf
//
//
/////////////////////////
// Calculate Formula Weight
//
//
	NParentheses = 0 // initialize to zero; this is the number of ) minus the number of (
//
//
	If (CmpStr(Compound_String,"") == 0)
		ErrorString = "" //No compound was entered
		Return ErrorString
	EndIf
//
//
////////Go through compound formula backwards
	FOR (i=1;i<=strlen(Compound_String);i+=1)
		C_String = Compound_String[strlen(Compound_String) - i]
//
		If (CmpStr(C_String, ")") == 0)
			IF (CmpStr(Lowercase_String, "") != 0)
				ErrorString = "There is a lowercase letter to the right of a right parenthesis."
				Return ErrorString
			EndIf
			NParentheses = NParentheses + 1
			Formula_Weight[NParentheses] = 0
//
		ElseIf (CmpStr(C_String,"(") == 0)
			IF (CmpStr(Lowercase_String, "") != 0)
				ErrorString = "There is a right parenthesis to the right of a left parenthesis."
				Return ErrorString
			EndIf
			NParentheses = NParentheses - 1
			IF (NParentheses < 0)
				ErrorString = "The parentheses are out of order."
				Return ErrorString
			EndIf
			IF (CmpStr(Number_String(NParentheses),"") == 0)
				Number_String[NParentheses] = "1"
			EndIf
			Formula_Weight[NParentheses] = Formula_Weight[NParentheses] + Formula_Weight[NParentheses + 1] * str2num(Number_String[NParentheses])
			Number_String[NParentheses] = ""
//
		ElseIf ((CmpStr(C_String,"0") == 0) || (CmpStr(C_String,"1") == 0) || (CmpStr(C_String,"2") == 0) || (CmpStr(C_String,"3") == 0) || (CmpStr(C_String,"4") ==0) || (CmpStr(C_String,"5") == 0) || (CmpStr(C_String,"5") == 0) || (CmpStr(C_String,"6") == 0) || (CmpStr(C_String,"7") == 0) || (CmpStr(C_String,"8") == 0) || (CmpStr(C_String,"9") == 0))
			IF (CmpStr(Lowercase_String,"") != 0)
				ErrorString = "There can't be a lower case to the right of a number."
				Return ErrorString
			EndIf
			Number_String[NParentheses] = C_String + Number_String[NParentheses]
//
		ElseIf ((CmpStr(C_String,"a",1) == 0) || (CmpStr(C_String,"b",1) == 0) || (CmpStr(C_String,"c",1) == 0) || (CmpStr(C_String,"d",1) == 0) || (CmpStr(C_String,"e",1) == 0) || (CmpStr(C_String,"f",1) == 0) || (CmpStr(C_String,"g",1) == 0) || (CmpStr(C_String,"h",1) == 0) || (CmpStr(C_String,"i",1) == 0) || (CmpStr(C_String,"k",1) == 0) || (CmpStr(C_String,"l",1) == 0) || (CmpStr(C_String,"m",1) == 0) || (CmpStr(C_String,"n",1) == 0) || (CmpStr(C_String,"o",1) == 0) || (CmpStr(C_String,"p",1) == 0) || (CmpStr(C_String,"r",1) == 0) || (CmpStr(C_String,"s",1) == 0) || (CmpStr(C_String,"t",1) == 0) || (CmpStr(C_String,"u",1) == 0) || (CmpStr(C_String,"v",1) == 0) || (CmpStr(C_String,"y",1) == 0))
//		there is no "j", "q", "w", "x", or "z" in any of the element names
			IF (CmpStr(Lowercase_String, "") != 0)
				ErrorString = "There can't be a lower case to the right of another lower case."
				Return ErrorString
			EndIf
			Lowercase_String = C_String
//
		ElseIf ((CmpStr(C_String,"A",1) == 0) || (CmpStr(C_String,"B",1) == 0) || (CmpStr(C_String,"C",1) == 0) || (CmpStr(C_String,"D",1) == 0) || (CmpStr(C_String,"E",1) == 0) || (CmpStr(C_String,"F",1) == 0) || (CmpStr(C_String,"G",1) == 0) || (CmpStr(C_String,"H",1) == 0) || (CmpStr(C_String,"I",1) == 0) || (CmpStr(C_String,"K",1) == 0) || (CmpStr(C_String,"L",1) == 0) || (CmpStr(C_String,"M",1) == 0) || (CmpStr(C_String,"N",1) == 0) || (CmpStr(C_String,"O",1) == 0) || (CmpStr(C_String,"P",1) == 0) || (CmpStr(C_String,"R",1) == 0) || (CmpStr(C_String,"S",1) == 0) || (CmpStr(C_String,"T",1) == 0) || (CmpStr(C_String,"U",1) == 0) || (CmpStr(C_String,"V",1) == 0) || (CmpStr(C_String,"W",1) == 0) || (CmpStr(C_String,"X",1) == 0) || (CmpStr(C_String,"Y",1) == 0) || (CmpStr(C_String,"Z",1) == 0))
//		there is no "J" or "Q" starting any of the element names
			Try_String = C_String + Lowercase_String
			Success_String = "No"
			FOR (Atomic_Number=1;Atomic_Number<=Number_of_Elements;Atomic_Number+=1)
				IF (CmpStr(Try_String,Element_Symbol[Atomic_Number],1) == 0) // if these match meaning an element is found
					IF (CmpStr(Number_String[NParentheses],"") == 0)
						Number_String[NParentheses] = "1"
					EndIf
					Formula_Weight[NParentheses] = Formula_Weight[NParentheses] + str2num(Number_String[NParentheses]) * Atomic_Weight[Atomic_number]
					Number_String[NParentheses] = ""
					Lowercase_String = "" // reset these
					Success_String = "Yes"
				EndIf
			EndFor
//
		Else
// 		there shouldn't be anything else
			ErrorString = "There is an invalid character."
			Return ErrorString
		EndIf
//
		If (CmpStr(Success_String, "No") == 0)
			ErrorString = "One of the names is not an element."
			Return ErrorString
		EndIf
//
		If (NParentheses < 0)
			ErrorString = "The parentheses are not matched."
			Return ErrorString
		EndIf
	EndFor
//
//
	If (CmpStr(C_String,")") == 0)
		ErrorString = "The leftmost character can't be lower case."
		Return ErrorString
	EndIf
//
	If (CmpStr(Lowercase_String,"")!=0)
		ErrorString = "The leftmost character can't be a number."
		Return ErrorString
	EndIf
//
	If (CmpStr(Number_String[0],"")!=0)
		ErrorString = "Make sure the formula is typed correctly."
		Return ErrorString
	EndIf
//
	If (NParentheses != 0)
		ErrorString = "The parentheses aren't matched."
		Return ErrorString
	EndIf
//
//
///////////////////////// if the program gets to here, all is good
	String string_name, TheString
	Sprintf string_name, "%7.3f", Formula_Weight[0]
	TheString = "\Z16Formula weight = " + string_name + "\Z16 g mol\S-1\M\Z16" // this is returned to be printed
//
//
Return TheString
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Elements_waves()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-03
//
//
// Description: This makes waves of properties of the elements.
// The values come from Prohaska et al., Standard atomic weights of the elements 2021 (IUPAC Technical Report),
//		Pur. Appl. Chem., 94(5), 573-600, 2022, specifically Table 1 on p. 581 and Table 2 on p. p. 594.
// The values listed here are those in column 7 of Table 1, rounded to three decimal places if necessary,
//		including four elements (Bi, Th, Pa, and U) that have no stable isotopes but have a characteristic 
//		terrestrial isotopic composition.
// For elements that have no stable isotopes and for which no standard atomic weight is given
//		(Tc, Pm, Po, At, Rn, Fr, Ra, Ac, Np, Pu, Am, Cm, Bk, Cf, Es, Fm, Md, No, Lr, Rf, Db, Sg, Bh, Hs, Mt, 
//		Ds, Rg, Cn, Nh, Fl, Mc, Lv, Ts, and Og), the atomic weight of the longest-lived isotope from Table 2
//		is given, rounded to three decimal places.
// For the 14 elements (H, Li, B, C, N, O, Mg, Si, S, Cl, Ar, Br, Tl, and Pb) for which a range of values was 
//		listed in Table 1, the values in column 7 are presented here, rounded to three decimal places if necessary.
// Commonly used alternative spellings for aluminium and caesium are aluminum and cesium.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_Formula_Weight, Display_Elements
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	Variable NElements=119
	Make/O/D/N=(NElements) Atomic_Weight
	Make/O/T/N=(NElements) Element_symbol, Element_name
//
//
	Element_symbol[0] = "Abbr";		Atomic_Weight[0] = 0;			Element_name[1] = "Name"
	Element_symbol[1] = "H";		Atomic_Weight[1] = 1.008;		Element_name[1] = "hydrogen"	// the range is 1.00784-1.00811
	Element_symbol[2] = "He";		Atomic_Weight[2] = 4.003;		Element_name[2] = "helium"
	Element_symbol[3] = "Li";		Atomic_Weight[3] = 6.94;		Element_name[3] = "lithium"		// the range is 6.938-6.997
	Element_symbol[4] = "Be";		Atomic_Weight[4] = 9.012;		Element_name[4] = "beryllium"
	Element_symbol[5] = "B";		Atomic_Weight[5] = 10.81;		Element_name[5] = "boron"		// the range is 10.806-10.821
	Element_symbol[6] = "C";		Atomic_Weight[6] = 12.011;		Element_name[6] = "carbon"		// the range is 12.0096-12.0116
	Element_symbol[7] = "N";		Atomic_Weight[7] = 14.007;		Element_name[7] = "nitrogen"	// the range is 14.00643-14.00728
	Element_symbol[8] = "O";		Atomic_Weight[8] = 15.999;		Element_name[8] = "oxygen"		// the range is 15.99903-15.99977
	Element_symbol[9] = "F";		Atomic_Weight[9] = 18.998;		Element_name[9] = "fluorine"
	Element_symbol[10] = "Ne";		Atomic_Weight[10] = 20.180;		Element_name[10] = "neon"
	Element_symbol[11] = "Na";		Atomic_Weight[11] = 22.990;		Element_name[11] = "sodium"
	Element_symbol[12] = "Mg";		Atomic_Weight[12] = 24.305;		Element_name[12] = "magnesium"	// the range is 23.304-24.307
	Element_symbol[13] = "Al";		Atomic_Weight[13] = 26.982;		Element_name[13] = "aluminium"
	Element_symbol[14] = "Si";		Atomic_Weight[14] = 28.085;		Element_name[14] = "silicon"	// the range is 28.084-28.086
	Element_symbol[15] = "P";		Atomic_Weight[15] = 30.974;		Element_name[15] = "phosphorus"
	Element_symbol[16] = "S";		Atomic_Weight[16] = 32.06;		Element_name[16] = "sulfur"		// the range is 32.059-32.076
	Element_symbol[17] = "Cl";		Atomic_Weight[17] = 35.45;		Element_name[17] = "chlorine"	// the range is 35.446-35.457
	Element_symbol[18] = "Ar";		Atomic_Weight[18] = 39.95;		Element_name[18] = "argon"		// the range is 39.792-39.963
	Element_symbol[19] = "K";		Atomic_Weight[19] = 39.098;		Element_name[19] = "potassium"
	Element_symbol[20] = "Ca";		Atomic_Weight[20] = 40.078;		Element_name[20] = "calcium"
	Element_symbol[21] = "Sc";		Atomic_Weight[21] = 44.956;		Element_name[21] = "scandium"
	Element_symbol[22] = "Ti";		Atomic_Weight[22] = 47.867;		Element_name[22] = "titanium"
	Element_symbol[23] = "V";		Atomic_Weight[23] = 50.942;		Element_name[23] = "vanadium"
	Element_symbol[24] = "Cr";		Atomic_Weight[24] = 51.996;		Element_name[24] = "chromium"
	Element_symbol[25] = "Mn";		Atomic_Weight[25] = 54.938;		Element_name[25] = "manganese"
	Element_symbol[26] = "Fe";		Atomic_Weight[26] = 55.845;		Element_name[26] = "iron"
	Element_symbol[27] = "Co";		Atomic_Weight[27] = 58.933;		Element_name[27] = "cobalt"
	Element_symbol[28] = "Ni";		Atomic_Weight[28] = 58.693;		Element_name[28] = "nickel"
	Element_symbol[29] = "Cu";		Atomic_Weight[29] = 63.546;		Element_name[29] = "copper"
	Element_symbol[30] = "Zn";		Atomic_Weight[30] = 65.38;		Element_name[30] = "zinc"
	Element_symbol[31] = "Ga";		Atomic_Weight[31] = 69.723;		Element_name[31] = "gallium"
	Element_symbol[32] = "Ge";		Atomic_Weight[32] = 72.630;		Element_name[32] = "germanium"
	Element_symbol[33] = "As";		Atomic_Weight[33] = 74.922;		Element_name[33] = "arsenic"
	Element_symbol[34] = "Se";		Atomic_Weight[34] = 78.971;		Element_name[34] = "selenium"
	Element_symbol[35] = "Br";		Atomic_Weight[35] = 79.904;		Element_name[35] = "bromine"	// the range is 79.901-79.907
	Element_symbol[36] = "Kr";		Atomic_Weight[36] = 83.798;		Element_name[36] = "krypton"
	Element_symbol[37] = "Rb";		Atomic_Weight[37] = 85.468;		Element_name[37] = "rubidium"
	Element_symbol[38] = "Sr";		Atomic_Weight[38] = 87.62;		Element_name[38] = "strontium"
	Element_symbol[39] = "Y";		Atomic_Weight[39] = 88.906;		Element_name[39] = "yttrium"
	Element_symbol[40] = "Zr";		Atomic_Weight[40] = 91.224;		Element_name[40] = "zirconium"
	Element_symbol[41] = "Nb";		Atomic_Weight[41] = 92.906;		Element_name[41] = "niobium"
	Element_symbol[42] = "Mo";		Atomic_Weight[42] = 95.95;		Element_name[42] = "molybdenum"
	Element_symbol[43] = "Tc";		Atomic_Weight[43] = 96.906;		Element_name[43] = "technetium"			// no stable isotopes
	Element_symbol[44] = "Ru";		Atomic_Weight[44] = 101.07;		Element_name[44] = "ruthenium"
	Element_symbol[45] = "Rh";		Atomic_Weight[45] = 102.91;		Element_name[45] = "rhodium"
	Element_symbol[46] = "Pd";		Atomic_Weight[46] = 106.42;		Element_name[46] = "palladium"
	Element_symbol[47] = "Ag";		Atomic_Weight[47] = 107.87;		Element_name[47] = "silver"
	Element_symbol[48] = "Cd";		Atomic_Weight[48] = 112.41;		Element_name[48] = "cadmium"
	Element_symbol[49] = "In";		Atomic_Weight[49] = 114.82;		Element_name[49] = "indium"
	Element_symbol[50] = "Sn";		Atomic_Weight[50] = 118.71;		Element_name[50] = "tin"
	Element_symbol[51] = "Sb";		Atomic_Weight[51] = 121.76;		Element_name[51] = "antimony"
	Element_symbol[52] = "Te";		Atomic_Weight[52] = 127.60;		Element_name[52] = "tellurium"
	Element_symbol[53] = "I";		Atomic_Weight[53] = 126.90;		Element_name[53] = "iodine"
	Element_symbol[54] = "Xe";		Atomic_Weight[54] = 131.29;		Element_name[54] = "xenon"
	Element_symbol[55] = "Cs";		Atomic_Weight[55] = 132.91;		Element_name[55] = "caesium"
	Element_symbol[56] = "Ba";		Atomic_Weight[56] = 137.33;		Element_name[56] = "barium"
	Element_symbol[57] = "La";		Atomic_Weight[57] = 138.91;		Element_name[57] = "lanthanum"
	Element_symbol[58] = "Ce";		Atomic_Weight[58] = 140.12;		Element_name[58] = "cerium"
	Element_symbol[59] = "Pr";		Atomic_Weight[59] = 140.91;		Element_name[59] = "praseodymium"
	Element_symbol[60] = "Nd";		Atomic_Weight[60] = 144.24;		Element_name[60] = "neodymium"
	Element_symbol[61] = "Pm";		Atomic_Weight[61] = 144.913;		Element_name[61] = "promethium"			// no stable isotopes
	Element_symbol[62] = "Sm";		Atomic_Weight[62] = 150.36;		Element_name[62] = "samarium"
	Element_symbol[63] = "Eu";		Atomic_Weight[63] = 151.96;		Element_name[63] = "europium"
	Element_symbol[64] = "Gd";		Atomic_Weight[64] = 157.25;		Element_name[64] = "gadolinium"
	Element_symbol[65] = "Tb";		Atomic_Weight[65] = 158.93;		Element_name[65] = "terbium"
	Element_symbol[66] = "Dy";		Atomic_Weight[66] = 162.50;		Element_name[66] = "dysprosium"
	Element_symbol[67] = "Ho";		Atomic_Weight[67] = 164.93;		Element_name[67] = "holmium"
	Element_symbol[68] = "Er";		Atomic_Weight[68] = 167.26;		Element_name[68] = "erbium"
	Element_symbol[69] = "Tm";		Atomic_Weight[69] = 168.93;		Element_name[69] = "thulium"
	Element_symbol[70] = "Yb";		Atomic_Weight[70] = 173.05;		Element_name[70] = "ytterbium"
	Element_symbol[71] = "Lu";		Atomic_Weight[71] = 174.97;		Element_name[71] = "lutetium"
	Element_symbol[72] = "Hf";		Atomic_Weight[72] = 178.49;		Element_name[72] = "hafnium"
	Element_symbol[73] = "Ta";		Atomic_Weight[73] = 180.95;		Element_name[73] = "tantalum"
	Element_symbol[74] = "W"; 		Atomic_Weight[74] = 183.84;		Element_name[74] = "tungsten"
	Element_symbol[75] = "Re";		Atomic_Weight[75] = 186.21;		Element_name[75] = "rhenium"
	Element_symbol[76] = "Os";		Atomic_Weight[76] = 190.23;		Element_name[76] = "osmium"
	Element_symbol[77] = "Ir";		Atomic_Weight[77] = 192.22;		Element_name[77] = "iridium"
	Element_symbol[78] = "Pt";		Atomic_Weight[78] = 195.08;		Element_name[78] = "platinum"
	Element_symbol[79] = "Au";		Atomic_Weight[79] = 196.97;		Element_name[79] = "gold"
	Element_symbol[80] = "Hg";		Atomic_Weight[80] = 200.59;		Element_name[80] = "mercury"
	Element_symbol[81] = "Tl";		Atomic_Weight[81] = 204.38;		Element_name[81] = "thallium"	// the range is 204.382-204.385
	Element_symbol[82] = "Pb";		Atomic_Weight[82] = 207.2;		Element_name[82] = "lead"		// the range is 206.14-207.94
	Element_symbol[83] = "Bi";		Atomic_Weight[83] = 208.98;		Element_name[83] = "bismuth"			// no stable isotopes, but characteristic terrestrial isotopic composition exists
	Element_symbol[84] = "Po";		Atomic_Weight[84] = 208.982;		Element_name[84] = "polonium"			// no stable isotopes
	Element_symbol[85] = "At";		Atomic_Weight[85] = 209.987;		Element_name[85] = "astatine"			// no stable isotopes
	Element_symbol[86] = "Rn";		Atomic_Weight[86] = 222.018;		Element_name[86] = "radon"				// no stable isotopes
	Element_symbol[87] = "Fr";		Atomic_Weight[87] = 223.020;		Element_name[87] = "francium"			// no stable isotopes
	Element_symbol[88] = "Ra";		Atomic_Weight[88] = 226.025;		Element_name[88] = "radium"				// no stable isotopes
	Element_symbol[89] = "Ac";		Atomic_Weight[89] = 227.028;		Element_name[89] = "actinium"			// no stable isotopes	
	Element_symbol[90] = "Th";		Atomic_Weight[90] = 232.04;		Element_name[90] = "thorium"			// no stable isotopes, but characteristic terrestrial isotopic composition exists
	Element_symbol[91] = "Pa";		Atomic_Weight[91] = 231.04;		Element_name[91] = "protactinium"		// no stable isotopes, but characteristic terrestrial isotopic composition exists
	Element_symbol[92] = "U"; 		Atomic_Weight[92] = 238.03;		Element_name[92] = "uranium"			// no stable isotopes, but characteristic terrestrial isotopic composition exists
	Element_symbol[93] = "Np";		Atomic_Weight[93] = 237.048;		Element_name[93] = "neptunium"			// no stable isotopes
	Element_symbol[94] = "Pu";		Atomic_Weight[94] = 244.064;		Element_name[94] = "plutonium"			// no stable isotopes
	Element_symbol[95] = "Am";		Atomic_Weight[95] = 243.061;		Element_name[95] = "americium"			// no stable isotopes
	Element_symbol[96] = "Cm";		Atomic_Weight[96] = 247.070;		Element_name[96] = "curium"				// no stable isotopes
	Element_symbol[97] = "Bk";		Atomic_Weight[97] = 247.070;		Element_name[97] = "berkelium"			// no stable isotopes
	Element_symbol[98] = "Cf";		Atomic_Weight[98] = 251.080;		Element_name[98] = "californium"		// no stable isotopes
	Element_symbol[99] = "Es";		Atomic_Weight[99] = 252.083;		Element_name[99] = "einsteinium"		// no stable isotopes
	Element_symbol[100] = "Fm";		Atomic_Weight[100] = 257.095;	Element_name[100] = "fermium"			// no stable isotopes
	Element_symbol[101] = "Md";		Atomic_Weight[101] = 258.098;	Element_name[101] = "mendelevium"		// no stable isotopes
	Element_symbol[102] = "No";		Atomic_Weight[102] = 259.101;	Element_name[102] = "nobelium"			// no stable isotopes
	Element_symbol[103] = "Lr";		Atomic_Weight[103] = 262.110;	Element_name[103] = "lawrencium"		// no stable isotopes
	Element_symbol[104] = "Rf";		Atomic_Weight[104] = 267.122;	Element_name[104] = "rutherfordium"		// no stable isotopes
	Element_symbol[105] = "Db";		Atomic_Weight[105] = 268.126;	Element_name[105] = "dubnium"			// no stable isotopes
	Element_symbol[106] = "Sg";		Atomic_Weight[106] = 269.129;	Element_name[106] = "seaborgium"		// no stable isotopes
	Element_symbol[107] = "Bh";		Atomic_Weight[107] = 270.133;	Element_name[107] = "bohrium"			// no stable isotopes
	Element_symbol[108] = "Hs";		Atomic_Weight[108] = 269.133;	Element_name[108] = "hassium"			// no stable isotopes
	Element_symbol[109] = "Mt";		Atomic_Weight[109] = 277.154;	Element_name[109] = "meitnerium"		// no stable isotopes
	Element_symbol[110] = "Ds";		Atomic_Weight[110] = 281.165;	Element_name[110] = "darmstadtium"		// no stable isotopes
	Element_symbol[111] = "Rg";		Atomic_Weight[111] = 282.169;	Element_name[111] = "roentgenium"		// no stable isotopes
	Element_symbol[112] = "Cn";		Atomic_Weight[112] = 285.177;	Element_name[112] = "copernicium"		// no stable isotopes
	Element_symbol[113] = "Nh";		Atomic_Weight[113] = 286.182;	Element_name[113] = "nihonium"			// no stable isotopes
	Element_symbol[114] = "Fl";		Atomic_Weight[114] = 289.192;	Element_name[114] = "flerovium"			// no stable isotopes
	Element_symbol[115] = "Mc";		Atomic_Weight[115] = 290.196;	Element_name[115] = "moscovium"			// no stable isotopes
	Element_symbol[116] = "Lv";		Atomic_Weight[116] = 293.205;	Element_name[116] = "livermorium"		// no stable isotopes
	Element_symbol[117] = "Ts";		Atomic_Weight[117] = 294.211;	Element_name[117] = "tennessine"		// no stable isotopes
	Element_symbol[118] = "Og";		Atomic_Weight[118] = 294.214;	Element_name[118] = "oganesson"			// no stable isotopes
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_Elements()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-03
//
//
// Description: This creates a panel that displays the elements and their atomic weights.
// The values come from Prohaska et al., Standard atomic weights of the elements 2021 (IUPAC Technical Report),
//		Pur. Appl. Chem., 94(5), 573-600, 2022, specifically Table 1 on p. 581 and Table 2 on p. p. 594.
// The values listed here are those in column 7 of Table 1, rounded to three decimal places if necessary,
//		including four elements (Bi, Th, Pa, and U) that have no stable isotopes but have a characteristic 
//		terrestrial isotopic composition.
// For elements that have no stable isotopes and for which no standard atomic weight is given
//		(Tc, Pm, Po, At, Rn, Fr, Ra, Ac, Np, Pu, Am, Cm, Bk, Cf, Es, Fm, Md, No, Lr, Rf, Db, Sg, Bh, Hs, Mt, 
//		Ds, Rg, Cn, Nh, Fl, Mc, Lv, Ts, and Og), the atomic weight of the longest-lived isotope from Table 2
//		is given, rounded to three decimal places.
// For the 14 elements (H, Li, B, C, N, O, Mg, Si, S, Cl, Ar, Br, Tl, and Pb) for which a range of values was 
//		listed in Table 1, the values in column 7 are presented here, rounded to three decimal places if necessary.
// Commonly used alternative spellings for aluminium and caesium are aluminum and cesium.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Elements_waves, Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// make Element properties panel
	Killwindow/Z Element_properties_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(470,50,1620,635) /N=Element_properties_panel as "Element properties"
//
//
/////////////////////////////////////
//	set up Elements title box
	TitleBox Elements_title title="\Z25ELEMENTS", size={200, 50}, pos={470, 15},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
	DrawText 10, 85, "  1   H";   DrawText 55, 85, "hydrogen";    DrawText 130, 85, "  1.008 &"
	DrawText 10, 100, "  2   He"; DrawText 55, 100, "helium ";    DrawText 130, 100, "  4.003"
	DrawLine 10, 105, 165, 105
//
	DrawText 10, 125, "  3   Li"; DrawText 55, 125, "lithium";    DrawText 130, 125, "  6.94   &"
	DrawText 10, 140, "  4   Be"; DrawText 55, 140, "beryllium";  DrawText 130, 140, "  9.012"
	DrawText 10, 155, "  5   B";  DrawText 55, 155, "boron";      DrawText 130, 155, "10.81   &"
	DrawText 10, 170, "  6   C";  DrawText 55, 170, "carbon";     DrawText 130, 170, "12.011 &"
	DrawText 10, 185, "  7   N";  DrawText 55, 185, "nitrogen";   DrawText 130, 185, "14.007 &"
	DrawText 10, 200, "  8   O";  DrawText 55, 200, "oxygen";     DrawText 130, 200, "15.999 &"
	DrawText 10, 215, "  9   F";  DrawText 55, 215, "fluorine";   DrawText 130, 215, "18.998"
	DrawText 10, 230, "10   Ne";   DrawText 55, 230, "neon";       DrawText 130, 230, "20.180"
	DrawLine 10, 235, 165, 235
//
	DrawText 10, 255, "11   Na";   DrawText 55, 255, "sodium";     DrawText 130, 255, "22.990"
	DrawText 10, 270, "12   Mg";   DrawText 55, 270, "magnesium";  DrawText 130, 270, "24.305 &"
	DrawText 10, 285, "13   Al";   DrawText 55, 285, "aluminium";   DrawText 130, 285, "26.982 @"
	DrawText 10, 300, "14   Si";   DrawText 55, 300, "silicon";    DrawText 130, 300, "28.085 &"
	DrawText 10, 315, "15   P";    DrawText 55, 315, "phosphorus"; DrawText 130, 315, "30.974"
	DrawText 10, 330, "16   S";    DrawText 55, 330, "sulfur";     DrawText 130, 330, "32.06   &"
	DrawText 10, 345, "17   Cl";   DrawText 55, 345, "chlorine";   DrawText 130, 345, "35.45   &"
	DrawText 10, 360, "18   Ar";   DrawText 55, 360, "argon";      DrawText 130, 360, "39.95   &"
	DrawLine 10, 365, 165, 365
//
	DrawLine 190, 70, 190, 365
//
	DrawText 210, 85, "19   K";    DrawText 260, 85, "potassium";  DrawText 340, 85, "39.098"
	DrawText 210, 100, "20   Ca";  DrawText 260, 100, "calcium";   DrawText 340, 100, "40.078"
	DrawText 210, 115, "21   Sc";  DrawText 260, 115, "scandium";  DrawText 340, 115, "44.956"
	DrawText 210, 130, "22   Ti";  DrawText 260, 130, "titanium";  DrawText 340, 130, "47.867"
	DrawText 210, 145, "23   V";   DrawText 260, 145, "vanadium";  DrawText 340, 145, "50.942"
	DrawText 210, 160, "24   Cr";  DrawText 260, 160, "chromium";  DrawText 340, 160, "51.996"
	DrawText 210, 175, "25   Mn";  DrawText 260, 175, "manganese"; DrawText 340, 175, "54.938"
	DrawText 210, 190, "26   Fe";  DrawText 260, 190, "iron";      DrawText 340, 190, "55.845"
	DrawText 210, 205, "27   Co";  DrawText 260, 205, "cobalt";    DrawText 340, 205, "58.933"
	DrawText 210, 220, "28   Ni";  DrawText 260, 220, "nickel";    DrawText 340, 220, "58.693"
	DrawText 210, 235, "29   Cu";  DrawText 260, 235, "copper";    DrawText 340, 235, "63.546"
	DrawText 210, 250, "30   Zn";  DrawText 260, 250, "zinc";      DrawText 340, 250, "65.38"
	DrawText 210, 265, "31   G";   DrawText 260, 265, "gallium";   DrawText 340, 265, "69.723"
	DrawText 210, 280, "32   Ge";  DrawText 260, 280, "germanium"; DrawText 340, 280, "72.630"
	DrawText 210, 295, "33   As";  DrawText 260, 295, "arsenic";   DrawText 340, 295, "74.922"
	DrawText 210, 310, "34   Se";  DrawText 260, 310, "selenium";  DrawText 340, 310, "78.971"
	DrawText 210, 325, "35   Br";  DrawText 260, 325, "bromine";   DrawText 340, 325, "79.904 &"
	DrawText 210, 340, "36   Kr";  DrawText 260, 340, "krypton";   DrawText 340, 340, "83.798"
	DrawLine 210, 345, 380, 345
//
	DrawLine 400, 70, 400, 350
//
	DrawText 425, 85, "37   Rb";  DrawText 475, 85, "rubidium";    DrawText 555, 85, "  85.468"
	DrawText 425, 100, "38   Sr"; DrawText 475, 100, "strontium";  DrawText 555, 100, "  87.62"
	DrawText 425, 115, "39   Y";  DrawText 475, 115, "yttrium";    DrawText 555, 115, "  88.906"
	DrawText 425, 130, "40   Zr"; DrawText 475, 130, "zirconium";  DrawText 555, 130, "  91.224"
	DrawText 425, 145, "41   Nb"; DrawText 475, 145, "niobium";    DrawText 555, 145, "  92.906"
	DrawText 425, 160, "42   Mo"; DrawText 475, 160, "molybdenum"; DrawText 555, 160, "  95.95"
	DrawText 425, 175, "43   Tc"; DrawText 475, 175, "technetium"; DrawText 555, 175, "  96.906 #"
	DrawText 425, 190, "44   Ru"; DrawText 475, 190, "ruthenium";  DrawText 555, 190, "101.07"
	DrawText 425, 205, "45   Rh"; DrawText 475, 205, "rhodium";    DrawText 555, 205, "102.91"
	DrawText 425, 220, "46   Pd"; DrawText 475, 220, "palladium";  DrawText 555, 220, "106.42"
	DrawText 425, 235, "47   Ag"; DrawText 475, 235, "silver";     DrawText 555, 235, "107.87"
	DrawText 425, 250, "48   Cd"; DrawText 475, 250, "cadmium";    DrawText 555, 250, "112.41"
	DrawText 425, 265, "49   In"; DrawText 475, 265, "indium ";    DrawText 555, 265, "114.82"
	DrawText 425, 280, "50   Sn"; DrawText 475, 280, "tin";        DrawText 555, 280, "118.71"
	DrawText 425, 295, "51   Sb"; DrawText 475, 295, "antimony";   DrawText 555, 295, "121.76"
	DrawText 425, 310, "52   Te"; DrawText 475, 310, "tellurium";  DrawText 555, 310, "127.60"
	DrawText 425, 325, "53   I";  DrawText 475, 325, "iodine";     DrawText 555, 325, "126.90"
	DrawText 425, 340, "54   Xe"; DrawText 475, 340, "xenon";      DrawText 555, 340, "131.29"
	DrawLine 425, 345, 600, 345
//
	DrawLine 620, 70, 620, 580
//
	DrawText 635, 85, "55   Cs"; DrawText 685, 85, "caesium"; DrawText 745, 85, "132.91  @"
	DrawText 635,100, "56   Ba"; DrawText 685, 100, "barium"; DrawText 745, 100, "137.33"
		DrawLine 675, 105, 860, 105
		DrawText 675, 125, "57   La"; DrawText 725, 125, "lanthanum";    DrawText 815, 125, "138.91"
		DrawText 675, 140, "58   Ce"; DrawText 725, 140, "cerium";       DrawText 815, 140, "140.11"
		DrawText 675, 155, "59   Pr"; DrawText 725, 155, "praseodymium"; DrawText 815, 155, "140.91"
		DrawText 675, 170, "60   Nd"; DrawText 725, 170, "neodymium";    DrawText 815, 170, "144.24"
		DrawText 675, 185, "61   Pm"; DrawText 725, 185, "promethium";   DrawText 815, 185, "144.913 #"
		DrawText 675, 200, "62   Sm"; DrawText 725, 200, "samarium";     DrawText 815, 200, "150.36"
		DrawText 675, 215, "63   Eu"; DrawText 725, 215, "europium";     DrawText 815, 215, "151.96"
		DrawText 675, 230, "64   Gd"; DrawText 725, 230, "gadolinium";   DrawText 815, 230, "157.25"
		DrawText 675, 245, "65   Tb"; DrawText 725, 245, "terbium";      DrawText 815, 245, "158.93"
		DrawText 675, 260, "66   Dy"; DrawText 725, 260, "dysprosium";   DrawText 815, 260, "162.50"
		DrawText 675, 275, "67   Ho"; DrawText 725, 275, "holmium";      DrawText 815, 275, "164.93"
		DrawText 675, 290, "68   Er"; DrawText 725, 290, "erbium";       DrawText 815, 290, "167.26"
		DrawText 675, 305, "69   Tm"; DrawText 725, 305, "thulium";      DrawText 815, 305, "168.93"
		DrawText 675, 320, "70   Yb"; DrawText 725, 320, "ytterbium";    DrawText 815, 320, "173.05"
		DrawText 675, 335, "71   Lu"; DrawText 725, 335, "lutetium";     DrawText 815, 335, "174.97"
		DrawLine 675, 340, 860, 340
	DrawText 635, 360, "72   Hf"; DrawText 685, 360, "hafnium";  DrawText 745, 360, "178.49"
	DrawText 635, 375, "73   Ta"; DrawText 685, 375, "tantalum"; DrawText 745, 375, "180.95"
	DrawText 635, 390, "74   W";  DrawText 685, 390, "tungsten"; DrawText 745, 390, "183.84"
	DrawText 635, 405, "75   Re"; DrawText 685, 405, "rhenium";  DrawText 745, 405, "186.21"
	DrawText 635, 420, "76   Os"; DrawText 685, 420, "osmium";   DrawText 745, 420, "190.23"
	DrawText 635, 435, "77   Ir"; DrawText 685, 435, "iridium";  DrawText 745, 435, "192.22"
	DrawText 635, 450, "78   Pt"; DrawText 685, 450, "platinum"; DrawText 745, 450, "195.08"
	DrawText 635, 465, "79   Au"; DrawText 685, 465, "gold";     DrawText 745, 465, "196.97"
	DrawText 635, 480, "80   Hg"; DrawText 685, 480, "mercury";  DrawText 745, 480, "200.59"
	DrawText 635, 495, "81   Tl"; DrawText 685, 495, "thallium"; DrawText 745, 495, "204.38   &"
	DrawText 635, 510, "82   Pb"; DrawText 685, 510, "lead";     DrawText 745, 510, "207.2     &"
	DrawText 635, 525, "83   Bi"; DrawText 685, 525, "bismuth";  DrawText 745, 525, "208.98   $"
	DrawText 635, 540, "84   Po"; DrawText 685, 540, "polonium"; DrawText 745, 540, "208.982 #"
	DrawText 635, 555, "85   At"; DrawText 685, 555, "astatine"; DrawText 745, 555, "209.987 #"
	DrawText 635, 570, "86   Rn"; DrawText 685, 570, "radon";    DrawText 745, 570, "222.018 #"
	DrawLine 635, 575, 790, 575
//
	DrawLine 877.5, 70, 877.5, 580
//
	DrawText 890, 85, "  87   Fr"; DrawText 945, 85, "francium"; DrawText 1030, 85, "223.020 #"
	DrawText 890, 100, "  88   Ra"; DrawText 945, 100, "radium"; DrawText 1030, 100, "226.025 #"
		DrawLine 935, 105, 1110, 105
		DrawText 930, 125, "  89   Ac"; DrawText 985, 125, "actinium";     DrawText 1065, 125, "227.028 #"
		DrawText 930, 140, "  90   Th"; DrawText 985, 140, "thorium";      DrawText 1065, 140, "232.04   $"
		DrawText 930, 155, "  91   Pa"; DrawText 985, 155, "protactinium"; DrawText 1065, 155, "231.04   $"
		DrawText 930, 170, "  92   U";  DrawText 985, 170, "uranium";      DrawText 1065, 170, "238.03   $"
		DrawText 930, 185, "  93   Np"; DrawText 985, 185, "neptunium";    DrawText 1065, 185, "237.048 #"
		DrawText 930, 200, "  94   Pu"; DrawText 985, 200, "plutonium";    DrawText 1065, 200, "244.064 #"
		DrawText 930, 215, "  95   Am"; DrawText 985, 215, "americium";    DrawText 1065, 215, "243.061 #"
		DrawText 930, 230, "  96   Cm"; DrawText 985, 230, "curium";       DrawText 1065, 230, "247.070 #"
		DrawText 930, 245, "  97   Bk"; DrawText 985, 245, "berkelium";    DrawText 1065, 245, "247.070 #"
		DrawText 930, 260, "  98   Cf"; DrawText 985, 260, "californium";  DrawText 1065, 260, "251.080 #"
		DrawText 930, 275, "  99   Es"; DrawText 985, 275, "einsteinium";  DrawText 1065, 275, "252.083 #"
		DrawText 930, 290, "100   Fm";  DrawText 985, 290, "fermium";      DrawText 1065, 290, "257.095 #"
		DrawText 930, 305, "101   Md";  DrawText 985, 305, "medelevium";   DrawText 1065, 305, "258.098 #"
		DrawText 930, 320, "102   No";  DrawText 985, 320, "nobelium";     DrawText 1065, 320, "259.101 #"
		DrawText 930, 335, "103   Lr";  DrawText 985, 335, "lawrencium";   DrawText 1065, 335, "262.110 #"
		DrawLine 930, 340, 1110, 340
	DrawText 890, 360, "104   Rf"; DrawText 945, 360, "rutherfordium"; DrawText 1030, 360, "267.122 #"
	DrawText 890, 375, "105   Db"; DrawText 945, 375, "dubnium";       DrawText 1030, 375, "268.126 #"
	DrawText 890, 390, "106   Sg"; DrawText 945, 390, "seaborgium";    DrawText 1030, 390, "269.129 #"
	DrawText 890, 405, "107   Bh"; DrawText 945, 405, "bohrium";       DrawText 1030, 405, "270.133 #"
	DrawText 890, 420, "108   Hs"; DrawText 945, 420, "hassium";       DrawText 1030, 420, "269.133 #"
	DrawText 890, 435, "109   Mt"; DrawText 945, 435, "meitnerium";    DrawText 1030, 435, "277.154 #"
	DrawText 890, 450, "110   Ds"; DrawText 945, 450, "darmstadtium";  DrawText 1030, 450, "281.165 #"
	DrawText 890, 465, "111   Rg"; DrawText 945, 465, "roentgenium";   DrawText 1030, 465, "282.169 #"
	DrawText 890, 480, "112   Cn"; DrawText 945, 480, "copernicium";   DrawText 1030, 480, "285.177 #"
	DrawText 890, 495, "113   Nh"; DrawText 945, 495, "nihonium";      DrawText 1030, 495, "286.182 #"
	DrawText 890, 510, "114   Fl"; DrawText 945, 510, "flerovium";     DrawText 1030, 510, "289.192 #"
	DrawText 890, 525, "115   Mc"; DrawText 945, 525, "moscovium";     DrawText 1030, 525, "290.196 #"
	DrawText 890, 540, "116   Lv"; DrawText 945, 540, "livermorium";   DrawText 1030, 540, "293.205 #"
	DrawText 890, 555, "117   Ts"; DrawText 945, 555, "tennessine";    DrawText 1030, 555, "294.211 #"
	DrawText 890, 570, "118   Og"; DrawText 945, 570, "oganesson";     DrawText 1030, 570, "294.214 #"
	DrawLine 892, 575, 1075, 575
//
//
	GroupBox Info_on_elements pos={10, 380}, size={605,200}, labelBack=(50000, 50000, 50000)
//
	DrawText 20, 405, "\Z14From Prohaska et al. (2022), Standard atomic weights of the elements 2021"
	DrawText 20, 425, "\Z14   (IUPAC Technical Report), Pure Appl. Chem., 94(5): 573-600."
//
	DrawText 20, 450, "\Z14   & A range of values is given; values listed here are from Table 1, column 7."
	DrawText 20, 470, "\Z14   # No stable isotope; values listed here are for the longest-lived isotope, from Table 2."
	DrawText 20, 490, "\Z14   $ No stable isotopes; values listed are characteristic terrestrial isotopic compositions,"
	DrawText 20, 510, "\Z14      from Table 1, column 7."
	DrawText 20, 532.5, "\Z14@ Commonly used alternative spellings for aluminium and caesium are aluminum and cesium."
// 
//
	DrawText 20, 555, "\Z14Text waves available (dimension 119): Element_symbol, Element_name"
	DrawText 20, 575, "\Z14Numeric wave available (dimension 119): Atomic_Weight"
//
//
	Make_Elements_waves() // so that the waves are available to the user
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Set_defaults_for_property_panels()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This sets defaults for variables required for functions that calculate properties and
//		runs all of these functions for the first time.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Calculate_all_stuff_for_properties_panels
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function: lots; defined with defaults set below
// set temperature defaults
	Variable/G TempC_input, TempK_input, TempF_input, TempR_input
// I purposefully did NOT name these “TempC” and “TempK” so as not too conflict with variables that might already exist
		TempC_input=20
		TempK_input=TempC_input+273.15
		TempF_input=9/5*TempC_input+32
		TempR_input=9/5*TempK_input
//
//
// set pressure defaults
	Variable/G P_hPa_input, P_kPa_input, P_MPa_input, P_Pa_input, P_atm_input, P_mbar_input, P_bar_input, P_torr_input, P_psi_input, P_inHg_input, P_dynpercm2_input
//	I purposefully named these so they wouldn't be likely to conflict with variables already named.
		P_hPa_input=1013.25
		P_kPa_input=P_hPa_input/10
		P_MPa_input=p_hPa_input/1e4
		P_Pa_input=P_hPa_input*100
		P_atm_input=P_hPa_input/1013.25
		P_mbar_input=P_hPa_input
		P_bar_input=P_hPa_input/1000
		P_torr_input=P_hPa_input*760/1013.25
		P_psi_input=P_hPa_input*14.69595/1013.25
		P_inHg_input=P_hPa_input*29.9213/1013.25
		P_dynpercm2_input=P_hPa_input*1000
//
//
// set particle properties defaults
	Variable/G Dp_input, rho_input
		Dp_input=100 // nm
		rho_input=1 // g/cm^3
//
//
// set up coagulation defaults
	Variable/G Dp1_input, rho1_input, Dp2_input, rho2_input, coagulation_accommodation_coefficient_input, Fuchs_or_Dahneke_value
		Dp1_input=100 // nm
		Dp2_input=10 // nm
		rho1_input=1.0 // g/cm^3
		rho2_input=1.0 // g/cm^3
		coagulation_accommodation_coefficient_input=1.0
		Fuchs_or_Dahneke_value=1 // Fuchs' coagulation formula; Dahneke's is = 2
//
//
// set charging efficiency defaults for equal mobility diameters
	Variable/G Whose_charging_efficiencies_for_equal_Dmob = 1 // Wiedensohler
//
	Make/O/D/N=7 Diameter_actual_Q
	Diameter_actual_Q[0]=0
	Diameter_actual_Q[1]=100 // this is the default for the set up; the others will be calculated from this
//
//
// set charging efficiency defaults for same diameter with various charges
	Variable/G Whose_charging_efficiencies_for_same_Dp = 1 // Wiedensohler
//
	Make/O/D/N=7 Dmob_for_various_Q
	Dmob_for_various_Q[0]=0
	Dmob_for_various_Q[1]=100 // this is the default for the set up; the others will be calculated from this 
//
//
/////////////////////////////////////
	Calculate_all_stuff_for_properties_panels()
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_all_stuff_for_properties_panels()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calls all routines in Ernie's Igor Tools that display properties so that they are 
//		initially set up with the defaults listed in Set_defaults_for_property_panels(),
//		and after any input value is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: these are all global variables:
//		TempC_input, P_hPa_input, Dp_input, rho_input
//		Dp1_input, rho1_input, Dp2_input, rho2_input, coagulation_accommodation_coefficient_input, Fuchs_or_Dahneke_value
//
// Calls: Calculate_air_properties, Calculate_water_vapor_in_air_properties, Calculate_water_properties,
//		Calculate_particle_properties, Calculate_coagulation_quantities, Calculate_Dq_equal_mobility_as_Dq_actual,
//		Calculate_Dmob_for_various_Q, Calculate_charging_efficiencies_for_equal_Dmob, Calculate_charging_efficiencies_for_same_Dp_various_Q
//
// Calls required previously: none
//
// Called by: Set_defaults_for_property_panels, Update_for_Input_Temp_panel, Update_for_Input_Pres_panel, Update_for_Particle_properties_panel,
//		Update_for_Coagulation_panel, Choose_Fuchs_or_Dahneke_coagulation
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	NVAR TempC_input, P_hPa_input, Dp_input, rho_input
	NVAR Dp1_input, rho1_input, Dp2_input, rho2_input, coagulation_accommodation_coefficient_input, Fuchs_or_Dahneke_value
//
	Variable TempC, Pres_hPa, DDpp, rho_p, Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient
//
	Wave Diameter_actual_Q, Dmob_for_various_Q
	Make/O/D/N=7 Diameter_equal_mobility, Dmob_same_Dp_various_Q
//
	TempC=TempC_input
	Pres_hPa=P_hPa_input
//
	DDpp=Dp_input
	rho_p=rho_input
//
	Dp1=Dp1_input
	rho1=rho1_input
	Dp2=Dp2_input
	rho2=rho2_input
	coagulation_accommodation_coefficient=coagulation_accommodation_coefficient_input
//
//
	Calculate_air_properties(TempC, Pres_hPa)
	Calculate_water_vapor_in_air_properties(TempC, Pres_hPa)
	Calculate_water_properties(TempC)
//
	Calculate_particle_properties(DDpp, rho_p, TempC, Pres_hPa)
	Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)
//
	Calculate_Dq_equal_mobility_as_Dq_actual(Diameter_actual_Q[1], 1) // this means when the temperature is updated, 
//			the singly charged diameter is held constant and the others are determined from that
	Diameter_actual_Q=Diameter_equal_mobility
//
	Calculate_Dmob_for_various_Q(Dmob_for_various_Q[1], 1) // this means when the temperature is updated, 
//			the singly charged diameter is held constant and the others are determined from that
	Dmob_for_various_Q=Dmob_same_Dp_various_Q
//
	Calculate_charging_efficiencies_for_equal_Dmob()
	Calculate_charging_efficiencies_for_same_Dp_various_Q()
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Input_Temp_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This creates a panel that allows for input of temperature in either F, C, R, or K, 
//		and the corresponding temperatures on all scales are calculated.
// The input temperature is used for the calculation of substance and particle properties.	
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Update_for_Input_Temp_panel, Do_Input_Temp_panel_info_button (when "i" hit)
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	NVAR TempC_input, TempK_input, TempF_input, TempR_input // I purposefully did NOT name these “TempC” and “TempK”
//
//
/////////////////////////////////////
//	make Input Temp panel
	KillWindow/Z Input_Temp_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(10,75,160,280) /N=Input_Temp_panel as "Input Temp"
//
//
/////////////////////////////////////
//	set up Input Temp title box
	TitleBox Input_Temp_title title="\Z25Input Temp", pos={10, 5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Temp info button
	Button Input_Temp_info_button,pos={55,160},size={40,40},proc=Do_Input_Temp_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// group Temp input boxes
	GroupBox Group_Temp_inputs pos={25, 50}, size={105, 105}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up Temp input boxes
	DrawText 30,75, "\Z14°C"
	SetVariable TempC_input, pos={50,55}, size={75,20}, bodyWidth=0, title=" ", fsize=14, format="%6.2f"
	SetVariable TempC_input, value=TempC_input, limits={-273.15,inf,1}, proc=Update_for_Input_Temp_panel
//
	DrawText 30,100, "\Z14 K"
	SetVariable TempK_input, pos={50,80}, size={75,20}, bodyWidth=0, title=" ", fsize=14, format="%6.2f"
	SetVariable TempK_input, value=TempK_input, limits={0, inf,1}, proc=Update_for_Input_Temp_panel
//
	DrawText 30,125, "\Z14°F"
	SetVariable TempF_input, pos={50,105}, size={75,20}, bodyWidth=0, title=" ", fsize=14, format="%6.2f"
	SetVariable TempF_input, value=TempF_input, limits={-459.67, inf,1}, proc=Update_for_Input_Temp_panel
//
	DrawText 30,150, "\Z14°R"
	SetVariable TempR_input, pos={50,130}, size={75,20}, bodyWidth=0, title=" ", fsize=14, format="%6.2f"
	SetVariable TempR_input, value=TempR_input, limits={0, inf,1}, proc=Update_for_Input_Temp_panel
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Input_Temp_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This provides the control for SetVariables in Make_Input_Temp_panel by updating everything
//		shown in that panel whenever an input is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: TempC_input, TempK_input, TempF_input, TempR_input
//
// Calls: Calculate_all_stuff_for_properties_panels
//
// Calls required previously: none
//
// Called by: Make_Input_Temp_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
	NVAR TempC_input, TempK_input, TempF_input, TempR_input
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “TempC_input”) == 0) // if TempC changed
		EndIf
//
		If (cmpstr(ctrlName.vName, “TempK_input”) == 0) // calculate TempC if TempK changed
			TempC_input=TempK_input-273.15
		EndIf
//
		If (cmpstr(ctrlName.vName, “TempF_input”) == 0) // calculate TempC if TempF changed
			TempC_input=5/9*(TempF_input-32)
		EndIf
//
		If (cmpstr(ctrlName.vName, “TempR_input”) == 0) // calculate TempC changed
			TempC_input=5/9*TempR_input-273.15
		EndIf
//
		TempK_input=TempC_input+273.15
		TempF_input=9/5*TempC_input+32
		TempR_input=9/5*TempK_input
//
		Calculate_all_stuff_for_properties_panels() // so that whatever is used gets updated	
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Input_Temp_panel_info_button(Input_Temp_panel_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-12-03
//
//
// Description: This calls Print_Input_Temp_panel_info when the Do_Input_Temp_panel_info_button is hit in panel Make_Input_Temp_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Input_Temp_panel_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Input_Temp_panel_info
//
// Calls required previously: none
//
// Called by: Make_Input_Temp_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Input_Temp_panel_info_Struct
//
//
	If (Input_Temp_panel_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Input_Temp_panel_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Input_Temp_panel_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the Input_Temp_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Input_Temp_panel_info_button
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Input_Temp_panel_info_text
//
//
	Input_Temp_panel_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "Input Temperature Panel Information\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "-----------------------------------\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "This panel allows the user to select temperature on the Celsius, Kelvin, Fahrenheit, or Rankine scale, from which it is converted to the other scales\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   and used for input to various functions.\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The relations between the temperatures on the various scales are:\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   T/C = T/K - 273.15 = 5/9*(T/F - 32) = 5/9*(T/R - 491.67)\r"  
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   T/K = T/C + 273.15 = 5/9*(T/F - 32) + 273.15 = 5/9*T/R\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   T/F = 9/5*T/C + 32 = 9/5*(T/K - 273.15) + 32 = T/R - 459.67\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   T/R = 9/5*(T/C + 273.15) = 9/5*T/K = T/F + 459.67\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The kelvin, symbol K, is the SI unit of thermodynamic temperature T.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "In 2019, it was defined by taking the fixed numerical value of the Boltzmann constant k to be exactly 1.380 649 × 10^(-23)in units J/K; previous to this\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   it had been defined as 1/273.16 of the temperature of the triple point of water with isotopic composition of Vienna Standard Mean Ocean Water (V-SMOW).\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "Celsius temperature t is defined to be t ≡ T/K - 273.15.\r\r\r"
//	
// 
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "Temperature Scales and Their Realization\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "-----------------------------------------\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "NHS\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "---\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The Normal Hydrogen Scale (NHS), the first standard temperature scale, was adopted by the International Committee on Weights and Measures in 1887.\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "ITS-27\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "------\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "In 1927 the Seventh General Conference on Weights and Measures adopted the Thermodynamic Centigrade Scale as the fundamental temperature scale.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "On this scale, the unit ° C. was defined as 1/100 of the temperature between the temperature of melting ice (defined as 0° C.) and the temperature\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   of condensing water vapor (defined as 100° C.), both at a pressure of one standard atmosphere.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The International Temperature Scale (later called ITS-27), based on six fixed points and four interpolation regions, was defined as a practical scale to aid\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   in the realization of this thermodynamic scale.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "Temperatures in the interval 0° C. to 100° C. were found as the solution of a quadratic equation involving the resistance of a standard platinum resistance thermometer.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "ITS-27 was defined only down to -190° C.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "For a reference on ITS-27, see Burgess, G. K. (1928), The International Temperature Scale, Journal of Research of the National Bureau of Standards v. 1, 635-640.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "For a discussion of the difference between ITS-27 and previous scales, see Hall, J. A. (1929), The International Temperature Scale between 0° and 100° C.,\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   Philosophical Transactions of the Royal Society, v. 29A, 1-48.\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "ITS-48\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "------\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "In 1948 the Ninth General Conference on Weights and Measures adopted the Kelvin scale, on which temperatures are designated by ° K and denoted by the symbol T,\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   as the fundamental temperature scale to which all temperature measurements should ultimately be referable.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "On this scale, the temperature from the ice point (T0, for which the value 273.15° K was recommended) to the steam point is 100° K.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The thermodynamic Celsius scale, on which the temperature is T - T0, was also adopted.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The International Temperature Scale of 1948 (ITS-48), on which temperatures designated as ° C and denoted by the symbol t, was defined similar to ITS-27\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   in terms of six fixed points and four interpolation regions, with temperatures between 0° C and 100° C still found as the solution to a quadratic equation\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   involving the resistance of a standard platinum resistance thermometer.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "Temperatures in this interval remained the same as those on ITS-27.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "ITS-48 was defined down to -182.97° C.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "For a reference on ITS-48, see Stimson, H. F. (1949), The International Temperature Scale of 1948, Journal of the National Bureau of Standards, v. 42, 209-217.\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "IPTS-48\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "-------\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "In 1954 the Tenth General Conference on Weights and Measures adopted the International Practical Temperature Scale of 1948 (IPTS-48) as a text revision\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   of the International Temperature Scale of 1948.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "This was approved by the International Committee on Weights and Measures 1960.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The Kelvin thermodynamic scale was recognized as the fundamental scale upon which all temperature measurements should be referable, just as Kelvin (in 1854)\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   had said it must ultimately be.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The temperature of the triple point of water was defined as 273.16 °K (= 0.01 °C), replacing the ice point as one of the fixed points and defining the unit °K.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The numerical values of temperature remained the same as on ITS-48.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "The boiling point of water has not been associated with the definition of temperature since 1954.\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "For a reference of IPTS-48 (amended edition of 1960), see Stimson, H. F. (1961), International Practical Temperature Scale of 1948. Text Revision of 1960,\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   Journal of Research of the National Bureau of Standards, v. 65A, 139-145.\r\r"
//
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "IPTS-68\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "-------\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "In 1968 the Thirteenth General Conference on Weights and Measures adopted the International Practical Temperature Scale of 1968 (IPTS-68).\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The basic temperature was defined as the thermodynamic temperature, units kelvin (symbol K), a kelvin being defined as 1/273.16 of the thermodynamic\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   temperature of the triple point of water.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "IPTS-68 relates the International Practical Kelvin Temperature (T) and the International Practical Celsius Temperature (t), by t = T - 273.15 K.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The units of t are degrees Celsius, symbol °C, which are equal to kelvins.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "IPTS-68 is based on 11 fixed points and interpolations formulae to define temperatures uniquely at other points.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Temperatures between 0 °C and 100 °C are found by evaluating a 4th order polynomial of the solution to a quadratic equation involving the resistance of a standard\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   platinum resistance thermometer.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Temperatures in this interval are lower than those on IPTS-48: at 10 °C, t68-t48 = -0.004 °C, while at 40 °C, t68-t48 = -0.010 °C.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "An approximation for the range of temperatures 0-40 °C is: t68 = t48 * (1 - .000488) + .0000058 * t48 * t48, from Bennett, A. S. (1976), Conversion of in situ\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   measurements of conductivity to salinity, Deep-Sea Research, v. 23, 157-165.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "IPTS-68 defines temperature down to 13.81 K.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The Amended Edition of 1975 left temperatures unchanged.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "For references on IPTS-68, see The International Practical Temperature Scale of 1968, Metrologia v. 5, 35-44, 1969,\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Ambrose, D. (1976), Thermodynamic temperatures and IPTS-68, Journal of Chemical and Engineering Data, v. 21, 139-141,\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Rossini, F. D. (1970), Report on the International Practical Temperature Scale of 1968, Journal of Chemical Thermodynamics, v. 2, 447-459,\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Rossini, F. D. (1970), A Report on the International Practical Temperature Scale of 1968, Pure and Applied Chemistry, v. 22, 556-570.\r\r"
//
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "ITS-90\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "------\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "In 1990, the 18th General Conference on Weights and Measures adopted the International Temperature Scale of 1990 (ITS-90).\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The fundamental quantity is called the thermodynamic temperature (symbol T) with unit kelvin (symbol K), defined as 1/273.16 of the thermodynamic\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   temperature of the triple point of water.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The symbol for the physical quantity called international temperature is T90; the units are also kelvins.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Temperatures in degrees Celsius (°C) are defined by t = T - 273.15.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "This scale is based on sixteen primary fixed points, but there are different interpolation procedures which may be used to calculate temperature in the interval\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   0 °C to 100 °C; thus it is NOT uniquely defined.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "In this interval each of the interpolation procedures involves relating a polynomial function of the resistance of a standard platinum resistance thermometer\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   to a 9th order polynomial in the temperature.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Temperatures in this interval are lower than those on IPTS-68; t90 - t68 varies from 0 K at 0 °C to -0.010 K at 40 °C, to -0.026 K at 100 °C.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The approximation t68 = 1.00024 * t90 , or t90 = .99976 * t68 is accurate to 0.0005 °C over the interval -2 °C to 40 °C.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The boiling point of water at one atm is 99.974 °C on ITS-90.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Temperatures on ITS-90 are defined down to 0.65 K.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The temperature on ITS-90 is lower than the (actual) thermodynamic temperature over the range 0 °C to 100 °C by an amount that is nearly linear in t90,\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   from 0 at 0 °C to near 0.01 K at 100 °C.\r"	
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "For a reference on ITS-90, see Preston-Thomas, H. (1990), The International Temperature Scale of 1990 (ITS-90), Metrologia, 27, 3-10,\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   which discusses the new (at that time) The International Temperature Scale of 1990 (ITS-90), and reviews previous temperature scales:\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   The International Temperature Scale of 1927 (ITS-27),\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   The International Temperature Scale of 1948 (ITS-48),\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   The International Practical Temperature Scale of 1948 (Amended Edition of 1960 (IPTS-48),\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   The International Practical Temperature Scale of 1968 (IPTS-68),\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   The International Practical Temperature Scale of 1968 (Amended Edition of 1975) (IPTS-68), and\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   The 1976 Provisional 0.5 K to 30 K Temperature Scale (EPT-76).\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Other references on ITS-90 are:\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "McGlashan, M. L. (1990), The International Temperature Scale of 1990 (ITS-90), Journal of Chemical Thermodynamics, v. 22, 653-663.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Goldberg, R. N. and R. D. Weir (1992), Conversion of temperatures and thermodynamic properties to the basis of the\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   International Temperature Scale of 1990, Pure and Applied Chemistry, v. 64, 1545-1562.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Mangum, B. W. (1990), Report on the 17th Session of the Consultative Committee on Thermometry, Journal of Research of the National Institute of Standards\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   and Technology, v. 95, 69-77.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Saunders, P. M., K-H. Mahrt, and R. T. Williams (1991), Standards and Laboratory Calibration, WHP Operations and Methods, July, 1991.\r\r"
//
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Approximate differences between scales are:\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "                t90/°C   (t90 - t68)/°C   (t90 - t48)/°C\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "                ------   --------------   --------------\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "                   0           0               0\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "                  10        -0.002          -0.006\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "                  20        -0.005          -0.012\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "                  30        -0.007          -0.016\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "                  40        -0.010          -0.020\r\r\r"
//
//
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Standard State and Standard Conditions of Temperature and Pressure\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "------------------------------------------------------------------\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Standard state and standard conditions should not be confused as they refer to different concepts.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Standard state refers to thermodynamic calculations (and does not formally include temperature) whereas standard conditions of temperature and pressure (STP)\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   typically refers how gas conditions are reported.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "Both of these have varied in the past (and still do), with different organizations recognizing different values for both standard state and standard conditions;\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   bluntly, it's a mess.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "In 1982, the International Union of Pure and Applied Chemistry (IUPAC) recommended 1 bar (=100,000 Pa) as standard state pressure and recommended that values\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "   be reported at 298.15 K.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "The value 1 bar replaces the traditional 1 atm (=1.01325 bar), and the value 298.15 was selected as it is frequently used.\r"
	Input_Temp_panel_info_text=Input_Temp_panel_info_text + "In 1990, IUPAC selected standard conditions for a gas as 1 bar and 273.15 K; under these conditions the volume of one mole of an ideal gas is 22.711 liters.\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "See Cox, J. D. (1982), Notation for states and processes, signficance of the word standard in chemical thermodynamics and remarks on commonly tabulated forms\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   of thermodynamic functions, Pure and Applied Chemistry, v. 54, 1239-1250,\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "Freeman, R. D. (1985), Conversion of standard thermodynamic data to the new standard-state pressure, Journal of Chemical Education, v. 62, 681-686,\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "Doiron, T. (2007), 20 °C-A short history of the standard reference temperature for industrial dimensional measurements, Journal of Research of the National Institute\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "	 of Standards and Technology, v. 112, 1-23,\r"	
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "IUPAC. Compendium of Chemical Terminology, 2nd ed. (the Gold Book). Compiled by A. D. McNaught and A. Wilkinson. Blackwell Scientific Publications, Oxford (1997);\r"
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "   online version (2019-) at https://doi.org/10.1351/goldbook.\r\r"
//
	Input_Temp_panel_info_text = Input_Temp_panel_info_text + "----------------------- Bottom of Page ----------------------"   
//
//
// print information
	KillWindow/Z Input_Temp_panel_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(180,75,1380, 900)/N=Input_Temp_panel_info_notebook
	Notebook Input_Temp_panel_info_notebook, text=Input_Temp_panel_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Input_Pres_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This creates a panel that allows for input of pressure in various units, and the corresponding
//		pressures in the onther unites are calculated.
// The input pressure is used for the calculation of substance and particle properties.	
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Update_for_Input_Pres_panel, Do_Input_Pres_panel_info_button (when "i" hit)
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	NVAR P_hPa_input, P_kPa_input, P_MPa_input, P_Pa_input, P_atm_input, P_mbar_input, P_bar_input, P_torr_input, P_psi_input, P_inHg_input, P_dynpercm2_input
//
//
/////////////////////////////////////
//	make Input Pres panel
	KillWindow/Z Input_Pres_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(10,330,160,710) /N=Input_Pres_panel as "Input Pres"
//
//
/////////////////////////////////////
//	set up Input Pres title box
	TitleBox Input_Pres_title title="\Z25Input Pres", pos={15, 5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Pres info button
	Button Input_Pres_panel_info_button,pos={55,335},size={40,40},proc=Do_Input_Pres_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// group Pres input boxes
	GroupBox Group_Pres_inputs pos={5, 50}, size={140, 280}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up input boxes
	DrawText 20,75, "\Z14hPa"
	SetVariable P_hPa_input, pos={55,55}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.2f"
	SetVariable P_hPa_input, value=P_hPa_input, limits={0,inf,1}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,100, "\Z14kPa"
	SetVariable P_kPa_input, pos={55,80}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.3f"
	SetVariable P_kPa_input, value=P_kPa_input, limits={0,inf,0.1}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,125, "\Z14MPa"
	SetVariable P_MPa_input, pos={55,105}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.6f"
	SetVariable P_MPa_input, value=P_MPa_input, limits={0,inf,0.0001}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,150, "\Z14Pa"
	SetVariable P_Pa_input, pos={55,130}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.1f"
	SetVariable P_Pa_input, value=P_Pa_input, limits={0,inf,1}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,175, "\Z14atm"
	SetVariable P_atm_input, pos={55,155}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.5f"
	SetVariable P_atm_input, value=P_atm_input, limits={0,inf,0.1}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,200, "\Z14mbar"
	SetVariable P_mbar_input, pos={55,180}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.2f"
	SetVariable P_mbar_input, value=P_mbar_input, limits={0,inf,1}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,225, "\Z14bar"
	SetVariable P_bar_input, pos={55,205}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.5f"
	SetVariable P_bar_input, value=P_bar_input, limits={0,inf,0.1}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,250, "\Z14torr"
	SetVariable P_torr_input, pos={55,230}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.2f"
	SetVariable P_torr_input, value=P_torr_input, limits={0,inf,0.01}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,275, "\Z14psi"
	SetVariable P_psi_input, pos={55,255}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.4f"
	SetVariable P_psi_input, value=P_psi_input, limits={0,inf,0.1}, proc=Update_for_Input_Pres_panel
//
	DrawText 20,300, "\Z14in Hg"
	SetVariable P_inHg_input, pos={55,280}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.4f"
	SetVariable P_inHg_input, value=P_inHg_input, limits={0,inf,1}, proc=Update_for_Input_Pres_panel
//
	DrawText 7.5,325, "\Z14dyn cm\S-2"
	SetVariable P_dynpercm2_input, pos={62.5,305}, size={80,20}, bodyWidth=0, title=" ", fsize=14, format="%7.0f"
	SetVariable P_dynpercm2_input, value=P_dynpercm2_input, limits={0,inf,100}, proc=Update_for_Input_Pres_panel
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Input_Pres_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This provides the control for SetVariables in Make_Input_Pres_panel by updating everything
//		shown in that panel whenever an input is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: P_hPa_input, P_kPa_input, P_MPa_input, P_Pa_input, P_atm_input, P_mbar_input, P_bar_input, P_torr_input, P_psi_input, P_inHg_input, P_dynpercm2_input
//
// Calls: Calculate_all_stuff_for_properties_panels
//
// Calls required previously: none
//
// Called by: Make_Input_Pres_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
	NVAR P_hPa_input, P_kPa_input, P_MPa_input, P_Pa_input, P_atm_input, P_mbar_input, P_bar_input, P_torr_input, P_psi_input, P_inHg_input, P_dynpercm2_input
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “P_hPa_input”) == 0) // calculate other pressues if P_hPa changed
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_kPa_input”) == 0) // calculate other pressues if P_kPa changed
			P_hPa_input=p_kPa_input*10
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_MPa_input”) == 0) // calculate other pressues if P_MPa changed
			P_hPa_input=p_MPa_input*1e4
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_Pa_input”) == 0) // calculate other pressues if P_Pa changed
			P_hPa_input=P_Pa_input/100
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_atm_input”) == 0) // calculate other pressues if P_atm changed
			P_hPa_input=P_atm_input*1013.25
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_mbar_input”) == 0) // calculate other pressues if P_mbar changed
			P_hPa_input=P_mbar_input
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_bar_input”) == 0) // calculate other pressues if P_bar changed
			P_hPa_input=P_bar_input*1000
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_torr_input”) == 0) // calculate other pressues if P_torr changed
			P_hPa_input=P_torr_input*1013.25/760
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_psi_input”) == 0) // calculate other pressues if P_psi changed
			P_hPa_input=P_psi_input*1013.25/14.69595
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_inHg_input”) == 0) // calculate other pressues if P_inHg changed
			P_hPa_input=P_inHg_input*1013.25/29.9213
		EndIf
//
		If (cmpstr(ctrlName.vName, “P_dynpercm2_input”) == 0) // calculate other pressues if P_dynpercm2 changed
			P_hPa_input=P_dynpercm2_input/1000
		EndIf
//
//
// calculate pressures in all units from P_hPa_input
		P_kPa_input=P_hPa_input/10
		P_MPa_input=P_hPa_input/1e4
		P_Pa_input=P_hPa_input*100
		P_atm_input=p_hPa_input/1013.25
		P_mbar_input=P_hPa_input
		P_bar_input=P_hPa_input/1000
		P_torr_input=P_hPa_input*760/1013.25
		P_psi_input=P_hPa_input*14.69595/1013.25
		P_inHg_input=P_hPa_input*29.9213/1013.25
		P_dynpercm2_input=P_hPa_input*1000
//
//
		Calculate_all_stuff_for_properties_panels() // so that whatever is used gets updated	
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Input_Pres_panel_info_button(Input_Pres_panel_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-12-03
//
//
// Description: This calls Print_Input_Pres_panel_info when the Do_Input_Pres_panel_info_button is hit in panel Make_Input_Pres_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Input_Pres_panel_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Input_Pres_panel_info
//
// Calls required previously: none
//
// Called by: Make_Input_Pres_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Input_Pres_panel_info_Struct
//
//
	If (Input_Pres_panel_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Input_Pres_panel_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Input_Pres_panel_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the Input_Pres_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Input_Pres_panel_info_button
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Input_Pres_panel_info_text
//
//
	Input_Pres_panel_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Input Pressure Panel Information\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "--------------------------------\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "The panel allows the user to input pressure in various units and to convert among pressure units.\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Pressure units are abundant and annoying.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "The SI unit is the pascal: 1 Pa ≡ 1 N/m^2; thus 1 dyne/cm^2 ≡ 0.1 Pa.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "1 bar is defined to be 10^5 Pa; thus 1 mbar ≡ 100 Pa ≡ 1 hPa.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "In 1954, 1 atm was defined to be 101325.0 Pa, so 1 atm ≡ 1013.25 mbar ≡ 1013.25 hPa.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "As Bruce Albrecht once noted, this represents probably the largest accuracy inflation ever,\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   as these six significant digits probably originated from two (76 cm of mercury).\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "1 atm ≡ 101325 Pa\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "      ≡ 101.325 kPa\r"	
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "      ≡ 1.01325 bar\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "      ≡ 1013.25 mbar\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "      ≡ 760 torr\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "      ≈ 14.69595 psi\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "      ≈ 29.9213 in Hg\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "      ≡ 1013250 dyne cm-2\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "A torr is defined such that 1 atm is exactly 760 torr.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "The old definition, 1 torr equal to 1 cm Hg, involves assumptions about the density (and thus isotopic composition),\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   compressibility, and thermal expansion of Hg, and on the gravitational strength at that location.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "As g ≡ 9.80665 m/s^2 by definition, 1 mm Hg at 0 °C is APPROXIMATELY 1/760 atm, and\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   1 in Hg at 0 °C is (APPROXIMATELY) 1/29.9213 atm.\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "As 1 lb ≡ 0.45359237 kg, g ≡ 9.80665 m/s^2, and 1 in ≡ 2.54 cm (all exact), 1 atm ≈ 14.69595 psi (approximately).\r\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "The gas constant R in various pressure units is approximately equal to: \r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   8.3145 Pa m^3/K/mol\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   82.058 atm cm^3/K/mol\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   0.082058 atm lit/K/mol\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   83.145 bar cm^3/K/mol\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   62.364 torr lit/K/mol\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   1.2059 psi lit/K/mol\r\r\r"
//
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Standard State and Standard Conditions of Temperature and Pressure\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "------------------------------------------------------------------\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Standard state and standard conditions should not be confused as they refer to different concepts.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Standard state refers to thermodynamic calculations (and does not formally include temperature) whereas standard\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   conditions of temperature and pressure (STP) typically refers how gas conditions are reported.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Both of these have varied in the past (and still do), with different organizations recognizing different values for\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   both standard state and standard conditions; bluntly, it's a mess.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "In 1982, the International Union of Pure and Applied Chemistry (IUPAC) recommended 1 bar (≡ 100,000 Pa) as a\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   standard state pressure and recommended that values be reported at 298.15 K.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "The value 1 bar replaces the traditional 1 atm (=1.01325 bar); 298.15 was selected as it is frequently used.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "In 1990, IUPAC selected standard conditions for a gas as 1 bar and 273.15 K; under these conditions the volume\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   	of one mole of an ideal gas is 22.711 liters.\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "See Cox, J. D. (1982), Notation for states and processes, signficance of the word standard in chemical\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   thermodynamics and remarks on commonly tabulated forms of thermodynamic functions, Pure and Applied Chemistry\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   v. 54, 1239-1250,\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Freeman, R. D. (1985), Conversion of standard thermodynamic data to the new standard-state pressure,\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   Journal of Chemical Education, v. 62, 681-686,\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "Doiron, T. (2007), 20 °C-A short history of the standard reference temperature for industrial dimensional\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "	  measurements, Journal of Research of the National Institute of Standards and Technology, v. 112, 1-23,\r"	
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "IUPAC. Compendium of Chemical Terminology, 2nd ed. (the Gold Book). Compiled by A. D. McNaught and A. Wilkinson.\r"
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "   Blackwell Scientific Publications, Oxford (1997); online version (2019-) at https://doi.org/10.1351/goldbook.\r\r"
//
	Input_Pres_panel_info_text = Input_Pres_panel_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Input_Pres_panel_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(180,50,1030,1005)/N=Input_Pres_panel_info_notebook
	Notebook Input_Pres_panel_info_notebook, text=Input_Pres_panel_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Air_properties_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2020-05-23
//
//
// Description: This creates a panel that displays volumetric, thermodynamic, and transport properties of dry air.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: air_properties_wave
//
// Calls: Do_Air_properties_info_button (when "i" hit) 
//
// Calls required previously: Set_defaults_for_property_panels() sets the default T and P
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function: air_properties_wave contains the values that will be displayed
//
//
/////////////////////////////////////
//	make Air properties panel
	KillWindow/Z Air_properties_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(175,75,590,735) /N=Air_properties_panel as "Display air properties"
//
//
/////////////////////////////////////
// set up title box for air properties
	TitleBox Air_properties_title title="\Z24Dry Air Properties", pos={110, 5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// Graph air properties
	Button Graph_air_properties_button,pos={120, 580}, size={160, 25}, proc=Do_Graph_air_properties_button, title="\Z14Graph air properties",fcolor=(0, 65535, 0)
//
//
/////////////////////////////////////
// set up Air properties info button
	Button Air_properties_info_button,pos={180,615},size={40,40},proc=Do_Air_properties_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
///////////////////////////////////
//	Group molal mass, gas constant of air
	GroupBox Air_molal_mass_stuff pos={10, 50}, size={190, 55}, labelBack=(50000, 50000, 50000)
//
// Gatley, D. P, S. Herrmann, H.-J. Kretzschmar (2008), A twenty-first century molar mass for dry air, HVAC&R Research, 14, 655-662.
	DrawText 15, 75, "\Z14Molar mass/(g mol\S-1\M\Z14): 28.966" // from Gatley et al. (2008)
	DrawText 35, 100, "\Z14R\Bair\M\Z14/(m\S2\M\Z14 s\S-2\M\Z14 K\S-1\M\Z14): 287.0" // = Rgas/Mair
//
//
/////////////////////////////////////
// Group calculated density values
	GroupBox Air_density_stuff pos={10,115}, size={190,130}, labelBack=(50000, 50000, 50000)
//
	DrawText 15,140, "\Z14density/(kg m\S-3\M\Z14)"
	ValDisplay air_density_kg_per_m3, pos={120,122.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[0]", fsize=12, format="%4.3f"
//
	DrawText 15,165, "\Z14density/(g cm\S-3\M\Z14)"
	DrawText 162.5,165, "\Z12×\Z1410\S-3"
	ValDisplay air_density_g_per_cm3, pos={120,147.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[1]", fsize=12, format="%4.3f"
//
	DrawText 15,190, "\Z14density/(mol m\S-3\M\Z14)"
	ValDisplay air_density_mol_per_m3, pos={125,172.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[2]", fsize=12, format="%4.2f"
//
	DrawText 15, 215, "\Z14density/(# m\S-3\M\Z14)"
	DrawText 157.5, 215, "\Z12×\Z1410\S25"
	ValDisplay air_density_number_per_m3, pos={115,197.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[3]", fsize=12, format="%4.3f"
//
	DrawText 25,240, "\Z14v\Bmol\M\Z14/(m\S3\M\Z14 mol\S-1\M\Z14)"
	ValDisplay air_molar_volume, pos={125,222.5}, size={55,20}, bodywidth=0, value=#"air_properties_wave[4]", fsize=12, format="%7.5f"
//
//
/////////////////////////////////////
// Group calculated air virial values
	GroupBox Air_virial_stuff pos={25, 255}, size={160, 80}, labelBack=(50000, 50000, 50000)
//
	DrawText 35,280, "\Z14Z≡pV/(RT)"
	ValDisplay air_compressibility, pos={115, 262.5}, size={50,20}, bodywidth=0, value=#"air_properties_wave[5]", fsize=12, format="%5.4f"
//
	DrawText 35,305, "\Z14B\Bv\M\Z14/(cm\S3\M\Z14 mol\S-1\M\Z14)"
	ValDisplay air_2nd_virial_volume, pos={125, 287.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[6]", fsize=12, format="%3.1f"
//
	DrawText 35,330, "\Z14B\Bp\M\Z14/(hPa\S-1\M\Z14)"
	DrawText 145,330, "\Z12×\Z1410\S-7"
	ValDisplay air_2nd_virial_pressure, pos={107.5, 312.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[7]", fsize=12, format="%3.1f"
//
//
/////////////////////////////////////
// Group calculated air specific heat values
	GroupBox air_specific_heat_stuff pos={15,345}, size={180,215}, labelBack=(50000, 50000, 50000)
//
	DrawText 25,375, "\Z14C\BP\M\Z14/(J mol\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay air_Cp_Jpermol, pos={120,357.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[8]", fsize=12, format="%4.2f"
//
	DrawText 25,400, "\Z14C\BP\M\Z14/(J kg\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay air_Cp_Jperkg, pos={120,382.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[9]", fsize=12, format="%4.0f"
//
	DrawText 25,425, "\Z14C\BP\M\Z14/(erg g\S-1\M\Z14 K\S-1\M\Z14)"
	DrawText 160,425, "\Z12×\Z1410\S6"
	ValDisplay air_Cp_ergperg, pos={120,407.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[10]", fsize=12, format="%4.2f"
// 
	DrawLine 35, 435, 175, 435
//
	DrawText 25,465, "\Z14C\BV\M\Z14/(J mol\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay air_Cv_Jpermol, pos={122.5,447.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[11]", fsize=12, format="%4.2f"
//
	DrawText 25,490, "\Z14C\BV\M\Z14/(J kg\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay air_Cv_Jperkg, pos={122.5,472.5}, size={30,20}, bodywidth=0, value=#"air_properties_wave[12]", fsize=12, format="%3.0f"
//
	DrawText 25,515, "\Z14C\BV\M\Z14/(erg g\S-1\M\Z14 K\S-1\M\Z14)"
	DrawText 155,515, "\Z12×\Z1410\S6"
	ValDisplay air_Cv_ergperg, pos={122.5,497.5}, size={30,20}, bodywidth=0, value=#"air_properties_wave[13]", fsize=12, format="%3.2f"
//
	DrawLine 35, 525, 175, 525
//
	DrawText 60,552.5, "\Z14C\BP\M\Z14/C\BV\M\Z14"
	ValDisplay air_Cp_by_Cv, pos={122.5,532.5}, size={32.5,20}, bodywidth=0, value=#"air_properties_wave[14]", fsize=12, format="%4.2f"
//
//
/////////////////////////////////////
// Group air mean free path
	GroupBox air_mean_free_path pos={215,50}, size={180,25}, labelBack=(50000, 50000, 50000)
//
	DrawText 220, 70, "\Z14mean free path/nm"
	ValDisplay air_mfp, pos={345, 52.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[15]", fsize=12, format="%5.1f"
//
//
/////////////////////////////////////
// Group calculated air speed values
	GroupBox air_speed_stuff pos={230,85}, size={150,80}, labelBack=(50000, 50000, 50000)
//
	DrawText 240,110, "\Z14c\Brms\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay air_c_rms, pos={325, 92.5}, size={45,20}, bodywidth=0, value=#"air_properties_wave[16]", fsize=12, format="%5.1f"
	DrawText 240,135, "\Z14< c >/(m s\S-1\M\Z14)"
	ValDisplay air_c_bar, pos={325, 117.5}, size={45,20}, bodywidth=0, value=#"air_properties_wave[17]", fsize=12, format="%5.1f"
	DrawText 240,160, "\Z14c\Bsound\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay air_c_sound, pos={325, 142.5}, size={45,20}, bodywidth=0, value=#"air_properties_wave[18]", fsize=12, format="%5.1f"
//
//
/////////////////////////////////////
// Group calculated air viscosity values
	GroupBox air_viscosity_stuff pos={205,175}, size={200,195}, labelBack=(50000, 50000, 50000)
//
	DrawText 215,200, "\Z14Dynamic viscosity, \f02η\f00 (or \f02µ\f00)"
	DrawText 225,225, "\Z14\f02η\f00/(kg m\S-1\M\Z14 s\S-1\M\Z14)"
	DrawText 357.5, 225, "\Z12×\Z1410\S-5"
	ValDisplay air_dynamic_viscosity, pos={320,207.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[19]", fsize=12, format="%4.2f"
	DrawText 225,250, "\Z14\f02η\f00/(g cm\S-1\M\Z14 s\S-1\M\Z14)"
	DrawText 357.5, 250, "\Z12×\Z1410\S-4"
	ValDisplay air_dynamic_viscosity_cgs, pos={320,232.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[20]", fsize=12, format="%4.2f"
//
	DrawText 210, 270, "\Z130.1 Pa s = 1 Poise = 1 g cm\S-1\M\Z13 s\S-1"
//
	DrawLine 225, 275, 385, 275
//
	DrawText 215,295, "\Z14Kinematic viscosity: \f02ν\f00 = \f02η\f00/\f02ρ\f00"
	DrawText 245,320, "\Z14\f02ν\f00/(m\S2\M\Z14 s\S-1\M\Z14)"
	DrawText 352.5, 320, "\Z12×\Z1410\S-5"
	ValDisplay air_kinematic_viscosity, pos={315,302.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[21]", fsize=12, format="%4.2f"
	DrawText 245,345, "\Z14\f02ν\f00/(cm\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay air_kinematic_viscosity_cgs, pos={315,327.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[22]", fsize=12, format="%5.3f"
//
	DrawText 210, 365, "\Z1310\S-4\M\Z13 m\S2\M\Z13 s\S-1\M\Z13 = 1 Stokes = 1 cm\S2\M\Z13 s\S-1"
//
//
/////////////////////////////////////
// Group calculated air thermal conductivity/diffusivity values
	GroupBox air_thermal_diffusivity_stuff pos={205,380}, size={200,155}, labelBack=(50000, 50000, 50000)
//
	DrawText 215, 400, "\Z14Thermal conductivity"
	DrawText 220, 425, "\Z14\f02k\f00/(kg m s\S-3\M\Z14 K\S-1\M\Z14)"
	DrawText 357.5, 425, "\Z12×\Z1410\S-2"
	ValDisplay air_thermal_conductivity, pos={320, 407.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[23]", fsize=12, format="%4.2f"
	DrawText 220, 450, "\Z14\f02k\f00/(g cm s\S-3\M\Z14 K\S-1\M\Z14)"
	DrawText 357.5, 450, "\Z12×\Z1410\S3"
	ValDisplay air_thermal_conductivity_cgs, pos={320, 432.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[24]", fsize=12, format="%4.2f"
//
	DrawLine 225, 455, 385, 455
//
	DrawText 210, 480, "\Z14Thermal diffusivity \f02κ\f00 = \f02k\f00/(\f02ρ\f00C\Bp\M\Z14)"
	DrawText 240, 505, "\Z14\f02κ\f00/(m\S2\M\Z14 s\S-1\M\Z14)"
	DrawText 357.5, 505, "\Z12×\Z1410\S-5"
	ValDisplay air_thermal_diffusivity, pos={320,487.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[25]", fsize=12, format="%4.2f"
	DrawText 240, 530, "\Z14\f02κ\f00/(cm\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay air_thermal_diffusivity_cgs, pos={320,512.5}, size={40,20}, bodywidth=0, value=#"air_properties_wave[26]", fsize=12, format="%4.3f"
//
//
// Group Prandtl number
	GroupBox air_Prandtl_number_value pos={205,545}, size={200,25}, labelBack=(50000, 50000, 50000)
	DrawText 215, 565, "\Z14Prandtl number ≡ \f02ν\f00/\f02κ\f00"
	ValDisplay air_Prandtl_number, pos={360,547.5}, size={35,20}, bodywidth=0, value=#"air_properties_wave[27]", fsize=12, format="%3.2f"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Air_properties_info_button(Air_properties_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-12-03
//
//
// Description: This calls Print_Air_properties_info which prints information on the Air properties panel
//		when the Do_Air_properties_button is hit in Make_Air_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Air_properties_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Air_properties_info
//
// Calls required previously: none
//
// Called by: Make_Air_properties_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Air_properties_info_Struct
//
//
	If (Air_properties_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Air_properties_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Air_properties_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2020-05-01
//
//
// Description: This prints information on air properties displayed in Make_Air_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Air_properties_info_button 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Air_properties_info_text	
//
//
	Air_properties_info_text = "need to do"
//
//
// print information
	KillWindow/Z Air_properties_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(645,75,1440,960)/N=Air_properties_info_notebook
	Notebook Air_properties_info_notebook, text=Air_properties_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Graph_air_properties_button(Graph_air_properties_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2026-03-07
//
//
// Description: This calls Graph_air_properties when the Do_Graph_air_properties_button 
//	is hit in Make_Air_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Graph_air_properties - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Graph_Air_properties_info
//
// Calls required previously: none
//
// Called by: Make_Air_properties_panel (when "Graph air properties" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Graph_air_properties_Struct
//
//
	If (Graph_air_properties_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Graph_air_properties()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Graph_Air_Properties()
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2026-03-07
//
//
// Description:
// This calculates and graphs air properties at 1 atm as functions of temperature from -20 to 40 °C and from -200 to 400 K.
//	
// Version history:
//		There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Calculate_air_density, Calculate_air_Cp, Calculate_air_Cv, Calculate_air_mean_free_path,
//		Calculate_air_c_sound, Calculate_air_dynamic_viscosity, Calculate_air_thermal_conductivity
//
// Calls required previously: none
//
// Called by: 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
Variable PP=1013.25
Variable air_molar_mass=0.028966 // kg/mol, from Gatley et al. (2008)
Variable i
//
//
Make/O/D/N=61 TC_air1=-20+x // do for -20 deg C to +40 deg C
Make/O/D/N=201 TK_air=200+x // do for 200 K to 400 K
Make/O/D/N=201 TC_air2=TK_air-273.15
//
//
Make/O/D/N=201 Virial_air_wave, dens_air_wave, CP_air_wave, CV_air_wave, mfp_air_wave, csound_air_wave, dynvisc_air_wave, kinvisc_air_wave, thermcond_air_wave, thermdiff_air_wave
Make/O/D/N=61 Virial_air_fit1_wave, dens_air_fit1_wave, CP_air_fit1_wave, CV_air_fit1_wave, mfp_air_fit1_wave, csound_air_fit1_wave, dynvisc_air_fit1_wave, kinvisc_air_fit1_wave, thermcond_air_fit1_wave, thermdiff_air_fit1_wave
Make/O/D/N=201 Virial_air_fit2_wave, dens_air_fit2_wave, CP_air_fit2_wave, CV_air_fit2_wave, mfp_air_fit2_wave, csound_air_fit2_wave, dynvisc_air_fit2_wave, kinvisc_air_fit2_wave, thermcond_air_fit2_wave, thermdiff_air_fit2_wave
//
//
//////////////////////////////////////////////////////////////////////// calculate stuff
////////// Calculate poroperties for TempK from 200 to 400 
For (i=0;i<201;i+=1) 
	virial_air_wave[i]=-13.35 + 0.2485*TC_air2[i] - 0.001164*TC_air2[i]^2 + 3.137e-6*TC_air2[i]^3 // in cm^3/mol, from my fit to values in Lemmon et al. (2000)
	dens_air_wave[i]=Calculate_air_density(TC_air2[i], PP)
	CP_air_wave[i]=Calculate_air_Cp(TC_air2[i], PP)
	CV_air_wave[i]=Calculate_air_Cv(TC_air2[i],PP)
	mfp_air_wave[i]=Calculate_air_mean_free_path(TC_air2[i], PP)
	csound_air_wave[i]=Calculate_air_c_sound(TC_air2[i], PP)
	dynvisc_air_wave[i]=Calculate_air_dynamic_viscosity(TC_air2[i], PP)
	kinvisc_air_wave[i]=dynvisc_air_wave[i]/dens_air_wave[i]
	thermcond_air_wave[i]=Calculate_air_thermal_conductivity(TC_air2[i], PP)
	thermdiff_air_wave[i]=thermcond_air_wave[i]/dens_air_wave[i]/CP_air_wave[i]*air_molar_mass
EndFor
//
//
////////// Do fit2 for TempK from 200 to 400
dens_air_fit2_wave=1.18*(TK_air/300)^(-1)
CP_air_fit2_wave=29.10 // = 7/2 * R_gas
CV_air_fit2_wave=20.79  // = 5/2 * R_gas
mfp_air_fit2_wave=68.4*(TK_air/300)^1.28 // good to within 1.5 %
csound_air_fit2_wave=347.4*(TK_air/300)^0.5 // good to within 0.15 %
dynvisc_air_fit2_wave=1.85e-5*(TK_air/300)^0.78 // good to within 0.7 %
kinvisc_air_fit2_wave=1.57e-5*(TK_air/300)^1.78 // good to within 0.7 %
thermcond_air_fit2_wave=2.64e-2*(TK_air/300)^0.85 // good to within 1 %
thermdiff_air_fit2_wave=2.23e-5*(TK_air/300)^1.84 // good to within 1.5 %
//
//
////////// Do fit1 for TempC from -20 to +40
virial_air_fit1_wave=-9 + 0.23*(TC_air1-20)
dens_air_fit1_wave=1.20 - 0.0044*(TC_air1-20)
CP_air_fit1_wave=29.10 // = 7/2 * R_gas
CV_air_fit1_wave=20.79 // = 5/2 * R_gas
mfp_air_fit1_wave=66.4 + 0.285*(TC_air1-20)
csound_air_fit1_wave=343.4 + 0.6*(TC_air1-20)
dynvisc_air_fit1_wave=1e-5*(1.82 + 0.005*(TC_air1-20))
kinvisc_air_fit1_wave=1e-5*(1.51 + 0.009*(TC_air1-20))
thermcond_air_fit1_wave=1e-2*(2.59 + 0.0075*(TC_air1-20))
thermdiff_air_fit1_wave=1e-5*(2.14 + 0.013*(TC_air1-20))
//
//
//////////////////////////////////////////////////////////////////////// graph stuff
////////////////////
KillWindow/Z Air_virial_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(50,50,650,500) /N=Air_virial_temp_graph as "Air_virial_temp_graph"
AppendtoGraph virial_air_fit1_wave vs TC_air1
SetAxis bottom -73.15, 126.85
SetAxis left -40,10
Label bottom "\Z24Temp/°C"
Label left "\Z24Second virial coefficient/(cm\S3\M\Z24 mol\S-1\M\Z24)"
//
AppendtoGraph/T virial_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph lstyle(Virial_air_fit1_wave)=3, lsize(Virial_air_fit1_wave)=3
ModifyGraph lstyle(Virial_air_wave)=0
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
//
Make/O/D/N=201 zero=0
Appendtograph zero vs TC_air2
ModifyGraph rgb(zero)=(0,0,0), lstyle(zero)=1, lsize(zero)=1
//
//
Make/O/D/n=2 VVirialX1={-20,-20}
Make/O/D/n=2 VVirialY1={-19,0}
AppendtoGraph VVirialY1 vs VVirialX1
TextBox/C/N=text1/F=0/A=LT/O=90/X=22/Y=23 "\\Z20\r0.09 % in \\f02ρ\\f00"
//
ModifyGraph rgb(virial_air_fit1_wave)=(65535,0,0), lstyle(virial_air_fit1_wave)=3, lsize(virial_air_fit1_wave)=3
ModifyGraph rgb(virial_air_wave)=(0,0,0), lstyle(virial_air_wave)=0, lsize(virial_air_wave)=1
//
//
Make/O/D/N=1 virial_air_ptX={20}
Make/O/D/N=1 virial_air_ptY={-9}
AppendtoGraph virial_air_ptY vs virial_air_ptX
ModifyGraph rgb(virial_air_ptY)=(65535,0,0), mode(virial_air_ptY)=3,marker(virial_air_ptY)=19,msize(virial_air_ptY)=5
//
////////////////////
KillWindow/Z Air_dens_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(100,100,700,550) /N=Air_dens_temp_graph as "Air_dens_temp_graph"
AppendtoGraph dens_air_fit1_wave vs TC_air1
AppendtoGraph dens_air_fit2_wave vs TC_air2
SetAxis bottom -73.15, 126.85
SetAxis left 0.8, 1.8
Label bottom "\Z24Temp/°C"
Label left "\Z24Air density/(kg m\S-3\M\Z24)"
//
AppendtoGraph/T dens_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(dens_air_fit1_wave)=(65535,0,0), lstyle(dens_air_fit1_wave)=3, lsize(dens_air_fit1_wave)=3
ModifyGraph rgb(dens_air_fit2_wave)=(65535,0,0), lstyle(dens_air_fit2_wave)=1, lsize(dens_air_fit2_wave)=1
ModifyGraph rgb(dens_air_wave)=(0,0,0), lstyle(dens_air_wave)=0, lsize(dens_air_wave)=1
//
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
TextBox/C/N=text1/F=0/A=LB/X=5/Y=15 "\\Z20\\s(dens_air_fit1_wave)1.20 - 0.0044×(\\f02T\\f00/ºC - 20)"
TextBox/C/N=text2/F=0/A=LB/X=5/Y=5 "\\Z20\\s(dens_air_fit2_wave)1.18×(\f02T\f00/300 K)\S-1"
//
Make/O/D/N=1 dens_air_ptX={20}
Make/O/D/N=1 dens_air_ptY={1.20}
AppendtoGraph dens_air_ptY vs dens_air_ptX
ModifyGraph rgb(dens_air_ptY)=(65535,0,0), mode(dens_air_ptY)=3,marker(dens_air_ptY)=19,msize(dens_air_ptY)=5
//
//
/////////////////////
KillWindow/Z Air_CP_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(150,150,750,600) /N=Air_Cp_temp_graph as "Air_CP_temp_graph"
AppendtoGraph CP_air_fit1_wave vs TC_air1
AppendtoGraph CP_air_fit2_wave vs TC_air2
SetAxis left 29,29.5
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air C\BP\M\Z24/(J mol\S-1\M\Z24 K\S-1\M\Z24)"
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
//
AppendtoGraph/T CP_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(CP_air_fit1_wave)=(65535,0,0), lstyle(CP_air_fit1_wave)=3, lsize(CP_air_fit1_wave)=3
ModifyGraph rgb(CP_air_fit2_wave)=(65535,0,0), lstyle(CP_air_fit2_wave)=1, lsize(CP_air_fit2_wave)=1
ModifyGraph rgb(CP_air_wave)=(0,0,0), lstyle(CP_air_wave)=0, lsize(CP_air_wave)=1
TextBox/C/N=text1/F=0/A=RB/X=22/Y=15.5 "\\Z24(7/2)R\\Bg"
//
Make/O/D/N=2 CP_air_Y, CP_air_X
CP_air_Y={29.2, 29.35}
CP_air_X={0,0}
AppendtoGraph CP_air_Y vs CP_air_X
ModifyGraph rgb(CP_air_Y)=(65535,0,0),lstyle(CP_air_Y)=1,lsize(CP_air_Y)=1
TextBox/C/N=text2/F=0/A=LT/O=90/X=30/Y=33 "\\Z240.05 %"
//
//
/////////////////////
KillWindow/Z Air_CV_temp_fit_graph // get rid of previous graph if it exists
Display/K=1/W=(200,200,800,650) /N=Air_CV_temp_graph as "Air_CV_temp_graph"
AppendtoGraph CV_air_fit1_wave vs TC_air1
AppendtoGraph CV_air_fit2_wave vs TC_air2
SetAxis left 20.7,21.1
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air C\BV\M\Z24/(J mol\S-1\M\Z24 K\S-1\M\Z24)"
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
//
AppendtoGraph/T CV_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(CV_air_fit1_wave)=(65535,0,0), lstyle(CV_air_fit1_wave)=3, lsize(CV_air_fit1_wave)=3
ModifyGraph rgb(CV_air_fit2_wave)=(65535,0,0), lstyle(CV_air_fit2_wave)=1, lsize(CV_air_fit2_wave)=1
ModifyGraph rgb(CV_air_wave)=(0,0,0), lstyle(CV_air_wave)=0,lsize(CV_air_wave)=1
TextBox/C/N=text1/F=0/A=RB/X=22/Y=17 "\\Z24(5/2)R\\Bg"
//
Make/O/D/N=2 CV_air_Y, CV_air_X
CV_air_Y={20.85, 20.955}
CV_air_X={0,0}
AppendtoGraph CV_air_Y vs CV_air_X
ModifyGraph rgb(CV_air_Y)=(65535,0,0),lstyle(CV_air_Y)=1,lsize(CV_air_Y)=1
TextBox/C/N=text2/F=0/A=LT/O=90/X=30/Y=36 "\\Z240.05 %"
//
//
/////////////////////
KillWindow/Z Air_mfp_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(250,250,850,700) /N=Air_mfp_temp_graph as "Air_mfp_temp_graph"
AppendtoGraph mfp_air_fit1_wave vs TC_air1
AppendtoGraph mfp_air_fit2_wave vs TC_air2
SetAxis left 40,100
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air mean free path/nm"
//
AppendtoGraph/T mfp_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(mfp_air_fit1_wave)=(65535,0,0), lstyle(mfp_air_fit1_wave)=3, lsize(mfp_air_fit1_wave)=3
ModifyGraph rgb(mfp_air_fit2_wave)=(65535,0,0), lstyle(mfp_air_fit2_wave)=1, lsize(mfp_air_fit2_wave)=1
ModifyGraph rgb(mfp_air_wave)=(0,0,0), lstyle(mfp_air_wave)=0, lsize(mfp_air_wave)=1
//
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
TextBox/C/N=text1/F=0/A=LB/X=30/Y=15 "\\Z20\\s(mfp_air_fit1_wave)66.4 + 0.285×(\\f02T\\f00/ºC - 20)"
TextBox/C/N=text2/F=0/A=LB/X=30/Y=5 "\\Z20\\s(mfp_air_fit2_wave)68.4×(\f02T\f00/300 K)\S1.28"
//
Make/O/D/N=1 mfp_air_ptX={20}
Make/O/D/N=1 mfp_air_ptY={66.4}
AppendtoGraph mfp_air_ptY vs mfp_air_ptX
ModifyGraph rgb(mfp_air_ptY)=(65535,0,0), mode(mfp_air_ptY)=3,marker(mfp_air_ptY)=19,msize(mfp_air_ptY)=5
//
//
/////////////////////
KillWindow/Z Air_csound_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(300,300,900,750) /N=Air_csound_temp_graph as "Air_csound_temp_graph"
AppendtoGraph csound_air_fit1_wave vs TC_air1
AppendtoGraph csound_air_fit2_wave vs TC_air2
SetAxis left 280,420
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air speed of sound/(m s\S-1\M\Z24)"
//
AppendtoGraph/T csound_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(csound_air_fit1_wave)=(65535,0,0), lstyle(csound_air_fit1_wave)=3, lsize(csound_air_fit1_wave)=3
ModifyGraph rgb(csound_air_fit2_wave)=(65535,0,0), lstyle(csound_air_fit2_wave)=1, lsize(csound_air_fit2_wave)=1
ModifyGraph rgb(csound_air_wave)=(0,0,0), lstyle(csound_air_wave)=0, lsize(csound_air_wave)=1
//
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
TextBox/C/N=text1/F=0/A=LB/X=35/Y=15 "\\Z20\\s(csound_air_fit1_wave)343.4 + 0.6×(\\f02T\\f00/ºC - 20)"
TextBox/C/N=text2/F=0/A=LB/X=35/Y=5 "\\Z20\\s(csound_air_fit2_wave)347.4×(\f02T\f00/300 K)\S0.5"
//
Make/O/D/N=1 csound_air_ptX={20}
Make/O/D/N=1 csound_air_ptY={343}
AppendtoGraph csound_air_ptY vs csound_air_ptX
ModifyGraph rgb(csound_air_ptY)=(65535,0,0), mode(csound_air_ptY)=3,marker(csound_air_ptY)=19,msize(csound_air_ptY)=5
//
//
/////////////////////
KillWindow/Z Air_dynvisc_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(350,350,950,800) /N=Air_dynvisc_temp_graph as "Air_dynvisc_temp_graph"
AppendtoGraph dynvisc_air_fit1_wave vs TC_air1
AppendtoGraph dynvisc_air_fit2_wave vs TC_air2
SetAxis left 1.2e-5, 2.4e-5
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air dynamic viscosity/(kg m\S-1\M\Z24 s\S-1\M\Z24)"
//
AppendtoGraph/T dynvisc_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(dynvisc_air_fit1_wave)=(65535,0,0), lstyle(dynvisc_air_fit1_wave)=3, lsize(dynvisc_air_fit1_wave)=3
ModifyGraph rgb(dynvisc_air_fit2_wave)=(65535,0,0), lstyle(dynvisc_air_fit2_wave)=1, lsize(dynvisc_air_fit2_wave)=1
ModifyGraph rgb(dynvisc_air_wave)=(0,0,0), lstyle(dynvisc_air_wave)=0, lsize(dynvisc_air_wave)=1
//
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
TextBox/C/N=text1/F=0/A=LB/X=30/Y=15 "\\Z20\\s(dynvisc_air_fit1_wave)1.82 + 0.005×(\\f02T\\f00/ºC - 20)"
TextBox/C/N=text2/F=0/A=LB/X=30/Y=5 "\\Z20\\s(dynvisc_air_fit2_wave)1.82×(\f02T\f00/293.15 K)\S0.79"
//
Make/O/D/N=1 dynvisc_air_ptX={20}
Make/O/D/N=1 dynvisc_air_ptY={1.82e-5}
AppendtoGraph dynvisc_air_ptY vs dynvisc_air_ptX
ModifyGraph rgb(dynvisc_air_ptY)=(65535,0,0), mode(dynvisc_air_ptY)=3,marker(dynvisc_air_ptY)=19,msize(dynvisc_air_ptY)=5
//
//
/////////////////////
KillWindow/Z Air_kinvisc_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(400,400,1000,850) /N=Air_kinvisc_temp_graph as "Air_kinvisc_temp_graph"
AppendtoGraph kinvisc_air_fit1_wave vs TC_air1
AppendtoGraph kinvisc_air_fit2_wave vs TC_air2
SetAxis left 5e-6,3e-5
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air kinematic viscosity/(m\S2\M\Z24 s\S-1\M\Z24)"
//
AppendtoGraph/T kinvisc_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(kinvisc_air_fit1_wave)=(65535,0,0), lstyle(kinvisc_air_fit1_wave)=3, lsize(kinvisc_air_fit1_wave)=3
ModifyGraph rgb(kinvisc_air_fit2_wave)=(65535,0,0), lstyle(kinvisc_air_fit2_wave)=1, lsize(kinvisc_air_fit2_wave)=1
ModifyGraph rgb(kinvisc_air_wave)=(0,0,0), lstyle(kinvisc_air_wave)=0, lsize(kinvisc_air_wave)=1
//
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
TextBox/C/N=text1/F=0/A=LB/X=30/Y=15 "\\Z20\\s(kinvisc_air_fit1_wave)1.51 + 0.009×(\\f02T\\f00/ºC - 20)"
TextBox/C/N=text2/F=0/A=LB/X=30/Y=5 "\\Z20\\s(kinvisc_air_fit2_wave)1.51×(\f02T\f00/293.15 K)\S1.79"
//
Make/O/D/N=1 kinvisc_air_ptX={20}
Make/O/D/N=1 kinvisc_air_ptY={1.51e-5}
AppendtoGraph kinvisc_air_ptY vs kinvisc_air_ptX
ModifyGraph rgb(kinvisc_air_ptY)=(65535,0,0), mode(kinvisc_air_ptY)=3,marker(kinvisc_air_ptY)=19,msize(kinvisc_air_ptY)=5
//
//
/////////////////////
KillWindow/Z Air_thermcond_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(450,450,1050,900) /N=Air_thermcond_temp_graph as "Air_thermcond_temp_graph"
AppendtoGraph thermcond_air_fit1_wave vs TC_air1
AppendtoGraph thermcond_air_fit2_wave vs TC_air2
SetAxis left 1.5e-2,3.5e-2
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air thermal conductivity/(kg m s\S-3\M\Z24 K\S-1\M\Z24)"
//
AppendtoGraph/T thermcond_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(thermcond_air_fit1_wave)=(65535,0,0), lstyle(thermcond_air_fit1_wave)=3, lsize(thermcond_air_fit1_wave)=3
ModifyGraph rgb(thermcond_air_fit2_wave)=(65535,0,0), lstyle(thermcond_air_fit2_wave)=1, lsize(thermcond_air_fit2_wave)=1
ModifyGraph rgb(thermcond_air_wave)=(0,0,0), lstyle(thermcond_air_wave)=0, lsize(thermcond_air_wave)=1
//
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
TextBox/C/N=text1/F=0/A=LB/X=25/Y=15 "\\Z20\\s(thermcond_air_fit1_wave)2.59 + 0.0075×(\\f02T\\f00/ºC - 20)"
TextBox/C/N=text2/F=0/A=LB/X=25/Y=5 "\\Z20\\s(thermcond_air_fit2_wave)2.59×(\f02T\f00/293.15 K)\S0.855"
//
Make/O/D/N=1 thermcond_air_ptX={20}
Make/O/D/N=1 thermcond_air_ptY={2.59e-2}
AppendtoGraph thermcond_air_ptY vs thermcond_air_ptX
ModifyGraph rgb(thermcond_air_ptY)=(65535,0,0), mode(thermcond_air_ptY)=3,marker(thermcond_air_ptY)=19,msize(thermcond_air_ptY)=5
//
//
/////////////////////
KillWindow/Z Air_thermdiff_temp_graph // get rid of previous graph if it exists
Display/K=1/W=(500,500,1100,950) /N=Air_thermdiff_temp_graph as "Air_thermdiff_temp_graph"
AppendtoGraph thermdiff_air_fit1_wave vs TC_air1
AppendtoGraph thermdiff_air_fit2_wave vs TC_air2
SetAxis left 1e-5, 4e-5
SetAxis bottom -73.15, 126.85
Label bottom "\Z24Temp/°C"
Label left "\Z24Air thermal diffusivity/(m\S2\M\Z24 s\S-1\M\Z24)"
//
AppendtoGraph/T thermdiff_air_wave vs TK_air
Label top "\Z24Temp/K"
Make/O/T/N=5 top_tick_labels={"200", "250", "300", "350", "400"}
Make/O/D/N=5 top_tick_locations={200, 250, 300, 350, 400}
ModifyGraph userticks(top)={top_tick_locations, top_tick_labels}
//
ModifyGraph mirror(left)=1,standoff=0, fsize=24
ModifyGraph rgb(thermdiff_air_fit1_wave)=(65535,0,0), lstyle(thermdiff_air_fit1_wave)=3, lsize(thermdiff_air_fit1_wave)=3
ModifyGraph rgb(thermdiff_air_fit2_wave)=(65535,0,0), lstyle(thermdiff_air_fit2_wave)=1, lsize(thermdiff_air_fit2_wave)=1
ModifyGraph rgb(thermdiff_air_wave)=(0,0,0),lstyle(thermdiff_air_wave)=0, lsize(thermdiff_air_wave)=1
//
TextBox/C/N=text0/F=0/A=RT/X=10/Y=5 "\\Z20\f02P\f00 = 1 atm"
TextBox/C/N=text1/F=0/A=LB/X=35/Y=15 "\\Z20\\s(thermdiff_air_fit1_wave)2.14 + 0.013×(\\f02T\\f00/ºC - 20)"
TextBox/C/N=text2/F=0/A=LB/X=35/Y=5 "\\Z20\\s(thermdiff_air_fit2_wave)2.14×(\f02T\f00/293.15 K)\S1.84"
//
Make/O/D/N=1 thermdiff_air_ptX={20}
Make/O/D/N=1 thermdiff_air_ptY={2.14e-5}
AppendtoGraph thermdiff_air_ptY vs thermdiff_air_ptX
ModifyGraph rgb(thermdiff_air_ptY)=(65535,0,0), mode(thermdiff_air_ptY)=3,marker(thermdiff_air_ptY)=19,msize(thermdiff_air_ptY)=5
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_properties(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2026-04-04
//
//
// Description: This calls functions that calculates properties of dry air at low pressures (< 5 atm) to display in Make_Air_Properties_Panel.
// The molar mass of air is from Gatley, D. P, S. Herrmann, H.-J. Kretzschmar (2008), A twenty-first century molar mass for dry air, 
//		HVAC&R Research, 14, 655-662.
// The second virial coefficient is from a fit to values calculated from densities presented in Lemmon, E. W., R. T. Jacobsen, S. G. Penoncello, 
//		and D. G. Friend (2000), Thermodynamic properties of air and mixtures of nitrogen, argon, and oxygen from 60 to 2000 K at 
//		pressures to 2000 MPa, J. Phys. Chem. Ref. Data, 29, 331-385, and are in close agreement to those presented in Hyland, R. W. (1975),
//		A correlation for the second interaction virial coefficients and enhancement factors for moist air, J. Res. NBS, 79A, 551-560. eeeee
//

// eee I need to formalize the fits I show in the graphs


// eeeee
// Description: This calculates the second virial coefficient of dry air based on my fit to densities 
//		at 1 atm presented in Table A2 on pp. 366-370 of Lemmon, E. W., R. T. Jacobsen, S. G. Penoncello, 
//		and D. G. Friend (2000), Thermodynamic properties of air and mixtures of nitrogen, argon, and 
//		oxygen from 60 to 2000 K at pressures to 2000 MPa, J. Phys. Chem. Ref. Data, 29, 331-385.
//
// Lemmon et al. presented the following data:
//		TempK={200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390, 400}
//		rho_1Atm = {0.061079, 0.058147, 0.055486, 0.053059, 0.050836, 0.048793, 0.046908, 0.045164, 0.043546, 0.042040, 0.040634, 0.039320, 0.038089, 0.036932, 0.035844, 0.034818, 0.033850, 0.032933, 0.032066, 0.031243, 0.030461}
//		rho_0pt2MPa = {0.12084, 0.11500, 0.10970, 0.10487, 0.10046, 0.096399, 0.092660, 0.089203, 0.085996, 0.083012, 0.080230, 0.077629, 0.075193, 0.072905, 0.070753, 0.068725, 0.066810, 0.064999, 0.063285, 0.061658, 0.060114}
//		rho_0pt5MPa = {0.30425, 0.28919, 0.27559, 0.26325, 0.25199, 0.24167, 0.23218, 0.22342, 0.21531, 0.20777, 0.20075, 0.19420, 0.18806, 0.18231, 0.17689, 0.17180, 0.16699, 0.16245, 0.15815, 0.15407, 0.15020}
//
// I calculated the second virial coefficient in terms of volume, B_v, from the 1 atm densities using
//		B_v=(P_Pa*rho/Rgas/TempK/1000 - 1)*Rgas*TempK/P_Pa*1e6 (where the 1000 is because 
//		the density values are in mol/dm^3, and the factor of 1e6 is because B_v is in cm^3/mol)
//		and fitted these to a cubic in TempC; the fit matched the data to within 0.4 cm^3/mol. 
//	The values for 1 atm, 0.2 MPa, and 0.5 MPa are nearly identical.
//	I took into account that they used 8.314510 for Rgas instead of the current value 8.314463.
//	Values calculated from Lemmon et al. are in close agreement with the fit (Eq. 4 on p. 552) of 
//		Hyland, R. W. (1975), A correlation for the second interaction virial coefficients and 
//		enhancement factors for moist air, J. Res. NBS, 79A, 551-560.




//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC, Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: Calculate_air_density, Calculate_air_Cp, Calculate_air_Cv, Calculate_air_mean_free_path, 
//		Calculate_air_c_sound, Calculate_air_dynamic_viscosity, Calculate_air_thermal_conductivity
//
// Calls required previously: none
//
// Called by: Calculate_all_stuff_for_properties_panels
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK, Rgas, N_Avogadro
	Variable air_molar_mass, air_density_kg_per_m3, air_density_g_per_cm3, air_density_mol_per_m3, air_density_number_per_m3, air_molar_volume
	Variable air_Cp_J_per_mol_per_K, air_Cp_J_per_kg_per_K, air_Cp_erg_per_g_per_K
	Variable air_Cv_J_per_mol_per_K, air_Cv_J_per_kg_per_K, air_Cv_erg_per_g_per_K
	Variable air_compressibility, air_2nd_virial_v, air_2nd_virial_p
	Variable air_mfp_nm
	Variable air_c_rms, air_c_bar, air_c_sound
	Variable air_dynamic_viscosity, air_dynamic_viscosity_cgs, air_kinematic_viscosity, air_kinematic_viscosity_cgs
	Variable air_thermal_conductivity, air_thermal_conductivity_cgs, air_thermal_diffusivity, air_thermal_diffusivity_cgs
	Variable air_Prandtl_number
//
//
	TempK=TempC+273.15
	Rgas=8.314463 // kg m^2 s^-2 mol^-1 K^-1
	N_Avogadro=6.02214076e23 // /mol
//
//
	air_molar_mass=0.028966 // kg/mol, from Gatley et al. (2008)
//


	air_2nd_virial_v=1e-6*(-13.35+0.2485*TempC-0.001164*TempC^2+3.137e-6*TempC^3) // in cm^3/mol, from my fit to data in Lemmon et al. (2000)
	air_2nd_virial_p=air_2nd_virial_v/Rgas/TempK // in 1/Pa
	air_compressibility=1+air_2nd_virial_v/Rgas/TempK*Pres_hPa*100 // the 100 is the conversion from Pres_hPa to Pres_Pa
//
	air_density_kg_per_m3=Calculate_air_density(TempC, Pres_hPa) // this is in kg/m^3
	air_density_g_per_cm3=air_density_kg_per_m3*1e-3 // this is in g/cm^3
	air_density_mol_per_m3=air_density_kg_per_m3/air_molar_mass // this is in mol/m^3
	air_density_number_per_m3=air_density_mol_per_m3*N_Avogadro // this is in number/m^3
	air_molar_volume=1/air_density_mol_per_m3 // this is in m^3/mol
//
	air_Cp_J_per_mol_per_K=Calculate_air_Cp(TempC, Pres_hPa) // this is in J/mol/K
	air_Cp_J_per_kg_per_K=air_Cp_J_per_mol_per_K/air_molar_mass // this is in J/kg/K
	air_Cp_erg_per_g_per_K=air_Cp_J_per_kg_per_K*1e4 // this is in erg/g/K
//
	air_Cv_J_per_mol_per_K=Calculate_air_Cv(TempC, Pres_hPa) // this is in J/mol/K
	air_Cv_J_per_kg_per_K=air_Cv_J_per_mol_per_K/air_molar_mass // this is in J/kg/K
	air_Cv_erg_per_g_per_K=air_Cv_J_per_kg_per_K*1e4 // this is in erg/g/K
//
	air_mfp_nm=Calculate_air_mean_free_path(TempC, Pres_hPa) // in nm
//
	air_c_rms=sqrt(3*Rgas*TempK/air_molar_mass) // in m/s
	air_c_bar=sqrt(8/Pi*Rgas*TempK/air_molar_mass) // in m/s
	air_c_sound=Calculate_air_c_sound(TempC, Pres_hPa) // in m/s
//
	air_dynamic_viscosity=Calculate_air_dynamic_viscosity(TempC, Pres_hPa) // this is in Pa s
	air_dynamic_viscosity_cgs=air_dynamic_viscosity*10
	air_kinematic_viscosity=air_dynamic_viscosity/air_density_kg_per_m3 // this is in m^2/s
	air_kinematic_viscosity_cgs=air_kinematic_viscosity*1e4
//
	air_thermal_conductivity=Calculate_air_thermal_conductivity(TempC, Pres_hPa) // this is in MKS
	air_thermal_conductivity_cgs=air_thermal_conductivity*1e5 // this is in cgs
	air_thermal_diffusivity=air_thermal_conductivity/air_density_mol_per_m3/air_Cp_J_per_mol_per_K // this is in MKS
	air_thermal_diffusivity_cgs=air_thermal_diffusivity*1e4 // this is in cgs
//
	air_Prandtl_number=air_kinematic_viscosity_cgs/air_thermal_diffusivity_cgs
//
//
//////////////////////////////// make wave of air properties for Air_properties_panel
// Some of the values created above are modified (by multiplying by 10 to some power) for display purposes.
	Make/O/D/N=28 air_properties_wave
	air_properties_wave[0]=air_density_kg_per_m3
	air_properties_wave[1]=air_density_g_per_cm3*1e3 // the 1e3 is because of how it is displayed
	air_properties_wave[2]=air_density_mol_per_m3
	air_properties_wave[3]=air_density_number_per_m3*1e-25 // the 1e-25 is because of how it is displayed
	air_properties_wave[4]=air_molar_volume
//
	air_properties_wave[5]=air_compressibility
	air_properties_wave[6]=air_2nd_virial_v*1e6 // the 1e6 is so the unites are cm^3/mol
	air_properties_wave[7]=air_2nd_virial_p*1e9 // the 1e9 is so the units are 1/hPa
//
	air_properties_wave[8]=air_Cp_J_per_mol_per_K
	air_properties_wave[9]=air_Cp_J_per_kg_per_K
	air_properties_wave[10]=air_Cp_erg_per_g_per_K*1e-6 // the 1e-6 is because of how it is displayed
//
	air_properties_wave[11]=air_Cv_J_per_mol_per_K
	air_properties_wave[12]=air_Cv_J_per_kg_per_K
	air_properties_wave[13]=air_Cv_erg_per_g_per_K*1e-6 // the 1e-6 is because of how it is displayed
	air_properties_wave[14]=air_Cp_J_per_mol_per_K/air_Cv_J_per_mol_per_K
// to very good approximation, Cp/Cv = 1.400 - 0.0001*(TempK-300), over TempK from 200 to 400 K
//
	air_properties_wave[15]=air_mfp_nm
//
	air_properties_wave[16]=air_c_rms
	air_properties_wave[17]=air_c_bar
	air_properties_wave[18]=air_c_sound
//
	air_properties_wave[19]=air_dynamic_viscosity*1e5 // the 1e6 is because of how it is displayed
	air_properties_wave[20]=air_dynamic_viscosity_cgs*1e4 // the 1e4 is because of how it is displayed
	air_properties_wave[21]=air_kinematic_viscosity*1e5 // the 1e6 is because of how it is displayed
	air_properties_wave[22]=air_kinematic_viscosity_cgs
//
	air_properties_wave[23]=air_thermal_conductivity*1e2 // the 1e3 is because of how it is displayed
	air_properties_wave[24]=air_thermal_conductivity_cgs*1e-3 // the 1e-3 is because of how it is displayed
	air_properties_wave[25]=air_thermal_diffusivity*1e5 // the 1e6 is because of how it is displayed
	air_properties_wave[26]=air_thermal_diffusivity_cgs
//
	air_properties_wave[27]=air_Prandtl_number
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_virial_coef(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2026-04-04
//
//
// Description: This calculates the second virial coefficient of dry air based on my fit to those calculated from 
//	densities at 1 atm presented in Table A2 on pp. 366-370 of Lemmon, E. W., R. T. Jacobsen, S. G. 
//	Penoncello, and D. G. Friend (2000), Thermodynamic properties of air and mixtures of nitrogen, argon,
//	and oxygen from 60 to 2000 K at pressures to 2000 MPa, J. Phys. Chem. Ref. Data, 29, 331-385.
//
// Lemmon et al. presented the following data:
//	TempK={200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390, 400}
//	rho_1Atm = {0.061079, 0.058147, 0.055486, 0.053059, 0.050836, 0.048793, 0.046908, 0.045164, 0.043546, 0.042040, 0.040634, 0.039320, 0.038089, 0.036932, 0.035844, 0.034818, 0.033850, 0.032933, 0.032066, 0.031243, 0.030461}
//	rho_0pt2MPa = {0.12084, 0.11500, 0.10970, 0.10487, 0.10046, 0.096399, 0.092660, 0.089203, 0.085996, 0.083012, 0.080230, 0.077629, 0.075193, 0.072905, 0.070753, 0.068725, 0.066810, 0.064999, 0.063285, 0.061658, 0.060114}
//	rho_0pt5MPa = {0.30425, 0.28919, 0.27559, 0.26325, 0.25199, 0.24167, 0.23218, 0.22342, 0.21531, 0.20777, 0.20075, 0.19420, 0.18806, 0.18231, 0.17689, 0.17180, 0.16699, 0.16245, 0.15815, 0.15407, 0.15020}
//
// I calculated the second virial coefficient in terms of volume, B_v, from the 1 atm densities using
//		B_v=(P_Pa*rho/Rgas/TempK/1000 - 1)*Rgas*TempK/P_Pa*1e6 (where the 1000 is because 
//		the density values are in mol/dm^3, and the factor of 1e6 is because B_v is in cm^3/mol)
//		and fitted these to a cubic in TempC; the fit matched the data to within 0.4 cm^3/mol. 
//	The values for 1 atm, 0.2 MPa, and 0.5 MPa are nearly identical.
//	I took into account that they used 8.314510 for Rgas instead of the current value 8.314463.
//	Values calculated from Lemmon et al. are in close agreement with the fit (Eq. 4 on p. 552) of 
//		Hyland, R. W. (1975), A correlation for the second interaction virial coefficients and 
//		enhancement factors for moist air, J. Res. NBS, 79A, 551-560.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none 
//
// Called by: Calculate_air_properties, eee
//
// Return: air_2nd_virial_v_cm3_per_mol
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable air_2nd_virial_v_cm3_per_mol
//
//
	air_2nd_virial_v_cm3_per_mol=1e-6*(-13.35+0.2485*TempC-0.001164*TempC^2+3.137e-6*TempC^3) // in cm^3/mol, from my fit to Lemmon et al. (2000)
//
//
Return air_2nd_virial_v_cm3_per_mol
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_density(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates the density of dry air using the molar mass of air is from Gatley, D. P, S. Herrmann, H.-J. Kretzschmar (2008),
//		A twenty-first century molar mass for dry air, HVAC&R Research, 14, 655-662, and my fit of the second virial coefficient from values
//		calculated from densities presented in Table A2 on p. eeeee of Lemmon, E. W., R. T. Jacobsen, S. G. Penoncello, and D. G. Friend (2000),
//		Thermodynamic properties of air and mixtures of nitrogen, argon, and oxygen from 60 to 2000 K at pressures to 2000 MPa, 
//		J. Phys. Chem. Ref. Data, 29, 331-385, which are in close agreement to those presented in Hyland, R. W. (1975),
//		A correlation for the second interaction virial coefficients and enhancement factors for moist air, J. Res. NBS, 79A, 551-560.
//
//eeeee  Lemmon Table 2 - 1 atm
// Make/o/D/n=21 TK={200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390, 400}
// make/o/D/n=21 rho_1Atm = {0.061079, 0.058147, 0.055486, 0.053059, 0.050836, 0.048793, 0.046908, 0.045164, 0.043546, 0.042040, 0.040634, 0.039320, 0.038089, 0.036932, 0.035844, 0.034818, 0.033850, 0.032933, 0.032066, 0.031243, 0.030461}
// make/o/D/n=21 zz=101325/8.314463/TempK/rho_1atm*0.001
// Make/O/D/N=21 BBVV=(zz-1)/rho_1Atm*1000




//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none 
//
// Called by: Calculate_air_properties
//
// Return: air_density_kg_per_m3
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable Rgas, air_molar_mass, air_2nd_virial_v, air_compressibility, air_density_kg_per_m3
//
//
	Rgas=8.314463 // kg m^2 /s^2 /K /mol
	air_molar_mass=0.028966 // kg/mol, from Gatley et al. (2008)
//
//
	air_2nd_virial_v=1e-6*(-13.35+0.2485*TempC-0.001164*TempC^2+3.137e-6*TempC^3) // in cm^3/mol, from my fit of data in Lemmon et al. (2000)
	air_compressibility=1+air_2nd_virial_v/Rgas/TempK*Pres_hPa*100 // the 100 is the conversion from Pres_hPa to Pres_Pa
	air_density_kg_per_m3=(Pres_hPa*100)*air_molar_mass/Rgas/TempK*air_compressibility
//
//
Return air_density_kg_per_m3
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_Cp(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates the specific heat of air at constant pressure in J/mol/K based on my fits to the data 
//		in Table A2 pp. 366-370 of of Lemmon et al., 2000, Thermodynamic properties of air and 
//		mixtures of nitrogen, argon, and oxygen from 60 to 2000 K at pressures to 2000 MPa, 
//		Journal of Physical and Chemical Reference Data, 29, 331-385, by fitting values from
//		200-400 K and pressures up to 5 atm quadratically in temperature and linearly in pressure.
//
// Make/O/D/N=21 TempK, CP_air_minus_29_0pt1MPa, CP_air_minus_29_0pt2MPa, CP_air_minus_29_0pt5MPa
// TempK={200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390, 400}
// CP_air_minus_29_0pt1MPa={0.16, 0.15, 0.14, 0.13, 0.13, 0.13, 0.13, 0.13, 0.13, 0.14, 0.15, 0.16, 0.18, 0.19, 0.21, 0.23, 0.26, 0.28, 0.31, 0.34, 0.38} // Table A2, p. 367, 0.101325 MPa
// CP_air_minus_29_0pt2MPa={0.29, 0.26, 0.24, 0.22, 0.21, 0.20, 0.19, 0.19, 0.19, 0.19, 0.20, 0.20, 0.21, 0.23, 0.24, 0.26, 0.29, 0.31, 0.34, 0.37, 0.40} // Table A2, p. 368, 0.2 MPa
// CP_air_minus_29_0pt5MPa={0.68, 0.60, 0.54, 0.49, 0.45, 0.41, 0.39, 0.37, 0.35, 0.34, 0.33, 0.33, 0.33, 0.34, 0.35, 0.36, 0.37, 0.39, 0.41, 0.44, 0.47} // Table A2, p. 370, 0.5 MPa
//
// Over this range, my fit matches the values in Lemmon to within 0.005 J/mol/K (0.02 %) at 1 atm (i.e., the number of digits listed),
//		0.007 J/mol/K (0.025 %) at 2 atm, and 0.025 J/mol/K at 5 atm.
// The accuracy corresponding to the number of digits listed is 0.02 %
// The expression Cp=3.5*Rgas (=29.10 J/mol/K) agrees to within 0.3 J/mol/K (1 %) at 1 and 2 atm, and within 0.6 J/mol/K (2 %) at 5 atm.
// 
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_air_properties
//
// Return: air_CP_J_per_mol_per_K
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable air_Cp_J_per_mol_per_K
//
//
// my fit to Lemmon et al. (2000)
	air_Cp_J_per_mol_per_K=29.126+1.2e-5*(TempK-255)^2 + (0.026+3e-6*(TempK-380)^2)*(Pres_hPa/1013.25-1)
//
//
Return air_Cp_J_per_mol_per_K
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_Cv(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates the specific heat of air at constant volume in J/mol/K based on my fits to the data 
//		in Table A2 pp. 366-370 of of Lemmon et al., 2000, Thermodynamic properties of air and 
//		mixtures of nitrogen, argon, and oxygen from 60 to 2000 K at pressures to 2000 MPa, 
//		Journal of Physical and Chemical Reference Data, 29, 331-385, by fitting values from
//		200-400 K and pressures up to 5 atm quadratically in temperature and linearly in pressure.
//
// Make/O/D/N=21 TempK, Cv_air_minus_20_0pt1MPa, Cv_air_minus_20_0pt2MPa, Cv_air_minus_20_0pt5MPa
// TempK={200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390, 400}
// Cv_air_minus_20_0pt1MPa={0.74, 0.74, 0.74, 0.74, 0.75, 0.75, 0.76, 0.76, 0.77, 0.78, 0.80, 0.81, 0.83, 0.85, 0.87, 0.89, 0.92, 0.94, 0.97, 1.01, 1.04} // Table A2, p. 367, 0.101325 MPa
// Cv_air_minus_20_0pt2MPa={0.77, 0.76, 0.76, 0.76, 0.76, 0.76, 0.77, 0.77, 0.78, 0.79, 0.80, 0.82, 0.83, 0.85, 0.87, 0.90, 0.92, 0.95, 0.98, 1.01, 1.04} // Table A2, p. 368, 0.2 MPa
// Cv_air_minus_20_0pt5MPa={0.84, 0.82, 0.81, 0.80, 0.80, 0.80, 0.80, 0.80, 0.81, 0.81, 0.82, 0.84, 0.85, 0.87, 0.89, 0.91, 0.93, 0.96, 0.99, 1.02, 1.06} // Table A2, p. 370, 0.2 MPa
//
// Over this range, my fit matches the values in Lemmon to within 0.007 J/mol/K (0.033 %) at all three pressures.
// The expression Cv=2.5*Rgas (=20.79 J/mol/K) agrees to within 0.27 J/mol/K (1.3 %) over this range of temperatures and pressure.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_air_properties
//
// Return: air_Cv_J_per_mol_per_K
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable air_Cv_J_per_mol_per_K
//
//
// my fit to Lemmon et al. (2000)
	air_Cv_J_per_mol_per_K=20.74+9.4e-6*(TempK-222)^2 + (0.004+7.2e-7*(TempK-360)^2)*(Pres_hPa/1013.25-1)
//
//
Return air_Cv_J_per_mol_per_K
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_mean_free_path(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates the mean free path using the relationship given in Allen, M. D., and O. G. Raabe (1982),
//   Re-evaluation of Millikan’s oil drop data for the motion of small particles in air, J. Aerosol Sci., 13, 537-547.
// The functional form they use is from Willeke, K. (1976), Temperature dependece of particle slip in a gaseous medium, J. Aerosol Sci., 7, 381-387.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_air_properties, Calculate_particle_properties, Calculate_coagulation_quantities, Calculate_Dq_equal_mobility_as_Dq_actual, Calculate_Dmob_for_various_Q
//
// Return: air_mean_free_path_nm
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK, mfp_0, P_ref, T_ref, T_Sutherland, air_mean_free_path_nm
	TempK=TempC+273.15
	mfp_0=67.3 // nm (Willeke uses 65.3 nm)
	P_ref=1013.25 // hPa
	T_ref=296.15 // K
	T_Sutherland=110.4 // K (Willeke uses 110.0)
//
//
// calculate the mean free path from Allen and Raabe (1982), based on Willeke (1976)
	air_mean_free_path_nm=mfp_0*(TempK/T_ref)*(P_ref/Pres_hPa)*(1+T_Sutherland/T_ref)/(1+T_Sutherland/TempK)
//
//
Return air_mean_free_path_nm
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_c_sound(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates the speed of sound in air, in m/s, from Table A2, pp. 366-370 of 
//		Lemmon, E. W., R. T. Jacobsen, S. G. Penoncello, and D. G. Friend (2000), Thermodynamic 
//		properties of air and mixtures of nitrogen, argon, and oxygen from 60 to 2000 K at 
//		pressures to 2000 MPa, J. Phys. Chem. Ref. Data, 29, 331-385, by my fitting values from
//		200-400 K and pressures up to 5 atm quadratically in temperature and linearly in pressure.
//
// TempK={200, 210, 220, 230, 240, 250, 260, 270, 280, 290, 300, 310, 320, 330, 340, 350, 360, 370, 380, 390, 400}
// c_sound_0pt1MPa={283.4, 290.5, 297.4, 304.1, 310.7, 317.1, 323.4, 329.6, 335.6, 341.5, 347.4, 353.1, 358.7, 364.2, 369.7, 375.0, 380.3, 385.4, 390.5, 395.5, 400.5} // Table A2, p. 367, 0.101325 MPa
// c_sound_0pt2MPa={283.2, 290.4, 297.3, 304.0, 310.7, 317.1, 323.4, 329.6, 335.7, 341.6, 347.5, 353.2, 358.8, 364.4, 369.8, 375.2, 380.4, 385.6, 390.7, 395.7, 400.7} // Table A2, p. 368, 0.2 MPa
// c_sound_0pt5MPa={282.6, 289.9, 297.0, 303.9, 310.6, 317.1, 323.5, 329.8, 335.9, 341.9, 347.8, 353.6, 359.3, 364.8, 370.3, 375.7, 381.0, 386.2, 391.3, 396.3, 401.3} // Table A2, p. 370, 0.5 MPa
//
// Over this range, my fits differs from the values in Lemmon by no more than 0.1 m/s.
// Over this range, the expression sqrt(1.4*RT/M) agrees to within 1 % and 0.4 m/s at 1 atm and 0.3 % and 9 m/s at 5 atm.
// The approximation 328.5+0.58*TempC agrees to within 1.2 % from 200-400 K and P up to 5 atm.
// The approximation 331+0.6*TempC agrees to within 0.15 % from 240-320 K (-30 to +50 C) at 1 atm.
//
// The molar mass of air is from Gatley, D. P, S. Herrmann, H.-J. Kretzschmar (2008), A twenty-first century molar mass for dry air, 
//		HVAC&R Research, 14, 655-662.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_air_properties
//
// Return: air_c_sound
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable Rgas, air_molar_mass, air_c_sound
//
//
	Rgas=8.314463 // kg m^2 /s^2 /K /mol
	air_molar_mass=0.028966 // kg/mol, from Gatley et al. (2008)
//
//
// my fit to Lemmon et al. (2000)
	air_c_sound=sqrt(1.4*Rgas*TempK/air_molar_mass) + 0.15+(0.0024+0.0027*(Pres_hPa/1013.25-1))*(TempK-250)-(4.2+(Pres_hPa/1013.25-1))*1e-5*(TempK-250)^2
//
//
Return air_c_sound
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_dynamic_viscosity(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2026-01-13
//
//
// Description: This calculates the dynamic viscosity of air from Eqs. 1, 2, and 3 and Tables I , II, and III of
//		Lemmon, E. W., and R. T. Jacobsen (2004), Viscosity and thermal conductivity equations for nitrogen, oxygen,
//		argon, and air, Int. J. Thermophys., 25, 21-69. They compiled results from 37 studies and expressed the viscosity
//		as the sum of two terms: the dilute gas viscosity (10 coefficients), which is based on kinetic theory and depends
//		only on temperature, and the residual fluid viscosity (20 coefficients) that accounts for pressure effects and is
//		roughly proportional to the pressure at low pressures. They stated that "the number of terms was kept to a minimum."
// The units are Pa-s.
// The stated uncertainty is 1 % for the dilute gas.
// The residual fluid viscosity is generally negligible; over the temperature range 200-400 K, its contribution
//		decreases from 0.7 to 0.25 % at 5 atm, and from 0.13 to 0.05 % at 1 atm.
// The range of validity is not explicitly stated but is ~70 K to ~1000 K.
// Kadoya, K., N. Matsunaga, and A. Nagashima (1985), Viscosity and thermal conductivity of dry air in the gas phase, 
//		J. Phys. Chem. Ref. Data, 14, 947-970, gave an expression that yields values for the dilute gas viscosity
//		that are ~0.2 % lower than those of Lemmon and Jacobsen (2004) over most of this temperature range.
// Rayleigh (1900), On the viscosity of argon as affected by temperature, Proc. Royal Soc. London, 66, 68-74 proposed
//		that the dynamic viscosity or air varied with temperature as a power law with exponent 0.754.
//	The expression µ/(kg /m /s) = 18.2 × (T/300 K)^0.754, agrees with that of Lemmon and Jacobsen (2004) to within 
//		to within 1 %  ???? for temperatures 200-600 K.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_air_properties
//
// Return: air_dynamic_viscosity
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable eps_by_k, T_star, Omega, air_dilute_viscosity, air_residual_viscosity, air_dynamic_viscosity
	Variable TempK_crit_air, rho_crit_air, rho_air, delta_LJ, tau_LJ
//
//
	eps_by_k=103.3 // K, for air
	T_star=TempK/eps_by_K
	Omega=exp(0.431 - 0.4623*ln(T_star) + 0.08406*(ln(T_star))^2 + 0.005341*(ln(T_star))^3 - 0.00331*(ln(T_star))^4) // p. 23, coefficients in Table 2
	TempK_crit_air=132.6312 // K
	rho_crit_air=10.4477 // mol/dm^3
//
// dynamic viscosity of air in dilute regime, Equation 2, with values from Table 1, Lemmon and Jacobsen (2004)
	air_dilute_viscosity=0.0266958e-6*sqrt(28.9586*TempK)/(0.360)^2/Omega // Pa-s
//
//
// correction for non-dilute (this is an approx for low pressures only)
	rho_air=0.04061*Pres_hPa/(1013.25)*(300/TempK) // assume perfect gas law to calculate density required for pressure correction
	delta_LJ=rho_air/rho_crit_air // rho in units mol/m^3
// eee check units
	tau_LJ=TempK_crit_air/TempK // from Table 1 in Lemmon and Jacobsen (2004)
	air_residual_viscosity=1e-6*(10.72*tau_LJ^0.2*delta_LJ + 1.122*tau_LJ^0.05*delta_LJ^4 + 0.002019*tau_LJ^2.4*delta_LJ^9 - 8.876*tau_LJ^0.6*delta_LJ*exp(-delta_LJ) - 0.02916*tau_LJ^3.6*delta_LJ^8*exp(-delta_LJ)) // in Pa-s, from Eq. 3 and Table 3 of Lemmon and Jacobsen (2004)
// this is very low - 0.7% for T=200 K and P=5 atm and 0.4% for T=300 K and P=5 atm;
//
	air_dynamic_viscosity=air_dilute_viscosity + air_residual_viscosity // in Pa-s
//
//
Return air_dynamic_viscosity
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_air_thermal_conductivity(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2026-01-13
//
//
// Description: This calculates the thermal conductivity of air from Eqs. 4, 5, and 6 and Table IV of Lemmon, E. W.,
//		and R. T. Jacobsen (2004), Viscosity and thermal conductivity equations for nitrogen, oxygen, 
//		argon, and air, Int. J. Thermophys., 25, 21-69, who compiled results from 27 studies and expressed
//		this quantity as the sum of the dilute gas thermal conductivity, which depends only on temperature
//		and the residual fluid thermal conductivity and the thermal conductivity critical enhancement that
//		depend on both temperature and pressure.
// The stated uncertainty is 2 % for the dilute gas.
// The residual fluid thermal conductivity is generally negligible; over the temperature range 200-400 K,
//		its contribution decreases from 1.4 to 0.35 % at 5 atm, and from 0.27 to 0.07 % at 1 atm.
// The thermal conductivity critical enhancement is not included, but is negligible for temperatues considered here.
// The range of validity is not explicitly stated but is ~70 K to ~1000 K.
// Kadoya, K., N. Matsunaga, and A. Nagashima (1985), Viscosity and thermal conductivity of dry air in the gas 
//		phase, J. Phys. Chem. Ref. Data, 14, 947-970, and Stephan, K., and A. Laesecke (1985), The 
//		thermal conductivity of fluid air, J. Phys. Chem. Ref. Data, 14, 227-234, gave expressions
//		that yields dilute gas values that are 0.6-1.2 % lower than those of Lemmon and Jacobsen for 200-400 K.
// A power law with exponent 0.855 and value 0.02623 kg m s^(-3) K(-1) at 300 K, k = 0.0262*(TK/300)^(0.855)
//		agrees with Lemmon and Jacobsen (2004) to within 0.5 % between 200 and 400 K.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_air_properties
//
// Return: air_thermal_conductivity
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable eps_by_k, T_star, Omega, TempK_crit_air, tau_LJ, air_dilute_viscosity, air_dilute_thermal_conductivity, air_residual_thermal_conductivity, air_thermal_conductivity
	Variable rho_crit_air, rho_air, delta_LJ
//
//
// calculate dilute air viscosity from Lemmon and Jacobsen (2004), Eq. 2, with values from Table 1
	eps_by_k=103.3 // K
	T_star=TempK/eps_by_K
	Omega=exp(0.431 - 0.4623*ln(T_star) + 0.08406*(ln(T_star))^2 + 0.005341*(ln(T_star))^3 - 0.00331*(ln(T_star))^4)
	TempK_crit_air=132.6312 // K
	rho_crit_air=10.4477 // mol/dm^3
//
	tau_LJ=TempK_crit_air/TempK
	air_dilute_viscosity=0.0266958e-6*sqrt(28.9586*TempK)/(0.360)^2/Omega // Pa-s
//
//
// thermal conductivity of air in the dilute regime, equation 5, with values from Table IV, Lemmon and Jacobsen (2004)
	air_dilute_thermal_conductivity=1e-3*(1.308*(1e6*air_dilute_viscosity) + 1.405*tau_LJ^(-1.1) - 1.036*tau_LJ^(-0.3)) // in W/m/K, which is the same as kg m /s^3 /K^1
//
//
// correction for non-dilute (this is an approx for low pressures only)
	rho_air=0.04061*Pres_hPa/(1013.25)*(300/TempK) // assume perfect gas law to calculate density required for pressure correction
	delta_LJ=rho_air/rho_crit_air // rho in units mol/m^3
// eee check units
	air_residual_thermal_conductivity=1e-3*(8.743*tau_LJ^(0.1)*delta_LJ + 14.76*delta_LJ^2 - 16.62*tau_LJ^0.5*delta_LJ^3*exp(-delta_LJ^2) + 3.793*tau_LJ^2.7*delta_LJ^7*exp(-delta_LJ^2)) // in W/m/K, which is the same as kg m /s^3 /K^1, from Eq. 6 and Table 4 of Lemmon and Jacobsen (2004)
//
//
	air_thermal_conductivity=air_dilute_thermal_conductivity + air_residual_thermal_conductivity // in W/m/K, which is the same as kg m /s^3 /K^1
//
//
Return air_thermal_conductivity
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Make_Water_vapor_in_air_properties_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This sets up a panel that displays thermodynamic and transport properties of water vapor in air.
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Do_Water_vapor_in_air_properties_info_button (when "i" hit)
//
// Calls required previously: Set_defaults_for_property_panels() sets the default T and P
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function: water_vapor_in_air_properties_wave contains the values that will be displayed
//
//
/////////////////////////////////////
//	make water vapor in air properties panel
	KillWindow/Z Water_vapor_in_air_properties_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(605,75,825,430) /N=Water_vapor_in_air_properties_panel as "Display water vapor in air properties"
//
//
/////////////////////////////////////
//	set up title box for water vapor
	TitleBox Water_vapor_properties_in_air_properties_title title="\Z22H\B2\M\Z22O in Air Properties", pos={7.5, 5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Water_vapor_in_air properties info button
	Button Water_vapor_in_air_properties_info_button,pos={90,310},size={40,40},proc=Do_Water_vapor_in_air_properties_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
///////////////////////////////////
//	Group molal mass, gas constant of water vapor in air
	GroupBox Water_vapor_molal_mass_stuff pos={10, 50}, size={200, 55}, labelBack=(50000, 50000, 50000)
//
	DrawText 15, 75, "\Z14 Molar mass/(g mol\S-1\M\Z14): 18.015"
	DrawText 35, 100, "\Z14 R\Bwv\M\Z14/(m\S2\M\Z14 s\S-2\M\Z14 K\S-1\M\Z14): 461.53" // = Rgas/Mwv
//
//
// Group calculated water vapor speeds
	GroupBox Water_vapor_speeds pos={30,115}, size={160,55}, labelBack=(50000, 50000, 50000)
//
	DrawText 45, 140, "\Z14c\Brms\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay H2O_c_rms, pos={140, 122.5}, size={40,20}, bodywidth=0, value=#"water_vapor_in_air_properties_wave[0]", fsize=12, format="%5.1f"
//
	DrawText 45, 165, "\Z14< c >/(m s\S-1\M\Z14)"
	ValDisplay H2O_c_bar, pos={140, 147.5}, size={40,20}, bodywidth=0, value=#"water_vapor_in_air_properties_wave[1]", fsize=12, format="%5.1f"
//
//
// Group calculated water transport values
	GroupBox Water_vapor_transport_values pos={10,180}, size={200,80}, labelBack=(50000, 50000, 50000)
//
	DrawText 15, 205, "\Z14Diffusivity/(m\S2\M\Z14 s\S-1\M\Z14)"
	DrawText 172.5, 205, "\Z12×\Z1410\S-5\M"
	ValDisplay H2O_diffusivity_in_air, pos={137.5, 187.5}, size={35,20}, bodywidth=0, value=#"water_vapor_in_air_properties_wave[2]", fsize=12, format="%4.2f"
//
	DrawText 15, 230, "\Z14Diffusivity/(cm\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay H2O_diffusivity_in_air_cgs, pos={137.5, 212.5}, size={40,20}, bodywidth=0, value=#"water_vapor_in_air_properties_wave[3]", fsize=12, format="%4.3f"
//
	DrawText 15, 255, "\Z14mean free path/nm"
	ValDisplay H2O_mfp_in_air, pos={137.5, 237.5}, size={40,20}, bodywidth=0, value=#"water_vapor_in_air_properties_wave[4]", fsize=12, format="%5.1f"
//
//
// Group Schmidt number
	GroupBox Schmidt_number_value pos={5,270}, size={210,30}, labelBack=(50000, 50000, 50000)
	DrawText 10, 295, "\Z14Schmidt number Sc≡\f02ν\f00/D"
	ValDisplay Schmidt_number, pos={172.5,275}, size={35, 20}, bodywidth=0, value=#"water_vapor_in_air_properties_wave[5]", fsize=12, format="%3.2f"
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Water_vapor_in_air_properties_info_button(Water_vapor_in_air_properties_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-12-03
//
//
// Description: This calls Print_Water_vapor_in_air_properties_info which prints information on the Water vapor in air properites panel
//		when the Do_Water_vapor_in_air_properties_button is hit in panel Make_Water_vapor_in_air_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Water_vapor_in_air_properties_info_Struct - the structure for this button control
//
//
// Quantities required for function: none
//
// Calls: Print_Water_vapor_in_air_properties_info
//
// Calls required previously: none
//
// Called by: Make_Water_vapor_in_air_properties_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Water_vapor_in_air_properties_info_Struct
//
//
	If (Water_vapor_in_air_properties_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Water_vapor_in_air_properties_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Water_vapor_in_air_properties_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the properties of water vapor in air display in Make_Water_vapor_in_air_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Water_vapor_in_air_properties_info_button 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Water_vapor_in_air_properties_info_text
//
//
	Water_vapor_in_air_properties_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "Water Vapor in Air Properties\r"
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "-----------------------------\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "The molar mass of water substance M_w = 18.015 g/mol, and R_wv = R_gas/M_w.\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "From basic kinetic theory, c_rms=(3RT/M)^(1/2) and <c>=[(8/π)(RT/M)]^(1/2).\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "The formulation for the diffusivity of water vapor in air, D_wv,a/(cm^2/s) = 0.2178*(1 atm/P)*(TempK/273.15)^(1.81),\r"
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "   is from the comprehensive review of Massman, W. J. (1988), A review of the molecular diffusivities of H2O, CO2,\r"
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "   CO, O3, SO2, NH3, NO, and NO2 in air, O2 and N2 near STP, Atmos. Envir., 32, 1111-1127, based on analysis of all\r"
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "   existing data: 58 determinations from 28 experiments, with 17 data eliminated by loess technique (and none at\r"
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "   temperatures below 0 ºC), with an absolute uncertainty of ~7 %, and the standard error of fit of ~0.5 %.\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "The data are all from near 1 atm, so the inverse relationship with pressure comes from theory. The approximation \r"
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "   Dwv,a/(cm^2/s) = 0.22*(1+0.0066*TempC) agrees with the relation at 1 atm to within 1 % between -40 ºC and 50 ºC.\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "The mean free path of water vapor in air is defined here as mfp = 3*D_wv,a/c_rms_wv.\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "The Schmidt number, Sc ≡ ν/D_wv,a (the ratio of the kinematic viscosity of air to the diffusivity of water vapor\r"
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "   in air), is near 0.61 from -20 °C to 90 °C at pressures to 5 atm.\r\r"
//
	Water_vapor_in_air_properties_info_text = Water_vapor_in_air_properties_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Water_vapor_in_air_properties_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(165,470,995,860)/N=Water_vapor_in_air_properties_info_notebook
	Notebook Water_vapor_in_air_properties_info_notebook, text=Water_vapor_in_air_properties_info_text
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_vapor_in_air_properties(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates properties of water vapor in air near 1 atm pressure to display in a panel.
// All values are in MKS units.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa, air_properties_wave
//
// Calls: Calculate_H2O_diffusivity_in_air, Calculate_air_properties
//
// Calls required previously: none
//
// Called by: Calculate_all_stuff_for_properties_panels
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable Rgas, TempK, H2O_molar_mass, H2O_c_rms, H2O_c_bar, H2O_diffusivity_in_air, H2O_diffusivity_in_air_cgs, H2O_mfp_in_air_nm, Schmidt_number
//
	Wave air_properties_wave

////
	Rgas=8.314463 // kg m^2 s^-2 mol^-1 K^-1
	TempK=TempC+273.15
//
	H2O_molar_mass=0.018015// kg/mol
	H2O_c_rms=sqrt(3*Rgas*TempK/H2O_molar_mass)
	H2O_c_bar=sqrt(8/Pi*Rgas*TempK/H2O_molar_mass)
	H2O_diffusivity_in_air=Calculate_H2O_diffusivity_in_air(TempC, Pres_hPa)
	H2O_diffusivity_in_air_cgs=H2O_diffusivity_in_air*1e4
	H2O_mfp_in_air_nm=1e9*3*H2O_diffusivity_in_air/H2O_c_rms // defined as 3D/c_bar
//
//
//////////////////////////////// make wave of water vapor in air properties for Display_water_vapor_in_air_properties
	Make/O/D/N=6 water_vapor_in_air_properties_wave
	water_vapor_in_air_properties_wave[0]=H2O_c_rms
	water_vapor_in_air_properties_wave[1]=H2O_c_bar
	water_vapor_in_air_properties_wave[2]=H2O_diffusivity_in_air*1e5 // the 1e5 is for display purposes
	water_vapor_in_air_properties_wave[3]=H2O_diffusivity_in_air_cgs
	water_vapor_in_air_properties_wave[4]=H2O_mfp_in_air_nm
//
	Calculate_air_properties(TempC, Pres_hPa)
	water_vapor_in_air_properties_wave[5]=air_properties_wave[22]/H2O_diffusivity_in_air_cgs
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_H2O_diffusivity_in_air(TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates the diffusivity of water vapor in air, based on the comprehensive review of 
// Massman, W. J. (1998), A review of the molecular diffusivities of H2O, CO2, CO, O3, SO2, NH3, 
//		NO, and NO2 in air, O2 and N2 near STP, Atmos. Envir., 32, 1111-1127.
// This is for pressures near 1 atm; the diffusivity is inversely proportional to pressure (near STP).
//	His results were based on analysis of all existing data: 58 determinations from 28 experiments,
//		 with 17 data eliminated by loess technique.
// There are apparently no data for temperatures below 0 ºC.
// He states an absolute uncertainty of ~7%, and the standard error of fit of ~0.5%.
// His result can be accurately approximated by Dwv,a/(m^2/s) = 2.2·10^(-5)*(1+0.0066t),
//		which agrees with his parameterization to within 1% for -40 ºC < t < 50 ºC.
// If the diffusivity must be approximated outside this range, a dependence on temperature of 
//		a power law with exponent 1.81 should be assumed.
// If the exponent 1.8 is used instead of 1.81, then the difference is less than 0.2% 
//		(=(323.15/273.15)^0.01 - 1) for t < 50 ºC.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC and Pres_hPa are the temperature and pressure
//
// Quantities required for function: TempC, Pres_hPa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_vapor_in_air_properties
//
// Return: H2O_diffusivity_in_air
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC, Pres_hPa
//
//
//////////// Declare other variables and waves
	Variable TempK, H2O_diffusivity_in_air
	TempK=TempC+273.15
	H2O_diffusivity_in_air=2.178e-5*(1013.25/Pres_hPa)*(TempK/273.15)^1.81 // in m^2/s, from Massman, 1998
//
//
Return H2O_diffusivity_in_air
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////



eee I have indented and checked stuff to here



////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Make_Water_properties_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This sets up a panel to display volumetric, thermodynamic, and transport properties of liquid water.
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: water_properties_wave
//
// Calls: Do_Water_properties_info_button (when "i" hit) 
//
// Calls required previously: Set_defaults_for_property_panels() sets the default T and P
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function: water_properties_wave contains the values that will be displayed
//
//
/////////////////////////////////////
//	make Water properties panel
	KillWindow/Z Water_properties_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(840,75,1255,885) /N=Water_properties_panel as "Display water properties"
//
//
/////////////////////////////////////
//	set up title box
	TitleBox Water_properties_title title="\Z24Liquid Water Properties", pos={80, 5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Water properties info button
	Button Water_properties_info_button,pos={180,765},size={40,40},proc=Do_Water_properties_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
///////////////////////////////////
//	Group molal mass of water
	GroupBox Water_molal_mass_stuff pos={105, 50}, size={200, 30}, labelBack=(50000, 50000, 50000)
	DrawText 115, 75, "\Z14Molar mass/(g mol\S-1\M\Z14): 18.015"
//
//
/////////////////////////////////////
// Group calculated density values
	GroupBox Water_density_stuff pos={10,90}, size={190,105}, labelBack=(50000, 50000, 50000)
//
	DrawText 15,115, "\Z14density/(kg m\S-3\M\Z14)"
	ValDisplay water_density_kg_per_m3, pos={125,97.5}, size={50,20}, bodywidth=0, value=#"water_properties_wave[0]", fsize=12, format="%5.1f"
//
	DrawText 15,140, "\Z14density/(g cm\S-3\M\Z14)"
	ValDisplay water_density_g_per_cm3, pos={125,122.5}, size={50,20}, bodywidth=0, value=#"water_properties_wave[1]", fsize=12, format="%5.4f"
//
	DrawText 15,165, "\Z14density/(mol m\S-3\M\Z14)"
	ValDisplay water_density_mol_per_m3, pos={120,147.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[2]", fsize=12, format="%4.3f"
	DrawText 162.5,165, "\Z12×\Z1410\S4"
//
	DrawText 15,190, "\Z14v\Bmol\M\Z14/(m\S3\M\Z14 mol\S-1\M\Z14)"
	ValDisplay water_molal_volume, pos={120,172.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[3]", fsize=12, format="%4.2f"
	DrawText 162.5,190, "\Z12×\Z1410\S-6"
//
//
/////////////////////////////////////
// Group calculated water specific heat values
	GroupBox water_specific_heat_stuff pos={10,205}, size={190,170}, labelBack=(50000, 50000, 50000)
//
	DrawText 17.5,230, "\Z14C\BP\M\Z14/(J mol\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay water_Cp_Jpermol, pos={117.5,212.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[4]", fsize=12, format="%4.2f"
//
	DrawText 17.5,255, "\Z14C\BP\M\Z14/(J kg\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay water_Cp_Jperkg, pos={117.5,237.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[5]", fsize=12, format="%4.3f"
	DrawText 160,255, "\Z12×\Z1410\S3"
//
	DrawText 17.5,280, "\Z14C\BP\M\Z14/(erg g\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay water_Cp_ergperg, pos={117.5,262.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[6]", fsize=12, format="%4.3f"
	DrawText 160,280, "\Z12×\Z1410\S7"
// 
	DrawLine 30, 290, 165, 290
//
	DrawText 17.5,320, "\Z14C\BV\M\Z14/(J mol\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay water_Cv_Jpermol, pos={117.5,302.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[7]", fsize=12, format="%4.2f"
//
	DrawText 17.5,345, "\Z14C\BV\M\Z14/(J kg\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay water_Cv_Jperkg, pos={117.5,327.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[8]", fsize=12, format="%4.3f"
	DrawText 160,345, "\Z12×\Z1410\S3"
//
	DrawText 17.5,370, "\Z14C\BV\M\Z14/(erg g\S-1\M\Z14 K\S-1\M\Z14)"
	ValDisplay water_Cv_ergperg, pos={117.5,352.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[9]", fsize=12, format="%4.3f"
	DrawText 160,370, "\Z12×\Z1410\S7"
//
//
/////////////////////////////////////
// Group calculated water latent heat values
	GroupBox water_latent_heat_stuff pos={10,385}, size={190,80}, labelBack=(50000, 50000, 50000)
//
	DrawText 15,410, "\Z14lat heat/(J mol\S-1\M\Z14)"
	ValDisplay water_latent_heat_Jpermol, pos={122.5,392.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[10]", fsize=12, format="%4.2f"
	DrawText 160, 410, "\Z12×\Z1410\S4"
//
	DrawText 15,435, "\Z14lat heat/(J kg\S-1\M\Z14)"
	ValDisplay water_latent_heat_Jperkg, pos={122.5,417.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[11]", fsize=12, format="%4.2f"
	DrawText 160, 435, "\Z12×\Z1410\S6"
//
	DrawText 15,460, "\Z14lat heat/(erg g\S-1\M\Z14)"
	ValDisplay water_latent_heat_ergperg, pos={122.5,442.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[12]", fsize=12, format="%4.2f"
	DrawText 160, 460, "\Z12×\Z1410\S10"
//
//
/////////////////////////////////////
// Group surface tension
	GroupBox water_surface_tension pos={10,475}, size={190,55}, labelBack=(50000, 50000, 50000)
//
	DrawText 20, 500, "\Z14surf tens\Z14/(N m\S-1\M\Z14)"
	ValDisplay water_surf_tension, pos={135, 482.5}, size={50,20}, bodywidth=0, value=#"water_properties_wave[23]", fsize=12, format="%6.4f"
	DrawText 20, 525, "\Z14surf tens\Z14/(dyn cm\S-1\M\Z14)"
	ValDisplay water_surf_tension_dynpercm, pos={150, 507.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[24]", fsize=12, format="%4.1f"
//
//
/////////////////////////////////////
// Group vapor pressure
	GroupBox water_vapor_pressure pos={45, 540}, size={120,130}, labelBack=(50000, 50000, 50000)
	DrawText 55, 565, "\Z14Vapor pressure"
	DrawText 120, 587.5, "\Z14hPa"
	ValDisplay water_vapor_pressure_hPa, pos={65,570}, size={50,20}, bodywidth=0, value=#"water_properties_wave[25]", fsize=12, format="%4.2f"
	DrawText 120, 612.5, "\Z14atm"
	ValDisplay water_vapor_pressure_atm, pos={65,595}, size={50,20}, bodywidth=0, value=#"water_properties_wave[26]", fsize=12, format="%4.2f"
	DrawText 120, 637.5, "\Z14torr"
	ValDisplay water_vapor_pressure_torr, pos={65,620}, size={50,20}, bodywidth=0, value=#"water_properties_wave[27]", fsize=12, format="%4.2f"
	DrawText 55, 662.5, "\Z14dlnVP/dT"
	ValDisplay dln_water_vapor_pressure_torr, pos={115,645}, size={40,20}, bodywidth=0, value=#"water_properties_wave[28]", fsize=12, format="%4.3f"
//
//
/////////////////////////////////////
// Group calculated water viscosity values
	GroupBox water_viscosity_stuff pos={205,90}, size={200,195}, labelBack=(50000, 50000, 50000)
//
	DrawText 215,115, "\Z14Dynamic viscosity, \f02η\f00 (or \f02µ\f00)"
	DrawText 225,140, "\Z14\f02η\f00/(kg m\S-1\M\Z14 s\S-1\M\Z14)"
	DrawText 360,140, "\Z12×\Z1410\S-3"
	ValDisplay water_dynamic_viscosity, pos={320,122.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[14]", fsize=12, format="%5.3f"
	DrawText 225,165, "\Z14\f02η\f00/(g cm\S-1\M\Z14 s\S-1\M\Z14)"
	DrawText 360,165, "\Z12×\Z1410\S-2"
	ValDisplay water_dynamic_viscosity_cgs, pos={320,147.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[15]", fsize=12, format="%5.3f"
//
	DrawText 210,185, "\Z130.1 Pa s = 1 Poise = 1 g cm\S-1\M\Z13 s\S-1"
//
	DrawLine 225, 185, 385, 185
//
	DrawText 215,210, "\Z14Kinematic viscosity: \f02ν\f00 = \f02η\f00/\f02ρ\f00"
	DrawText 245,235, "\Z14\f02ν\f00/(m\S2\M\Z14 s\S-1\M\Z14)"
	DrawText 360,235, "\Z12×\Z1410\S-6"
	ValDisplay water_kinematic_viscosity, pos={320,217.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[16]", fsize=12, format="%5.3f"
	DrawText 245,260, "\Z14\f02ν\f00/(cm\S2\M\Z14 s\S-1\M\Z14)"
	DrawText 360,260, "\Z12×\Z1410\S-2"
	ValDisplay water_kinematic_viscosity_cgs, pos={320,242.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[17]", fsize=12, format="%5.3f"
//
	DrawText 210,280, "\Z1310\S-4\M\Z13 m\S2\M\Z13 s\S-1\M\Z13 = 1 Stokes = 1 cm\S2\M\Z13 s\S-1"
//
//
/////////////////////////////////////
// Group calculated water thermal conductivity/diffusivity values
	GroupBox water_thermal_diffusivity_stuff pos={205,295}, size={200,155}, labelBack=(50000, 50000, 50000)
//
	DrawText 215,315, "\Z14Thermal conductivity"
	DrawText 220,340, "\Z14\f02k\f00/(kg m s\S-3\M\Z14 K\S-1\M\Z14)"
	ValDisplay water_thermal_conductivity, pos={320, 322.5}, size={40,20}, bodywidth=0, value=#"water_properties_wave[18]", fsize=12, format="%3.3f"
	DrawText 220,365, "\Z14\f02k\f00/(g cm s\S-3\M\Z14 K\S-1\M\Z14)"
	DrawText 360,365, "\Z12×\Z1410\S4"
	ValDisplay water_thermal_conductivity_cgs, pos={325,347.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[19]", fsize=12, format="%3.2f"
//
	DrawLine 225, 370, 385, 370
//
	DrawText 210,395, "\Z14Thermal diffusivity \f02κ\f00 = \f02k\f00/(\f02ρ\f00C\Bp\M\Z14)"
	DrawText 235, 420, "\Z14\f02κ\f00/(m\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay water_thermal_diffusivity, pos={310,402.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[20]", fsize=12, format="%4.2f"
	DrawText 347.5, 420, "\Z12×\Z1410\S-7"
	DrawText 235, 445, "\Z14\f02κ\f00/(cm\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay water_thermal_diffusivity_cgs, pos={310,427.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[21]", fsize=12, format="%4.2f"
	DrawText 347.5, 445, "\Z12×\Z1410\S-3"
//
//
/////////////////////////////////////
// Group Prandtl number
	GroupBox water_Prandtl_number_value pos={205,460}, size={200,30}, labelBack=(50000, 50000, 50000)
	DrawText 210, 485, "\Z14Prandtl number Pr≡\f02ν\f00/\f02κ\f00"
	ValDisplay water_Prandtl_number, pos={362.5,467.5}, size={32.5,20}, bodywidth=0, value=#"water_properties_wave[22]", fsize=12, format="%3.1f"
//
//
/////////////////////////////////////
// Group speed of sound
	GroupBox water_speed_of_sound pos={235,500}, size={140,30}, labelBack=(50000, 50000, 50000)
	DrawText 245, 525, "\Z14c\Bsound\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay water_c_sound, pos={330, 507.5}, size={35,20}, bodywidth=0, value=#"water_properties_wave[13]", fsize=12, format="%4.0f"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////
Function Do_Water_properties_info_button(Water_properties_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-12-03
//
//
// Description: This calls Print_Water_properties_info which prints information on the Water properties panel
//		when the Do_Water_properties_button is hit in Make_Water_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Water_properties_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Water_properties_info
//
// Calls required previously: none
//
// Called by: Make_Water_properties_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Water_properties_info_Struct
//
//
	If (Water_properties_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Water_properties_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Water_properties_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2020-05-01
//
//
// Description: This prints information on water properties displayed in Make_Water_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Water_properties_info_button 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Water_properties_info_text	
//
//
	Water_properties_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Water_properties_info_text = Water_properties_info_text + "Water Properties Information\r"
	Water_properties_info_text = Water_properties_info_text + "-----------------------------\r\r"
//
	Water_properties_info_text = Water_properties_info_text + "This needs to be done eee\r"
	Water_properties_info_text = Water_properties_info_text + "Values presented here are valid for temperatures ~200 to ~400 K and pressures up to ~5 atm.\r\r"
//
	Water_properties_info_text = Water_properties_info_text + "The molar mass of water is\r\r"
//
	Water_properties_info_text = Water_properties_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Water_properties_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(675,75,1450,900)/N=Water_properties_info_notebook
	Notebook Water_properties_info_notebook, text=Water_properties_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_properties(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calls functions that calculate properties of liquid water to display in the Water properties panel.
// As most properties depend weakly on pressure, it is not an input in this situation.
// All values are in MKS units.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC 
//
// Quantities required for function: TempC
//
// Calls: Calculate_water_density, Calculate_water_Cp, Calculate_water_Cv, Calculate_water_latent_heat,
//		Calculate_water_c_sound, Calculate_water_dynamic_viscosity, Calculate_water_thermal_conductivity,
//		Calculate_water_surface_tension
//
// Calls required previously: none
//
// Called by: Calculate_all_stuff_for_properties_panels
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable water_molar_mass, water_density_kg_per_m3, water_density_g_per_cm3, water_density_mol_per_m3, water_molal_volume
	Variable water_Cp_J_per_mol_per_K, water_Cp_J_per_kg_per_K, water_Cp_erg_per_g_per_K
	Variable water_Cv_J_per_mol_per_K, water_Cv_J_per_kg_per_K, water_Cv_erg_per_g_per_K
	Variable water_latent_heat_J_per_kg, water_latent_heat_erg_per_g, water_latent_heat_J_per_mol
	Variable water_dynamic_viscosity, water_dynamic_viscosity_cgs, water_kinematic_viscosity, water_kinematic_viscosity_cgs
	Variable water_thermal_conductivity, water_thermal_conductivity_cgs, water_thermal_diffusivity, water_thermal_diffusivity_cgs
	Variable water_Prandtl_number
	Variable water_c_sound, water_surface_tension, water_surface_tension_dynpercm, water_vapor_pressure_hPa
//
//
	water_molar_mass = 0.018015 // kg/mol
//
//
///////////////////////Calculate water properties
	water_density_kg_per_m3=Calculate_water_density(TempC) // this is in kg/m^3
	water_density_g_per_cm3=water_density_kg_per_m3*1e-3
	water_density_mol_per_m3=water_density_kg_per_m3/water_molar_mass
	water_molal_volume=1/water_density_mol_per_m3
//
	water_Cp_J_per_kg_per_K=Calculate_water_Cp(TempC) // this is in J/kg/K
	water_Cp_erg_per_g_per_K=water_Cp_J_per_kg_per_K*1e4
	water_Cp_J_per_mol_per_K=water_Cp_J_per_kg_per_K*water_molar_mass // this is in J/mol/K
//
	water_Cv_J_per_kg_per_K=Calculate_water_Cv(TempC) // this is in J/kg/K
	water_Cv_erg_per_g_per_K=water_Cv_J_per_kg_per_K*1e4
	water_Cv_J_per_mol_per_K=water_Cv_J_per_kg_per_K*water_molar_mass // this is in J/mol/K
//
	water_latent_heat_J_per_kg=Calculate_water_latent_heat(TempC) // J/kg
	water_latent_heat_erg_per_g=water_latent_heat_J_per_kg*1e4
	water_latent_heat_J_per_mol=water_latent_heat_J_per_kg*water_molar_mass // J/mol
//
	water_c_sound=Calculate_water_c_sound(TempC) // in m/s
//
	water_dynamic_viscosity=Calculate_water_dynamic_viscosity(TempC) // this is in Pa s
	water_dynamic_viscosity_cgs=water_dynamic_viscosity*10
//
	water_kinematic_viscosity=water_dynamic_viscosity/water_density_kg_per_m3 // this is in m^2/s
	water_kinematic_viscosity_cgs=water_kinematic_viscosity*1e4
//
	water_thermal_conductivity=Calculate_water_thermal_conductivity(TempC) // this is in MKS
	water_thermal_conductivity_cgs=water_thermal_conductivity*1e5
//
	water_thermal_diffusivity=water_thermal_conductivity/water_density_mol_per_m3/water_Cp_J_per_mol_per_K
	water_thermal_diffusivity_cgs=water_thermal_diffusivity*1e4
//
	water_Prandtl_number=water_kinematic_viscosity_cgs/water_thermal_diffusivity_cgs
//
	water_surface_tension=Calculate_water_surface_tension(TempC) // in N/m
	water_surface_tension_dynpercm=water_surface_tension*1e3
//
	//water_vapor_pressure_hPa=Calculate_water_vapor_pressure(TempC) // in hPa
//
//
//////////////////////////////// make wave of water properties for Water_properties_panel
	Make/O/D/N=30 water_properties_wave
	water_properties_wave[0]=water_density_kg_per_m3
	water_properties_wave[1]=water_density_g_per_cm3
	water_properties_wave[2]=water_density_mol_per_m3*1e-4 // the 1e-4 is because of how it is displayed
//
	water_properties_wave[3]=water_molal_volume*1e6 // the 1e6 is because of how it is displayed
//
	water_properties_wave[4]=water_Cp_J_per_mol_per_K
	water_properties_wave[5]=water_Cp_J_per_kg_per_K*1e-3 // the 1e-3 is because of how it is displayed
	water_properties_wave[6]=water_Cp_erg_per_g_per_K*1e-7 // the 1e-7 is because of how it is displayed
//
	water_properties_wave[7]=water_Cv_J_per_mol_per_K
	water_properties_wave[8]=water_Cv_J_per_kg_per_K*1e-3 // the 1e-3 is because of how it is displayed
	water_properties_wave[9]=water_Cv_erg_per_g_per_K*1e-7 // the 1e-7 is because of how it is displayed
//
	water_properties_wave[10]=water_latent_heat_J_per_mol*1e-4 // the 1e-3 is because of how it is displayed
	water_properties_wave[11]=water_latent_heat_J_per_kg*1e-6 // the 1e-6 is because of how it is displayed
	water_properties_wave[12]=water_latent_heat_erg_per_g*1e-10 // the 1e-9 is because of how it is displayed
//
	water_properties_wave[13]=water_c_sound
//
	water_properties_wave[14]=water_dynamic_viscosity*1e3 // the 1e3 is because of how it is displayed
	water_properties_wave[15]=water_dynamic_viscosity_cgs*1e2 // the 1e3 is because of how it is displayed
//
	water_properties_wave[16]=water_kinematic_viscosity*1e6 // the 1e6 is because of how it is displayed
	water_properties_wave[17]=water_kinematic_viscosity_cgs*1e2 // the 1e3 is because of how it is displayed
//
	water_properties_wave[18]=water_thermal_conductivity
	water_properties_wave[19]=water_thermal_conductivity_cgs*1e-4 // the 1e-4 is because of how it is displayed
//
	water_properties_wave[20]=water_thermal_diffusivity*1e7 // the 1e6 is because of how it is displayed
	water_properties_wave[21]=water_thermal_diffusivity_cgs*1e3 // the 1e3 is because of how it is displayed
//
	water_properties_wave[22]=water_Prandtl_number
//
	water_properties_wave[23]=water_surface_tension
	water_properties_wave[24]=water_surface_tension_dynpercm
//
	water_properties_wave[25]=water_vapor_pressure_hPa
	water_properties_wave[26]=water_properties_wave[25] / 1013.25
	water_properties_wave[27]=water_properties_wave[25] * 760
	//water_properties_wave[28]=
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_density(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-05-23
//
//
// Description: This calculates the density of water on the vapor-liquid phase boundary in kg/m^3 
//		from Eq. 2.6 on p. 399 of Wagner, W., and A. Pruß (1993), International Equations 
//		for the saturation properties of ordinary water substance. Revised according to the 
//		International Temperature Scale of 1990. Addendum to J. Phys. Chem. Ref. Data 16, 
//		683, (1987), J. Phys. Chem. Ref. Data, 22, 783-787.
// It is valid from the triple point, 273.16 K, to the critical point, 647.096 K,
//		or equivalently, from TempC = 0.01 C to 373.946 C; temperatures are on ITS-90.
// eee need to check this
// eee Water triple point: Guildner et al., J. Res. NBS, v80A, 1976: VPtrip = 611.657 Pa
//		eee Ttrip=273.16; definition; see Stimson, H. F., J. Res. NBS v42 1949, p. 209 and Stimson, H. F., Amer. J. Phys., v23, 1955, p. 614.

//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_density_kg_per_m3
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable tau=1-TempK/647.096 // 647.096 K is Temp_crit
	Variable water_density_kg_per_m3
//
//
// eq. 2.6 on p. 399 of Wagner and Pruß (2002)
// !!!!! but this is for saturated liquid / eee
	water_density_kg_per_m3=322*(1 + 1.99274064*tau^(1/3) + 1.09965342*tau^(2/3) - 0.510839303*tau^(5/3) - 1.75493479*tau^(16/3) - 45.5170352*tau^(43/3) - 6.74694450e5*tau^(110/3))
//
//
Return water_density_kg_per_m3
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////



eee
at 0. 1MPa

from Lin, C.-W., and J. P. M. Trusler (2012), The speed of sound and derived thermodynamic properties of pure water
	at temperatures between (253 and 473) K and pressures up to 400 MPa, J. Chem. Phys., 136, 094511.
 
 
TKby300=TempK/300
speed_of_sound = -2.865737e2/TKby300^4 + 6.741434e2/TKby300 + 1.475934e3*TKby300 - 5.363834e2*TKby300^4 + 2.580254e2*TKby300^6 - 8.392639e1*TKby300^7
rho_water = -5.313576e3/TKby300^3 + 2.656543e4/TKby300^2 - 5.582386e4/TKby300 + 6.377655e4 - 3.959303e4*TKby300 + 1.327844e4*TKby300^2 - 1.893405e3*TKby300^3

cp_water=2.823085e2/TKby300^3 - 1.423382e3/TKby300^2 + 2.978876e3/TKby300 -3.308114e3 + 2.064563e3*TKby300 - 6.846225e2*TKby300^2 + 9.455246e1*TKby300^3
that was eq. 15 in Lin and Trusler
It agrees with my fit to Wagner and Pruss to within 0.05 % for temperatures from 0 to 100 °C, and is up to 1.3% higher at -20 °C
include effect of air saturation on density












//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_Cp(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-03-18
//
//
// Description: This calculates the specific heat of water at constant pressure in J/kg/K based on fits to data 
//		in Table 13.2 on pp. 497-498 for 0.101325 MPa from Wagner, W., and A. Pruss (2002), The IAPWS 
//		formulation 1995 for the thermodynamic properties of ordinary water substance for general and 
//		scientific use, J. Phys. Chem. Ref. Data, v. 31, 387-535.
// The estimated accuracy (stated in abstract) ~0.1%, which is ~4 J/kg/K.
// The pressure dependence is incredibly weak (<0.5 J/kg/K per atm).
//
// TempK={273.153, 275, 280, 285, 290, 295, 300, 305, 310, 315, 320, 325, 330, 335, 340, 345, 350, 355, 360, 365, 370}
// Cp_1atm=1000*{4.2194, 4.2135, 4.2009, 4.1924, 4.1866, 4.1829, 4.1806, 4.1795, 4.1792, 4.1796, 4.1805, 4.1819, 4.1837, 4.1858, 4.1883, 4.1912, 4.1945, 4.1982, 4.2023, 4.2070, 4.2121}
//
// Cp_1atm does not differ from 4200 J/kg/K by more than 0.5 % (21 J/kg/K) over this temperature range.
//
// My fits from Igor (in J/kg/K):
// cubic fit of CP_1atm=1000*(4.2164-0.00222*TempC+3.8e-5*TempC^2-1.6e-7*TempC^3) // agrees to within 3 J/kg/K
// quartic fit of Cp_1atm=1000*(4.2186-0.00293*TempC+7.363e-5*TempC^2-7.51e-7*TempC^3+3.06e-9*TempC^4)// agrees to within 1 J/kg/K
// quintic fit of CP_fit_1atm=1000*(4.2192-0.003244*TC+9.9187e-5*TC^2-1.4836e-6*TC^3+1.1691e-8*TC^4-3.5709e-11*TC^5) // agrees to within 0.25 J/kg/K
// My fits are valid from 0-100 °C.


// Fits of Kell (from Chen, JChemEngData, v32, 1987), Kell (Eq. 17 in JChemEngData, v20, 1975), 
//		Clarke and Glew (Eq. 56 in JPhysChemRefData, v14, 1985), and Hershey et al. (JSolChem, v13, 1984, up to 45 °C)
//		are up to 3 J/kg/K lower, especially at temperatures from ~0-40 °C.

//from Table 3 of Archer, D. G., and R. W. Carter, Thermodynamic Properties of the NaCl + H2O System. 4. Heat Capacities of H2O and NaCl(aq) in Cold-Stable and Supercooled States, J. Phys Chem B., 104:8563-8584, 2000.
// make/n=13 TK, Cp
// TK={236, 238, 240, 242, 245, 250, 255, 260, 265, 270, 275, 280, 285}
// Cp={5391, 5155, 4948, 4781, 4621, 4430, 4330, 4277, 4249, 4222, 4208, 4200, 4193}
// Display Cp vs TK
// from 270 to 285, Cp=4214-1.9*TC
// from 275 to 285, Cp=4211-1.5*TC
// eee need to check this
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_CP_J_per_kg_per_K
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable water_Cp_J_per_kg_per_K
//
//
// my fit to Wagner and Pruss (2002)
	water_Cp_J_per_kg_per_K=1000*(4.2192-0.003244*TempC+9.9187e-5*TempC^2-1.4836e-6*TempC^3+1.1691e-8*TempC^4-3.5709e-11*TempC^5)
//
//
Return water_Cp_J_per_kg_per_K
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_Cv(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-03-18
//
//
// Description: This calculates the specific heat of water at constant volume in J/kg/K based on fits to data 
//		in Table 13.2 on pp. 497-498 for 0.101325 MPa of Wagner, W., and A. Pruß (2002), The IAPWS
//		formulation 1995 for the thermodynamic properties of ordinary water substance for general and
//		 scientific use, J. Phys. Chem. Ref. Data, v. 31, 387-535.
// The estimated accuracy (stated in abstract) ~0.1%, which is ~4 J/kg/K
// The pressure dependence is incredibly weak (<0.5 J/kg/K per atm).
//
// TempK={273.153, 275, 280, 285, 290, 295, 300, 305, 310, 315, 320, 325, 330, 335, 340, 345, 350, 355, 360, 365, 370}
// Cv_1atm=1000*{4.2170, 4.2128, 4.1998, 4.1848, 4.1680, 4.1498, 4.1302, 4.1094, 4.0876, 4.0649, 4.0414, 4.0171, 3.9923, 3.9671, 3.9414, 3.9155, 3.8894, 3.8631, 3.8369, 3.8107, 3.7845}
//
// The approximation (4235-4.5*TempC) J/kg/K agrees to within 0.5 % (21 J/kg/K) over this temperature range.
//
// my fits from Igor (in J/kg/K):
// quadratic fit of Cv_1atm: Cv_fit2=1000*(4.222-0.0032*TempC - 1.43e-5*TempC^2) // agrees to within 5 J/kg/K
// cubic fit of Cv_1atm: Cv_fit3=1000*(4.2175-0.00239*TempC-3.6e-5*TempC^2-1.5e-7*TempC^3) // agrees to within 0.6 J/kg/K
// quartic fit of Cv_1atm: Cv_fit4=1000*(4.2171-0.0022683*TC-4.2492e-5*TC^2+2.5574e-7*TC^3-5.3113e-10*TC^4)// agrees to within 0.15 J/kg/K
// My fits are valid from 0-100 °C.
// eee need to check this
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_CP_J_per_kg_per_K
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable water_Cv_J_per_kg_per_K
//
//
// my fit to Wagner and Pruß (2002)
	water_Cv_J_per_kg_per_K=1000*(4.2171-0.0022683*TempC-4.2492e-5*TempC^2+2.5574e-7*TempC^3-5.3113e-10*TempC^4)
//
//
Return water_Cv_J_per_kg_per_K
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_latent_heat(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-03-18
//
//
// Description: This calculates the latent heat of water in J/kg.
// eee need to DO this
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_latent_heat_J_per_kg
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable water_latent_heat_J_per_kg
//
//
	water_latent_heat_J_per_kg=(2.5-0.0023*TempC)*1e6 // eee need to do this
//
//
Return water_latent_heat_J_per_kg
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_c_sound(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-03-18
//
//
// Description: This calculates the speed of sound in water in m/s based on a fit to data for 0.101325 MPa 
//		in Table 13.2 on pp. 497-498 of Wagner, W., and A. Pruß (2002), The IAPWS formulation 
//		1995 for the thermodynamic properties of ordinary water substance for general and 
//		scientific use, J. Phys. Chem. Ref. Data, v. 31, 387-535.
// The estimated accuracy (stated in abstract) ~0.03%, which is ~0.4 m/s
// The pressure dependence is incredibly weak (<0.25 m/s per atm).
//
// TempC={273.153, 275, 280, 285, 290, 295, 300, 305, 310, 315, 320, 325, 330, 335, 340, 345, 350, 355, 360, 365, 370}
// u_sound_1atm={1402.4, 1411.5, 1434.3, 1454.4, 1472.3, 1487.9, 1501.5, 1513.3, 1523.4, 1531.9, 1538.9, 1544.5, 1548.9, 1552.0, 1554.0, 1555.0, 1554.9, 1554.0, 1552.1, 1549.3, 1545.8}
//
// my fits from Igor:
// quadratic fit=1407.3+4.1548*TempC-0.028637*TempC^2 // agrees to within 5 m/s
// cubic fit=1402.9+4.8507*TempC-0.047635*TempC^2+0.00013258*TempC^3 // agrees to wtihin 0.5 m/s
// quartic fit=1402.45+5.0056*TempC-0.05549*TempC^2+0.00026237*TempC^3-6.7454e-7*TempC^4 agrees to within 0.08 m/s
// eee need to check this
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_c_sound
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable water_c_sound
//
//
// my fit to Wagner and Pruß (2002)
	water_c_sound=1402.45+5.0056*TempC-0.05549*TempC^2+0.00026237*TempC^3-6.7454e-7*TempC^4 // m/s
//
//
Return water_c_sound
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_dynamic_viscosity(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-02-28
//
//
// Description: This calculates the dynamic viscosity of water.
// Eq. 7 in Pátek, J., J. Hrubý, J. Klomfar, M. Součková, and A. H. Harvey (2009), “Reference correlations for thermophysical properties of liquid water at 0.1 MPa,” J. Phys. Chem. Ref. Data, 38, 21-29.
// it is also Eq. 37 in Huber, M. L. et al., New International Formulation for the Viscosity of H2O, J. Phys. Chem. Ref. Data, v38, 101-125, 2009
// It is the the International Association for the Properties of Water and Steam (IAPWS) Formulation 2008 for the Viscosity of Ordinary Water Substance.
// It is valid for 253.15 < KTK < 383.15, with an uncertainty of 1% for stable region (2-sigma).
// eee need to check this
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_latent_heat_J_per_kg
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable water_dynamic_viscosity
//
//
	water_dynamic_viscosity=1e-6*(280.68*(TempK/300)^(-1.9)+ 511.45*(TempK/300)^(-7.7) + 61.131*(TempK/300)^(-19.6) + 0.45903*(TempK/300)^(-40.0)) // in Pa s
//
//
Return water_dynamic_viscosity
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_thermal_conductivity(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-02-28
//
//
// Description: This calculates the thermal conductivity of water.
// This is Eq. 21 (and Table 4) of Huber, M. L. et al., New international formulation for the thermal conductivity of H2O, J. Phys. Chem. Ref. Data, 41, 1-23, 2012
// It is valid for 273.15 to 383.15 K at 0.1 MPa, with an uncertainty (2-sigma) of 1.5%
// It is the IAPWS 2011 formulation for thermal conductivity of water at 0.1 MPa
// They state that it "extrapolates in a physically reasonable manner down to 253.15 K", and that it "replaces" Patek et al., 2009
// Eq. 9 of Patek, 2009: thermal_cond_Patek=0.80201*(TK/300)^(-0.32) - 0.25992*(TK/300)^(-5.7) + 0.10024*(TK/300)^(-12) - 0.032005*(TK/300)^(-15)
// The expression therm_cond=0.554*(1+(TempC/200 - (TempC/250)^2) agrees with Huber to within 0.5 % between -20 °C and 50 °C
// over the range 273.15 to 283.15, Patek is a bit higher: 1 % a5 TK=273.15, and generally < 0.5 % for the rest of the range
// over the range 253.15 to 273.15, Patek is up to 7 % higher
//
// Ramires, et al., Standard reference data for the thermal conductivity of water, J. Phys. Chem. Ref. Data, 24, 1377-1381, 1995
// Ramirez, Eq. 4, W/m/K, estimated accuracy 0.7% at 2-sigma, valid along the saturation line
// thermal_cond_ramires = 0.6065*(-1.48445+4.12292*(TK/298.15) - 1.63866*(TK/298.15)^2)
// Ramirez agrees with Huber to within 0.7 % (and generally much less) between TK=273.15 to 373.15 K
// this is the same as 0.5564*(1+tempC/244 - (TempC/223)^2))
// eee need to check this
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_thermal_conductivity
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable water_thermal_conductivity
//
//
	water_thermal_conductivity=1.6630*(TempK/300)^(-1.15)-1.7781*(TempK/300)^(-3.4)+1.1567*(TempK/300)^(-6.0)-0.432115*(TempK/300)^(-7.6) // in W/m/K
//
//
Return water_thermal_conductivity
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_water_surface_tension(TempC)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2019-02-28
//
//
// Description: This calculates the surface tension of water based on Eq. 5 on p. 931 and Table 3 on 
//		p. 933 of Patek, J., M. Souckova, and J. Klomfar (2016), Generation of recommendable 
//		values for the surface tension of water using a nonparametric regression, J. Chem. 
//		Eng. Data, 61, 928−935, which has a stated range of applicability of 248 K to the 
//		critical temperature of water, 647.096 K, with a “worst-case error level”
// 		estimated at 0.0001 N m^(-1).
// The expression 0.007565-0.000163*TempC agrees with this to within 1 %, or 0.0007 N m^(-1)
//		for temperatures from -25 to 100 °C.
// The formulations proposed by Mulero, A., I. Cachadina, and M. I. Parra (2012), 
//		Recommended correlations for the surface tension of common fluids, J. Phys. Chem. 
//		Ref. Data, 41, 043105, 1-13 and Vargaftik, N. B., B. N. Volkov, and L. D. Voljak 
//		(1983), International tables of the surface tension of water, J. Phys. Chem. Ref. 
//		Data, 12, 817-820 agree with the results of Patek et al. to within 0.2 %, or
//		1.4 N m^(-1) over the temperature range -25 to 100 °C.
// eee need to check this
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: TempC is the temperature
//
// Quantities required for function: TempC
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Calculate_water_properties
//
// Return: water_surface_tension
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//////////// Declare variables in call statement
	Variable TempC
//
//
//////////// Declare other variables and waves
	Variable TempK=273.15+TempC
	Variable water_surface_tension
//
//
	water_surface_tension=233.58e-3*(1-TempK/647.096)^1.2527*(1-0.61594*(1-TempK/647.096)) // in N/m
//
//
// myfit=75.635*(1-0.00185*TempC-3.62e-6*Temp^2) // = 75.635*(1-TempC/540-(TempC/526)^2)
// between -25 and 100 °C, this is good to within 0.025 %, and to within 0.02
//eee discuss the previous one that is typically used
//
//
Return water_surface_tension
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Particle_properties_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This creates a panel that displays dynamical properties of a particle.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: particle_properties_wave
//
// Calls: Do_particle_properties_info_button (when "i" hit)
//
// Calls required previously: Set_defaults_for_property_panels() sets the default T and P, D, and rho
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function: particle_properties_wave contains values that will be displayed
//
//
// eeee I need to document this more

//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	NVAR Dp_input, rho_input
//
//
/////////////////////////////////////
//	make input Dp panel
	KillWindow/Z Particle_properties_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(240,100,460,805) /N=Particle_properties_panel as "Particle Properties"
//
//
/////////////////////////////////////
//	set up title box
	TitleBox Input_Dp_title title="\Z22Particle Properties", pos={20, 5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Dp info button
	Button Dp_info_button,pos={90,655},size={40,40},proc=Do_Particle_properties_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// Graph some quantities
	Button Graph_some_particle_properties_button,pos={30, 620}, size={160, 25}, proc=Do_Graph_some_particle_properties_button, title="\Z14Graph some properties",fcolor=(0, 65535, 0)
//
//
/////////////////////////////////////
// group Dp input box
	GroupBox Group_Dp_input pos={45, 52.5}, size={130, 30}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up input diameter box
	DrawText 55,77.5, "\Z14D\Bp\M\Z14/nm"
	SetVariable Dp_input, pos={100,57.5}, size={70,25}, bodyWidth=0, title=" ", fsize=14, format="%6.1f"
	SetVariable Dp_input, value=Dp_input, limits={1,10000,1}, proc=Update_for_Particle_properties_panel
//
//
/////////////////////////////////////
// Group calculated values
	GroupBox Cunningham_stuff pos={10,85}, size={200,275}, labelBack=(50000, 50000, 50000)
//
//
	DrawText 65,110, "\Z14Kn"
	ValDisplay Dp_Knudsen, pos={95,92.5}, size={50,20}, bodywidth=0, value=#"Particle_properties_wave[1]", fsize=12, format="%6.2f"
//
	DrawText 55,135, "\Z14Cunn"
	ValDisplay Dp_Cunningham, pos={95,117.5}, size={50,20}, bodywidth=0, value=#"Particle_properties_wave[2]", fsize=12, format="%6.2f"
//
	DrawText 35,160, "\Z14(D\Bp\M\Z14/nm)/Cunn"
	ValDisplay Dp_by_Cunningham, pos={130,142.5}, size={50,20}, bodywidth=0, value=#"Particle_properties_wave[3]", fsize=12, format="%4.3g"
//
	DrawText 25,185, "\Z14(D\Bp\M\Z14/nm)\S2\M\Z14×Cunn"
	ValDisplay Dp_sqrd_times_Cunningham, pos={130,167.5}, size={65,20}, bodywidth=0, value=#"Particle_properties_wave[4]", fsize=12, format="%4.3g"
//
	DrawText 25,210, "\Z14Friction/(kg s\S-1\M\Z14)"
	ValDisplay Dp_friction, pos={135,195.5}, size={60,20}, bodywidth=0, value=#"Particle_properties_wave[5]", fsize=12, format="%3.2e"
//
	DrawText 15,235, "\Z14Diffusivity/(m\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay Dp_diffusivity, pos={135,217.5}, size={60,20}, bodywidth=0, value=#"Particle_properties_wave[6]", fsize=12, format="%3.2e"
//
	DrawText 15,260, "\Z14Diffusivity/(cm\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay Dp_diffusivity_cgs, pos={135,242.5}, size={60,20}, bodywidth=0, value=#"Particle_properties_wave[7]", fsize=12, format="%3.2e"
//
	DrawText 25,285, "\Z14Mobility/(s kg\S-1\M\Z14)"
	ValDisplay Dp_mobility, pos={130,267.5}, size={65,20}, bodywidth=0, value=#"Particle_properties_wave[8]", fsize=12, format="%3.2e"
//
	DrawText 15,310, "\Z14Electrical mobility"
	DrawText 50,330, "\Z14/(C s kg\S-1\M\Z14)"
	ValDisplay Dp_Electrial_mobility_1, pos={135,312.5}, size={60,20}, bodywidth=0, value=#"Particle_properties_wave[9]", fsize=12, format="%3.2e"
//
	DrawText 50, 355, "\Z14/(cm\S2\M\Z14 V\S-1\M\Z14 s\S-1\M\Z14)"
	ValDisplay Dp_Electrial_mobility_2, pos={135,337.5}, size={60,20}, bodywidth=0, value=#"Particle_properties_wave[10]", fsize=12, format="%3.2e"
//
//
/////////////////////////////////////
	DrawLine 25, 370, 195, 370
//
//
/////////////////////////////////////
// group rho input box
	GroupBox Group_rho_input pos={40, 377.5}, size={140, 25}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up input density box
	DrawText 45,400, "\Z14\f02ρ\f00/(g cm\S-1\M)"
	SetVariable rho_input, pos={115,380}, size={55,20}, bodyWidth=0, title=" ", fsize=14, format="%4.2f"
	SetVariable rho_input, value=rho_input, limits={0.001,10,0.05}, proc=Update_for_Particle_properties_panel
//
//
/////////////////////////////////////
// Group calculated values
	GroupBox Dp_speed_stuff pos={30,405}, size={160,210}, labelBack=(50000, 50000, 50000)
//
//
	DrawText 45,430, "\Z14mass/fg"
	ValDisplay Dp_mass, pos={115,412.5}, size={65,20}, bodywidth=0, value=#"Particle_properties_wave[11]", fsize=12, format="%3.2e"
//
	DrawText 40,455, "\Z14\f02d\f00\Baero\M\Z14/nm"
	ValDisplay D_aero, pos={115,437.5}, size={45,20}, bodywidth=0, value=#"Particle_properties_wave[12]", fsize=12, format="%5.1f"
//
	DrawText 40,480, "\Z14\f02c\f00\Brms\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay Dp_c_rms, pos={115,462.5}, size={65,20}, bodywidth=0, value=#"Particle_properties_wave[13]", fsize=12, format="%3.2e"
//
	DrawText 35,505, "\Z14< \f02c\f00 >\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay Dp_c_bar, pos={115,487.5}, size={65,20}, bodywidth=0, value=#"Particle_properties_wave[14]", fsize=12, format="%3.2e"
//
	DrawText 40,530, "\Z14\f02c\f00\BStk\M\Z14/(µm s\S-1\M\Z14)"
	ValDisplay Dp_c_Stokes, pos={115,512.5}, size={65,20}, bodywidth=0, value=#"Particle_properties_wave[15]", fsize=12, format="%3.2e"
//
	DrawText 60,555, "\Z14\f02τ\f00\BStk\M\Z14/ns"
	ValDisplay Dp_tau_Stokes, pos={115,537.5}, size={65,20}, bodywidth=0, value=#"Particle_properties_wave[16]", fsize=12, format="%3.2e"
//
	DrawText 70,580, "\Z14\f02λ\f00\Bp\M\Z14/nm"
	ValDisplay Dp_lambda, pos={115,562.5}, size={45,20}, bodywidth=0, value=#"Particle_properties_wave[17]", fsize=12, format="%4.2f"
//
	DrawText 70,605, "\Z14\f02g\f00/nm"
	ValDisplay Dp_g, pos={115,587.5}, size={45,20}, bodywidth=0, value=#"Particle_properties_wave[18]", fsize=12, format="%4.2f"
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Particle_properties_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:



// This provides the control for SetVariables in Particle_properties_panel by updating everything
//		shown in that panel whenever Dp or rho is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: Dp_input, rho_input
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Particle_properties_panel only (when a SetVariable is changed)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		Calculate_all_stuff_for_properties_panels()
	ENDIF
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Particle_properties_info_button(Particle_properties_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-06-01
//
//
// Description: This calls Print_Particle_properties_info which prints information on the Particle properties panel
//		when the Do_Particle_properties_button is hit in Make_Particle_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Particle_properties_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Particle_properties_info
//
// Calls required previously: none
//
// Called by: Make_Particle_properties_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Particle_properties_info_Struct
//
//
	If (Particle_properties_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Particle_properties_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Graph_some_particle_properties_button(Graph_some_particle_properties_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2024-09-01
//
//
// Description: This calls Graph_Stokes_relaxation_time and Graph_particle_lambda_g, which graph 
//		Stokes relaxation times (for different diameters and different pressures) and
//		the quantities g and lambda_p, used by Fuchs for coagulation calculations,
//		when the Do_Graph_some_particle_properties_button is hit in Make_Particle_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Graph_some_particle_properties - the structure for this button control
//
// Quantities required for function: none
//
// Calls: eeePrint_Particle_properties_info
//
// Calls required previously: none
//
// Called by: Make_Particle_properties_panel (when "Graph some properties" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Graph_some_particle_properties_Struct
//
//
	If (Graph_some_particle_properties_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Graph_Stokes_relaxation_time()
		Graph_particle_lambda_g()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Print_Particle_properties_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2020-06-01
//
//
// Description: This prints information on particle properties displayed in Make_Particle_properties_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Particle_properties_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Particle_properties_info_text	
//
//
	Particle_properties_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Particle_properties_info_text = Particle_properties_info_text + "Particle Properties Information\r"
	Particle_properties_info_text = Particle_properties_info_text + "-------------------------------\r\r"
//
	Particle_properties_info_text = Particle_properties_info_text + "Values assume a spherical particle at the selected temperature and pressure.\r\r"
//
	Particle_properties_info_text = Particle_properties_info_text + "The Knudsen number is equal to 2×λ_air/D, where λ_air is the mean free path for air.\r"
	Particle_properties_info_text = Particle_properties_info_text + "The Cunningham correction, C=1+Kn[1.165+0.483exp(-0.997/Kn)], is from Kim et al., 2005, J. Res. NIST, 110, 31-54.\r\r"
//
	Particle_properties_info_text = Particle_properties_info_text + "The friction is 3πDµ/C, where µ is the dynamic viscosity of air.\r"
	Particle_properties_info_text = Particle_properties_info_text + "The diffusivity is kT/friction = 3πDµ/C, where k is the Boltzmann constant, 1.380649e-23 J/K.\r"
	Particle_properties_info_text = Particle_properties_info_text + "The mobility is 1/friction = C/(3πDµ).\r"
	Particle_properties_info_text = Particle_properties_info_text + "The electrical mobility is e × mobility = eC/(3πDµ), where e is the electron charge, 1.602176634e-19 C.\r\r"
//
	Particle_properties_info_text = Particle_properties_info_text + "The rms speed is sqrt(3kT/mass), and the mean speed, <c>, is sqrt[(8/π)(kT/mass)].\r"
	Particle_properties_info_text = Particle_properties_info_text + "The Stokes' speed is ρ×grav×D^2×C/(18µ) = mass×grav×C/(3µ), where grav is the acceleration due to gravity.\r"
	Particle_properties_info_text = Particle_properties_info_text + "The Stokes' relaxation time is ρ×D^2×C/(18µ) = mass×C/(3πµD).\r\r"
//
	Particle_properties_info_text = Particle_properties_info_text + "The quantities λ_p (the particle mean free path) and g, used for coagulation calculations, are from Fuchs,\r"	
	Particle_properties_info_text = Particle_properties_info_text + "   Mechanics of Aerosols, 1964, pp. 182-183;\r"
	Particle_properties_info_text = Particle_properties_info_text + "   λ_p=(8/π)×diffusivity/<c> and g=[(D+λ_p)^3-(D^2+λ_p^2)^(3/2)]/(3Dλ_p)-D.\r\r"
//
	Particle_properties_info_text = Particle_properties_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Particle_properties_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(475,75,1300,475)/N=Particle_properties_info_notebook
	Notebook Particle_properties_info_notebook, text=Particle_properties_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_particle_properties(DDpp, rho_p, TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
//
// Explanation of call parameters: 
//
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:




// this calculates properties of a particle with diameter DDpp to display in the panel
//// This calculates properties of the behavior in air of a spherical particle with a given diameter,
//	including the Knudsen number, Cunningham correction, friction, diffusivity, and electrical mobility. 

//
//////////// declare variables in call statement
	Variable DDpp, rho_p, TempC, Pres_hPa
// DDpp in nm; I named it DDpp as Dp is possibly taken and I didn't want confusion
// rho_p is entered in g/cm^3; it must be multiplied by 1000 to be in kg/m^3
//
//
/////////////// declare other variables needed
	Variable air_mean_free_path_nm, air_dynamic_viscosity, k_Boltzmann, e_charge, g_little, TempK
	Variable particle_Kn, particle_Cunn, particle_diffusivity, particle_friction, particle_mobility, particle_electrical_mobility
	Variable particle_mass, particle_D_aero, particle_c_rms, particle_c_bar, particle_c_Stokes, particle_tau_Stokes
	Variable particle_lambda, particle_g
//
//
	k_Boltzmann=1.380649e-23 // J/K
	e_charge=1.602176634e-19 // C
	g_little=9.80665 // m/s^2
	TempK=TempC+273.15
//
//
	air_mean_free_path_nm=Calculate_air_mean_free_path(TempC, Pres_hPa) // in nm
	particle_Kn=2*air_mean_free_path_nm/DDpp // DDpp is in nm
	particle_Cunn=1+particle_Kn*(1.165+0.483*exp(-0.997/particle_Kn)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
	air_dynamic_viscosity=Calculate_air_dynamic_viscosity(TempC, Pres_hPa) // kg/m/s
	particle_friction=3*Pi*(DDpp*1e-9)*air_dynamic_viscosity/particle_Cunn // kg/s //
	particle_diffusivity=k_Boltzmann*TempK/particle_friction // m^2/s
	particle_mobility=1/particle_friction // s/kg
	particle_electrical_mobility=e_charge*particle_mobility // C s/kg
	particle_mass=Pi/6*(rho_p*1e3)*(DDpp*1e-9)^3 // kg
	particle_D_aero=Calculate_aerodynamic_diameter(DDpp, rho_p, TempC, Pres_hPa)	
	particle_c_rms=sqrt(3*k_Boltzmann*TempK/particle_mass) // m/s
	particle_c_bar=sqrt(8/Pi*k_Boltzmann*TempK/particle_mass) // m/s
	particle_c_Stokes=(rho_p*1e3)*g_little*(DDpp*1e-9)^2*particle_Cunn/18/air_dynamic_viscosity // m/s
	particle_tau_Stokes=(rho_p*1e3)*(DDpp*1e-9)^2*particle_Cunn/18/air_dynamic_viscosity // s; = particle_c_Stokes / g_little
	particle_lambda=8/Pi*particle_diffusivity/particle_c_bar // m, from Fuchs, pp.182-183
	particle_g=1/3/(DDpp*1e-9)/particle_lambda*(((DDpp*1e-9)+particle_lambda)^3-((DDpp*1e-9)^2+particle_lambda^2)^1.5)-(DDpp*1e-9) // m
//
//
// The values for particle_diffusivity, particle_c_bar, particle_tau_Stokes, and particle_lambda agree
//		well with those in Table 13 on p. 184 of Fuchs (1964), The Mechanics of Aerosols.
//
//
// make Particle_properties_wave
	Make/O/D/N=19 Particle_properties_wave
//
	Particle_properties_wave[0]=DDpp //nm
	Particle_properties_wave[1]=Particle_Kn // dimensionless
	Particle_properties_wave[2]=Particle_Cunn // dimensionless
	Particle_properties_wave[3]=DDpp/Particle_Cunn
	Particle_properties_wave[4]=DDpp^2*Particle_Cunn
//
	Particle_properties_wave[5]=Particle_friction // kg/s 
	Particle_properties_wave[6]=Particle_diffusivity // m^2/s
	Particle_properties_wave[7]=Particle_diffusivity*1e4 // cm^2/s	
	Particle_properties_wave[8]=Particle_mobility // s/kg 
	Particle_properties_wave[9]=Particle_electrical_mobility // C s/kg
	Particle_properties_wave[10]=Particle_electrical_mobility*1e4 // cm^2/V/s
//	
	Particle_properties_wave[11]=Particle_mass*1e18 // fg
	Particle_properties_wave[12]=Particle_D_aero // nm
//	
	Particle_properties_wave[13]=particle_c_rms// m/s
	Particle_properties_wave[14]=particle_c_bar // m/s
	Particle_properties_wave[15]=particle_c_Stokes*1e6 // µm/s
	Particle_properties_wave[16]=particle_tau_Stokes*1e9 // ns
	Particle_properties_wave[17]=particle_lambda*1e9 // nm
	Particle_properties_wave[18]=particle_g*1e9 // nm
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_aerodynamic_diameter(DDpp, rho_p, TempC, Pres_hPa)
//
// written by Ernie Lewis
// version 1.01
// last revision 2025-05-15
//
//
// Description: This calculates teh aerodynamic diameter of a particle with geometric diameter DDpp and density rho_p
//
//
// Version history: There are no previous versions.
//
//
// Explanation of call parameters: 
//
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
//////////// declare variables in call statement
	Variable DDpp, rho_p, TempC, Pres_hPa
//
	Variable air_mean_free_path_nm, Kn_geo, Cunn_geo, YY, D_aero, Kn_aero, Cunn_aero, i
//
	air_mean_free_path_nm=Calculate_air_mean_free_path(TempC, Pres_hPa) // in nm
	Kn_geo=2*air_mean_free_path_nm/DDpp // DDpp is in nm
	Cunn_geo=1+Kn_geo*(1.165+0.483*exp(-0.997/Kn_geo)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
	YY=DDpp^2*Cunn_geo*rho_p
//
	D_aero=DDpp*rho_p^(3/4) // good starting guess
	For (i=0;i<10;i+=1)
		Kn_aero=2*air_mean_free_path_nm/D_aero
		Cunn_aero=1+Kn_aero*(1.165+0.483*exp(-0.997/Kn_aero))
		D_aero=(YY^2/D_aero/Cunn_aero^2)^(1/3)
	EndFor
//
//
Return D_aero
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_Stokes_relaxation_time()
//
//
// written by Ernie Lewis
// last revision 2022-05-26
//
//
// Description: This calculates and graphs the relaxation time for a particle of density 1 g/cm^3 in the Stokes' regime
//	as a function of both diameter and pressure.
//
//



//////////////////////////////////////
Variable TempC, Pres_hPa, mfpath, visc
TempC=25
Pres_hPa=1013.25 // 1 atm
mfpath=Calculate_air_mean_free_path(TempC, Pres_hPa) // in nm
visc=Calculate_air_dynamic_viscosity(TempC, Pres_hPa) // kg/m/s
//
Make/O/D/N=1000 ddd, Kn, Cunn, relaxation_time, relaxation_time_approx_lowD, relaxation_time_approx_highD
ddd=x+1 // nm
Kn=2*mfpath/ddd // dimensionless
Cunn=1+Kn*(1.165+0.483*exp(-0.997/Kn)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
relaxation_time=1e3*(ddd*1e-9)^2*Cunn/18/visc // s
relaxation_time_approx_lowD=1e3*(ddd*1e-18)*1.648*2*mfpath/18/visc // s; 1.648+1.165+0.483
relaxation_time_approx_highD=1e3*(ddd*1e-9)^2/18/visc // s; assumes Cunn=1
//
//
////////////////////////////////////// graph relaxation time vs diameter
Killwindow/Z Graph_relaxation_time_vs_diameter
Display /W=(500,50,1000,450) /N=Graph_relaxation_time_vs_diameter
AppendtoGraph relaxation_time, relaxation_time_approx_lowD, relaxation_time_approx_highD vs ddd
ModifyGraph log=1,mirror=1,fSize=20,standoff=0,rgb=(0,0,0)
ModifyGraph lsize(relaxation_time)=2, lstyle(relaxation_time_approx_lowD)=1, lstyle(relaxation_time_approx_highD)=2
SetAxis left 5e-10,5e-6
Label left "\\Z20Relaxation time/s"
Label bottom "\\Z20Diameter/nm"
TextBox/C/N=text0/F=0/A=LT/X=10/Y=10 "\\Z16TempC=25 °C, Pres=1013.25 hPa\r\r\s(relaxation_time_approx_lowD)\f02τ\f00∝\f02D\f00\r\s(relaxation_time_approx_highD)\f02τ\f00∝\f02D\f00\S2"
//
//

//////////////////////////////////////

Variable ii, d1000, d100, d10, Knn, Cunnn
d1000=1000 // nm
d100=100 // nm
d10=10 // nm
Make/O/D/N=1000 PPP, relax_time_1000, relax_time_100, relax_time_10
PPP=x+1 // hPa
For (ii=0;ii<numpnts(PPP);ii+=1)
	mfpath=Calculate_air_mean_free_path(TempC, PPP[ii]) // in nm
	visc=Calculate_air_dynamic_viscosity(TempC, PPP[ii]) // kg/m/s
//
	Knn=2*mfpath/d1000 // dimensionless
	Cunnn=1+Knn*(1.165+0.483*exp(-0.997/Knn)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
	relax_time_1000[ii]=1e3*(d1000*1e-9)^2*Cunnn/18/visc // s
//
	Knn=2*mfpath/d100 // dimensionless
	Cunnn=1+Knn*(1.165+0.483*exp(-0.997/Knn)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
	relax_time_100[ii]=1e3*(d100*1e-9)^2*Cunnn/18/visc // s
//
	Knn=2*mfpath/d10 // dimensionless
	Cunnn=1+Knn*(1.165+0.483*exp(-0.997/Knn)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
	relax_time_10[ii]=1e3*(d10*1e-9)^2*Cunnn/18/visc // s
EndFor
//
//
Killwindow/Z Graph_relaxation_time_vs_pressure
Display /W=(500,500,1000,900) /N=Graph_relaxation_time_vs_pressure
AppendtoGraph relax_time_1000, relax_time_100, relax_time_10 vs PPP
ModifyGraph log=1,mirror=1,fSize=20,standoff=0,rgb=(0,0,0)
ModifyGraph lstyle(relax_time_1000)=0, lstyle(relax_time_100)=1, lstyle(relax_time_10)=2
Label left "\\Z20Relaxation time/s"
Label bottom "\\Z20Pressure/hPa"
TextBox/C/N=text0/F=0/A=RT/X=10/Y=10 "\\Z20\\s(relax_time_1000)D=1000 nm\r\\s(relax_time_100)D=  100 nm\r\\s(relax_time_10)D=    10 nm"
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_particle_lambda_g()
//
//
// written by Ernie Lewis
// last revision 2022-05-26
//
//
// Description: This calculates and graphs the values of lambda and g of a particle (from Fuchs, pp.182-183) as a function of diameter;
//		the particle density is assumed to be 1000 kg m^(-3).
//
//
//////////////////////////////////////
Variable k_Boltzmann=1.380649e-23 // J/K
Variable TempC, TempK, Pres_hPa, visc, mfpath
TempC=25
TempK=TempC+273.15
Pres_hPa=1013.25 // 1 atm
visc=Calculate_air_dynamic_viscosity(TempC, Pres_hPa) // kg/m/s
mfpath=Calculate_air_mean_free_path(TempC, Pres_hPa) // in nm
//
Make/O/D/N=1000 ddd, Knn, Cunnn, mass, c_bar, diffusivity, lambda_of_particle, g_of_particle, inverse_sqr_D
ddd=x+1 // nm
Knn=2*mfpath/ddd
Cunnn=1+Knn*(1.165+0.483*exp(-0.997/Knn)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
mass=1e3*1e-27*Pi/6*ddd^3 // kg; this assumes that the density is 1000 kg m^(-3)
c_bar=sqrt(8/Pi*k_Boltzmann*TempK/mass) // m/s
diffusivity=k_Boltzmann*TempK*Cunnn/(3*Pi*(ddd*1e-9)*visc) // m^2/s
lambda_of_particle=1e9*8/Pi*diffusivity/c_bar // nm, from Fuchs, pp.182-183
g_of_particle=(1/3/ddd/lambda_of_particle*((ddd+lambda_of_particle)^3-(ddd^2+lambda_of_particle^2)^1.5)-ddd) // nm
inverse_sqr_D=lambda_of_particle[0]/ddd[0]/sqrt(ddd) // my fit to low end
//
//
//////////////////////////// graph
Killwindow/Z Graph_g_particle_lambda_particle
Display /W=(1050,50,1650,450) /N=Graph_g_particle_lambda_particle
AppendtoGraph g_of_particle, lambda_of_particle, inverse_sqr_D vs ddd
ModifyGraph log(bottom)=1,mirror=1,fSize=20,standoff=0,rgb=(0,0,0)
SetAxis left 0,100
Label left "\\Z20g\Bparticle\M\Z20/nm, λ\Bparticle\M\Z20/nm"
Label bottom "\\Z20Diameter/nm"
ModifyGraph lstyle(lambda_of_particle)=3
ModifyGraph rgb(inverse_sqr_D)=(65535,0,0)
TextBox/C/N=text0/B=1/F=0/A=RT/X=5/Y=5 "\\Z20\\s(g_of_particle)\\f02g\\f00\\Bparticle\\M\r\\Z20\\s(lambda_of_particle)\\f02λ\\f00\\Bparticle\\M\r\\Z20\\s(inverse_sqr_D) fit ∝1/\\f02D\\f00\\S1/2\r"
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Make_Kn_Cunningham_relations_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This sets up a panel to calculate and display relations between 
//		the Knudsen number Kn and the Cunningham correction.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: Kn_input, Cunn_input, Kn_times_Cunn_input, 
//		Kn_squared_over_Cunn_input, onebyKn, dCunn_dKn, d_onebyKn_d_Kn_times_Cunn, 
//		Kn_times_d_onebyKn_d_Kn_times_Cunn, d_onebyKn_d_Kn_squared_over_Cunn
//
// Waves created in function: none
//
// Free waves created in function: none
//
// Calls: Calculate_d_onebyKn_d_Kn_times_Cunn, Calculate_d_onebyKn_d_Kn_squared_over_Cunn
//		SetVariable controls are handled with Update_for_Kn_Cunningham_relations_panel
//
// Calls required previously: none
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Declare quantities needed in function:
Variable/G Kn_input, Cunn_input, Kn_times_Cunn_input, Kn_squared_over_Cunn_input
Variable/G onebyKn, dCunn_dKn, dlnCunn_dlnKn, d_onebyKn_d_Kn_times_Cunn, Kn_times_d_onebyKn_d_Kn_times_Cunn, d_onebyKn_d_Kn_squared_over_Cunn
//
//
//*********************************************************************
//*********************************************************************
/////////// set defaults
// inputs
Kn_input=1
Cunn_input=2.34322 // calculated offline
Kn_times_Cunn_input=Kn_input*Cunn_input
Kn_squared_over_Cunn_input=Kn_input^2/Cunn_input
//
//
// outputs
onebyKn=1/Kn_input
dCunn_dKn=1.521 // calculated offline
dlnCunn_dlnKn=dCunn_dKn*Kn_input/Cunn_input
d_onebyKn_d_Kn_times_Cunn=Calculate_d_onebyKn_d_Kn_times_Cunn(Kn_input)
Kn_times_d_onebyKn_d_Kn_times_Cunn=Kn_input*d_onebyKn_d_Kn_times_Cunn
d_onebyKn_d_Kn_squared_over_Cunn=Calculate_d_onebyKn_d_Kn_squared_over_Cunn(Kn_input)
//
//
/////////////////////////////////////
//	make Kn-Cunnigham relations panel
	KillWindow/Z Kn_Cunnigham_relations_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(480,100,640,585) /N=Kn_Cunnigham_relations_panel as "Kn-Cunningham Relations"
//
//
/////////////////////////////////////
//	set up Kn-Cunningham Relations title box
	TitleBox Kn_Cunningham_relations_title title="\Z21   Knudsen-\rCunningham\r   Relations", pos={15, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Kn-Cunningham relations info button
	Button Kn_Cunningham_relations_info_button,pos={60,440},size={40,40},proc=Do_Kn_Cunningham_relations_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// group Kn-Cunnigham relations variable input box
	GroupBox Group_Kn_Cunningham_inputs pos={15, 100}, size={130, 105}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up Kn-Cunnigham relations variable input boxes
	DrawText 35,125, "\Z14Kn"
	SetVariable Kn_input, pos={70,105}, size={65,20}, bodyWidth=0, title=" ", fsize=14, format="%6.3f"
	SetVariable Kn_input, value=Kn_input, limits={0.01,inf,0.1}, proc=Update_for_Kn_Cunningham_relations_panel
//
	DrawText 35,150, "\Z14C"
	SetVariable Cunn_input, pos={70,130}, size={65,20}, bodyWidth=0, title=" ", fsize=14, format="%6.3f"
	SetVariable Cunn_input, value=Cunn_input, limits={1.01,inf,0.01*Cunn_input}, proc=Update_for_Kn_Cunningham_relations_panel
//
	DrawText 25,175, "\Z14Kn\Z12×\Z14C"
	SetVariable Kn_times_Cunn_input, pos={70,155}, size={65,20}, bodyWidth=0, title=" ", fsize=14, format="%6.3f"
	SetVariable Kn_times_Cunn_input, value=Kn_times_Cunn_input, limits={0.01,inf,0.1}, proc=Update_for_Kn_Cunningham_relations_panel
//
	DrawText 25,200, "\Z14Kn\S2\M\Z14/C"
	SetVariable Kn_squared_over_Cunn_input, pos={70,180}, size={65,20}, bodyWidth=0, title=" ", fsize=14, format="%5.3f"
	SetVariable Kn_squared_over_Cunn_input, value=Kn_squared_over_Cunn_input, limits={0.01,inf,0.1}, proc=Update_for_Kn_Cunningham_relations_panel
//
//
/////////////////////////////////////
// group Kn-Cunnigham relations output box
	GroupBox Group_Kn_Cunningham_outputs pos={10, 215}, size={140, 220}, labelBack=(50000, 50000, 50000)
//
//
	DrawText 30, 240, "\Z141/Kn"
	ValDisplay onebyKn, pos={95, 222.5}, size={45,20}, bodywidth=0, value=#"onebyKn", fsize=12, format="%5.3f"
//
	DrawText 30, 270, "\Z14dC/dKn"
	ValDisplay dCunn_dKn, pos={95, 252.5}, size={45,20}, bodywidth=0, value=#"dCunn_dKn", fsize=12, format="%5.3f"
//
	DrawText 20, 300, "\Z14dlnC/dlnKn"
	ValDisplay dlnCunn_dlnKn, pos={95, 282.5}, size={45,20}, bodywidth=0, value=#"dlnCunn_dlnKn", fsize=12, format="%5.3f"
//
	DrawText 30, 325, "\Z14d(1/Kn)"
	DrawLine 30,325,80,325
	DrawText 30, 342.5, "\Z14d(Kn\Z12×\Z14C)"
	ValDisplay d_onebyKn_d_Kn_times_Cunn, pos={95, 315}, size={50,20}, bodywidth=0, value=#"d_onebyKn_d_Kn_times_Cunn", fsize=12, format="%5.3f"
//
	DrawText 40, 365, "\Z14d(1/Kn)"
	DrawText 15, 373, "\Z14Kn\Z12×"
	DrawLine 40,365,90,365
	DrawText 40, 382.5, "\Z14d(Kn\Z12×\Z14C)"
	ValDisplay Kn_times_d_onebyKn_d_Kn_times_Cunn, pos={95, 355}, size={50,20}, bodywidth=0, value=#"kn_times_d_onebyKn_d_Kn_times_Cunn", fsize=12, format="%5.3f"
//
	DrawText 30, 405, "\Z14d(1/Kn)"
	DrawLine 30,405,80,405
	DrawText 30, 427.5, "\Z14d(Kn\S2\M\Z14/C)"
	ValDisplay d_onebyKn_d_Kn_squared_over_Cunn, pos={95, 397.5}, size={50,20}, bodywidth=0, value=#"d_onebyKn_d_Kn_squared_over_Cunn", fsize=12, format="%5.3f"
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Kn_Cunningham_relations_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This provides the control for SetVariables in Make_Kn_Cunningham_relations_panel 
//		by updating everything shown in that panel whenever an input is changed.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: Kn_input, Cunn_input, Kn_times_Cunn_input, 
//		Kn_squared_over_Cunn_input, onebyKn, dCunn_dKn, dlnCunn_dlnKn, d_onebyKn_d_Kn_times_Cunn, 
//		Kn_times_d_onebyKn_d_Kn_times_Cunn, d_onebyKn_d_Kn_squared_over_Cunn
//
// Free waves created in function: none
//
// Calls: Calculate_d_onebyKn_d_Kn_times_Cunn, Calculate_d_onebyKn_d_Kn_squared_over_Cunn
//
// Calls required previously: none
//
// Called by: Make_Kn_Cunningham_relations_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
// Declare other variables and waves
NVAR Kn_input, Cunn_input, Kn_times_Cunn_input, Kn_squared_over_Cunn_input
NVAR onebyKn, dCunn_dKn, dlnCunn_dlnKn, d_onebyKn_d_Kn_times_Cunn, Kn_times_d_onebyKn_d_Kn_times_Cunn, d_onebyKn_d_Kn_squared_over_Cunn
//
//
Variable Acunn, Bcunn, Ccunn
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “Kn_input”) == 0) // calculate other quantities if Kn changed
		EndIf
//
		If (cmpstr(ctrlName.vName, “Cunn_input”) == 0) // calculate other quantities if Cunn changed
			Kn_input=Calculate_Kn_from_Cunn(Cunn_input)
		EndIf
//
		If (cmpstr(ctrlName.vName, “Kn_times_Cunn_input”) == 0) // calculate other quantities if Kn*Cunn changed
			Kn_input=Calculate_Kn_from_Kn_times_Cunn(Kn_times_Cunn_input)
		EndIf
//
		If (cmpstr(ctrlName.vName, “Kn_squared_over_Cunn_input”) == 0) // calculate other quantities if Kn^2/Cunn changed
			Kn_input=Calculate_Kn_from_Kn_squared_over_Cunn(Kn_squared_over_Cunn_input)
		EndIf
//
//
// recalculate all
	Cunn_input=1+Kn_input*(Acunn+Bcunn*exp(-Ccunn/Kn_input))
	Kn_times_Cunn_input=Kn_input*Cunn_input
	Kn_squared_over_Cunn_input=Kn_input^2/Cunn_input			
//
//
	onebyKn=1/Kn_input
	dCunn_dKn=Acunn+Bcunn*exp(-Ccunn/Kn_input)+Bcunn*Ccunn*exp(-Ccunn/Kn_input)/Kn_input
	dlnCunn_dlnKn=dCunn_dKn*Kn_input/Cunn_input
	d_onebyKn_d_Kn_times_Cunn=Calculate_d_onebyKn_d_Kn_times_Cunn(Kn_input)
	Kn_times_d_onebyKn_d_Kn_times_Cunn=Kn_input*d_onebyKn_d_Kn_times_Cunn
	d_onebyKn_d_Kn_squared_over_Cunn=Calculate_d_onebyKn_d_Kn_squared_over_Cunn(Kn_input)

	dCunn_dKn=Acunn+Bcunn*exp(-Ccunn/Kn_input)+Bcunn*Ccunn*exp(-Ccunn/Kn_input)/Kn_input
//		in case it is changed with later calculations in other calls
//
//
	SetVariable Cunn_input, value=Cunn_input, limits={1,inf,0.01*Cunn_input}, proc=Update_for_Kn_Cunningham_relations_panel
// eee
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Kn_Cunningham_relations_panel_info_button(Make_Kn_Cunningham_relations_panel_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This calls Kn_Cunningham_relations_panel_info when the 
//		Kn_Cunningham_relations_info_button is hit in panel Make_Kn_Cunningham_relations_panel.
//
//	
// Version history: there are no previous versions
//
// Explanation of call parameters: Make_Kn_Cunningham_relations_panel_info_Struct 
//		is the structure for this button control
//
// Quantities required for function: none
//
// Variables calculated in function: none
//
// Waves created in function: none
//
// Free waves created in function: none
//
// Calls: Print_Kn_Cunningham_relations_info
//
// Calls required previously: none
//
// Called by: Make_Kn_Cunningham_relations_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Make_Kn_Cunningham_relations_panel_info_Struct
//
//
	If (Make_Kn_Cunningham_relations_panel_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Kn_Cunningham_relations_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Kn_Cunningham_relations_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2020-06-01
//
//
// Description: This prints information on Kn-Cunningham relations displayed in Make_Kn_Cunningham_relations_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Kn_Cunningham_relations_panel_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Kn_Cunningham_relations_info_text	
//
//
	Kn_Cunningham_relations_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "Kn-Cunningham Relations Information\r"
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "------------------------------------\r\r"
//
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "The calculations here are based on the Cunningham correction, C=1+Kn[1.165+0.483exp(-0.997/Kn)],\r"
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "   from Kim et al., 2005, J. Res. NIST, 110, 31-54.\r\r"
//
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "The Knudsen number Kn is equal to 2×λ_air/D, and λ_air is the mean free path of air and D\r"
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "   is the particle diameter.\r\r"
//
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "Kn and C are dimenionless quantities, but for a fixed particle diameter, Kn and C will depend\r"
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "   on temperature and pressure through the dependences of λ_air on these quantities.\r\r"
//
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "Any of the quantities Kn, C, Kn×C, or Kn^2/C will uniquely determine the other three.\r\r"
//
	Kn_Cunningham_relations_info_text = Kn_Cunningham_relations_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Kn_Cunningham_relations_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(650,100,1350,390)/N=Kn_Cunningham_relations_info_notebook
	Notebook Kn_Cunningham_relations_info_notebook, text=Kn_Cunningham_relations_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Kn_from_Cunn(Cunn)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This calculates the value of Kn (the Knudsen number) from the Cunningham correction.	
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: Cunn is the Cunningham correction.
//
// Quantities required for function: Cunn
//
// Variables calculated in function: Kn, Kn_new, Cunn_new, dCunn_dKn
//
// Free waves created in function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Kn_Cunningham_relations_panel, Update_for_Kn_Cunningham_relations_panel
//
// Return: Kn
//
//
// Declare variables in call statement
Variable Cunn
//
//
// Declare other variables and waves
Variable i, Kn, Kn_new, Cunn_new, dCunn_dKn
//
Variable Acunn, Bcunn, Ccunn // from Kim et al., J. Res. NIST, 110, 31-54, 2005
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
//
//
////////////////// make sure Cunn > 1
If (Cunn <= 1) 
	print "Cunn must be > 1"
	Return 0
EndIf
//
//
// use Newton's method - it converges very rapidly (unusally one or two steps)
// starting guess
Kn=(Cunn-1)/(Acunn+Bcunn) // based on approximation Cunn=1+(Acunn+Bcunn)*Kn
//
// iterate
For (i=1;i<10;i+=1)
	Cunn_new=1+Kn*(Acunn+Bcunn*exp(-Ccunn/Kn))
	dCunn_dKn=Acunn+Bcunn*exp(-Ccunn/Kn)+Bcunn*Ccunn*exp(-Ccunn/Kn)/Kn
	Kn_new=Kn-(Cunn_new-Cunn)/dCunn_dKn // this is Newton's method
	Kn=Kn_new // update and iterate
EndFor
//
//
Return Kn
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Kn_from_Kn_times_Cunn(Kn_times_Cunn)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This calculates the value of Kn (the Knudsen number) from Kn*Cunn.
//
//	
// Version history: there are no previous versions
//
// Explanation of call parameters: Kn_times_Cunn is the Knudsen number times the Cunningham correction.
//
// Quantities required for function: Kn_times_Cunn
//
// Variables calculated in function: Kn, Cunn, Kn_times_Cunn_new, dKn_times_Cunn_dKn, Kn_new
//
// Free waves created in function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Kn_Cunningham_relations_panel, Update_for_Kn_Cunningham_relations_panel
//
// Return: Kn
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
Variable Kn_times_Cunn
//
//
// Declare other variables and waves
Variable i, Kn, Cunn, Kn_times_Cunn_new, dCunn_dKn, dKn_times_Cunn_dKn, Kn_new
//
Variable Acunn, Bcunn, Ccunn
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
//*********************************************************************
//*********************************************************************
// use Newton's method - it converges very rapidly (unusally one or two steps)
// starting guess
Kn=(-1+(1+4*(Acunn+Bcunn)*Kn_times_Cunn)^(1/2))/2/(Acunn+Bcunn)
// based on approximation Cunn=1+(Acunn+Bcunn)*Kn, thus Kn_times_Cunn=Kn*Cunn=Kn+(aa+bb)*Kn^2
//	invert to get Kn=(-1+(1+4*(Acunn+Bcunn)*Kn_times_Cunn)^(1/2))/2/(Acunn+Bcunn)
//
//
// iterate
For (i=1;i<10;i+=1) // it converges more slowly for very small values of Kn*Cunn
	Cunn=1+Kn*(Acunn+Bcunn*exp(-Ccunn/Kn))
	Kn_times_Cunn_new=Kn*Cunn
	dCunn_dKn=Acunn+Bcunn*exp(-Ccunn/Kn)+Bcunn*Ccunn*exp(-Ccunn/Kn)/Kn
	dKn_times_Cunn_dKn=Cunn + Kn*dCunn_dKn
	Kn_new=Kn-(Kn_times_Cunn_new-Kn_times_Cunn)/dKn_times_Cunn_dKn // this is Newton's method
	Kn=Kn_new // update and iterate
EndFor
//
//
//*********************************************************************
//*********************************************************************
//		Kn=sqrt(Kn*Kn_times_Cunn/Cunn) // this works well (but is not as quick as Newton's method)
// 	It works because a fractional error e in Kn results in a fractional error -dlnC/dlnKn*e in 1/C,
//			and the fractional error in Kn * Kn_times_Cunn/Cunn will be e*(1-dlnC/dlnKn). As 
//			dlnC/dlnKn is between 0 and 1, the fractional error in the product will be between 1 and 0,
//			and the fractional error in the square root will be 1/2 that, so there is geometric convergence. 
//		Kn=1/2*(Kn+Kn_times_Cunn/Cunn) // this works also
//		Kn=Kn_times_Cunn/Cunn // this converges slowly and oscillatory
//
//
//*********************************************************************
//*********************************************************************
Return Kn
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Kn_from_Kn_squared_over_Cunn(Kn_squared_over_Cunn)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This calculates the value of Kn (the Knudsen number) from Kn^2/Cunn.	
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: Kn_squared_over_Cunn is the Knudsen number squared 
//		divided by the Cunningham correction.
//
// Quantities required for function: Kn_squared_over_Cunn
//
// Variables calculated in function: Kn, Cunn, Kn_squared_over_Cunn_new, 
//		dCunn_dKn, dKn_squared_over_Cunn_dKn, Kn_new
//
// Free waves created in function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Kn_Cunningham_relations_panel, Update_for_Kn_Cunningham_relations_panel
//
// Return: Kn
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
Variable Kn_squared_over_Cunn
//
//
// Declare other variables and waves
Variable i, Kn, Cunn, Kn_squared_over_Cunn_new, dCunn_dKn, dKn_squared_over_Cunn_dKn, Kn_new
//
Variable Acunn, Bcunn, Ccunn
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
//*********************************************************************
//*********************************************************************
// use Newton's method - it converges very rapidly (unusally one or two steps)
// starting guess
Kn=((Acunn+Bcunn)*Kn_squared_over_Cunn+((Acunn+Bcunn)^2*Kn_squared_over_Cunn^2+4*Kn_squared_over_Cunn)^(1/2))/2 // starting guess
// based on approximation Cunn=1+(Acunn+Bcunn)*Kn => Kn^2=Kn_squared_over_Cunn*(1+(Acunn+Bcunn)*Kn)
// invert to get Kn=((Acunn+Bcunn)*Kn_squared_over_Cunn+((Acunn+Bcunn)^2*Kn_squared_over_Cunn^2+4*Kn_squared_over_Cunn)^(1/2))/2
//
//
// iterate
For (i=1;i<10;i+=1)
	Cunn=1+Kn*(Acunn+Bcunn*exp(-Ccunn/Kn))
	Kn_squared_over_Cunn_new=Kn^2/Cunn	
	dCunn_dKn=Acunn+Bcunn*exp(-Ccunn/Kn)+Bcunn*Ccunn*exp(-Ccunn/Kn)/Kn
	dKn_squared_over_Cunn_dKn=2*Kn/Cunn-Kn^2/Cunn^2*dCunn_dKn
	Kn_new=Kn-(Kn_squared_over_Cunn_new-Kn_squared_over_Cunn)/dKn_squared_over_Cunn_dKn // this is Newton's method
	Kn=Kn_new // update and iterate
EndFor
//
//
//*********************************************************************
//*********************************************************************
//	Kn=sqrt(Cunn*Kn_squared_over_Cunn) // this works well (but is not as quick as Newton's method)
// 	It works because a fractional error e in Kn results in a fractional error in C of 
//		e*dlnC/dlnKn. As dlnC/dlnKn is between 0 and 1, the fractional error in the square root will
//		be 1/2 of that, so there is geometric convergence.
//
//
//*********************************************************************
//*********************************************************************
Return Kn
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_d_onebyKn_d_Kn_times_Cunn(Kn)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This calculates the derivative of Kn (the Knudsen number) with respect to Kn*Cunn.
//	
//
// Version history: there are no previous versions
//
// Explanation of call parameters: Kn is the Knudsen number
//
// Quantities required for function: Kn
//
// Variables calculated in function: Cunn, Kn_times_Cunn, Kn_plus, Cunn_plus, 
//		Kn_times_Cunn_plus, d_onebyKn_d_Kn_times_Cunn
//
// Free waves created in function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Kn_Cunningham_relations_panel, Update_for_Kn_Cunningham_relations_panel
//
// Return: d_onebyKn_d_Kn_times_Cunn
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
Variable Kn
//
//
// Declare other variables and waves
Variable Cunn, Kn_times_Cunn, Kn_plus, Cunn_plus, Kn_times_Cunn_plus, d_onebyKn_d_Kn_times_Cunn
//
Variable Acunn, Bcunn, Ccunn
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
//*********************************************************************
//*********************************************************************
Cunn=1+Kn*(Acunn+Bcunn*exp(-Ccunn/Kn))
Kn_times_Cunn=Kn*Cunn
//
Kn_plus=Kn*1.01
Cunn_plus=1+Kn_plus*(Acunn+Bcunn*exp(-Ccunn/Kn_plus))
Kn_times_Cunn_plus=Kn_plus*Cunn_plus
//
d_onebyKn_d_Kn_times_Cunn=((1/Kn_plus)-(1/Kn))/(Kn_times_Cunn_plus-Kn_times_Cunn)
//
//
//*********************************************************************
//*********************************************************************
Return d_onebyKn_d_Kn_times_Cunn
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_d_onebyKn_d_Kn_squared_over_Cunn(Kn)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This calculates the derivative of Kn (the Knudsen number) with respect to Kn^2/Cunn.	
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: Kn is the Knudsen number
//
// Quantities required for function: Kn
//
// Variables calculated in function: Cunn, Kn_plus, Cunn_plus, Kn_squared_over_Cunn, Kn_squared_over_Cunn_plus, 
//		d_onebyKn_d_Kn_squared_over_Cunn
//
// Free waves created in function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Kn_Cunningham_relations_panel, Update_for_Kn_Cunningham_relations_panel
//
// Return: d_onebyKn_d_Kn_squared_over_Cunn
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
Variable Kn
//
//
// Declare other variables and waves
Variable Cunn, Kn_squared_over_Cunn, Kn_plus, Cunn_plus, Kn_squared_over_Cunn_plus, d_onebyKn_d_Kn_squared_over_Cunn
//
Variable Acunn, Bcunn, Ccunn
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
//*********************************************************************
//*********************************************************************
Cunn=1+Kn*(Acunn+Bcunn*exp(-Ccunn/Kn))
Kn_squared_over_Cunn=Kn^2/Cunn
//
Kn_plus=Kn*1.01
Cunn_plus=1+Kn_plus*(Acunn+Bcunn*exp(-Ccunn/Kn_plus))
Kn_squared_over_Cunn_plus=Kn_plus^2/Cunn_plus
//
d_onebyKn_d_Kn_squared_over_Cunn=((1/Kn_plus)-(1/Kn))/(Kn_squared_over_Cunn_plus-Kn_squared_over_Cunn)
//
//
//*********************************************************************
//*********************************************************************
Return d_onebyKn_d_Kn_squared_over_Cunn
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Mass_Diam_Density_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-25
//
//
// Description: This sets up a panel to calculate and display relations between 
//		the mass, diameter, and density of a spherical particle, or of the mass,
//		mobility (or other) diameter, and effective density of a non-spherical particle.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: 
//		Update_for_Mass_Diam_Density_relations_panel when any value is changed
//		Choose_Mass_or_Diam_or_Density when any control box is selected
//		Do_Mass_Diam_Density_relations_panel_info_button when "i" button is hit
//
// Calls required previously: none
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Declare quantities needed in function:
Variable/G MassA, DiamA, DensityA // the "A" at the end is to avoid conflicts if any other routine uses these varaibles
Variable/G MassA_value, DiamA_value, DensityA_value // these tell which radio buttons are selected
//
//
//*********************************************************************
//*********************************************************************
/////////// set defaults
// inputs
MassA=0.523 // fm
DiamA=100 // nm
DensityA=1.0 // g/cm^3 (calculated offline)
//
MassA_value=1 // Mass selected
DiamA_value=1 // Diam selected
DensityA_value=0 // Density not selected; calculated from Mass and Diam
//
//
/////////////////////////////////////
//	make Mass-Diam-Density panel
	KillWindow/Z Mass_Diam_Density_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(150,50,350,240) /N=Mass_Diam_Density_panel as "Mass-Diam-ρ"
//
//
/////////////////////////////////////
//	set up Mass-ss-Density Relations title box
	TitleBox Mass_Diam_Density_relations_title title="\Z20\f02M-D-ρ\f00 Relations", pos={25, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Mass_ss_Density relations info button
	Button Mass_Diam_Density_relations_info_button,pos={80,140},size={40,40},proc=Do_Mass_Diam_Density_relations_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// set up Mass_Diam_Density relations variable input boxes
	GroupBox Group_Mass_Diam_Density pos={20, 50}, size={160, 80}, labelBack=(65535, 50000, 50000)
//
//
// set up Mass_Diam_Density relations variable input boxes
	CheckBox MassA_selected, pos={25, 57.5}, size={20,20}, title=" ", proc=Choose_Mass_or_Diam_or_Density, value=MassA_value, mode=1
	DrawText 42.5,75, "\Z14Mass/fg"
	SetVariable MassA_input, pos={97.5,55}, size={75,20}, bodyWidth=0, title=" ", fsize=14, format="%5.3g"
	SetVariable MassA_input, value=MassA, limits={0,1e4,0.1}, proc=Update_for_Mass_Diam_Density_relations_panel
//
	CheckBox DiamA_selected, pos={25,82.5}, size={20,20}, title=" ", proc=Choose_Mass_or_Diam_or_Density, value=DiamA_value, mode=1
	DrawText 42.5,100, "\Z14Diam/nn"
	SetVariable DiamA_input, pos={110,80}, size={62.5,20}, bodyWidth=0, title=" ", fsize=14, format="%5.1f"
	SetVariable DiamA_input, value=DiamA, limits={0.01,1000,1}, proc=Update_for_Mass_Diam_Density_relations_panel
//
	CheckBox DensityA_selected, pos={25,107.5}, size={20,20}, title=" ", proc=Choose_Mass_or_Diam_or_Density, value=DensityA_value, mode=1
	DrawText 42.5,125, "\Z14\f02ρ\f00/(g cm\S-3\M)"	
	SetVariable DensityA_input, pos={110,105}, size={62.5,20}, bodyWidth=0, title=" ", fsize=14, format="%5.3f", disable=2
	SetVariable DensityA_input, value=DensityA, limits={0.01,2,0.01}, proc=Update_for_Mass_Diam_Density_relations_panel
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Mass_Diam_Density_relations_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-23
//
//
// Description: This provides the control for SetVariables in Make_Mass_Diam_Density_panel 
//		by updating everything shown in that panel whenever an input is changed.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: MassA, DiamA, DensityA
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Mass_Diam_Density_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
// Declare other variables and waves
	NVAR MassA, DiamA, DensityA
	NVAR MassA_value, DiamA_value, DensityA_value
//
//
// this is if an entry is changed
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “MassA”) == 0) // Mass changed, which means it was selected
			If (DiamA_value == 1) // Diam was also selected
				DensityA=1e6*MassA/(Pi/6*DiamA^3) // calculate Density from Mass and Diam
			EndIf
//
			If (DensityA_value == 1) // Density was also selected
				DiamA=(1e6*MassA/DensityA)^(1/3) // calculate Diam from Mass and Density
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “DiamA”) == 0) // Diam changed, which means it was selected
			If (MassA_value == 1) // Mass was also selected
				DensityA=1e6*MassA/(Pi/6*DiamA^3) // calculate Density from Mass and Diam
			EndIf
//
			If (DensityA_value == 1) // Density was also selected
				MassA=1e-6*Pi/6*DensityA*DiamA^3 // calculate Mass from Diam and Density
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “DensityA”) == 0) // Density changed, which means it was selected
			If (MassA_value == 1) // Mass was also selected
				DiamA=(1e6*MassA/DensityA)^(1/3) // calculate Diam from Mass and Density
			EndIf
//
			If (DiamA_value == 1) // Diam was also selected
				MassA=1e-6*Pi/6*DensityA*DiamA^3 // calculate Mass from Diam and Density
			EndIf
		EndIf
//
//
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Choose_Mass_or_Diam_or_Density(Choose_Mass_or_Diam_or_Density_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2023-03-28
//
//
// Description: This provides the control for the check boxes for the choice of 
//		whether Mass, Diam, or Density is held constant while another is varied.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Choose_Mass_or_Diam_or_Density_box tells whether the box is checked for calculations.
//
//
// Quantities required for function: none
// Variables calculated in function: Choose_Mass_or_Diam_or_Density_value
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Mass_Diam_Density_panel (when checkbox for Mass, Diam, or Density is checked)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//f
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& Choose_Mass_or_Diam_or_Density_box
	NVAR MassA_value, DiamA_value, DensityA_value
//
//
//	This determines which pair of boxes amoung Mass, Diam, and Density is checked.
	If (Choose_Mass_or_Diam_or_Density_box.eventcode == 2) // do only when mouse goes up (eventcode = 2)
//
		// disable all inputs
		SetVariable MassA_input, disable=2 // disable this one
		SetVariable DiamA_input, disable=2 // disable this one
		SetVariable DensityA_input, disable=2 // disable this one
//
		StrSwitch (Choose_Mass_or_Diam_or_Density_box.ctrlName)
			Case "MassA_selected":
				MassA_value=1 // select this one
				If (DiamA_value==1 & DensityA_value==1) // both other boxes are selected
					CheckBox DiamA_selected, value=0 // deselect this one
					DiamA_value=0
					Checkbox DensityA_selected, value=0 // deselect this one
					DensityA_value=0
				Else // this would be the second time
					Checkbox MassA_selected, value=1 // select this one
					MassA_value=1
					SetVariable MassA_input, disable=0 // enable this one
					If (DiamA_value==1)
						SetVariable DiamA_input, disable=0 // enable this one
					EndIf
					If (DensityA_value==1)
						SetVariable DensityA_input, disable=0 // enable this one
					EndIf
				EndIf
				Break		
//
			Case "DiamA_selected":
				DiamA_value=1 // select this one
				If (MassA_value==1 & DensityA_value==1) // both other boxes are selected
					Checkbox MassA_selected, value=0 // deselect this one
					MassA_value=0
					Checkbox DensityA_selected, value=0 // deselect this one
					DensityA_value=0
				Else // this would be the second time
					Checkbox DiamA_selected, value=1 // select this one
					DiamA_value=1
					SetVariable DiamA_input, disable=0 // enable this one
					If (MassA_value==1)
						SetVariable MassA_input, disable=0 // enable this one
					EndIf
					If (DensityA_value==1)
						SetVariable DensityA_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
//
			Case "DensityA_selected":
				DensityA_value=1 // select this one
				If (MassA_value==1 & DiamA_value==1) // both other boxes are selected
					Checkbox MassA_selected, value=0 // deselect this one
					MassA_value=0
					Checkbox DiamA_selected, value=0 // deselect this one
					DiamA_value=0
				Else // this would be the second time
					Checkbox DensityA_selected, value=1 // select this one
					DensityA_value=1
					SetVariable DensityA_input, disable=0 // enable this one
					If (MassA_value==1)
						SetVariable MassA_input, disable=0 // enable this one
					EndIf
					If (DiamA_value==1)
						SetVariable DiamA_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
		EndSwitch
	EndIf
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Mass_Diam_Density_relations_panel_info_button(Do_Mass_Diam_Density_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-01-16
//
// Description: This calls Mass_Diam_Density_panel_info when the 
//		Mass_Density_relations_info_button is hit in panel Mass_Diam_Density_panel.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: Do_Mass_Diam_Density_info_Struct 
//		is the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Mass_Diam_Density_relations_info
//
// Calls required previously: none
//
// Called by: Mass_Diam_Density_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Do_Mass_Diam_Density_info_Struct
//
//
	If (Do_Mass_Diam_Density_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Mass_Diam_Density_relations_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Mass_Diam_Density_relations_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-28
//
//
// Description: This prints information on the relations among Mass, Diam, and Density
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Mass_Diam_Density_panel_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Mass_Diam_Density_info_text
//
//
	Mass_Diam_Density_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "Relations among the Mass, Diameter, and Density\r"
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "-----------------------------------------------\r\r"
//
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "Calculations relating the mass, diameter, and density of a spherical particle, or the mass, mobility\r"
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "   (or other) diameter, and effective density of a non-spherical particle, are based on the equation\r"
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "   Mass = (π/6) × ρ × Diam^3.\r\r"
//
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "Mass is in femtograms (1 fg = 1e-15 g), diameter is in nm (1 nm = 1e-9 m), and density in g cm^(-3).\r"
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "In these units, Mass/fg = 1e-6 × (π/6) × ρ/(g cm^(-3)) × (Diam/nm)^3 = (π/6) × ρ/(g cm^(-3)) × (Diam/100 nm)^3.\r\r"
//		
	Mass_Diam_Density_info_text = Mass_Diam_Density_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Mass_Diam_Density_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(370,50,1170,290)/N=Mass_Diam_Density_info_notebook
	Notebook Mass_Diam_Density_info_notebook, text=Mass_Diam_Density_info_text, fsize=11
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Coagulation_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This sets up a panel to input partile diameter and calculate quantities related to that.
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
//
// Quantities required for function: none
// Variables calculated in function: xxxxxxxx
// Waves created in function: none
// Free waves created in function: none
// Calls: none
//		SetVariable controls are handled with Update_for_Coagulation_panel
//		The "i" button calls Do_xxxxx, which calls Print_xxxx
// Calls required previously: none
// Called by: none
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
//
//
/////////////////////////////////////
//	make coagulation panel
	KillWindow/Z Coagulation_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(660,100,960,890) /N=Coagulation_panel as "Coagulation"
//
//
/////////////////////////////////////
//	set up title box
	TitleBox Coagulation_title title="\Z24Coagulation", pos={90, 5},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Coagulation information button
	Button Coagulation_information_button,pos={130,740},size={40,40},proc=Do_Coagulation_information_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// group Coagulation input box for particle 1
	GroupBox Group_Coagulation_inputs_particle1 pos={10, 50}, size={135, 55}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up coagualation inputs box for particle 1

	DrawText 25,75, "\Z14D\Bp\M\Z14/nm"
	SetVariable Dp1_input, pos={75,55}, size={65,25}, bodyWidth=0, title=" ", fsize=14, format="%6.1f"
	SetVariable Dp1_input, value=Dp1_input, limits={1,10000,1}, proc=Update_for_Coagulation_panel
//
	DrawText 15,100, "\Z14\f02ρ\f00/(g cm\S-3\M)"
	SetVariable rho1_input, pos={85,80}, size={55,25}, bodyWidth=0, title=" ", fsize=14, format="%4.2f"
	SetVariable rho1_input, value=rho1_input, limits={0.001,10,0.05}, proc=Update_for_Coagulation_panel
//
//
/////////////////////////////////////
// group Coagulation input box for particle 2
	GroupBox Group_Coagulation_inputs_particle2 pos={155, 50}, size={135, 55}, labelBack=(65535, 50000, 50000)
//
//
////////////////////////////////////
// set up coagualation inputs box for particle 2

	DrawText 170,75, "\Z14D\Bp\M\Z14/nm"
	SetVariable Dp2_input, pos={220,55}, size={65,25}, bodyWidth=0, title=" ", fsize=14, format="%6.1f"
	SetVariable Dp2_input, value=Dp2_input, limits={1,10000,1}, proc=Update_for_Coagulation_panel
//
	DrawText 160,100, "\Z14\f02ρ\f00/(g cm\S-3\M)"
	SetVariable rho2_input, pos={230,80}, size={55,25}, bodyWidth=0, title=" ", fsize=14, format="%4.2f"
	SetVariable rho2_input, value=rho2_input, limits={0.001,10,0.05}, proc=Update_for_Coagulation_panel
//
//
//////////////////////////////////////
// Group calculated values box for particle 1
	GroupBox Particle1_calculated_values pos={10,115}, size={135,205}, labelBack=(50000, 50000, 50000)
//
	DrawText 20,140, "\Z14mass/fg"
	ValDisplay mass1, pos={75,122.5}, size={60,20}, bodywidth=0, value=#"Coagulation_wave_particle1[0]", fsize=12, format="%4.3g"
//
	DrawText 40,165, "\Z14Kn"
	ValDisplay Kn1, pos={75,147.5}, size={50,20}, bodywidth=0, value=#"Coagulation_wave_particle1[1]", fsize=12, format="%6.3f"
//
	DrawText 40,190, "\Z14Cunn"
	ValDisplay Cunn1, pos={75,172.5}, size={50,20}, bodywidth=0, value=#"Coagulation_wave_particle1[2]", fsize=12, format="%5.2f"
//
	DrawText 20,215, "\Z14Diffusivity/(m\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay diffusivity1, pos={75,217.5}, size={60,20}, bodywidth=0, value=#"Coagulation_wave_particle1[3]", fsize=12, format="%4.3g"
//
	DrawText 15,260, "\Z14< c >\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay c_bar1, pos={95,242.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_particle1[4]", fsize=12, format="%6.3f"
//
	DrawText 40,285, "\Z14\f02λ\f00\Bp\M\Z14/nm"
	ValDisplay lambda_particle_1, pos={90,267.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_particle1[5]", fsize=12, format="%5.2f"
//
	DrawText 45,310, "\Z14g/nm"
	ValDisplay g_particle_1, pos={90,292.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_particle1[6]", fsize=12, format="%5.2f"
//
//
/////////////////////////////////////
// Group calculated values box for particle 2
	GroupBox Particle2_calculated_values pos={155,115}, size={135,205}, labelBack=(50000, 50000, 50000)
//
	DrawText 165,140, "\Z14mass/fg"
	ValDisplay mass2, pos={220,122.5}, size={60,20}, bodywidth=0, value=#"Coagulation_wave_particle2[0]", fsize=12, format="%4.3g"
//
	DrawText 185,165, "\Z14Kn"
	ValDisplay Kn2, pos={220,147.5}, size={50,20}, bodywidth=0, value=#"Coagulation_wave_particle2[1]", fsize=12, format="%6.3f"
//
	DrawText 185,190, "\Z14Cunn"
	ValDisplay Cunn2, pos={220,172.5}, size={50,20}, bodywidth=0, value=#"Coagulation_wave_particle2[2]", fsize=12, format="%5.2f"
//
	DrawText 165, 215, "\Z14Diffusivity/(m\S2\M\Z14 s\S-1\M\Z14)"
	ValDisplay diffusivity2, pos={220,217.5}, size={60,20}, bodywidth=0, value=#"Coagulation_wave_particle2[3]", fsize=12, format="%4.3g"
//
	DrawText 160,260, "\Z14< c >\M\Z14/(m s\S-1\M\Z14)"
	ValDisplay c_bar2, pos={240,242.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_particle2[4]", fsize=12, format="%6.3f"
//
	DrawText 185,285, "\Z14\f02λ\f00\Bp\M\Z14/nm"
	ValDisplay lambda_particle_2, pos={235,267.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_particle2[5]", fsize=12, format="%5.2f"
//
	DrawText 190,310, "\Z14g/nm"
	ValDisplay g_particle_2, pos={235,292.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_particle2[6]", fsize=12, format="%5.2f"
//
//
//////////////////////////////////////
	DrawLine 20, 330, 280, 330
//
//
/////////////////////////////////////
// Group calculated values box 1 for coagulation
	GroupBox Coagulation_calculated_values_1 pos={80,340}, size={140,105}, labelBack=(50000, 50000, 50000)
//
	DrawText 90,365, "\Z14D\Bp,12\M\Z14/nm"
	ValDisplay Dp12, pos={165,347.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_12[0]", fsize=12, format="%6.2f"
//
	DrawText 90, 390, "\Z14\f02ρ\f00\B12\M\Z14/(g cm\S-3\M\Z14)"
	ValDisplay rho12, pos={175,372.5}, size={35,20}, bodywidth=0, value=#"Coagulation_wave_12[1]", fsize=12, format="%4.2f"
//
	DrawText 90, 415, "\Z14mass\B12\M\Z14/fg"
	ValDisplay mass12, pos={160,397.5}, size={55,20}, bodywidth=0, value=#"Coagulation_wave_12[2]", fsize=12, format="%6.3g"
//
	DrawText 120, 440, "\Z14Kn\B12\M\Z14"
	ValDisplay Kn12, pos={165, 422.5}, size={45, 20}, bodywidth=0, value=#"Coagulation_wave_12[3]", fsize=12, format="%6.3f"
//
//////////////////////////////////////
	DrawLine 20, 455, 280, 455
//
//
//////////////////////////////////////
// group coagulation input box for accommodation coefficient
	GroupBox Coagulation_Accommodation pos={30, 465}, size={240, 30}, labelBack=(65535, 50000, 50000)
	DrawText 35, 490, "\Z14Accommodation coefficient"
	SetVariable coagulation_accommodation_coefficient_input, pos={205, 470}, size={60, 25}, bodyWidth=0, title=" " , fsize=14, format="%4.3f"
	SetVariable coagulation_accommodation_coefficient_input, value=coagulation_accommodation_coefficient_input, limits={0.001, 1, 0.1}, proc=Update_for_Coagulation_panel
//
//
//////////////////////////////////////
// group whose coagulation formula box
	GroupBox Whose_coagulation_formula_box pos={30, 500}, size={240, 25}, labelBack=(65535, 50000, 50000)
	CheckBox Fuchs_coagulation, pos={40, 503.5},size={20,20},title="\Z14Fuchs ",proc=Choose_Fuchs_or_Dahneke_coagulation,value=1,mode=1
	CheckBox Dahneke_coagulation, pos={115,503.5},size={20,20},title="\Z14Dahneke ",proc=Choose_Fuchs_or_Dahneke_coagulation,value=0,mode=1
	CheckBox beta_coag_eq_1, pos={205,503.5},size={20,20},title="\Z14\f02β\f00\B12\M\Z14=1 ",proc=Choose_Fuchs_or_Dahneke_coagulation,value=0,mode=1
//
//
/////////////////////////////////////
// Group calculated values box 2 for coagulation
	GroupBox Coagulation_calculated_values_2 pos={75,535}, size={155,55}, labelBack=(50000, 50000, 50000)
//
	DrawText 120,560, "\Z14\f02β\f00\B12"
	ValDisplay beta12, pos={165,542.5}, size={45,20}, bodywidth=0, value=#"Coagulation_wave_12[4]", fsize=12, format="%6.3f"
//
	DrawText 80, 585, "\Z14K\B12\M\Z14/(cm\S3\M\Z14 s\S-1\M\Z14)"
	ValDisplay K12, pos={165,567.5}, size={60,20}, bodywidth=0, value=#"Coagulation_wave_12[5]", fsize=12, format="%4.3g"
//
//
//////////////////////////////////////
// Graph coagulation coefficient
	Button Graph_coagulation_coefficient_button,pos={50, 600}, size={200, 25}, proc=Graph_coagulation_coefficient_button, title="\Z14Graph coagulation coefficient",fcolor=(0, 65535, 0)
//
//
//////////////////////////////////////
// Graph coagulation efficiency
	Button Graph_coagulation_efficiency_button,pos={50, 635}, size={200, 25}, proc=Graph_coagulation_efficiency_button, title="\Z14Graph coagulation efficiency",fcolor=(0, 65535, 0)
//
//
//////////////////////////////////////
// Compare Fuchs Dahneke button
	Button Compare_Fuchs_Dahneke_coagulation_button,pos={50, 670}, size={200, 25}, proc=Do_Compare_Fuchs_Dahneke_coagulation_button, title="\Z14Compare Fuchs and Dahneke",fcolor=(0, 65535, 0)
//
//
//////////////////////////////////////
// Coagulate size distribution button
	Button Coagulate_size_distribution_button,pos={60, 705}, size={180, 25}, proc=Do_Coagulate_size_distribution_button, title="\Z14Coagulate size distribution",fcolor=(0, 65535, 0)
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Coagulation_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:



// This provides the control for SetVariables in Coagulation_panel by updating everything
//		shown in that panel whenever Dp1, Dp2, rho1, or rho2 is changed.
//
// Version history:
//		There are no previous versions.
//
//
// Explanation of call parameters: none
//
//
// Quantities required for function: Dp1_input, Dp2_input, rho1_input, rho2_input, coagulation_accommodation_coefficient_input
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Coagulation_panel only (when a SetVariable is changed)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		Calculate_all_stuff_for_properties_panels()
	EndIF
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Coagulation_information_button(Coagulation_information_button_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-04-24
//
//
// Description: This calls xxxxxxxx when the 
//		Kn_Cunningham_relations_info_button is hit in panel Kn_Cunningham_relations_panel.
//
//	
// Version history: there are no previous versions
//
// Explanation of call parameters: Coagulation_information_button_Struct
//		is the structure for this button control
//
// Quantities required for function: none
//
// Variables calculated in function: none
//
// Waves created in function: none
//
// Free waves created in function: none
//
// Calls: Print_Coagulation_info
//
// Calls required previously: none
//
// Called by: Make_Coaguatlionxxxxx_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Coagulation_information_button_Struct
//
//
	If (Coagulation_information_button_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Coagulation_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Coagulation_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2020-06-01
//
//
// Description: This prints information on the coagulation panel xxxxxxxx Make_Kn_Cunningham_relations_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Coagulation_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Coagulation_info_text	
//
//
	Coagulation_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Coagulation_info_text = Coagulation_info_text + "Coagulation Information\r"
	Coagulation_info_text = Coagulation_info_text + "------------------------\r\r"
//
	Coagulation_info_text = Coagulation_info_text + "THIS NEEDS TO BE DONE\r\r"
//
	Coagulation_info_text = Coagulation_info_text + "The calculations here are based on the C\r"
	Coagulation_info_text = Coagulation_info_text + "   from \r\r"
//
	Coagulation_info_text = Coagulation_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Coagulation_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(650,100,1350,370)/N=Coagulation_info_notebook
	Notebook Coagulation_info_notebook, text=Coagulation_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Choose_Fuchs_or_Dahneke_coagulation(Choose_Fuchs_or_Dahneke_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-02-11
//
//
// Description: This provides the control for the check boxes for the choice of 
//		Fuchs or Dahneke for the coagulation kernel, or setting it equal to unity.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Choose_Fuchs_or_Dahneke_box tells whether the box is checked for using the Fuchs or 
//		the Dahneke expression for the coagulation kernel, or for setting it equal to unity
//
//
// Quantities required for function: none
// Variables calculated in function: Fuchs_or_Dahneke_value
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_coagulation_panel (when checkbox for Fuchs or Dahneke is selected)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& Choose_Fuchs_or_Dahneke_box
	NVAR Fuchs_or_Dahneke_value
//
//
//	determine if Fuchs or Dahneke box is checked
	StrSwitch (Choose_Fuchs_or_Dahneke_box.ctrlName)
		Case "Fuchs_coagulation":
			Fuchs_or_Dahneke_value=1
			break
//
		Case "Dahneke_coagulation":
			Fuchs_or_Dahneke_value=2
			break
//
		Case "beta_coag_eq_1":
			Fuchs_or_Dahneke_value=3
			break
	EndSwitch
//
//
Calculate_all_stuff_for_properties_panels() // I could call only Calculate_coagulation_quantities,
//		but then I would have to declare and pass all the variables
//
//
//	reset Fuchs and Dahneke checkboxes
	CheckBox Fuchs_coagulation,value=Fuchs_or_Dahneke_value==1
	CheckBox Dahneke_coagulation,value=Fuchs_or_Dahneke_value==2
	CheckBox beta_coag_eq_1,value=Fuchs_or_Dahneke_value==3
//
//
Return 0
//
//
End
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This calculates the coagulation coefficient as formulated by Fuchs (1964) and by Dahneke (1983).
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:




// eee include charges on particles !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


// calculations done in MKS; values reported in different units

// this calculates properties of a particle with diameter DDpp to display in the panel
//// This calculates properties of the behavior in air of a spherical particle with a given diameter,
//	including the Knudsen number, Cunningham correction, friction, diffusivity, and electrical mobility. 

//

// variables in call statement
Variable Dp1, Dp2, rho1, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa
// Dp1, Dp2 in nm
// rho1, rho2 in g/cm^3
//
//
/////////////// declare other variables needed
Variable air_mean_free_path_nm, air_dynamic_viscosity, k_Boltzmann, TempK
Variable Kn1, Kn2, Cunn1, Cunn2
Variable mass1, mass2, diffusivity1, diffusivity2, c_bar1, c_bar2
Variable lambda_particle_1, lambda_particle_2, g_particle_1, g_particle_2, Kn12
Variable Dp12, rho12, mass12
Variable beta12_Fuchs, beta12_Dahneke, beta12, K12
//
//
Variable Acunn, Bcunn, Ccunn
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
k_Boltzmann=1.380649e-23 // J/K
TempK=TempC+273.15
//
//
air_mean_free_path_nm=Calculate_air_mean_free_path(TempC, Pres_hPa)
Kn1=2*air_mean_free_path_nm/Dp1 // Dp1 is in nm
Kn2=2*air_mean_free_path_nm/Dp2 // Dp2 is in nm
//
Cunn1=1+Kn1*(Acunn+Bcunn*exp(-Ccunn/Kn1))
Cunn2=1+Kn2*(Acunn+Bcunn*exp(-Ccunn/Kn2))
//
mass1=Pi/6*(rho1*1e3)*(Dp1*1e-9)^3 // kg
mass2=Pi/6*(rho2*1e3)*(Dp2*1e-9)^3 // kg
//
c_bar1=sqrt(8/Pi*k_Boltzmann*TempK/mass1) // m/s
c_bar2=sqrt(8/Pi*k_Boltzmann*TempK/mass2) // m/s
//
air_dynamic_viscosity=Calculate_air_dynamic_viscosity(TempC, Pres_hPa) // kg/m/s
diffusivity1=k_Boltzmann*TempK*Cunn1/3/Pi/(Dp1*1e-9)/air_dynamic_viscosity // m^2/s
diffusivity2=k_Boltzmann*TempK*Cunn2/3/Pi/(Dp2*1e-9)/air_dynamic_viscosity // m^2/s
//
lambda_particle_1=8/Pi*diffusivity1/c_bar1*1e9 // nm, this is from Fuchs, 1964
lambda_particle_2=8/Pi*diffusivity2/c_bar2*1e9 // nm
//
g_particle_1=1/3/Dp1/lambda_particle_1*((Dp1+lambda_particle_1)^3-(Dp1^2+lambda_particle_1^2)^1.5)-Dp1 // nm, this is from Fuchs, 1964
g_particle_2=1/3/Dp2/lambda_particle_2*((Dp2+lambda_particle_2)^3-(Dp2^2+lambda_particle_2^2)^1.5)-Dp2 // nm
//
Dp12=(Dp1^3 + Dp2^3)^(1/3) // nm
rho12=(rho1*Dp1^3 + rho2*Dp2^3)/(Dp1^3 + Dp2^3) // g/cm^3
mass12=mass1 + mass2 // kg
//
//
// eeee shouldn't I use mean free path from Fuchs above?
Kn12=4*(diffusivity1+diffusivity2)/sqrt(c_bar1^2+c_bar2^2)/(Dp1+Dp2)/1e-9 // from Dahneke (1983)
// p. 294 Fuchs: K12=Pi*(Dp1+Dp2)*(diffusivity1+diffusivity2) eee

beta12_Fuchs=1/(1/(1+2*sqrt(g_particle_1^2+g_particle_2^2)/(Dp1+Dp2)) + 2*Kn12/coagulation_accommodation_coefficient)
// eee where did Fuchs get his Kn12?? - I need to check this
beta12_Dahneke=1/(1/(1+Kn12) + 2*Kn12/coagulation_accommodation_coefficient)


// !!!!!! see Fuchs eq. 49.27


//
//
If (Fuchs_or_Dahneke_value==1) // Fuchs' expression
	beta12=beta12_Fuchs
ElseIf (Fuchs_or_Dahneke_value==2) // Dahneke's expression
	beta12=beta12_Dahneke
ElseIf (Fuchs_or_Dahneke_value==3) // set beta12 = 1
	beta12=1
EndIf
K12=2*Pi*(Dp1+Dp2)*1e-9*(diffusivity1+diffusivity2)*beta12
//
//


//////////	get this figured out
// Kn11_Dahneke=4*diffusivity1/Dp1/1e-9/sqrt(2)/c_bar1 // = Pi/2/sqrt(2)*lambda_Fuchs1/Dp1/1e-9
// beta11_Fuchs=1/(1/(1+2*sqrt(2)*g_Fuchs1)/2/Dp1/1e-9 + Pi/sqrt(2)*lambda_Fuchs1/Dp1/1e-9) // eee check
// K11_Fuchs=8*Pi*Dp1*1e-9*diffusivity1*beta11_Fuchs
//
// Kn22_Dahneke=4*diffusivity2/Dp2/1e-9/sqrt(2)/c_bar2 // = Pi/2/sqrt(2)*lambda_Fuchs1/Dp1/1e-9
// beta22_Fuchs=1/(1/(1+2*sqrt(2)*g_Fuchs2)/2/Dp2/1e-9 + Pi/sqrt(2)*lambda_Fuchs2/Dp2/1e-9) // eee check
// K22_Fuchs=8*Pi*Dp2*1e-9*diffusivity2*beta22_Fuchs
//
// beta11_Dahneke=1/(1/(1+Kn11_Dahneke) + 2*Kn11_Dahneke)
// K11_Dahneke=8*Pi*Dp1*1e-9*diffusivity1*beta11_Dahneke
//
// beta22_Dahneke=1/(1/(1+Kn22_Dahneke) + 2*Kn22_Dahneke)
// K22_Dahneke=8*Pi*Dp2*1e-9*diffusivity2*beta22_Dahneke
//
//
//	Coagulation_wave_12[5]=Kn12_Dahneke // dimensionless
//	Coagulation_wave_12[6]=beta12_Dahneke // dimensionless
//	Coagulation_wave_12[7]=K12_Dahneke*1e6 // /cm^3/s
	// tau12_Fuchs, tau12_Dahneke
	
//////////////////////////////




// make Coagulation_wave
make/O/D/N=7 Coagulation_wave_particle1, Coagulation_wave_particle2
make/O/D/N=6 Coagulation_wave_12
//
Coagulation_wave_particle1[0]=mass1*1e18 //fg
Coagulation_wave_particle1[1]=Kn1
Coagulation_wave_particle1[2]=Cunn1
Coagulation_wave_particle1[3]=diffusivity1 // m^2/s
Coagulation_wave_particle1[4]=c_bar1 // m/s
Coagulation_wave_particle1[5]=lambda_particle_1 // nm
Coagulation_wave_particle1[6]=g_particle_1 // nm
//			
Coagulation_wave_particle2[0]=mass2*1e18 // fg
Coagulation_wave_particle2[1]=Kn2
Coagulation_wave_particle2[2]=Cunn2
Coagulation_wave_particle2[3]=diffusivity2 // m^2/s
Coagulation_wave_particle2[4]=c_bar2 // m/s
Coagulation_wave_particle2[5]=lambda_particle_2 // nm
Coagulation_wave_particle2[6]=g_particle_2 // nm
//
Coagulation_wave_12[0]=Dp12 // nm
Coagulation_wave_12[1]=rho12 // g/cm^3
Coagulation_wave_12[2]=mass12*1e18 // fg
Coagulation_wave_12[3]=Kn12 // dimensionless
Coagulation_wave_12[4]=beta12 // dimensionless
Coagulation_wave_12[5]=K12*1e6 // /cm^3/s
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_coagulation_coefficient_button(Graph_coagulation_coefficient_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2021-11-08
//
//
// Description: This calls Graph_coagulation_coefficient() when the Graph_coagulation_coefficient_button is hit in panel Make_Coagulation_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Graph_coagulation_coefficient_Struct - the structure for this button control
//
// Quantities required for function: none
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: Graph_coagulation_coefficient
// Calls required previously: none
// Called by: Make_Coagulation_panel (when “Graph coagulation coefficient" button hit)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Graph_coagulation_coefficient_Struct
//
//
	If (Graph_coagulation_coefficient_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Graph_coagulation_coefficient()
	EndIf
//
//
Return 0
//
//
End
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_coagulation_coefficient()
//
//
Wave Coagulation_wave_12
//
//
Variable i, ii
Variable Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa
rho1=1
rho2=1
coagulation_accommodation_coefficient=1
TempC=20
Pres_hPa=1013.25
//
//
Make/O/D/N=100 DD_coag_comparison_1=10^(3*x/99)
Make/O/D/N=100 DD_coag_comparison_2=10^(3*x/99)
Make/O/D/N=(numpnts(DD_coag_comparison_1), numpnts(DD_coag_comparison_2)) K12_Fuchs_for_coagulation_graph, Beta_Fuchs_for_coagulation_graph
//
//
For (i=0;i<numpnts(DD_coag_comparison_1);i+=1)
	For (ii=0;ii<numpnts(DD_coag_comparison_2);ii+=1)
		Dp1=DD_coag_comparison_1[i]
		Dp2=DD_coag_comparison_2[ii]
		//
		Fuchs_or_Dahneke_value=1 // Fuchs
		Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)
		K12_Fuchs_for_coagulation_graph[i][ii]=Coagulation_wave_12[5] // in cm^3/s
		beta_Fuchs_for_coagulation_graph[i][ii]=Coagulation_wave_12[4] // dimensionless
	EndFor
EndFor
//
//
Make/O/D/N=101 DD_coag_comparison_1_to_plot_image=10^((x-0.5)/33)
Make/O/D/N=101 DD_coag_comparison_2_to_plot_image=10^((x-0.5)/33)
//
//
////////////////// graph coagulation coefficient
KillWindow/Z Coagulation_coefficient_graph // get rid of previous graph if it exists
Display/K=1/W=(785,100,1235,500) /N=Coagulation_coefficient_graph as "Coagulation coefficient graph"
AppendImage K12_Fuchs_for_coagulation_graph vs {DD_coag_comparison_1_to_plot_image,DD_coag_comparison_2_to_plot_image}
ModifyImage K12_Fuchs_for_coagulation_graph ctab={*,*,Rainbow,0}, log=1
//
AppendMatrixContour K12_Fuchs_for_coagulation_graph vs {DD_coag_comparison_1,DD_coag_comparison_2}
ModifyGraph log=1,mirror=1,standoff=0, fsize=16
ModifyContour K12_Fuchs_for_coagulation_graph autoLevels={6e-10,3e-5,15}, rgbLines=(0,0,0)
ModifyContour ''#0 autoLevels={*,*,0}	// no auto levels
ModifyContour ''#0 moreLevels=0,moreLevels={1e-9,1e-08,1e-07,1e-06,1e-5}
TextBox/C/N=text0/F=2/X=0/Y=0/A=LT "\Z16Coagulation coefficient"
TextBox/C/N=text1/F=2/X=0/Y=0/A=LB "\Z14    K\B12\M\Z14/(cm\S3\M\Z14 s\S-1\M)\Z14\r(\f02ρ\f00\B1\M\Z14 = \f02ρ\f00\B2\M\Z14 = 1 g cm\S-3\M\Z14)"
Label bottom "\Z16Diameter 1/nm"
Label left "\Z16Diameter 2/nm"
SetAxis left 1,1000
SetAxis bottom 1,1000
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_coagulation_efficiency_button(Graph_coagulation_efficiency_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2021-11-08
//
//
// Description: This calls Graph_coagulation_efficiency() when the Graph_coagulation_efficiency_button is hit in panel Make_Coagulation_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Graph_coagulation_efficiency_Struct - the structure for this button control
//
//
// Quantities required for function: none
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: Graph_coagulation_efficiency
// Calls required previously: none
// Called by: Make_Coagulation_panel (when “Graph coagulation efficiency" button hit)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Graph_coagulation_efficiency_Struct
//
//
	If (Graph_coagulation_efficiency_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Graph_coagulation_efficiency()
	EndIf
//
//
Return 0
//
//
End
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_coagulation_efficiency()
//
//
Wave Coagulation_wave_12
//
//
Variable i, ii
Variable Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa
rho1=1
rho2=1
coagulation_accommodation_coefficient=1
TempC=20
Pres_hPa=1013.25
//
//
Make/O/D/N=100 DD_coag_comparison_1=10^(3*x/99)
Make/O/D/N=100 DD_coag_comparison_2=10^(3*x/99)
Make/O/D/N=(numpnts(DD_coag_comparison_1), numpnts(DD_coag_comparison_2)) K12_Fuchs_for_coagulation_graph, Beta_Fuchs_for_coagulation_graph
//



// eee merge this with previous routine, get rid of two buttons


//
For (i=0;i<numpnts(DD_coag_comparison_1);i+=1)
	For (ii=0;ii<numpnts(DD_coag_comparison_2);ii+=1)
		Dp1=DD_coag_comparison_1[i]
		Dp2=DD_coag_comparison_2[ii]
		//
		Fuchs_or_Dahneke_value=1 //Fuchs
		Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)
		K12_Fuchs_for_coagulation_graph[i][ii]=Coagulation_wave_12[5] // cm^3/s
		beta_Fuchs_for_coagulation_graph[i][ii]=Coagulation_wave_12[4] // dimensionless
	EndFor
EndFor
//
//
Make/O/D/N=101 DD_coag_comparison_1_to_plot_image=10^((x-0.5)/33)
Make/O/D/N=101 DD_coag_comparison_2_to_plot_image=10^((x-0.5)/33)
//
//
////////////////// graph coagulation efficiency
KillWindow/Z Coagulation_efficiency_graph // get rid of previous graph if it exists
Display/K=1/W=(785,550,1235,950) /N=Coagulation_efficiency_graph as "Coagulation efficiency graph"
AppendImage beta_Fuchs_for_coagulation_graph vs {DD_coag_comparison_1_to_plot_image,DD_coag_comparison_2_to_plot_image}
ModifyImage beta_Fuchs_for_coagulation_graph ctab={*,*,Rainbow,0}, log=1
//
AppendMatrixContour Beta_Fuchs_for_coagulation_graph vs {DD_coag_comparison_1,DD_coag_comparison_2}
ModifyGraph log=1,mirror=1,standoff=0, fsize=16
ModifyContour beta_Fuchs_for_coagulation_graph manLevels={0,0,0}, moreLevels=0,moreLevels={0.01, 0.02, 0.05, 0.1, 0.2, 0.4, 0.6, 0.8, 0.9}, rgbLines=(0,0,0)
TextBox/C/N=text0/F=2/X=0/Y=0/A=LT "\Z16Coagulation efficiency\Z14, \f02β\f00\B12\M\Z14  (\f02ρ\f00\B1\M\Z14 = \f02ρ\f00\B2\M\Z14 = 1 g cm\S-3\M\Z14)"
Label bottom "\Z16Diameter 1/nm"
Label left "\Z16Diameter 2/nm"
SetAxis left 1,1000
SetAxis bottom 1,1000
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Compare_Fuchs_Dahneke_coagulation_button(Compare_Fuchs_Dahneke_coagulation_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-12-03
//
//
// Description: This calls Compare_Fuchs_Danheke_coagulation() when the Compare_Fuchs_Dahneke_coagulation_button is hit in panel Make_Coagulation_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Compare_Fuchs_Dahneke_coagulation_Struct - the structure for this button control
//
//
// Quantities required for function: none
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: Compare_Fuchs_Danheke_coagulation
// Calls required previously: none
// Called by: Make_Coagulation_panel (when “Compare Fuchs and Dahneke" button hit)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Compare_Fuchs_Dahneke_coagulation_Struct
//
//
	If (Compare_Fuchs_Dahneke_coagulation_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Compare_Fuchs_Danheke_coagulation()
	EndIf
//
//
Return 0
//
//
End
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Compare_Fuchs_Danheke_coagulation()
//
//
Wave Coagulation_wave_12
//
//
Variable i, ii
Variable Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa
rho1=1
rho2=1
coagulation_accommodation_coefficient=1
TempC=20
Pres_hPa=1013.25
//
//
Make/O/D/N=100 DD_coag_comparison_1=10^(3*x/99)
Make/O/D/N=100 DD_coag_comparison_2=10^(3*x/99)
Make/O/D/N=(numpnts(DD_coag_comparison_1), numpnts(DD_coag_comparison_2)) K12_Fuchs_for_coag_comparison, K12_Dahneke_for_coag_comparison, pct_DK12_Dahneke_Fuchs
//
//
For (i=0;i<numpnts(DD_coag_comparison_1);i+=1)
	For (ii=0;ii<numpnts(DD_coag_comparison_2);ii+=1)
		Dp1=DD_coag_comparison_1[i]
		Dp2=DD_coag_comparison_2[ii]
		//
		Fuchs_or_Dahneke_value=1 // Fuchs
		Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)
		K12_Fuchs_for_coag_comparison[i][ii]=Coagulation_wave_12[5]
		//
		Fuchs_or_Dahneke_value=2 // Dahneke
		Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)
		K12_Dahneke_for_coag_comparison[i][ii]=Coagulation_wave_12[5]
	EndFor
EndFor
pct_DK12_Dahneke_Fuchs=100*(K12_Dahneke_for_coag_comparison/K12_Fuchs_for_coag_comparison-1)
//
//
Make/O/D/N=101 DD_coag_comparison_1_to_plot_image=10^((x-0.5)/33)
Make/O/D/N=101 DD_coag_comparison_2_to_plot_image=10^((x-0.5)/33)
//
//
////////////////// graph comparison
KillWindow/Z Fuchs_Dahneke_comparison_graph // get rid of previous graph if it exists
Display/K=1/W=(1250,100,1700,500) /N=Fuchs_Dahneke_comparison_graph as "Fuchs-Dahneke comparison"
AppendImage pct_DK12_Dahneke_Fuchs vs {DD_coag_comparison_1_to_plot_image,DD_coag_comparison_2_to_plot_image}
ModifyImage pct_DK12_Dahneke_Fuchs ctab={*,*,Rainbow,0}
//
AppendMatrixContour pct_DK12_Dahneke_Fuchs vs {DD_coag_comparison_1,DD_coag_comparison_2}
ModifyContour pct_DK12_Dahneke_Fuchs autoLevels={-5,5,11}, rgbLines=(0,0,0)
ModifyGraph log=1,mirror=1,standoff=0, fsize=16
Label bottom "\Z16Diameter 1/nm"
Label left "\Z16Diameter 2/nm"
SetAxis left 1,1000
SetAxis bottom 1,1000
TextBox/C/N=text0/F=2/X=0/Y=0/F=0/A=LB "\Z16    % difference\rDahneke vs Fuchs\Z14\r  (\f02ρ\f00\B1\M\Z14 = \f02ρ\f00\B2\M\Z14 = 1 g cm\S-3\M\Z14)"
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Coagulate_size_distribution_button(Coagulate_size_distribution_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-12-03
//
//
// Description: This calls Coagulate_size_distribution() when the Coagulate_size_distribution_button is hit in panel Make_Coagulation_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Coagulate_size_distribution_Struct - the structure for this button control
//
//
// Quantities required for function: none
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: Compare_Fuchs_Danheke_coagulation
// Calls required previously: none
// Called by: Make_Coagulation_panel (when “Coagulate size distribution" button hit)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Coagulate_size_distribution_Struct
//
//
	If (Coagulate_size_distribution_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Coagulate_size_distribution()
	EndIf
//
//
Return 0
//
//
End
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Coagulate_size_distribution()
//
//
// written by Ernie Lewis
// last revision 2026-09-30
// Thanks to Tim Onasch for many helpful discussions.
//
// Description: This creates a size distribution and calculates its evolution through coagulation.
// It is assumed that the particles are spherical.
// The initial size distribution, dNdlogD_0, is the sum of up to three user-selected lognormal modes.
// The diameter wave is DD, which is logarithmically spaced with equal values of dlogD.
// The input values Dmin and Dmax refer to the lower endpoint of the first bin and the 
//		upper endpoint of the last bin.
// The coagulation coefficient K12 describes the rate of coagulation of two sets of particles:
//		those with diameter d1 and concentration N1, and those with diameter d2 and concentration N2.
// The number concentration in bin i is dNdlogD[i]*dlogD[i].
// Coagulation of a particle from a smaller bin [i] with that from a larger bin [j>i] results in 
//		a loss of particle number -K12 * dNdlogD[i]*dlogD[i] * dNdlogD[j]*dlogD[j].
// Thus, the change in dNdlogD at a given time step has only one factor of dlogD, as the 
//		loss of number in that bin is dNdlogD[i]*dlogD[i].
// The diameter of the resulting particle is calculated assuming the volumes of the two particles
//		add to comprise the volume of the new particle.
// It is assumed that smaller particles are lost during coagulation.
// As smaller particles are coagulated on larger particles (or those of the same size), only the 
//		diagonal values and those above are required for K12 and thus these are the only ones that
//		are calculated, saving some time in calculations (although most of the time is in the coagulation.
// The initial and final number concentrations are printed, as is the ratio of the final to initial mass,
//		the latter as a diagnostic of the accuracy of the routine; there will be some loss of mass when a
//		smaller particle coagulates with a larger one but does not cause it to move into the next highest size bin.
//
//
// Version history: The current version is amended from a previous one which to take into account the fact
//		that Dmin and Dmax should be boundaries of bins, not midpoints, as was implicitly implied.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Calculate_coagulation_quantities()
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
////////////////// make initial size distribution
/////////////// set defaults for lognormals
	Variable Ntot_1, Ntot_2, Ntot_3, GMD_1, GMD_2, GMD_3, GSD_1, GSD_2, GSD_3
	Ntot_1=5000
	Ntot_2=1000
	Ntot_3=500
//
	GMD_1=10
	GMD_2=50
	GMD_3=150
//
	GSD_1=1.45
	GSD_2=1.45
	GSD_3=1.45
//
//
	Prompt Ntot_1, "Enter number concentration for first lognormal: "
	Prompt Ntot_2, "Enter number concentration for second lognormal: "
	Prompt Ntot_3, "Enter number concentration for third lognormal: "
//
	Prompt GMD_1, "Enter geometric mean diameter for first lognormal: "
	Prompt GMD_2, "Enter geometric mean diameter for second lognormal: "
	Prompt GMD_3, "Enter geometric mean diameter for third lognormal: "
//
	Prompt GSD_1, "Enter geometric standard deviation for first lognormal: "
	Prompt GSD_2, "Enter geometric standard deviation for second lognormal: "
	Prompt GSD_3, "Enter geometric standard deviation for third lognormal: "
//
	DoPrompt "Enter coefficients for lognormals", Ntot_1, Ntot_2, Ntot_3, GMD_1, GMD_2, GMD_3, GSD_1, GSD_2, GSD_3
	If (V_Flag)
		Return -1 // user cancelled
	EndIF
//
//
/////////////// set defaults for bins
	Variable Nbins, Dmin, Dmax, dlogD
	Nbins=100
	Dmin=1 // nm
	Dmax=1000 // nm
//
//
	Prompt Nbins, "Enter number of bins (logarithmically spaced): "
	Prompt Dmin, "Enter Dmin (smallest limit of smallest bin): "
	Prompt Dmax, "Enter Dmax (largest limit of largest bin): "
	DoPrompt "Enter Nbins, Dmin, Dmax", Nbins, Dmin, Dmax
	If (V_Flag)
		Return -1 // user cancelled
	EndIF
//
//
////////// make lognormal
	dlogD=log(Dmax/Dmin)/Nbins
	Make/O/D/N=(Nbins) DD=Dmin*10^((x+1/2)*dlogD) // these are the geometric midpoints of the bins
//
	Make/O/D/N=(Nbins) dNdlogD_1, dNdlogD_2, dNdlogD_3, dNdlogD
	dNdlogD_1=Ntot_1/sqrt(2*Pi)*ln(10)/ln(GSD_1)*exp(-0.5*(ln(DD/GMD_1)/ln(GSD_1))^2)
	dNdlogD_2=Ntot_2/sqrt(2*Pi)*ln(10)/ln(GSD_2)*exp(-0.5*(ln(DD/GMD_2)/ln(GSD_2))^2)
	dNdlogD_3=Ntot_3/sqrt(2*Pi)*ln(10)/ln(GSD_3)*exp(-0.5*(ln(DD/GMD_3)/ln(GSD_3))^2)
	dNdlogD=dNdlogD_1 + dNdlogD_2 + dNdlogD_3
//
//
	Duplicate/O dNdlogD, dNdlogD_0 // dNdlogD_0 is the starting value, which remains unchanged
//
//
	Variable Ntot_0, Ntot
	Ntot_0=sum(dNdlogD_0)*dlogD
//
//
/////////////// set defaults for other quantities
	Variable coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa, rhorho
	coagulation_accommodation_coefficient=1
	Fuchs_or_Dahneke_value=1 // Fuchs
	TempC=20
	Pres_hPa=1013.25
	rhorho=1 // g/cm^3; this is the density of each particle - they are all the same
//
//
	Prompt coagulation_accommodation_coefficient, "Enter accommodation coefficient: "
	Prompt Fuchs_or_Dahneke_value, "Enter Fuchs (1) or Dahneke (2) formulation: "
	Prompt TempC, "Enter temperature (deg C): "
	Prompt Pres_hPa, "Enter pressure (hPa): "
	Prompt rhorho, "Enter density of particles (g/cm^3): "
	DoPrompt "Enter coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa, rhorho", coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa, rhorho
	If (V_Flag)
		Return -1 // user cancelled
	EndIF
//
//
/////////////////// make coagulation kernel matrix
	Make/O/D/N=1 Coagulation_wave_12 // this will be recreated later
	Variable i_D1, i_D2
	Variable Dp1, rho1, Dp2, rho2
	rho1=rhorho // both densities should be the same
	rho2=rhorho // both densities should be the same
//
//
// make coagulation kernel matrix; only the diagonal and values above it are required
	Make/O/D/N=(Nbins, Nbins) KK12=0 // I would have used K12, but that is reserved in Igor
	For (i_D1=0;i_D1<Nbins;i_D1+=1)
		For (i_D2=i_D1;i_D2<Nbins;i_D2+=1) // only calculate on diagonal or above
			Dp1=DD[i_D1]
			Dp2=DD[i_D2]
			//
			Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)
			KK12[i_D1][i_D2]=Coagulation_wave_12[5] // in cm^3/s
		EndFor
	EndFor
//
//
/////////////// set defaults for time step and duration
	Variable time_step=60 // sec, time step
	Variable time_tot=24 // default, total time, in hrs
	Prompt time_tot, "Enter the total time, in hours (time step is 1 minute): "
	DoPrompt "Enter total time, in hours", time_tot
	If (V_Flag)
		Return -1 // user cancelled
	EndIF
//
//
	Variable i_min, i_hrs
	Variable i_small_D, i_large_D
	Variable new_D, i_new_D
	Variable coagulated_number // used in loop, this is the number coagulated and moved to the next bin in a timestep
//
//
/////////////////////////////
// propagate forward in time
	For (i_hrs=1;i_hrs<=time_tot;i_hrs+=1)
		For (i_min=1; i_min<=60; i_min+=1) // scan over time steps
			For (i_small_D=0;i_small_D<(Nbins-1);i_small_D+=1) // scan over small particles
				For (i_large_D=i_small_D;i_large_D<(Nbins);i_large_D+=1) // scan over larger particles, start with coagulation in same bin
//					calculate number of coagulations, remove from small size bin
					coagulated_number=KK12[i_small_D][i_large_D]*dNdlogD[i_small_D]*dNdlogD[i_large_D]*dlogD^2*time_step
					dNdlogD[i_small_D]=dNdlogD[i_small_D]-coagulated_number/dlogD // remove number from small size
//					see what bin new coagulated particle will end up in, move out of large_D and into new_D if growth is sufficient
					new_D=(DD[i_small_D]^3 + DD[i_large_D]^3)^(1/3)
					i_new_D=trunc(log(new_D/DD[0])/dlogD) // this is the bin that the combination will end up in
					If (i_new_D >= Nbins-1) // in case new particle size is out of range
						i_new_D=Nbins-1 // put all in last bin
					EndIf
					If (i_new_D != i_large_D)
						dNdlogD[i_large_D]=dNdlogD[i_large_D]-coagulated_number/dlogD // remove number from large bin
						dNdlogD[i_new_D]=dNdlogD[i_new_D]+coagulated_number/dlogD // move large bin particles into new bin
					EndIf
				EndFor
			EndFor
		EndFor
	EndFor
//
//
//////////////////////// number concentration loss due to coagulation:
	Ntot=sum(dNdlogD)*dlogD
	String pct_N_loss=num2str(100*(1-Ntot/Ntot_0))
//
//
//////////////////////// mass conservation check:
	Make/O/D/N=(Nbins) mass_0=Pi/6*DD^3*dNdlogD_0
	Make/O/D/N=(Nbins) mass_Ttot=Pi/6*DD^3*dNdlogD
	String pct_mass_loss=num2str(100*(1- sum(mass_Ttot)/sum(mass_0)))
//
//
//////////////////////// graph
	Killwindow/Z Coagulated_size_distribution_graph
	Display /W=(50,100,650,450) /N=Coagulated_size_distribution_graph
	AppendtoGraph dNdlogD_0, dNdlogD vs DD
	ModifyGraph log(bottom)=1,mirror=1,fSize=20,standoff=0,AxThick=2
	SetAxis bottom Dmin, Dmax
	Label left "\Z20Size distribution, \f02dN\f00/\f02d\f00log\f02D\f00"
	Label bottom "\Z20Diameter/nm"
	ModifyGraph rgb=(0,0,0), lstyle(dNdlogD)=1, lsize=2
	TextBox/C/N=text0/F=0/A=RT/X=5/Y=5 "\Z20\s(dNdlogD_0)\f02dN\f00/\f02d\f00log\f02D\f00 (0)\r\s(dNdlogD)\f02dN\f00/\f02d\f00log\f02D\f00 (" + num2str(time_tot) + " hrs)"
//
//
//////////////////////// print results
	String Coagulate_size_distribution_info_text
//
//
	Coagulate_size_distribution_info_text = "------------------------ Top of page ------------------------\r\r"
//	
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "Waves available (" + num2str(Nbins) + " points in each): DD, dNdlogD_0, dNdlogD\r\r"
//
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "Initial N_tot = " + num2str(Ntot_0) + "/cm^3; final N_tot = " + num2str(Ntot) + "/cm^3; reduction = " + pct_N_loss + " %.\r\r"
//
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "The loss of mass resulting from the coagulation calculations is " + pct_mass_loss + " %.\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "Mass is not conserved during the calculations because a coagulated particle\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "   might not have sufficient mass to be moved into the next larger size bin.\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "The amount of mass loss can be reduced by selecting more bins, but at a cost of\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "   increased computational time, which is directly proportional to N_bin^2.\r\r"
//
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "Mass loss was investigated by running the routine using the default conditions\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "   with a total coagulation time of 24 hours, but with different numbers of bins:\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "      for  100 bins, the mass loss is 1.2 %,\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "      for  200 bins, the mass loss is 0.9 %,\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "      for  500 bins, the mass loss is 0.6 %,\r"
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "      for 1000 bins, the mass loss is 0.44 % (but it takes a few minutes to run).\r\r"
//	
	Coagulate_size_distribution_info_text = Coagulate_size_distribution_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Coagulate_size_distribution_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(50,500,650,835)/N=Coagulate_size_distribution_notebook
	Notebook Coagulate_size_distribution_notebook, text= Coagulate_size_distribution_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Charging_efficiencies_for_equal_Dmob_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:




// this displays a table of charging efficiencies for particles with the same mobility diameter but different charges.
//
//
/////////////////////////////////////
//	make charging efficiencies panel
	KillWindow/Z Charging_efficiencies_for_equal_Dmob_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(475,100,1390,465) /N=Charging_efficiencies_for_equal_Dmob_panel as "Charging Efficiencies for Equal Dmob"
//
//
/////////////////////////////////////
//	set up title box
	TitleBox Charging_efficiencies_for_equal_Dmob_title title="\Z22Charging Efficiencies for Particles with Equal D\Bmob", pos={215, 5}, size={490, 100}, fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// group which charging type box
	GroupBox Whose_charging_efficiencies_for_equal_Dmob_box pos={215, 47.5}, size={485, 25}, labelBack=(65535, 50000, 50000)
	CheckBox Wiedensohler_charging_for_equal_Dmob, pos={230, 50},size={20,20},title="\Z14Wiedensohler",proc=Whose_charging_efficiencies_for_equal_Dmob_proc,value=1,mode=1
	CheckBox Fuchs_charging_for_equal_Dmob, pos={350,50},size={20,20},title="\Z14Fuchs",proc=Whose_charging_efficiencies_for_equal_Dmob_proc,value=0,mode=1
	CheckBox Gopalakrishnan_charging_for_equal_Dmob, pos={420,50},size={20,20},title="\Z14Gopalakrishnan et al.",proc=Whose_charging_efficiencies_for_equal_Dmob_proc,value=0,mode=1
	CheckBox Tigges_charging_for_equal_Dmob, pos={590,50},size={20,20},title="\Z14Tigges et al.",proc=Whose_charging_efficiencies_for_equal_Dmob_proc,value=0,mode=1
//
//
/////////////////////////////////////
// set up Charging efficiencies info button
	Button Charging_efficiencies_for_equal_Dmob_info_button,pos={440,275},size={40,40},proc=Do_Charging_efficiencies_for_equal_Dmob_info_button,title="\Z24i",fcolor=(50000,50000,65535) // eee this has to be done
//
//
////////////////////////////
	DrawText 15, 90, "\Z16q=-6"
	DrawText 70, 90, "\Z16q=-5"
	DrawText 125, 90, "\Z16q=-4"
	DrawText 180, 90, "\Z16q=-3"
	DrawText 235, 90, "\Z16q=-2"
	DrawText 290, 90, "\Z16q=-1"
	DrawText 347.5, 90, "\Z16q=0"
//	
	DrawLine 395, 90, 395, 260
	Drawline 520, 90, 520, 260
//
	DrawText 537.5, 90, "\Z16q=0"
	DrawText 587.5, 90, "\Z16q=+1"
	DrawText 642.5, 90, "\Z16q=+2"
	DrawText 697.5, 90, "\Z16q=+3"
	DrawText 752.5, 90, "\Z16q=+4"
	DrawText 807.5, 90, "\Z16q=+5"
	DrawText 862.5, 90, "\Z16q=+6"
//
//
/////////////////////////////////////
	GroupBox group_Dp_equal_Dmob_inputs pos={405,80}, size={105,185}, labelBack=(65535, 50000, 50000)
//
	DrawText 412.5, 110, "\Z16D\B1\M\Z16:"
	SetVariable Dp_1, pos={437.5,87.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_1, value=Diameter_actual_Q[1], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_equal_Dmob_panel
//
	DrawText 412.5, 140, "\Z16D\B2\M\Z16:"
	SetVariable Dp_2, pos={437.5,117.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_2, value=Diameter_actual_Q[2], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_equal_Dmob_panel
//
	DrawText 412.5, 170, "\Z16D\B3\M\Z16:"
	SetVariable Dp_3, pos={437.5,147.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_3, value=Diameter_actual_Q[3], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_equal_Dmob_panel
//
	DrawText 412.5, 200, "\Z16D\B4\M\Z16:"
	SetVariable Dp_4, pos={437.5,177.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_4, value=Diameter_actual_Q[4], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_equal_Dmob_panel
//
	DrawText 412.5, 230, "\Z16D\B5\M\Z16:"
	SetVariable Dp_5, pos={437.5,207.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_5, value=Diameter_actual_Q[5], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_equal_Dmob_panel
//
	DrawText 412.5, 260, "\Z16D\B6\M\Z16:"
	SetVariable Dp_6, pos={437.5,237.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_6, value=Diameter_actual_Q[6], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_equal_Dmob_panel
//
//
////////////////////////////////////
// fill in boxes for charging efficiencies for each diameter
//
// actual_Q=1
	ValDisplay Qeff_Dp1_n6, pos={10,90}, size={45,20}, bodyWidth=0, value=#"Qeff_n1[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_n5, pos={65,90}, size={45,20}, bodyWidth=0, value=#"Qeff_n1[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_n4, pos={120,90}, size={45,20}, bodyWidth=0, value=#"Qeff_n1[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_n3, pos={175,90}, size={45,20}, bodyWidth=0, value=#"Qeff_n1[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_n2, pos={230,90}, size={45,20}, bodyWidth=0, value=#"Qeff_n1[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_n1, pos={285,90}, size={45,20}, bodyWidth=0, value=#"Qeff_n1[1]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_n0, pos={340,90}, size={45,20}, bodyWidth=0, value=#"Qeff_n1[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp1_p0, pos={530,90}, size={45,20}, bodyWidth=0, value=#"Qeff_p1[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_p1, pos={585,90}, size={45,20}, bodyWidth=0, value=#"Qeff_p1[1]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_p2, pos={640,90}, size={45,20}, bodyWidth=0, value=#"Qeff_p1[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_p3, pos={695,90}, size={45,20}, bodyWidth=0, value=#"Qeff_p1[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_p4, pos={750,90}, size={45,20}, bodyWidth=0, value=#"Qeff_p1[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_p5, pos={805,90}, size={45,20}, bodyWidth=0, value=#"Qeff_p1[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp1_p6, pos={860,90}, size={45,20}, bodyWidth=0, value=#"Qeff_p1[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=2
	ValDisplay Qeff_Dp2_n6, pos={10,120}, size={45,20}, bodyWidth=0, value=#"Qeff_n2[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_n5, pos={65,120}, size={45,20}, bodyWidth=0, value=#"Qeff_n2[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_n4, pos={120,120}, size={45,20}, bodyWidth=0, value=#"Qeff_n2[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_n3, pos={175,120}, size={45,20}, bodyWidth=0, value=#"Qeff_n2[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_n2, pos={230,120}, size={45,20}, bodyWidth=0, value=#"Qeff_n2[2]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_n1, pos={285,120}, size={45,20}, bodyWidth=0, value=#"Qeff_n2[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_n0, pos={340,120}, size={45,20}, bodyWidth=0, value=#"Qeff_n2[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp2_p0, pos={530,120}, size={45,20}, bodyWidth=0, value=#"Qeff_p2[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_p1, pos={585,120}, size={45,20}, bodyWidth=0, value=#"Qeff_p2[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_p2, pos={640,120}, size={45,20}, bodyWidth=0, value=#"Qeff_p2[2]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_p3, pos={695,120}, size={45,20}, bodyWidth=0, value=#"Qeff_p2[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_p4, pos={750,120}, size={45,20}, bodyWidth=0, value=#"Qeff_p2[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_p5, pos={805,120}, size={45,20}, bodyWidth=0, value=#"Qeff_p2[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp2_p6, pos={860,120}, size={45,20}, bodyWidth=0, value=#"Qeff_p2[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=3
	ValDisplay Qeff_Dp3_n6, pos={10,150}, size={45,20}, bodyWidth=0, value=#"Qeff_n3[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_n5, pos={65,150}, size={45,20}, bodyWidth=0, value=#"Qeff_n3[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_n4, pos={120,150}, size={45,20}, bodyWidth=0, value=#"Qeff_n3[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_n3, pos={175,150}, size={45,20}, bodyWidth=0, value=#"Qeff_n3[3]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_n2, pos={230,150}, size={45,20}, bodyWidth=0, value=#"Qeff_n3[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_n1, pos={285,150}, size={45,20}, bodyWidth=0, value=#"Qeff_n3[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_n0, pos={340,150}, size={45,20}, bodyWidth=0, value=#"Qeff_n3[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp3_p0, pos={530,150}, size={45,20}, bodyWidth=0, value=#"Qeff_p3[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_p1, pos={585,150}, size={45,20}, bodyWidth=0, value=#"Qeff_p3[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_p2, pos={640,150}, size={45,20}, bodyWidth=0, value=#"Qeff_p3[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_p3, pos={695,150}, size={45,20}, bodyWidth=0, value=#"Qeff_p3[3]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_p4, pos={750,150}, size={45,20}, bodyWidth=0, value=#"Qeff_p3[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_p5, pos={805,150}, size={45,20}, bodyWidth=0, value=#"Qeff_p3[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp3_p6, pos={860,150}, size={45,20}, bodyWidth=0, value=#"Qeff_p3[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=4
	ValDisplay Qeff_Dp4_n6, pos={10,180}, size={45,20}, bodyWidth=0, value=#"Qeff_n4[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_n5, pos={65,180}, size={45,20}, bodyWidth=0, value=#"Qeff_n4[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_n4, pos={120,180}, size={45,20}, bodyWidth=0, value=#"Qeff_n4[4]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_n3, pos={175,180}, size={45,20}, bodyWidth=0, value=#"Qeff_n4[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_n2, pos={230,180}, size={45,20}, bodyWidth=0, value=#"Qeff_n4[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_n1, pos={285,180}, size={45,20}, bodyWidth=0, value=#"Qeff_n4[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_n0, pos={340,180}, size={45,20}, bodyWidth=0, value=#"Qeff_n4[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp4_p0, pos={530,180}, size={45,20}, bodyWidth=0, value=#"Qeff_p4[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_p1, pos={585,180}, size={45,20}, bodyWidth=0, value=#"Qeff_p4[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_p2, pos={640,180}, size={45,20}, bodyWidth=0, value=#"Qeff_p4[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_p3, pos={695,180}, size={45,20}, bodyWidth=0, value=#"Qeff_p4[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_p4, pos={750,180}, size={45,20}, bodyWidth=0, value=#"Qeff_p4[4]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_p5, pos={805,180}, size={45,20}, bodyWidth=0, value=#"Qeff_p4[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp4_p6, pos={860,180}, size={45,20}, bodyWidth=0, value=#"Qeff_p4[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=5
	ValDisplay Qeff_Dp5_n6, pos={10,210}, size={45,20}, bodyWidth=0, value=#"Qeff_n5[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_n5, pos={65,210}, size={45,20}, bodyWidth=0, value=#"Qeff_n5[5]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_n4, pos={120,210}, size={45,20}, bodyWidth=0, value=#"Qeff_n5[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_n3, pos={175,210}, size={45,20}, bodyWidth=0, value=#"Qeff_n5[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_n2, pos={230,210}, size={45,20}, bodyWidth=0, value=#"Qeff_n5[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_n1, pos={285,210}, size={45,20}, bodyWidth=0, value=#"Qeff_n5[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_n0, pos={340,210}, size={45,20}, bodyWidth=0, value=#"Qeff_n5[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp5_p0, pos={530,210}, size={45,20}, bodyWidth=0, value=#"Qeff_p5[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_p1, pos={585,210}, size={45,20}, bodyWidth=0, value=#"Qeff_p5[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_p2, pos={640,210}, size={45,20}, bodyWidth=0, value=#"Qeff_p5[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_p3, pos={695,210}, size={45,20}, bodyWidth=0, value=#"Qeff_p5[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_p4, pos={750,210}, size={45,20}, bodyWidth=0, value=#"Qeff_p5[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_p5, pos={805,210}, size={45,20}, bodyWidth=0, value=#"Qeff_p5[5]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp5_p6, pos={860,210}, size={45,20}, bodyWidth=0, value=#"Qeff_p5[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=6
	ValDisplay Qeff_Dp6_n6, pos={10,240}, size={45,20}, bodyWidth=0, value=#"Qeff_n6[6]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_n5, pos={65,240}, size={45,20}, bodyWidth=0, value=#"Qeff_n6[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_n4, pos={120,240}, size={45,20}, bodyWidth=0, value=#"Qeff_n6[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_n3, pos={175,240}, size={45,20}, bodyWidth=0, value=#"Qeff_n6[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_n2, pos={230,240}, size={45,20}, bodyWidth=0, value=#"Qeff_n6[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_n1, pos={285,240}, size={45,20}, bodyWidth=0, value=#"Qeff_n6[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_n0, pos={340,240}, size={45,20}, bodyWidth=0, value=#"Qeff_n6[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp6_p0, pos={530,240}, size={45,20}, bodyWidth=0, value=#"Qeff_p6[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_p1, pos={585,240}, size={45,20}, bodyWidth=0, value=#"Qeff_p6[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_p2, pos={640,240}, size={45,20}, bodyWidth=0, value=#"Qeff_p6[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_p3, pos={695,240}, size={45,20}, bodyWidth=0, value=#"Qeff_p6[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_p4, pos={750,240}, size={45,20}, bodyWidth=0, value=#"Qeff_p6[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_p5, pos={805,240}, size={45,20}, bodyWidth=0, value=#"Qeff_p6[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp6_p6, pos={860,240}, size={45,20}, bodyWidth=0, value=#"Qeff_p6[6]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
//
//
//////////////////////////////////
// print information on waves that can be used
	DrawText 35, 285, "\Z14The waves \K(65535,0,0)Q_efficiencies_for_equal_Dmob_neg \K(0,0,0)and"
	DrawText 35, 300, "\Z14\K(65535,0,0)Q_efficiencies_for_equal_Dmob_pos \K(0,0,0)contain the values"
	DrawText 35, 315, "\Z14in red, with the [0] value set to 0."
	DrawText 555, 285, "\Z14The wave \K(0,0,65535)Diameter_actual_Q \K(0,0,0)contains the diameters,"
	DrawText 555, 300, "\Z14 with the [0] value set to 0."
//
//
	DrawText 65, 340, "\Z14Wiedensohler (1988), Gopalakrishnan et al. (2013), and Tigges et al. (2015) calculate efficiencies for q = -2, -1, 0, 1, and 2;"
	DrawText 65, 360, "\Z14       those for |q| > 2 are from Gunn and Woessner (1956). Fuchs (1964) calculates all of them."
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Charging_efficiencies_for_equal_Dmob_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:



// this updates the panel Charging_efficiencies_for_equal_Dmob_panel

//
// Description:
// This provides the control for SetVariables in Charging_efficiencies_for_equal_Dmob_panel by updating everything
//		shown in that panel whenever an input is changed.
//
// Version history:
//		There are no previous versions.
//
//
// Explanation of call parameters: none
//
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
// declare waves used
	Wave Diameter_equal_mobility, Diameter_actual_Q
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, "Diameter_actual_Q[1]") == 0)
			Calculate_Dq_equal_mobility_as_Dq_actual(Diameter_actual_Q[1], 1) // calculate diameters of particles with same mobility diameter
		EndIf
//
		If (cmpstr(ctrlName.vName, "Diameter_actual_Q[2]") == 0)
			Calculate_Dq_equal_mobility_as_Dq_actual(Diameter_actual_Q[2], 2) // calculate diameters of particles with same mobility diameter
		EndIf
//
		If (cmpstr(ctrlName.vName, "Diameter_actual_Q[3]") == 0)
			Calculate_Dq_equal_mobility_as_Dq_actual(Diameter_actual_Q[3], 3) // calculate diameters of particles with same mobility diameter
		EndIf
//
		If (cmpstr(ctrlName.vName, "Diameter_actual_Q[4]") == 0)
			Calculate_Dq_equal_mobility_as_Dq_actual(Diameter_actual_Q[4], 4) // calculate diameters of particles with same mobility diameter
		EndIf
//
		If (cmpstr(ctrlName.vName, "Diameter_actual_Q[5]") == 0)
			Calculate_Dq_equal_mobility_as_Dq_actual(Diameter_actual_Q[5], 5) // calculate diameters of particles with same mobility diameter
		EndIf
//
		If (cmpstr(ctrlName.vName, "Diameter_actual_Q[6]") == 0)
			Calculate_Dq_equal_mobility_as_Dq_actual(Diameter_actual_Q[6], 6) // calculate diameters of particles with same mobility diameter
		EndIf
		Diameter_actual_Q=Diameter_equal_mobility
		Calculate_charging_efficiencies_for_equal_Dmob()
	EndIf
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Charging_efficiencies_for_equal_Dmob_info_button(Charging_efficiencies_for_equal_Dmob_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-08-28
//
//
// Description: This calls Print_Charging_efficiencies_for_equal_Dmob_info which prints information on the charging information for equal Dmob.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Charging_efficiencies_for_equal_Dmob_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Charging_efficiencies_for_equal_Dmob_info()
//
// Calls required previously: none
//
// Called by: Make_Charging_efficiencies_for_equal_Dmob_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Charging_efficiencies_for_equal_Dmob_info_Struct
//
//
	If (Charging_efficiencies_for_equal_Dmob_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Charging_efficiencies_for_equal_Dmob_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Charging_efficiencies_for_equal_Dmob_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-08-28
//
//
// Description: This prints information on the charging efficiencies for the same Dmob displayed in the Make_Charging_efficiencies_for_equal_Dmob_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Charging_efficiencies_for_equal_Dmob_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Charging_efficiencies_for_equal_Dmob_info_text
//
//
	Charging_efficiencies_for_equal_Dmob_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Charging_efficiencies_for_equal_Dmob_info_text = Charging_efficiencies_for_equal_Dmob_info_text + "Charging efficiencies for equal Dmob information\r"
	Charging_efficiencies_for_equal_Dmob_info_text = Charging_efficiencies_for_equal_Dmob_info_text + "------------------------------------------------\r\r"
//
	Charging_efficiencies_for_equal_Dmob_info_text = Charging_efficiencies_for_equal_Dmob_info_text + "THIS NEEDS TO BE DONE\r\r"
//
	Charging_efficiencies_for_equal_Dmob_info_text = Charging_efficiencies_for_equal_Dmob_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Charging_efficiencies_for_equal_Dmob_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(475,500,1390,800)/N=Charging_efficiencies_for_equal_Dmob_info_notebook
	Notebook Charging_efficiencies_for_equal_Dmob_info_notebook, text=Charging_efficiencies_for_equal_Dmob_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Whose_charging_efficiencies_for_equal_Dmob_proc(Whose_charging_efficiencies_for_equal_Dmob_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-02-11
//
//
// Description: This provides the control for the check boxes in the 
//		Make_Charging_efficiencies_for_equal_Dmob_panel for the choice of charging efficiencies from
//		Wiedensohler, Fuchs, Gopalakrishnan et al., or Tigges et al.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Whose_charging_efficiencies_for_equal_Dmob_box tells whether the box is checked for Wiedensohler, Gopalakrishnan, or Tigges
//		charging of aerosol particles
//
//
// Quantities required for function: none
// Variables calculated in function: Which_charging_efficiencies
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Charging_efficiencies_for_equal_Dmob_panel (when checkbox for Wiedensohler, Gopalakrishnan, or Tigges charging is selected)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& Whose_charging_efficiencies_for_equal_Dmob_box
	NVAR Whose_charging_efficiencies_for_equal_Dmob
//
//
//	determine whose charging efficiencies box is checked
	StrSwitch (Whose_charging_efficiencies_for_equal_Dmob_box.ctrlName)
		Case "Wiedensohler_charging_for_equal_Dmob":
			Whose_charging_efficiencies_for_equal_Dmob=1 // Wiedensohler
			Break
//
		Case "Fuchs_charging_for_equal_Dmob":
			Whose_charging_efficiencies_for_equal_Dmob=2 // Fuchs
			Break
//
		Case "Gopalakrishnan_charging_for_equal_Dmob":
			Whose_charging_efficiencies_for_equal_Dmob=3 // Gopalakrishnan et al.
			Break
//
		Case "Tigges_charging_for_equal_Dmob":
			Whose_charging_efficiencies_for_equal_Dmob=4 // Tigges et al.
			Break
	EndSwitch
//
//
	Calculate_charging_efficiencies_for_equal_Dmob()
//
//
//	reset whose charging effiencies checkboxes
	CheckBox Wiedensohler_charging_for_equal_Dmob,value=Whose_charging_efficiencies_for_equal_Dmob==1
	CheckBox Fuchs_charging_for_equal_Dmob,value=Whose_charging_efficiencies_for_equal_Dmob==2
	CheckBox Gopalakrishnan_charging_for_equal_Dmob,value=Whose_charging_efficiencies_for_equal_Dmob==3
	CheckBox Tigges_charging_for_equal_Dmob,value=Whose_charging_efficiencies_for_equal_Dmob==4
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Dq_equal_mobility_as_Dq_actual(Dq_actual, Q_actual)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This calculates the wave of diameters Diameter_equal_mobility that have the same
//		mobility diameter as a particle with diameter Dq_actual and charge Q_actual.
// It uses an iterative routine, with the Cunningham correction from 
// 	Kim, J. H., G. W. Mulholland, S. R. Kukuck, and D. Y. H. Pui (2005), 
//			Slip correction measurements of certified PSL nanoparticles using a nanometer 
//			differential mobility analyzer (Nano-DMA) for Knudsen number from 0.5 to 83, 
//			J. Res. NIST, 110, 31-54.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: Dq_actual is the particle diameter, Q_actual is the charge
//		on the particle.
//
// Quantities required for function: Dq_actual, Q_actual, TempC, Pres_hPa
// Variables calculated in function: q, i, air_mean_free_path_nm, Kn_actual_Q, Cunn_actual_Q, XX_actual_Q
// Waves created in function: Kn_equal_mobility, Diameter_equal_mobility
// Free waves created in function: Kn_udated
// Calls: Calculate_air_mean_free_path
// Calls required previously: ??
// Called by: various routines
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//
//
/////////////// declare variables in call statement
	Variable Dq_actual, Q_actual
//
//
/////////////// declare other variables and waves needed
	NVAR TempC_input, P_hPa_input
	Variable TempC, Pres_hPa
	TempC=TempC_input
	Pres_hPa=P_hPa_input
//
//
	Variable q, i, air_mean_free_path_nm, Kn_actual_Q, Cunn_actual_Q, XX_actual_Q
	Variable Acunn, Bcunn, Ccunn
//
//
	Acunn = 1.165
	Bcunn = 0.483
	Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
	air_mean_free_path_nm=Calculate_air_mean_free_path(TempC, Pres_hPa)
	Kn_actual_Q=2*air_mean_free_path_nm/Dq_actual
	Cunn_actual_Q=1+Kn_actual_Q*(Acunn+Bcunn*exp(-Ccunn/Kn_actual_Q)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
	XX_actual_Q=Kn_actual_Q*Cunn_actual_Q
//
//
// the equation to be solved is XX_equal_mobility==Kn_equal_mobility*Cunn_equal_mobility=XX_actual_Q*Q_actual/q_equal_mobility
//	attempt to solve it by Newton's method, with starting guess given by my approximation
//		that is, iterate on Kn_equal_mobility(i+1) = Kn_equal_mobility(i) - stuff
//		where stuff = (dXX_equal_mobility/dKn_equal_mobility)/(XX_equal_mobility-XX_actual*Q_actual/q_equal_mobility)
//
// Kn_equal_mobility(i+1)=Kn_equal_mobility-(Kn_equal_mobility*Cunn_equal_mobility-XX_actual_Q*Q_actual/q_equal_mobility)/(dXX_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility*(dXX_equal_mobility/dKn_equal_mobility)-Kn_equal_mobility*Cunn_equal_mobility+XX_actual_Q*Q_actual/q_equal_mobility)/(dXX_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility^2*(dCunn_equal_mobility/dKn_equal_mobility)+XX_actual_Q*Q_actual/q_equal_mobility)/(Cunn_equal_mobility+Kn_equal_mobility*dCunn_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility^2*(1.165+0.483*exp(-0.997/Kn_equal_mobility)) + Kn_equal_mobility*0.483*0.997*exp(-0.997/Kn_equal_mobility))+XX_actual_Q*Q_actual/q_equal_mobility)/(Cunn_equal_mobility+Kn_equal_mobility*dCunn_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility^2*(1.165+0.483*exp(-0.997/Kn_equal_mobility)) + Kn_equal_mobility*0.483*0.997*exp(-0.997/Kn_equal_mobility))+XX_actual_Q*Q_actual/q_equal_mobility)/(1+2*Kn_equal_mobility*(1.165+0.483*exp(-0.997/Kn_equal_mobility))+0.483*0.997*exp(-0.997/Kn_equal_mobility))
//
//
// calculate wave of diameters with same mobility diameter as particle with charge Q_actual
// that is, diam_1 has one charge with the same mobility diameter, diam_2 has two charges...
	Make/O/D/N=7 Kn_equal_mobility, Diameter_equal_mobility
	Make/O/D/N=7/Free Kn_updated
//
//
// find starting guess
	For (q=1;q<7;q+=1)
		Kn_equal_mobility[q]=XX_actual_Q*Q_actual/q/(1+(1.648*XX_actual_Q*Q_actual/q)^(1.67/2))^(1/1.67) // my approximation
	EndFor
//
//
// iterate to get solution (Newton's method)
	For (i=1;i<=10;i+=1) // iterate 10 times; this is overkill
// eee add another variable here
		Kn_updated[]=(Kn_equal_mobility^2*(Acunn+Bcunn*exp(-Ccunn/Kn_equal_mobility)) + Kn_equal_mobility*Bcunn*Ccunn*exp(-Ccunn/Kn_equal_mobility)+XX_actual_Q*Q_actual/p)/(1+2*Kn_equal_mobility*(Acunn+Bcunn*exp(-Ccunn/Kn_equal_mobility))+Bcunn*Ccunn*exp(-Ccunn/Kn_equal_mobility))
		Kn_equal_mobility=Kn_updated
	EndFor
//
//
	Diameter_equal_mobility=2*air_mean_free_path_nm/Kn_equal_mobility // this is the wave that has diameters of the same mobility
	Diameter_equal_mobility[0]=0 // to have a value in the [0] position
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_charging_efficiencies_for_equal_Dmob()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:



//
// this calculates the charging efficiencies for diameters given by the wave Diameter_actual_Q with multiple charges
//
//
	NVAR TempC_input, Whose_charging_efficiencies_for_equal_Dmob
	Variable i, TempC, Whose_charging_efficiencies
	TempC=TempC_input
	Whose_charging_efficiencies=Whose_charging_efficiencies_for_equal_Dmob
	Wave Diameter_actual_Q 
	Make/O/D/N=7 Qeff_neg, Qeff_pos
	Make/O/D/N=7 Qeff_n1, Qeff_n2, Qeff_n3, Qeff_n4, Qeff_n5, Qeff_n6
	Make/O/D/N=7 Qeff_p1, Qeff_p2, Qeff_p3, Qeff_p4, Qeff_p5, Qeff_p6
//
//
	For (i=1;i<7;i+=1)
		Calculate_charging_efficiencies(Diameter_actual_Q[i], TempC, Whose_charging_efficiencies)
		If (i==1)
			Qeff_n1=Qeff_neg
			Qeff_p1=Qeff_pos
		EndIf
		If (i==2)
			Qeff_n2=Qeff_neg
			Qeff_p2=Qeff_pos
		EndIf
		If (i==3)
			Qeff_n3=Qeff_neg
			Qeff_p3=Qeff_pos
		EndIf
		If (i==4)
			Qeff_n4=Qeff_neg
			Qeff_p4=Qeff_pos
		EndIf
		If (i==5)
			Qeff_n5=Qeff_neg
			Qeff_p5=Qeff_pos
		EndIf
		If (i==6)
			Qeff_n6=Qeff_neg
			Qeff_p6=Qeff_pos
		EndIf
	EndFor
//
//
//////////////////
// make waves Q_efficiencies_for_equal_Dmob_neg and Q_efficiencies_for_equal_Dmob_pos
	Make/O/D/N=7 Q_efficiencies_for_equal_Dmob_neg
	Q_efficiencies_for_equal_Dmob_neg[0]=0
	Q_efficiencies_for_equal_Dmob_neg[1]=Qeff_n1[1]
	Q_efficiencies_for_equal_Dmob_neg[2]=Qeff_n2[2]
	Q_efficiencies_for_equal_Dmob_neg[3]=Qeff_n3[3]
	Q_efficiencies_for_equal_Dmob_neg[4]=Qeff_n4[4]
	Q_efficiencies_for_equal_Dmob_neg[5]=Qeff_n5[5]
	Q_efficiencies_for_equal_Dmob_neg[6]=Qeff_n6[6]
//
//
	Make/O/D/N=7 Q_efficiencies_for_equal_Dmob_pos
	Q_efficiencies_for_equal_Dmob_pos[0]=0
	Q_efficiencies_for_equal_Dmob_pos[1]=Qeff_p1[1]
	Q_efficiencies_for_equal_Dmob_pos[2]=Qeff_p2[2]
	Q_efficiencies_for_equal_Dmob_pos[3]=Qeff_p3[3]
	Q_efficiencies_for_equal_Dmob_pos[4]=Qeff_p4[4]
	Q_efficiencies_for_equal_Dmob_pos[5]=Qeff_p5[5]
	Q_efficiencies_for_equal_Dmob_pos[6]=Qeff_p6[6]
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_charging_efficiencies(D_for_Qeff, TempC, Whose_charging_efficiencies)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2022-03-07
//
//
// Description: This calculates the charging efficiencies of an aerosol particle with diameter D_for_Qeff in nm for various charges. 
// There are four options: Wiedensohler, Fuchs, Gopalakrishnan et al., and Tigges et al.
//
//		Wiedensohler, A. (1988), J. Aerosol Sci., 19(3): 387-389, with coefficients in Table 1 on p. 388.
// 		Wiedensohler (1988) used an 85Kr source.
// 		There are two typographic errors, which are corrected here. 
//			A. Wiedensohler stated in an email to me on 2016-09-16 that the coefficients a4 for N=1 and a5 for N=2
//				were incorrect in the paper, but are correct in the TSI manual.
// 		These values are also given (correctly) in the TSI handbook, equations B-2, B-3, and also in Wiedensohler (2012, 2019).
//
//		Fuchs (1964), The Mechanics of Aerosols, p. 113.
//
//		Gopalakrishnan, R., M. J. Meredith, C. Larriba-Andaluz, and C. J. Hogan, Jr. (2013), Brownian dynamics determination
//			of the bipolar stead state charge distribution on spheres and non-spheres in the transition regime, J. Aerosol Sci., 
//			63, 126-145.
//		They did Brownian motion simulations.
//		The values are givn in Table 2, p. 140 and Eq. 10, p. 143.
//
//		Tigges L., A. Wiedensohler, K. Weinhold, J. Gandhi, and H.-J. Schmidt (2015), Bipolar charge distribution of a 
//			soft X-ray diffusion source, J. Aerosol Sci., 90, 77-86, with coefficients in Table 3 on p. 83.
//
// Fuchs calculates efficiencies for all charges.
// Wiedensohler, Gopalakrishnan et al., and Tigges et al. calculate efficiencies for q = -2, -1, 0, 1, and 2, 
//		and for |q| > 2, the expressions in Gunn and Woessner (1956) are used.
//
// Wiedensohler (1988) state that there wasn't a big temperature dependence for Q=1, 2, -1, -2, 
//		and the expressions don't have any; HOWEVER, there is still a temperature dependence for higher charges.
//
// Note that the sum of the efficiencies doesn't always add to unity.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: D_for_Qeff is the input diameter in nm, TempC is the temperature
//		Whose_charging_efficiencies = 1 is Wiedensohler, 2 is Fuchs, 3 is Gopalakrishnan et al., 4 is Tigges et al.
//
// Quantities required for function: D_for_Qeff, TempC, Whose_charging_efficiencies
// Variables calculated in function: TempK, DDD
// Waves created in function: Qeff_neg, Qeff_pos
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: various programs
// Return: 0
//
//
////////////////////////////////////////////////////////////////
// declare variables in call statement
	Variable D_for_Qeff, TempC, Whose_charging_efficiencies // I named it D_for_Qeff as there would be less likelihood that that name had been used (unlike Dp)
//
//
////////////////////////////////////////////////////////////////
// declare other variables and waves
	Variable TempK, e0, e_charge, k_Boltzmann, DDD
	TempK=TempC+273.15
	e0=8.8542e-12 // C^2 s^2 /kg /m^3
	e_charge=1.602176634e-19 // C
	k_Boltzmann=1.380649e-23 // J/K
//
//
	DDD=e_charge^2/(2*Pi*e0*k_Boltzmann*TempK)*1e9 // D in nm; this = 112.1 nm at 25 °C and 114.0 at 20 °C- what is the physics behind this? It is the distance at which the electrical energy is equal to the thermal energy?
	// eee is it the distance between two electrons whose energy is the same as the thermal energy?
	
//
	Make/O/D/N=7 Qeff_neg, Qeff_pos
	Variable SumFuchs
//
//
// Calculate charging efficiencies
	If (Whose_charging_efficiencies == 1) // Wiedensohler
		Qeff_neg[2]=10^(-26.3328+35.9044*(log(D_for_Qeff))-21.4608*(log(D_for_Qeff))^2+7.0867*(log(D_for_Qeff))^3-1.3088*(log(D_for_Qeff))^4+0.1051*(log(D_for_Qeff))^5)
		Qeff_neg[1]=10^(-2.3197+0.6175*(log(D_for_Qeff))+0.6201*(log(D_for_Qeff))^2-0.1105*(log(D_for_Qeff))^3-0.1260*(log(D_for_Qeff))^4+0.0297*(log(D_for_Qeff))^5)
		Qeff_neg[0]=10^(-0.0003-0.1014*(log(D_for_Qeff))+0.3073*(log(D_for_Qeff))^2-0.3372*(log(D_for_Qeff))^3+0.1023*(log(D_for_Qeff))^4-0.0105*(log(D_for_Qeff))^5)
 		Qeff_pos[0] = Qeff_neg[0]
 		Qeff_pos[1]=10^(-2.3484+0.6044*(log(D_for_Qeff))+0.4800*(log(D_for_Qeff))^2+0.0013*(log(D_for_Qeff))^3-0.1553*(log(D_for_Qeff))^4+0.0320*(log(D_for_Qeff))^5)
		Qeff_pos[2]=10^(-44.4756+79.3772*(log(D_for_Qeff))-62.8900*(log(D_for_Qeff))^2+26.4492*(log(D_for_Qeff))^3-5.7480*(log(D_for_Qeff))^4+0.5049*(log(D_for_Qeff))^5)
//
	ElseIf (Whose_charging_efficiencies == 3) // Gopalakrishnan
		Qeff_neg[2] = exp(-45.405 + 20.049*ln(D_for_Qeff) - 3.0579*(ln(D_for_Qeff))^2 + 0.1534*(ln(D_for_Qeff))^3)
		Qeff_neg[1] = exp(-7.8696 + 3.1036*ln(D_for_Qeff) - 0.4557*(ln(D_for_Qeff))^2 + 0.0187*(ln(D_for_Qeff))^3)
		Qeff_neg[0] = exp(-0.3880 + 0.4545*ln(D_for_Qeff) - 0.1634*(ln(D_for_Qeff))^2 + 0.0091*(ln(D_for_Qeff))^3)
		Qeff_pos[0]=Qeff_neg[0]
		Qeff_pos[1] = exp(-8.0157 + 3.2536*ln(D_for_Qeff) - 0.5018*(ln(D_for_Qeff))^2 + 0.0223*(ln(D_for_Qeff))^3)
		Qeff_pos[2]= exp(-40.714 + 17.487*ln(D_for_Qeff) - 2.6146*(ln(D_for_Qeff))^2 + 0.1282*(ln(D_for_Qeff))^3)
//
///////////// not used here (yet), but this is for nonconducting
// Table 4, p. 142 (nonconducting), and Eq. 10, p. 143
// Gopal_neg_2[ii] = exp(-63.185 + 26.833*ln(dd) - 3.8723*(ln(dd))^2 + 0.1835*(ln(dd))^3)
// Gopal_neg_1[ii] = exp(-16.801 + 7.5947*ln(dd) - 1.1975*(ln(dd))^2 + 0.059*(ln(dd))^3)
// Gopal_neg_0[ii] = exp(-1.212 + 1.1068*ln(dd) - 0.2934*(ln(dd))^2 + 0.0169*(ln(dd))^3)
// Gopal_pos_0[ii]=Gopal_neg_0[ii]
// Gopal_pos_1[ii] = exp(-16.704 + 7.5438*ln(dd) - 1.1938*(ln(dd))^2 + 0.0589*(ln(dd))^3)
// Gopal_pos_2[ii]= exp(-71.051 + 31.209*ln(dd) - 4.6696*(ln(dd))^2 + 0.2301*(ln(dd))^3)
//
//
	ElseIf (Whose_charging_efficiencies == 4) // Tigges
		Qeff_neg[2]=10^(-30.61558+46.33885*log(D_for_Qeff)-31.18191*(log(D_for_Qeff))^2+11.39070*(log(D_for_Qeff))^3-2.22028*(log(D_for_Qeff))^4+0.17935*(log(D_for_Qeff))^5)
		Qeff_neg[1]=10^(-2.33509+0.43635*log(D_for_Qeff)+1.08654*(log(D_for_Qeff))^2-0.55679*(log(D_for_Qeff))^3+0.04981*(log(D_for_Qeff))^4+0.00551*(log(D_for_Qeff))^5)
		Qeff_neg[0]=10^(0.00163-0.11384*log(D_for_Qeff)+0.33393*(log(D_for_Qeff))^2-0.35714*(log(D_for_Qeff))^3+0.10770*(log(D_for_Qeff))^4-0.01082*(log(D_for_Qeff))^5)
		Qeff_pos[0]=Qeff_neg[0]
		Qeff_pos[1]=10^(-2.35889+0.45169*log(D_for_Qeff)+0.99798*(log(D_for_Qeff))^2-0.48173*(log(D_for_Qeff))^3+0.02631*(log(D_for_Qeff))^4+0.00804*(log(D_for_Qeff))^5)
		Qeff_pos[2]=10^(-27.25320+38.47963*log(D_for_Qeff)-24.27128*(log(D_for_Qeff))^2+8.44162*(log(D_for_Qeff))^3-1.60589*(log(D_for_Qeff))^4+0.12917*(log(D_for_Qeff))^5)
	EndIf
//
//
// Calculate charging efficienies for |q|>2 from Gunn and Woessner for Wiedensohler, Gopalakrishnan et al., and Tigges et al.
	Qeff_neg[3]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(-3-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
	Qeff_neg[4]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(-4-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
	Qeff_neg[5]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(-5-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
	Qeff_neg[6]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(-6-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
//
	Qeff_pos[3]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(3-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
	Qeff_pos[4]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(4-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
	Qeff_pos[5]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(5-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
	Qeff_pos[6]=1/sqrt(2*Pi)*sqrt(DDD/D_for_Qeff)*exp(-(6-D_for_Qeff/DDD*ln(0.875))^2/(2*D_for_Qeff/DDD))
//
// calculate charging efficiencies for Fuchs
	If (Whose_charging_efficiencies == 2)
		SumFuchs=2*exp(-36/2*DDD/D_for_Qeff) + 2*exp(-25/2*DDD/D_for_Qeff) + 2*exp(-16/2*DDD/D_for_Qeff) + 2*exp(-9/2*DDD/D_for_Qeff) + 2*exp(-4/2*DDD/D_for_Qeff) + 2*exp(-1/2*DDD/D_for_Qeff) + 1
		Qeff_neg[6]=exp(-36/2*DDD/D_for_Qeff)/SumFuchs
		Qeff_pos[6]=Qeff_neg[6]
		Qeff_neg[5]=exp(-25/2*DDD/D_for_Qeff)/SumFuchs
		Qeff_pos[5]=Qeff_neg[5]
		Qeff_neg[4]=exp(-16/2*DDD/D_for_Qeff)/SumFuchs
		Qeff_pos[4]=Qeff_neg[4]
		Qeff_neg[3]=exp(-9/2*DDD/D_for_Qeff)/SumFuchs
		Qeff_pos[3]=Qeff_neg[3]
		Qeff_neg[2]=exp(-4/2*DDD/D_for_Qeff)/SumFuchs
		Qeff_pos[2]=Qeff_neg[2]
		Qeff_neg[1]=exp(-1/2*DDD/D_for_Qeff)/SumFuchs
		Qeff_pos[1]=Qeff_neg[1]
		Qeff_neg[0]=1/SumFuchs
		Qeff_pos[0]=Qeff_neg[0]
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Make_Charging_efficiencies_for_same_Dp_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:


// this displays a table of charging efficiencies for a particle of given diameter with different charges.
//
//
/////////////////////////////////////
//	make charging efficiency panel
	KillWindow/Z Charging_efficiencies_for_same_Dp_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(475,510,1390,875) /N=Charging_efficiencies_for_same_Dp_panel as "Charging Efficiencies for Particles with Same Dp"
//
//
/////////////////////////////////////
//	set up title box
	TitleBox Charging_efficiencies_for_same_Dp_title title="\Z22Charging Efficiencies for Particles with Same D\Bp\M\Z22 but Different Charges", pos={125, 5}, size={800, 100}, fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// group which charging type box
	GroupBox Whose_charging_efficiencies_for_same_Dp_box pos={215, 47.5}, size={485, 25}, labelBack=(65535, 50000, 50000)
	CheckBox Wiedensohler_charging_for_same_Dp, pos={230, 50},size={20,20},title="\Z14Wiedensohler",proc=Whose_charging_efficiencies_for_same_Dp_proc,value=1,mode=1
	CheckBox Fuchs_charging_for_same_Dp, pos={350,50},size={20,20},title="\Z14Fuchs",proc=Whose_charging_efficiencies_for_same_Dp_proc,value=0,mode=1
	CheckBox Gopalakrishnan_charging_for_same_Dp, pos={420,50},size={20,20},title="\Z14Gopalakrishnan et al.",proc=Whose_charging_efficiencies_for_same_Dp_proc,value=0,mode=1
	CheckBox Tigges_charging_for_same_Dp, pos={590,50},size={20,20},title="\Z14Tigges et al.",proc=Whose_charging_efficiencies_for_same_Dp_proc,value=0,mode=1
//
//
/////////////////////////////////////
// set up Charging efficiencies info button
	Button Charging_efficiencies_info_button,pos={440,275},size={40,40},proc=Do_Charging_efficiencies_for_same_Dp_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
////////////////////////////
	DrawText 15, 90, "\Z16q=-6"
	DrawText 70, 90, "\Z16q=-5"
	DrawText 125, 90, "\Z16q=-4"
	DrawText 180, 90, "\Z16q=-3"
	DrawText 235, 90, "\Z16q=-2"
	DrawText 290, 90, "\Z16q=-1"
	DrawText 347.5, 90, "\Z16q=0"
//	
	DrawLine 395, 90, 395, 260
	Drawline 520, 90, 520, 260
//
	DrawText 537.5, 90, "\Z16q=0"
	DrawText 587.5, 90, "\Z16q=+1"
	DrawText 642.5, 90, "\Z16q=+2"
	DrawText 697.5, 90, "\Z16q=+3"
	DrawText 752.5, 90, "\Z16q=+4"
	DrawText 807.5, 90, "\Z16q=+5"
	DrawText 862.5, 90, "\Z16q=+6"
//
//
/////////////////////////////////////
	GroupBox group_Dp_various_charges_inputs pos={402.5,80}, size={110,185}, labelBack=(65535, 50000, 50000)
//
	DrawText 410, 110, "\Z16D\Bq6\M\Z16:"
	SetVariable Dp_q_eq_6 pos={440,87.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_q_eq_6, value=Dmob_for_various_Q[6], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_same_Dp_panel
//
	DrawText 410, 140, "\Z16D\Bq5\M\Z16:"
	SetVariable Dp_q_eq_5, pos={440,117.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_q_eq_5, value=Dmob_for_various_Q[5], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_same_Dp_panel
//
	DrawText 410, 170, "\Z16D\Bq4\M\Z16:"
	SetVariable Dp_q_eq_4, pos={440,147.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_q_eq_4, value=Dmob_for_various_Q[4], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_same_Dp_panel
//
	DrawText 410, 200, "\Z16D\Bq3\M\Z16:"
	SetVariable Dp_q_eq_3, pos={440,177.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_q_eq_3, value=Dmob_for_various_Q[3], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_same_Dp_panel
//
	DrawText 410, 230, "\Z16D\Bq2\M\Z16:"
	SetVariable Dp_q_eq_2, pos={440,207.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_q_eq_2, value=Dmob_for_various_Q[2], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_same_Dp_panel
//
	DrawText 410, 260, "\Z16D\Bq1\M\Z16:"
	SetVariable Dp_q_eq_1, pos={440,237.5}, size={65,20}, bodyWidth=0, title=" ", fsize=14, valueColor=(65535, 0, 0)
	SetVariable Dp_q_eq_1, value=Dmob_for_various_Q[1], limits={0.1,inf,1}, format="%5.1f", proc=Update_for_Charging_efficiencies_for_same_Dp_panel
//
//
////////////////////////////////////
// fill in boxes for charging efficiencies for each diameter
//
// actual_Q=1// relabel these
	ValDisplay Qeff_Dp_q_eq_6_n6, pos={10,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6n[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_n5, pos={65,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6n[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_n4, pos={120,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6n[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_n3, pos={175,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6n[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_n2, pos={230,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6n[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_n1, pos={285,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6n[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_n0, pos={340,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6n[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp_q_eq_6_p0, pos={530,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6p[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_p1, pos={585,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6p[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_p2, pos={640,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6p[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_p3, pos={695,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6p[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_p4, pos={750,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6p[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_p5, pos={805,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6p[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_6_p6, pos={860,90}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_6p[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=2
	ValDisplay Qeff_Dp_q_eq_5_n6, pos={10,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5n[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_n5, pos={65,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5n[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_n4, pos={120,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5n[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_n3, pos={175,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5n[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_n2, pos={230,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5n[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_n1, pos={285,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5n[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_n0, pos={340,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5n[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp_q_eq_5_p0, pos={530,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5p[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_p1, pos={585,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5p[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_p2, pos={640,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5p[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_p3, pos={695,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5p[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_p4, pos={750,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5p[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_p5, pos={805,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5p[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_5_p6, pos={860,120}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_5p[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=3
	ValDisplay Qeff_Dp_q_eq_4_n6, pos={10,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4n[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_n5, pos={65,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4n[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_n4, pos={120,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4n[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_n3, pos={175,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4n[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_n2, pos={230,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4n[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_n1, pos={285,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4n[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_n0, pos={340,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4n[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp_q_eq_4_p0, pos={530,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4p[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_p1, pos={585,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4p[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_p2, pos={640,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4p[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_p3, pos={695,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4p[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_p4, pos={750,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4p[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_p5, pos={805,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4p[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_4_p6, pos={860,150}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_4p[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=4
	ValDisplay Qeff_Dp_q_eq_3_n6, pos={10,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3n[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_n5, pos={65,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3n[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_n4, pos={120,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3n[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_n3, pos={175,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3n[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_n2, pos={230,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3n[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_n1, pos={285,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3n[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_n0, pos={340,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3n[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp_q_eq_3_p0, pos={530,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3p[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_p1, pos={585,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3p[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_p2, pos={640,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3p[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_p3, pos={695,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3p[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_p4, pos={750,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3p[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_p5, pos={805,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3p[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_3_p6, pos={860,180}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_3p[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=5
	ValDisplay Qeff_Dp_q_eq_2_n6, pos={10,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2n[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_n5, pos={65,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2n[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_n4, pos={120,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2n[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_n3, pos={175,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2n[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_n2, pos={230,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2n[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_n1, pos={285,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2n[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_n0, pos={340,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2n[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp_q_eq_2_p0, pos={530,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2p[0]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_p1, pos={585,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2p[1]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_p2, pos={640,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2p[2]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_p3, pos={695,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2p[3]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_p4, pos={750,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2p[4]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_p5, pos={805,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2p[5]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_2_p6, pos={860,210}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_2p[6]", fsize=12, valueColor=(0, 0, 0), format="%4.3f"
//
//
// actual_Q=6
	ValDisplay Qeff_Dp_q_eq_1_n6, pos={10,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1n[6]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_n5, pos={65,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1n[5]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_n4, pos={120,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1n[4]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_n3, pos={175,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1n[3]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_n2, pos={230,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1n[2]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_n1, pos={285,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1n[1]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_n0, pos={340,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1n[0]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
//
	ValDisplay Qeff_Dp_q_eq_1_p0, pos={530,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1p[0]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_p1, pos={585,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1p[1]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_p2, pos={640,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1p[2]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_p3, pos={695,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1p[3]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_p4, pos={750,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1p[4]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_p5, pos={805,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1p[5]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
	ValDisplay Qeff_Dp_q_eq_1_p6, pos={860,240}, size={45,20}, bodyWidth=0, value=#"Qeff_Dp_q_eq_1p[6]", fsize=14, valueColor=(65535, 0, 0), format="%4.3f"
//
//
//////////////////////////////////
// print information on waves that can be used
	DrawText 10, 285, "\Z14The waves \K(65535,0,0)Q_efficiencies_for_same_Dp_various_Q_neg \K(0,0,0)"
	DrawText 10, 300, "\Z14and \K(65535,0,0)Q_efficiencies_for_same_Dp_various_Q_pos \K(0,0,0)contain"
	DrawText 10, 315, "\Z14the values in red."
	DrawText 530, 285, "\Z14The wave \K(0,0,65535)Dmob_same_Dp_various_Q \K(0,0,0)contains the"
	DrawText 530, 300, "\Z14mobility diameters, corresponding to D\Bq1\M\Z14 with various"
	DrawText 530, 315, "\Z14charges, with the [0] value set to 0."
//
//
	DrawText 65, 340, "\Z14Wiedensohler (1988), Gopalakrishnan et al. (2013), and Tigges et al. (2015) calculate efficiencies for q = -2, -1, 0, 1, and 2;"
	DrawText 65, 360, "\Z14       those for |q| > 2 are from Gunn and Woessner (1956). Fuchs (1964) calculates all of them."
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Charging_efficiencies_for_same_Dp_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:



// this updates the panel Charging_efficiencies_for_same_Dp_panel

//
// Description:
// This provides the control for SetVariables in Charging_efficiencies_for_same_Dp_panel by updating everything
//		shown in that panel whenever an input is changed.
//
//
// Version history:
//		There are no previous versions.
//
//
// Explanation of call parameters: none
//
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
// declare waves used
	Wave Dmob_same_Dp_various_Q, Dmob_for_various_Q
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, "Dmob_for_various_Q[1]") == 0)
			Calculate_Dmob_for_various_Q(Dmob_for_various_Q[1], 1) // calculate diameters of particles with same Dmob as Dp with various charges
		EndIf
//
		If (cmpstr(ctrlName.vName, "Dmob_for_various_Q[2]") == 0)
			Calculate_Dmob_for_various_Q(Dmob_for_various_Q[2], 2) // calculate diameters of particles with same Dmob as Dp with various charges
		EndIf
//
		If (cmpstr(ctrlName.vName, "Dmob_for_various_Q[3]") == 0)
			Calculate_Dmob_for_various_Q(Dmob_for_various_Q[3], 3) // calculate diameters of particles with same Dmob as Dp with various charges
		EndIf
//
		If (cmpstr(ctrlName.vName, "Dmob_for_various_Q[4]") == 0)
			Calculate_Dmob_for_various_Q(Dmob_for_various_Q[4], 4) // calculate diameters of particles with same Dmob as Dp with various charges
		EndIf
//
		If (cmpstr(ctrlName.vName, "Dmob_for_various_Q[5]") == 0)
			Calculate_Dmob_for_various_Q(Dmob_for_various_Q[5], 5) // calculate diameters of particles with same Dmob as Dp with various charges
		EndIf
//
		If (cmpstr(ctrlName.vName, "Dmob_for_various_Q[6]") == 0)
			Calculate_Dmob_for_various_Q(Dmob_for_various_Q[6], 6) // calculate diameters of particles with same Dmob as Dp with various charges
		EndIf
//
		Dmob_for_various_Q=Dmob_same_Dp_various_Q
		Calculate_charging_efficiencies_for_same_Dp_various_Q()
	EndIf
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////
Function Do_Charging_efficiencies_for_same_Dp_info_button(Charging_efficiencies_for_same_Dp_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-08-28
//
//
// Description: This calls Print_Charging_efficiencies_for_same_Dp_info which prints information on the charging information for a given Dp with different charges.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Charging_efficiencies_for_same_Dp_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Charging_efficiencyies_for_same_Dp_info()
//
// Calls required previously: none
//
// Called by: Make_Charging_efficiencies_for_same_Dp_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Charging_efficiencies_for_same_Dp_info_Struct
//
//
	If (Charging_efficiencies_for_same_Dp_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Charging_efficiencies_for_same_Dp_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Charging_efficiencies_for_same_Dp_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-08-28
//
//
// Description: This prints information on the charging efficiencies for the same Dp but with different charges displayed in the Make_Charging_efficiencies_for_same_Dp_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Charging_efficiencies_for_same_Dp_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Charging_efficiencies_for_same_Dp_info_text
//
//
	Charging_efficiencies_for_same_Dp_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Charging_efficiencies_for_same_Dp_info_text = Charging_efficiencies_for_same_Dp_info_text + "Charging efficiencies for the same Dp with different charges information\r"
	Charging_efficiencies_for_same_Dp_info_text = Charging_efficiencies_for_same_Dp_info_text + "-----------\r\r"
//
	Charging_efficiencies_for_same_Dp_info_text = Charging_efficiencies_for_same_Dp_info_text + "THIS NEEDS TO BE DONE\r\r"
//
	Charging_efficiencies_for_same_Dp_info_text = Charging_efficiencies_for_same_Dp_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Charging_efficiencies_for_same_Dp_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(475,50,1390,315)/N=Charging_efficiencies_for_same_Dp_info_notebook
	Notebook Charging_efficiencies_for_same_Dp_info_notebook, text=Charging_efficiencies_for_same_Dp_info_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Whose_charging_efficiencies_for_same_Dp_proc(Whose_charging_efficiencies_for_same_Dp_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2020-02-11
//
//
// Description: This provides the control for the check boxes in the 
//		Make_Charging_efficiencies_for_same_Dp_panel for the choice of charging efficiencies from
//		Wiedensohler, Gopalakrishnan et al., or Tigges et al.
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Whose_charging_efficiencies_for_same_Dp_box tells whether the box is checked for Wiedensohler, Gopalakrishnan, or Tigges
//
// Quantities required for function: none
// Variables calculated in function: Which_charging_efficiencies
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Charging_efficiencies_for_same_Dp_panel (when checkbox for Wiedensohler, Gopalakrishnan, or Tigges charging is selected)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& Whose_charging_efficiencies_for_same_Dp_box
	NVAR Whose_charging_efficiencies_for_same_Dp
//
//
//	determine whose charging efficiency box is checked
	StrSwitch (Whose_charging_efficiencies_for_same_Dp_box.ctrlName)
		Case "Wiedensohler_charging_for_same_Dp":
			Whose_charging_efficiencies_for_same_Dp=1 // Wiedensohler
			Break
//
		Case "Fuchs_charging_for_same_Dp":
			Whose_charging_efficiencies_for_same_Dp=2 // Fuchs
			Break
//
		Case "Gopalakrishnan_charging_for_same_Dp":
			Whose_charging_efficiencies_for_same_Dp=3 // Gopalakrishnan et al.
			Break
//
		Case "Tigges_charging_for_same_Dp":
			Whose_charging_efficiencies_for_same_Dp=4 // Tigges et al.
			Break
	EndSwitch
//
//
	Calculate_charging_efficiencies_for_same_Dp_various_Q()
//
//
//	reset Whose_charging_efficiencies checkboxes
	CheckBox Wiedensohler_charging_for_same_Dp,value=Whose_charging_efficiencies_for_same_Dp==1
	CheckBox Fuchs_charging_for_same_Dp,value=Whose_charging_efficiencies_for_same_Dp==2
	CheckBox Gopalakrishnan_charging_for_same_Dp,value=Whose_charging_efficiencies_for_same_Dp==3
	CheckBox Tigges_charging_for_same_Dp,value=Whose_charging_efficiencies_for_same_Dp==4
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Dmob_for_various_Q(Dmob_various_Q, Q_actual)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This calculates the wave of diameters Dmob_same_Dp_various_Q that have the same
//		mobility diameter as a particle.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: Calculate_air_mean_free_path
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:



//
/////////////// declare variables in call statement
	Variable Dmob_various_Q, Q_actual
//
//
/////////////// declare other variables and waves needed
	NVAR TempC_input, P_hPa_input
	Variable TempC, Pres_hPa
	TempC=TempC_input
	Pres_hPa=P_hPa_input
//
//
	Variable Acunn, Bcunn, Ccunn
	Acunn = 1.165
	Bcunn = 0.483
	Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
//
//
	Wave Dmob_same_Dp_various_Q
	Variable q, i, air_mean_free_path_nm, Kn_actual_Q, Cunn_actual_Q, XX_actual_Q
//
//
	air_mean_free_path_nm=Calculate_air_mean_free_path(TempC, Pres_hPa)
	Kn_actual_Q=2*air_mean_free_path_nm/Dmob_various_Q
	Cunn_actual_Q=1+Kn_actual_Q*(Acunn+Bcunn*exp(-Ccunn/Kn_actual_Q)) // Kim et al., J. Res. NIST, 110, 31-54, 2005
	XX_actual_Q=Kn_actual_Q*Cunn_actual_Q
//
//


/// ********************* // eee rewrite this explanation
// the equation to be solved is XX_equal_mobility==Kn_equal_mobility*Cunn_equal_mobility=XX_actual_Q*Q_actual/q_equal_mobility
//	attempt to solve it by Newton's method, with starting guess given by my approximation
//		that is, iterate on Kn_equal_mobility(i+1) = Kn_equal_mobility(i) - stuff
//		where stuff = (dXX_equal_mobility/dKn_equal_mobility)/(XX_equal_mobility-XX_actual*Q_actual/q_equal_mobility)
//
// Kn_equal_mobility(i+1)=Kn_equal_mobility-(Kn_equal_mobility*Cunn_equal_mobility-XX_actual_Q*Q_actual/q_equal_mobility)/(dXX_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility*(dXX_equal_mobility/dKn_equal_mobility)-Kn_equal_mobility*Cunn_equal_mobility+XX_actual_Q*Q_actual/q_equal_mobility)/(dXX_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility^2*(dCunn_equal_mobility/dKn_equal_mobility)+XX_actual_Q*Q_actual/q_equal_mobility)/(Cunn_equal_mobility+Kn_equal_mobility*dCunn_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility^2*(1.165+0.483*exp(-0.997/Kn_equal_mobility)) + Kn_equal_mobility*0.483*0.997*exp(-0.997/Kn_equal_mobility))+XX_actual_Q*Q_actual/q_equal_mobility)/(Cunn_equal_mobility+Kn_equal_mobility*dCunn_equal_mobility/dKn_equal_mobility)
// 	= (Kn_equal_mobility^2*(1.165+0.483*exp(-0.997/Kn_equal_mobility)) + Kn_equal_mobility*0.483*0.997*exp(-0.997/Kn_equal_mobility))+XX_actual_Q*Q_actual/q_equal_mobility)/(1+2*Kn_equal_mobility*(1.165+0.483*exp(-0.997/Kn_equal_mobility))+0.483*0.997*exp(-0.997/Kn_equal_mobility))
//
// ***********************
//
// calculate wave of diameters with same mobility diameter as particle with charge Q_actual //eee change
// that is, diam_1 has one charge with the same mobility diameter, diam_2 has two charges... // eee change
	Make/O/D/N=7 Kn_same_Dp_various_Q
	Make/O/D/N=7/Free Kn_updated
//
//
// find starting guess
	For (q=1;q<7;q+=1)
		Kn_same_Dp_various_Q[q]=XX_actual_Q/Q_actual*q/(1+(1.648*XX_actual_Q/Q_actual*q)^(1.67/2))^(1/1.67) // my approximation
	EndFor
//
//
// iterate to get solution (Newton's method)
	For (i=1;i<=10;i+=1) // iterate 10 times, although this is overkill
		Kn_updated[]=(Kn_same_Dp_various_Q^2*(Acunn+Bcunn*exp(-Ccunn/Kn_same_Dp_various_Q)) + Kn_same_Dp_various_Q*Bcunn*Ccunn*exp(-Ccunn/Kn_same_Dp_various_Q)+XX_actual_Q/Q_actual*p)/(1+2*Kn_same_Dp_various_Q*(Acunn+Bcunn*exp(-Ccunn/Kn_same_Dp_various_Q))+Bcunn*Ccunn*exp(-Ccunn/Kn_same_Dp_various_Q))
		Kn_same_Dp_various_Q=Kn_updated
	EndFor
//
//
	Dmob_same_Dp_various_Q=2*air_mean_free_path_nm/Kn_same_Dp_various_Q // this is the wave that has diameters with different charges
	Dmob_same_Dp_various_Q[0]=0 // to have a value in the [0] position
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_charging_efficiencies_for_same_Dp_various_Q()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:




// this calculates the charging efficiencies for diameters given by the wave Dmob_for_various_Q with multiple charges
//
//
	NVAR TempC_input, Whose_charging_efficiencies_for_same_Dp
	Variable i, TempC, Whose_charging_efficiencies
	TempC=TempC_input
	Wave Dmob_for_various_Q
	Whose_charging_efficiencies = Whose_charging_efficiencies_for_same_Dp
	Make/O/D/N=7 Qeff_neg, Qeff_pos
	Make/O/D/N=7 Qeff_Dp_q_eq_1n, Qeff_Dp_q_eq_2n, Qeff_Dp_q_eq_3n, Qeff_Dp_q_eq_4n, Qeff_Dp_q_eq_5n, Qeff_Dp_q_eq_6n
	Make/O/D/N=7 Qeff_Dp_q_eq_1p, Qeff_Dp_q_eq_2p, Qeff_Dp_q_eq_3p, Qeff_Dp_q_eq_4p, Qeff_Dp_q_eq_5p, Qeff_Dp_q_eq_6p
//
//
	For (i=1;i<7;i+=1)
		Calculate_charging_efficiencies(Dmob_for_various_Q[i], TempC, Whose_charging_efficiencies)
		If (i==1)
			Qeff_Dp_q_eq_1n=Qeff_neg
			Qeff_Dp_q_eq_1p=Qeff_pos
		EndIf
//
		If (i==2)
			Qeff_Dp_q_eq_2n=Qeff_neg
			Qeff_Dp_q_eq_2p=Qeff_pos
		EndIf
//
		If (i==3)
			Qeff_Dp_q_eq_3n=Qeff_neg
			Qeff_Dp_q_eq_3p=Qeff_pos
		EndIf
//
		If (i==4)
			Qeff_Dp_q_eq_4n=Qeff_neg
			Qeff_Dp_q_eq_4p=Qeff_pos
		EndIf
//
		If (i==5)
			Qeff_Dp_q_eq_5n=Qeff_neg
			Qeff_Dp_q_eq_5p=Qeff_pos
		EndIf
//
		If (i==6)
			Qeff_Dp_q_eq_6n=Qeff_neg
			Qeff_Dp_q_eq_6p=Qeff_pos
		EndIf
	EndFor
//
//
//////////////////
// make waves Q_efficiencies_for_same_Dp_various_Q_neg and Q_efficiencies_for_same_Dp_various_Q_pos
	Make/O/D/N=7 Q_efficiencies_for_same_Dp_various_Q_neg
	Q_efficiencies_for_same_Dp_various_Q_neg[0]=Qeff_Dp_q_eq_1n[0]
	Q_efficiencies_for_same_Dp_various_Q_neg[1]=Qeff_Dp_q_eq_1n[1]
	Q_efficiencies_for_same_Dp_various_Q_neg[2]=Qeff_Dp_q_eq_1n[2]
	Q_efficiencies_for_same_Dp_various_Q_neg[3]=Qeff_Dp_q_eq_1n[3]
	Q_efficiencies_for_same_Dp_various_Q_neg[4]=Qeff_Dp_q_eq_1n[4]
	Q_efficiencies_for_same_Dp_various_Q_neg[5]=Qeff_Dp_q_eq_1n[5]
	Q_efficiencies_for_same_Dp_various_Q_neg[6]=Qeff_Dp_q_eq_1n[6]
//
	Make/O/D/N=7 Q_efficiencies_for_same_Dp_various_Q_pos
	Q_efficiencies_for_same_Dp_various_Q_pos[0]=Qeff_Dp_q_eq_1p[0]
	Q_efficiencies_for_same_Dp_various_Q_pos[1]=Qeff_Dp_q_eq_1p[1]
	Q_efficiencies_for_same_Dp_various_Q_pos[2]=Qeff_Dp_q_eq_1p[2]
	Q_efficiencies_for_same_Dp_various_Q_pos[3]=Qeff_Dp_q_eq_1p[3]
	Q_efficiencies_for_same_Dp_various_Q_pos[4]=Qeff_Dp_q_eq_1p[4]
	Q_efficiencies_for_same_Dp_various_Q_pos[5]=Qeff_Dp_q_eq_1p[5]
	Q_efficiencies_for_same_Dp_various_Q_pos[6]=Qeff_Dp_q_eq_1p[6]
//	
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Query_for_Graph_charging_efficiencies_info_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2019-05-23
//
//
// Description: This 
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: 
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:


// this creates a button to determine if the user wants charging efficiencies information to be graphed
//
//
/////////////////////////////////////
//
//	make query for charging efficiencies panel
	KillWindow/Z Query_for_graph_charging_efficiencies_info_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(760,925,1105,975) /N=Query_for_graph_charging_efficiencies_info_panel as "Graph Charging Efficiencies Info?"
//
//
// set up Query_for_graph_charging efficiencies_info_button
	Button Query_for_graph_charging_efficiencies_info_button,pos={10, 10},size={320,30},proc=Graph_charging_efficiencies_info_button,title="\Z22Graph charging efficiencies info",fcolor=(0, 65535, 0)
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Graph_charging_efficiencies_info_button(Graph_charging_efficiencies_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2016-12-03
//
//
// Description: This calls Graph_charging_efficiencies_info when the Graph_charging_efficiencies_info_button is hit in panel Query_for_Graph_charging_efficiencies_info_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Graph_charging_efficiencies_info_Struct - the structure for this button control
//
// Quantities required for function: none
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: Graph_charging_efficiencies_info
// Calls required previously: none
// Called by: Make_Query_for_Graph_charging_efficiencies_info_panel (when "i" button is hit).
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Graph_charging_efficiencies_info_Struct
//
//
	If (Graph_charging_efficiencies_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		KillWindow/Z Query_for_graph_charging_efficiencies_info_panel
		Graph_charging_efficiencies_info()
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Graph_charging_efficiencies_info()


// I need to put in the information section and then it's done

// old stuff here - useful, but needs to be updated

// Description:
// This calculates the charging efficiencies of an aerosol particle with diameter D_for_Qeff in nm for various charges. 
// There are four options: Wiedensohler, Fuchs, Gopalakrishnan et al., and Tigges et al.
//
//		Wiedensohler, A. (1988), J. Aerosol Sci., 19(3): 387-389, with coefficients in Table 1 on p. 388.
// 		Wiedensohler (1988) used an 85Kr source.
// 		There are two typographic errors, which are corrected here. 
//			A. Wiedensohler stated in an email to me on 2016-09-16 that the coefficients a4 for N=1 and a5 for N=2
//				were incorrect in the paper, but are correct in the TSI manual.
// 		These values are also given (correctly) in the TSI handbook, equations B-2, B-3, and also in Wiedensohler (2012, 2019).
//
//		Fuchs (1964), The Mechanics of Aerosols, p. 113.
//
//		Gopalakrishnan, R., M. J. Meredith, C. Larriba-Andaluz, and C. J. Hogan, Jr. (2013), Brownian dynamics determination
//			of the bipolar stead state charge distribution on spheres and non-spheres in the transition regime, J. Aerosol Sci., 
//			63, 126-145.
//		They did Brownian motion simulations.
//		The values are givn in Table 2, p. 140 and Eq. 10, p. 143.
//
//		Tigges L., A. Wiedensohler, K. Weinhold, J. Gandhi, and H.-J. Schmidt (2015), Bipolar charge distribution of a 
//			soft X-ray diffusion source, J. Aerosol Sci., 90, 77-86, with coefficients in Table 3 on p. 83.
//
// Fuchs calculates efficiencies for all charges.
// Wiedensohler, Gopalakrishnan et al., and Tigges et al. calculate efficiencies for q = -2, -1, 0, 1, and 2, 
//		and for |q| > 2, the expressions in Gunn and Woessner (1956) are used.
//
// Wiedensohler (1988) state that there wasn't a big temperature dependence for Q=1, 2, -1, -2, 
//		and the expressions don't have any; HOWEVER, there is still a temperature dependence for higher charges.
//
// Note that the sum of the efficiencies doesn't always add to unity.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: D_for_Qeff is the input diameter in nm, TempC is the temperature
//
// Quantities required for function: D_for_Qeff, TempC
// Variables calculated in function: TempK, DDD
// Waves created in function: Qeff_neg, Qeff_pos
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: various programs
// Return: 0
//
//
////////////////////////////////////////////////////////////////
	NVAR TempC_input
//
//
////////////////////////////////////////////////////////////////
// declare other variables and waves
//
//
	Variable TempC, TempK, e0, e_charge, k_Boltzmann, DDD
	TempC=TempC_input
	TempK=TempC+273.15
	e0=8.8542e-12 // C^2 s^2 /kg /m^3
	e_charge=1.602176634e-19 // C
	k_Boltzmann=1.380649e-23 // J/K
	DDD=e_charge^2/(2*Pi*e0*k_Boltzmann*TempK)*1e9 // D in nm; this = 112 nm at 25 °C- this is the distance at which the electrical energy equals the thermal energy
//
	Make/O/D/N=1000 DDiam=10^(3*x/999)
	Make/O/D/N=1000 one=1 // for graphing
	Make/O/D/N=1000 Qeff_neg2_Wiedensohler, Qeff_neg1_Wiedensohler, Qeff_0_Wiedensohler, Qeff_pos1_Wiedensohler, Qeff_pos2_Wiedensohler
	Make/O/D/N=1000 Qeff_neg2_Fuchs, Qeff_neg1_Fuchs, Qeff_0_Fuchs, Qeff_pos1_Fuchs, Qeff_pos2_Fuchs
	Make/O/D/N=1000 Qeff_neg2_Gopalakrishnan, Qeff_neg1_Gopalakrishnan, Qeff_0_Gopalakrishnan, Qeff_pos1_Gopalakrishnan, Qeff_pos2_Gopalakrishnan
	Make/O/D/N=1000 Qeff_neg2_Tigges, Qeff_neg1_Tigges, Qeff_0_Tigges, Qeff_pos1_Tigges, Qeff_pos2_Tigges
	Make/O/D/N=1000 Qeff_neg2_pos2_ratio_Wiedensohler, Qeff_neg1_pos1_ratio_Wiedensohler
	Make/O/D/N=1000 Qeff_neg2_pos2_ratio_Fuchs, Qeff_neg1_pos1_ratio_Fuchs
	Make/O/D/N=1000 Qeff_neg2_pos2_ratio_Gopalakrishnan, Qeff_neg1_pos1_ratio_Gopalakrishnan
	Make/O/D/N=1000 Qeff_neg2_pos2_ratio_Tigges, Qeff_neg1_pos1_ratio_Tigges
	Make/O/D/N=1000 Qeff_neg2_Fuchs_to_Wiedensohler_ratio, Qeff_neg1_Fuchs_to_Wiedensohler_ratio, Qeff_0_0_Fuchs_to_Wiedensohler_ratio, Qeff_pos1_Fuchs_to_Wiedensohler_ratio, Qeff_pos2_Fuchs_to_Wiedensohler_ratio
	Make/O/D/N=1000 Qeff_neg2_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_neg1_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_0_0_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_pos1_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_pos2_Gopalakrishnan_to_Wiedensohler_ratio
	Make/O/D/N=1000 Qeff_neg2_Tigges_to_Wiedensohler_ratio, Qeff_neg1_Tigges_to_Wiedensohler_ratio, Qeff_0_0_Tigges_to_Wiedensohler_ratio, Qeff_pos1_Tigges_to_Wiedensohler_ratio, Qeff_pos2_Tigges_to_Wiedensohler_ratio
	Make/O/D/N=1000 Qeff_neg6, Qeff_neg5, Qeff_neg4, Qeff_neg3, Qeff_pos3, Qeff_pos4, Qeff_pos5, Qeff_pos6
	Make/O/D/N=1000 Qeff_neg6_pos6_ratio, Qeff_neg5_pos5_ratio, Qeff_neg4_pos4_ratio, Qeff_neg3_pos3_ratio
	Make/O/D/N=1000 Qeff_3456_sum, Qeff_sum_Wiedensohler, Qeff_sum_Fuchs, Qeff_sum_Gopalakrishnan, Qeff_sum_Tigges
	Make/O/D/N=1000 Qeff_neg2_neg1_ratio_Wiedensohler, Qeff_neg3_neg1_ratio_Wiedensohler, Qeff_pos2_pos1_ratio_Wiedensohler, Qeff_pos3_pos1_ratio_Wiedensohler
//
//
// Calculate charging efficiencies for Wiedensohler
	Qeff_neg2_Wiedensohler=10^(-26.3328+35.9044*(log(DDiam))-21.4608*(log(DDiam))^2+7.0867*(log(DDiam))^3-1.3088*(log(DDiam))^4+0.1051*(log(DDiam))^5)
	Qeff_neg1_Wiedensohler=10^(-2.3197+0.6175*(log(DDiam))+0.6201*(log(DDiam))^2-0.1105*(log(DDiam))^3-0.1260*(log(DDiam))^4+0.0297*(log(DDiam))^5)
	Qeff_0_Wiedensohler=10^(-0.0003-0.1014*(log(DDiam))+0.3073*(log(DDiam))^2-0.3372*(log(DDiam))^3+0.1023*(log(DDiam))^4-0.0105*(log(DDiam))^5)
	Qeff_pos1_Wiedensohler=10^(-2.3484+0.6044*(log(DDiam))+0.4800*(log(DDiam))^2+0.0013*(log(DDiam))^3-0.1553*(log(DDiam))^4+0.0320*(log(DDiam))^5)
	Qeff_pos2_Wiedensohler=10^(-44.4756+79.3772*(log(DDiam))-62.8900*(log(DDiam))^2+26.4492*(log(DDiam))^3-5.7480*(log(DDiam))^4+0.5049*(log(DDiam))^5)
//
//
// Calculate charging efficiencies for Gopalakrishnan
	Qeff_neg2_Gopalakrishnan = exp(-45.405 + 20.049*ln(DDiam) - 3.0579*(ln(DDiam))^2 + 0.1534*(ln(DDiam))^3)
	Qeff_neg1_Gopalakrishnan = exp(-7.8696 + 3.1036*ln(DDiam) - 0.4557*(ln(DDiam))^2 + 0.0187*(ln(DDiam))^3)
	Qeff_0_Gopalakrishnan = exp(-0.3880 + 0.4545*ln(DDiam) - 0.1634*(ln(DDiam))^2 + 0.0091*(ln(DDiam))^3)
	Qeff_pos1_Gopalakrishnan = exp(-8.0157 + 3.2536*ln(DDiam) - 0.5018*(ln(DDiam))^2 + 0.0223*(ln(DDiam))^3)
	Qeff_pos2_Gopalakrishnan= exp(-40.714 + 17.487*ln(DDiam) - 2.6146*(ln(DDiam))^2 + 0.1282*(ln(DDiam))^3)
//
/////////////// not used here (yet), but this is for nonconducting
// Table 4, p. 142 (nonconducting), and Eq. 10, p. 143
// Gopal_neg_2[ii] = exp(-63.185 + 26.833*ln(dd) - 3.8723*(ln(dd))^2 + 0.1835*(ln(dd))^3)
// Gopal_neg_1[ii] = exp(-16.801 + 7.5947*ln(dd) - 1.1975*(ln(dd))^2 + 0.059*(ln(dd))^3)
// Gopal_neg_0[ii] = exp(-1.212 + 1.1068*ln(dd) - 0.2934*(ln(dd))^2 + 0.0169*(ln(dd))^3)
// Gopal_pos_0[ii]=Gopal_neg_0[ii]
// Gopal_pos_1[ii] = exp(-16.704 + 7.5438*ln(dd) - 1.1938*(ln(dd))^2 + 0.0589*(ln(dd))^3)
// Gopal_pos_2[ii]= exp(-71.051 + 31.209*ln(dd) - 4.6696*(ln(dd))^2 + 0.2301*(ln(dd))^3)
//
// Calculate charging efficiencies for Tigges et al.
	Qeff_neg2_Tigges=10^(-30.61558+46.33885*log(DDiam)-31.18191*(log(DDiam))^2+11.39070*(log(DDiam))^3-2.22028*(log(DDiam))^4+0.17935*(log(DDiam))^5)
	Qeff_neg1_Tigges=10^(-2.33509+0.43635*log(DDiam)+1.08654*(log(DDiam))^2-0.55679*(log(DDiam))^3+0.04981*(log(DDiam))^4+0.00551*(log(DDiam))^5)
	Qeff_0_Tigges=10^(0.00163-0.11384*log(DDiam)+0.33393*(log(DDiam))^2-0.35714*(log(DDiam))^3+0.10770*(log(DDiam))^4-0.01082*(log(DDiam))^5)
	Qeff_pos1_Tigges=10^(-2.35889+0.45169*log(DDiam)+0.99798*(log(DDiam))^2-0.48173*(log(DDiam))^3+0.02631*(log(DDiam))^4+0.00804*(log(DDiam))^5)
	Qeff_pos2_Tigges=10^(-27.25320+38.47963*log(DDiam)-24.27128*(log(DDiam))^2+8.44162*(log(DDiam))^3-1.60589*(log(DDiam))^4+0.12917*(log(DDiam))^5)
//
//
// Calculate charging efficiencies for |q|>2 from Gunn and Woessner
	Qeff_neg6=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(-6-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
	Qeff_neg5=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(-5-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
	Qeff_neg4=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(-4-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
	Qeff_neg3=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(-3-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
//
	Qeff_pos3=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(3-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
	Qeff_pos4=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(4-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
	Qeff_pos5=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(5-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
	Qeff_pos6=1/sqrt(2*Pi)*sqrt(DDD/DDiam)*exp(-(6-DDiam/DDD*ln(0.875))^2/(2*DDiam/DDD))
//
//
// calculate charging efficiencies for Fuchs
	Qeff_sum_Fuchs=2*exp(-36*DDD/DDiam[p]) + 2*exp(-25*DDD/DDiam[p]) + 2*exp(-16*DDD/DDiam[p]) + 2*exp(-9*DDD/DDiam[p]) + 2*exp(-4*DDD/DDiam[p]) + 2*exp(-DDD/DDiam[p]) + 1
	Qeff_neg2_Fuchs=exp(-4*DDD/DDiam)/Qeff_sum_Fuchs
	Qeff_pos2_Fuchs=Qeff_neg2_fuchs
	Qeff_neg1_fuchs=exp(-DDD/DDiam)/Qeff_sum_Fuchs
	Qeff_pos1_fuchs=Qeff_neg1_Fuchs
	Qeff_0_Fuchs=1/Qeff_sum_Fuchs
//
//
/////// make ratios
	Qeff_neg2_pos2_ratio_Wiedensohler=Qeff_neg2_Wiedensohler/Qeff_pos2_Wiedensohler
	Qeff_neg1_pos1_ratio_Wiedensohler=Qeff_neg1_Wiedensohler/Qeff_pos1_Wiedensohler
	Qeff_neg2_pos2_ratio_Fuchs=Qeff_neg2_Fuchs/Qeff_pos2_Fuchs
	Qeff_neg1_pos1_ratio_Fuchs=Qeff_neg1_Fuchs/Qeff_pos1_Fuchs
	Qeff_neg2_pos2_ratio_Gopalakrishnan=Qeff_neg2_Gopalakrishnan/Qeff_pos2_Gopalakrishnan
	Qeff_neg1_pos1_ratio_Gopalakrishnan=Qeff_neg1_Gopalakrishnan/Qeff_pos1_Gopalakrishnan
	Qeff_neg2_pos2_ratio_Tigges=Qeff_neg2_Tigges/Qeff_pos2_Tigges
	Qeff_neg1_pos1_ratio_Tigges=Qeff_neg1_Tigges/Qeff_pos1_Tigges
//
	Qeff_neg2_Fuchs_to_Wiedensohler_ratio=Qeff_neg2_Fuchs/Qeff_neg2_Wiedensohler
	Qeff_neg1_Fuchs_to_Wiedensohler_ratio=Qeff_neg1_Fuchs/Qeff_neg1_Wiedensohler
	Qeff_0_0_Fuchs_to_Wiedensohler_ratio=Qeff_0_Fuchs/Qeff_0_Wiedensohler
	Qeff_pos1_Fuchs_to_Wiedensohler_ratio=Qeff_pos1_Fuchs/Qeff_pos1_Wiedensohler
	Qeff_pos2_Fuchs_to_Wiedensohler_ratio=Qeff_pos2_Fuchs/Qeff_pos2_Wiedensohler
//
	Qeff_neg2_Gopalakrishnan_to_Wiedensohler_ratio=Qeff_neg2_Gopalakrishnan/Qeff_neg2_Wiedensohler
	Qeff_neg1_Gopalakrishnan_to_Wiedensohler_ratio=Qeff_neg1_Gopalakrishnan/Qeff_neg1_Wiedensohler
	Qeff_0_0_Gopalakrishnan_to_Wiedensohler_ratio=Qeff_0_Gopalakrishnan/Qeff_0_Wiedensohler
	Qeff_pos1_Gopalakrishnan_to_Wiedensohler_ratio=Qeff_pos1_Gopalakrishnan/Qeff_pos1_Wiedensohler
	Qeff_pos2_Gopalakrishnan_to_Wiedensohler_ratio=Qeff_pos2_Gopalakrishnan/Qeff_pos2_Wiedensohler
//
	Qeff_neg2_Tigges_to_Wiedensohler_ratio=Qeff_neg2_Tigges/Qeff_neg2_Wiedensohler
	Qeff_neg1_Tigges_to_Wiedensohler_ratio=Qeff_neg1_Tigges/Qeff_neg1_Wiedensohler
	Qeff_0_0_Tigges_to_Wiedensohler_ratio=Qeff_0_Tigges/Qeff_0_Wiedensohler
	Qeff_pos1_Tigges_to_Wiedensohler_ratio=Qeff_pos1_Tigges/Qeff_pos1_Wiedensohler
	Qeff_pos2_Tigges_to_Wiedensohler_ratio=Qeff_pos2_Tigges/Qeff_pos2_Wiedensohler
//
	Qeff_neg2_neg1_ratio_Wiedensohler=Qeff_neg2_Wiedensohler/Qeff_neg1_Wiedensohler
	Qeff_neg3_neg1_ratio_Wiedensohler=Qeff_neg3/Qeff_neg1_Wiedensohler
	Qeff_pos2_pos1_ratio_Wiedensohler=Qeff_pos2_Wiedensohler/Qeff_pos1_Wiedensohler
	Qeff_pos3_pos1_ratio_Wiedensohler=Qeff_pos3/Qeff_pos1_Wiedensohler
///// !!!!! do also for other two
//
// these are independent of DDiam
	Qeff_neg6_pos6_ratio=Qeff_neg6/Qeff_pos6
	Qeff_neg5_pos5_ratio=Qeff_neg5/Qeff_pos5
	Qeff_neg4_pos4_ratio=Qeff_neg4/Qeff_pos4
	Qeff_neg3_pos3_ratio=Qeff_neg3/Qeff_pos3
//
//
// make sums
	Qeff_3456_sum=Qeff_neg6 + Qeff_neg5 + Qeff_neg4 + Qeff_neg3 + Qeff_pos3 + Qeff_pos4 + Qeff_pos5 + Qeff_pos6
	Qeff_sum_Wiedensohler=Qeff_3456_sum + Qeff_neg2_Wiedensohler + Qeff_neg1_Wiedensohler + Qeff_0_Wiedensohler + Qeff_pos1_Wiedensohler + Qeff_pos2_Wiedensohler
// Qeff_sum_Fuchs already calculated
	Qeff_sum_Gopalakrishnan=Qeff_3456_sum + Qeff_neg2_Gopalakrishnan + Qeff_neg1_Gopalakrishnan + Qeff_0_Gopalakrishnan + Qeff_pos1_Gopalakrishnan + Qeff_pos2_Gopalakrishnan
	Qeff_sum_Tigges=Qeff_3456_sum + Qeff_neg2_Tigges + Qeff_neg1_Tigges + Qeff_0_Tigges + Qeff_pos1_Tigges + Qeff_pos2_Tigges
//
//
//*********************************************************************
//*********************************************************************
KillWindow/Z Graph_Qeff_sums
Display /W=(100,50,600,350) /N=Graph_Qeff_sums
AppendtoGraph one, Qeff_sum_Wiedensohler, Qeff_sum_Gopalakrishnan, Qeff_sum_Tigges vs DDiam
ModifyGraph log(bottom)=1,mirror=1,fSize=16,standoff=0
SetAxis left 0.95,1.05
ModifyGraph nticks(left)=7
Label left "\Z16Sum of efficiencies"
Label bottom "\Z16Diameter/nm"
ModifyGraph lstyle(one)=0, rgb(one)=(0,0,0)
ModifyGraph rgb(Qeff_sum_Wiedensohler)=(65535,0,0), rgb(Qeff_sum_Gopalakrishnan)=(0,65535,0), rgb(Qeff_sum_Tigges)=(0,0,65535)
TextBox/C/N=text0/F=0/A=MC/X=-10/Y=30 "\Z16\s(Qeff_sum_Wiedensohler)Sum Wiedensohler\r\s(Qeff_sum_Gopalakrishnan)Sum Gopalakrishnan\r\s(Qeff_sum_Tigges)Sum Tigges"
//
//
//////////////////////////////
KillWindow/Z Graph_Qeff_neg_and_pos
Display /W=(100,400,600,700) /N=Graph_Qeff_neg_and_pos
AppendtoGraph one, Qeff_0_Wiedensohler, Qeff_0_Fuchs, Qeff_0_Gopalakrishnan, Qeff_0_Tigges vs DDiam
AppendtoGraph Qeff_pos1_Wiedensohler, Qeff_pos1_Fuchs, Qeff_pos1_Gopalakrishnan, Qeff_pos1_Tigges, Qeff_pos2_Wiedensohler, Qeff_pos2_Fuchs, Qeff_pos2_Gopalakrishnan, Qeff_pos2_Tigges, Qeff_pos3, Qeff_pos4, Qeff_pos5, Qeff_pos6 vs DDiam
AppendtoGraph Qeff_neg6, Qeff_neg5, Qeff_neg4, Qeff_neg3, Qeff_neg2_Tigges, Qeff_neg2_Gopalakrishnan, Qeff_neg2_Fuchs, Qeff_neg2_Wiedensohler, Qeff_neg1_Tigges, Qeff_neg1_Gopalakrishnan, Qeff_neg1_Fuchs, Qeff_neg1_Wiedensohler vs DDiam
ModifyGraph log(bottom)=1,mirror=1,fSize=16,standoff=0
SetAxis left 0,1
ModifyGraph nticks(left)=7
Label left "\Z16Efficiency"
Label bottom "\Z16Diameter/nm"
ModifyGraph lstyle(one)=0, rgb(one)=(0,0,0)
ModifyGraph rgb(Qeff_0_Wiedensohler)=(65535,0,0), rgb(Qeff_0_Fuchs)=(36873,14755,58982), rgb(Qeff_0_Gopalakrishnan)=(0,65535,0), rgb(Qeff_0_Tigges)=(0,0,65535)
ModifyGraph lstyle(Qeff_0_Wiedensohler)=0, lstyle(Qeff_0_Fuchs)=0, lstyle(Qeff_0_Gopalakrishnan)=0, lstyle(Qeff_0_Tigges)=0
//
ModifyGraph rgb(Qeff_pos1_Wiedensohler)=(65535,0,0), rgb(Qeff_pos1_Fuchs)=(36873,14755,58982), rgb(Qeff_pos1_Gopalakrishnan)=(0,65535,0), rgb(Qeff_pos1_Tigges)=(0,0,65535)
ModifyGraph lstyle(Qeff_pos1_Wiedensohler)=0, lstyle(Qeff_pos1_Fuchs)=0, lstyle(Qeff_pos1_Gopalakrishnan)=0, lstyle(Qeff_pos1_Tigges)=0
//
ModifyGraph rgb(Qeff_neg1_Wiedensohler)=(65535,0,0), rgb(Qeff_neg1_Fuchs)=(36873,14755,58982), rgb(Qeff_neg1_Gopalakrishnan)=(0,65535,0), rgb(Qeff_neg1_Tigges)=(0,0,65535)
ModifyGraph lstyle(Qeff_neg1_Wiedensohler)=1, lstyle(Qeff_neg1_Fuchs)=1, lstyle(Qeff_neg1_Gopalakrishnan)=1, lstyle(Qeff_neg1_Tigges)=1
//
ModifyGraph rgb(Qeff_pos2_Wiedensohler)=(65535,0,0), rgb(Qeff_pos2_Fuchs)=(36873,14755,58982), rgb(Qeff_pos2_Gopalakrishnan)=(0,65535,0), rgb(Qeff_pos2_Tigges)=(0,0,65535)
ModifyGraph lstyle(Qeff_pos2_Wiedensohler)=0, lstyle(Qeff_pos2_Fuchs)=0, lstyle(Qeff_pos2_Gopalakrishnan)=0, lstyle(Qeff_pos2_Tigges)=0
//
ModifyGraph rgb(Qeff_neg2_Wiedensohler)=(65535,0,0), rgb(Qeff_neg2_Fuchs)=(36873,14755,58982), rgb(Qeff_neg2_Gopalakrishnan)=(0,65535,0), rgb(Qeff_neg2_Tigges)=(0,0,65535)
ModifyGraph lstyle(Qeff_neg2_Wiedensohler)=1, lstyle(Qeff_neg2_Fuchs)=1, lstyle(Qeff_neg2_Gopalakrishnan)=1, lstyle(Qeff_neg2_Tigges)=1
//
ModifyGraph lstyle(Qeff_neg6)=1, lstyle(Qeff_pos6)=0, lstyle(Qeff_neg5)=1, lstyle(Qeff_pos5)=0, lstyle(Qeff_neg4)=1, lstyle(Qeff_pos4)=0, lstyle(Qeff_neg3)=1, lstyle(Qeff_pos3)=0
ModifyGraph rgb(Qeff_neg6)=(0,0,0), rgb(Qeff_neg5)=(0,0,0), rgb(Qeff_neg4)=(0,0,0), rgb(Qeff_neg3)=(0,0,0)
ModifyGraph rgb(Qeff_pos6)=(0,0,0), rgb(Qeff_pos5)=(0,0,0), rgb(Qeff_pos4)=(0,0,0), rgb(Qeff_pos3)=(0,0,0)
TextBox/C/N=text0/F=0/A=MC/X=-25/Y=0 "\Z14\s(Qeff_0_Wiedensohler)Wiedensohler\r\s(Qeff_0_Gopalakrishnan)Gopalakrishnan et al.\r\s(Qeff_0_Tigges)Tigges et al.\r\r\s(Qeff_pos6)positive\r\s(Qeff_neg6)negative"
//
//
//////////////////////////////
KillWindow/Z Qeff_neg_to_pos_ratios
Display /W=(650,50,1150,350) /N=Qeff_neg_to_pos_ratios
AppendtoGraph one, Qeff_neg2_pos2_ratio_Wiedensohler, Qeff_neg1_pos1_ratio_Wiedensohler, Qeff_neg2_pos2_ratio_Fuchs, Qeff_neg1_pos1_ratio_Fuchs, Qeff_neg2_pos2_ratio_Gopalakrishnan, Qeff_neg1_pos1_ratio_Gopalakrishnan, Qeff_neg2_pos2_ratio_Tigges, Qeff_neg1_pos1_ratio_Tigges vs DDiam
ModifyGraph log(bottom)=1,mirror=1,fSize=16,standoff=0
SetAxis left 0,2
ModifyGraph nticks(left)=7
Label left "\Z16Ratio"
Label bottom "\Z16Diameter/nm"
ModifyGraph lstyle(one)=0, rgb(one)=(0,0,0)
ModifyGraph lstyle(Qeff_neg2_pos2_ratio_Wiedensohler)=3,rgb(Qeff_neg2_pos2_ratio_Wiedensohler)=(65535,0,0)
ModifyGraph lstyle(Qeff_neg1_pos1_ratio_Wiedensohler)=1,rgb(Qeff_neg1_pos1_ratio_Wiedensohler)=(65535,0,0)
ModifyGraph lstyle(Qeff_neg2_pos2_ratio_Fuchs)=3,rgb(Qeff_neg2_pos2_ratio_Fuchs)=(36873,14755,58982)
ModifyGraph lstyle(Qeff_neg1_pos1_ratio_Fuchs)=1,rgb(Qeff_neg1_pos1_ratio_Fuchs)=(36873,14755,58982)
ModifyGraph lstyle(Qeff_neg2_pos2_ratio_Gopalakrishnan)=3,rgb(Qeff_neg2_pos2_ratio_Gopalakrishnan)=(0,65535,0)
ModifyGraph lstyle(Qeff_neg1_pos1_ratio_Gopalakrishnan)=1,rgb(Qeff_neg1_pos1_ratio_Gopalakrishnan)=(0,65535,0)
ModifyGraph lstyle(Qeff_neg2_pos2_ratio_Tigges)=3,rgb(Qeff_neg2_pos2_ratio_Tigges)=(0,0,65535)
ModifyGraph lstyle(Qeff_neg1_pos1_ratio_Tigges)=1,rgb(Qeff_neg1_pos1_ratio_Tigges)=(0,0,65535)
TextBox/C/N=text0/F=0/A=MC/X=13/Y=-25 "\Z14\s(Qeff_neg2_pos2_ratio_Wiedensohler)Eff(-2)/Eff(+2) for Wiedensohler";DelayUpdate
AppendText "\s(Qeff_neg1_pos1_ratio_Wiedensohler)Eff(-1)/Eff(+1) for Wiedensohler";DelayUpdate
AppendText "\s(Qeff_neg2_pos2_ratio_Gopalakrishnan)Eff(-2)/Eff(+2) for Gopalakrishnan et al.";DelayUpdate
AppendText "\s(Qeff_neg1_pos1_ratio_Gopalakrishnan)Eff(-1)/Eff(+1) for Gopalakrishnan et al."
AppendText "\s(Qeff_neg2_pos2_ratio_Tigges)Eff(-2)/Eff(+2) for Tigges et al.";DelayUpdate
AppendText "\s(Qeff_neg1_pos1_ratio_Tigges)Eff(-1)/Eff(+1) for Tigges et al."
//
//
//////////////////////////////
// eee need to do Gopalakrishnan to Wiedensohler and Fuchs to Wiedensohler
KillWindow/Z Qeff_Tigges_to_Wiedensohler_ratios
Display /W=(650,400, 1150,700) /N=Qeff_Tigges_to_Wiedensohler_ratios
AppendtoGraph one, Qeff_neg2_Tigges_to_Wiedensohler_ratio, Qeff_neg1_Tigges_to_Wiedensohler_ratio, Qeff_0_0_Tigges_to_Wiedensohler_ratio, Qeff_pos1_Tigges_to_Wiedensohler_ratio, Qeff_pos2_Tigges_to_Wiedensohler_ratio vs DDiam
ModifyGraph log(bottom)=1,mirror=1,fSize=16,standoff=0
SetAxis left 0,2
ModifyGraph nticks(left)=7
Label left "\Z16Ratio"
Label bottom "\Z16Diameter/nm"
ModifyGraph lstyle(one)=0, rgb(one)=(0,0,0)
ModifyGraph lstyle(Qeff_neg2_Tigges_to_Wiedensohler_ratio)=3,rgb(Qeff_neg2_Tigges_to_Wiedensohler_ratio)=(65535,0,0)
ModifyGraph lstyle(Qeff_neg1_Tigges_to_Wiedensohler_ratio)=1,rgb(Qeff_neg1_Tigges_to_Wiedensohler_ratio)=(65535,0,0)
ModifyGraph lstyle(Qeff_0_0_Tigges_to_Wiedensohler_ratio)=3, rgb(Qeff_0_0_Tigges_to_Wiedensohler_ratio)=(0,0,0)
ModifyGraph lstyle(Qeff_pos2_Tigges_to_Wiedensohler_ratio)=3,rgb(Qeff_pos2_Tigges_to_Wiedensohler_ratio)=(0,0,65535)
ModifyGraph lstyle(Qeff_pos1_Tigges_to_Wiedensohler_ratio)=1,rgb(Qeff_pos1_Tigges_to_Wiedensohler_ratio)=(0,0,65535)
TextBox/C/N=text1/F=0/A=RB/X=5/Y=5 "\Z14\s(Qeff_neg2_Tigges_to_Wiedensohler_ratio)Efficiency(-2) Tigges/Wiedensohler";DelayUpdate
AppendText "\s(Qeff_pos2_Tigges_to_Wiedensohler_ratio)Efficiency(+2) Tigges/Wiedensohler";DelayUpdate
AppendText "\s(Qeff_neg1_Tigges_to_Wiedensohler_ratio)Efficiency(-1) Tigges/Wiedensohler";DelayUpdate
AppendText "\s(Qeff_pos1_Tigges_to_Wiedensohler_ratio)Efficiency(+1) Tigges/Wiedensohler";DelayUpdate
AppendText "\s(Qeff_0_0_Tigges_to_Wiedensohler_ratio)Efficiency(0) Tigges/Wiedensohler"
//
//
//////////////////////////////
KillWindow/Z Qeff_n_to_one_ratios
Display /W=(1200,50,1700,350) /N=Qeff_n_to_one_ratios
AppendtoGraph Qeff_neg2_neg1_ratio_Wiedensohler, Qeff_neg3_neg1_ratio_Wiedensohler, Qeff_pos2_pos1_ratio_Wiedensohler, Qeff_pos3_pos1_ratio_Wiedensohler vs DDiam
ModifyGraph log(bottom)=1,mirror=1,fSize=16,standoff=0
SetAxis left 0,1
Label left "\Z16Ratio"
Label bottom "\Z16Diameter/nm"
ModifyGraph lstyle(Qeff_neg2_neg1_ratio_Wiedensohler)=3,rgb(Qeff_neg2_neg1_ratio_Wiedensohler)=(65535,0,0)
ModifyGraph lstyle(Qeff_neg3_neg1_ratio_Wiedensohler)=1,rgb(Qeff_neg3_neg1_ratio_Wiedensohler)=(65535,0,0)
ModifyGraph lstyle(Qeff_pos2_pos1_ratio_Wiedensohler)=3,rgb(Qeff_pos2_pos1_ratio_Wiedensohler)=(0,65535,0)
ModifyGraph lstyle(Qeff_pos3_pos1_ratio_Wiedensohler)=1,rgb(Qeff_pos3_pos1_ratio_Wiedensohler)=(0,65535,0)
//// !!!! later do also for Tigges, Gopalakrishnan
TextBox/C/N=text0/F=0/A=LT/X=5/Y=5 "\Z14\s(Qeff_neg2_neg1_ratio_Wiedensohler)Eff(-2)/Eff(-1) for Wiedensohler";DelayUpdate
AppendText "\s(Qeff_neg3_neg1_ratio_Wiedensohler)Eff(-3)/Eff(-1) for Wiedensohler";DelayUpdate
AppendText "\s(Qeff_pos2_pos1_ratio_Wiedensohler)Eff(+2)/Eff(+1) for Wiedensohler";DelayUpdate
AppendText "\s(Qeff_pos3_pos1_ratio_Wiedensohler)Eff(+3)/Eff(+1) for Wiedensohler"
//
//
/////////////////////////////////////
// make Charging efficiencies waves panel
	KillWindow/Z List_charging_efficiencies_waves_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(50,750,1475,1020) /N=List_charging_efficiencies_waves_panel as "List charging efficiencies waves"
//
	DrawText 250, 30, "The following waves are available, each with 1000 points:"
	DrawLine 250, 30, 560, 30
//
	DrawText 10, 50, "DDiam (which contains values from 1 to 1000 nm)"
//
	DrawText 10, 60, "----------------------------"
//
	DrawText 10, 70, "Qeff_neg2_Wiedensohler, Qeff_neg1_Wiedensohler, Qeff_0_Wiedensohler, Qeff_pos1_Wiedensohler, Qeff_pos2_Wiedensohler"
	DrawText 10, 85, "Qeff_neg2_Gopalakrishnan, Qeff_neg1_Gopalakrishnan, Qeff_0_Gopalakrishnan, Qeff_pos1_Gopalakrishnan, Qeff_pos2_Gopalakrishnan"
	DrawText 10, 100, "Qeff_neg2_Tigges, Qeff_neg1_Tigges, Qeff_0_Tigges, Qeff_pos1_Tigges, Qeff_pos2_Tigges"
//
	DrawText 10, 110, "----------------------------"
//
	DrawText 10, 120, "Qeff_neg2_pos2_ratio_Wiedensohler, Qeff_neg1_pos1_ratio_Wiedensohler"
	DrawText 10, 135, "Qeff_neg2_pos2_ratio_Gopalakrishnan, Qeff_neg1_pos1_ratio_Gopalakrishnan"
	DrawText 10, 150, "Qeff_neg2_pos2_ratio_Tigges, Qeff_neg1_pos1_ratio_Tigges"
//
	DrawText 10, 160, "----------------------------"
//
	DrawText 10, 170, "Qeff_neg2_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_neg1_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_0_0_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_pos1_Gopalakrishnan_to_Wiedensohler_ratio, Qeff_pos2_Gopalakrishnan_to_Wiedensohler_ratio"
	DrawText 10, 185, "Qeff_neg2_Tigges_to_Wiedensohler_ratio, Qeff_neg1_Tigges_to_Wiedensohler_ratio, Qeff_0_0_Tigges_to_Wiedensohler_ratio, Qeff_pos1_Tigges_to_Wiedensohler_ratio, Qeff_pos2_Tigges_to_Wiedensohler_ratio"
//
	DrawText 10, 195, "----------------------------"
//
	DrawText 10, 205, "Qeff_neg6, Qeff_neg5, Qeff_neg4, Qeff_neg3, Qeff_pos3, Qeff_pos4, Qeff_pos5, Qeff_pos6"
	DrawText 10, 220, "Qeff_neg6_pos6_ratio, Qeff_neg5_pos5_ratio, Qeff_neg4_pos4_ratio, Qeff_neg3_pos3_ratio"
	DrawText 10, 235, "Qeff_3456_sum, Qeff_sum_Wiedensohler, Qeff_sum_Gopalakrishnan, Qeff_sum_Tigges"
//
	DrawText 10, 245, "----------------------------"
//
//	The following ratios are independent of Ddiam, but the [0] value is a NaN because the pos and neg efficiencies are 0; thus use the [100] value.
	DrawText 10, 255, "Qeff(-3)/Qeff(+3) = "
	ValDisplay Q3_ratio_neg_to_pos, pos={115,240}, size={35,15}, bodyWidth=0, value=#"Qeff_neg3_pos3_ratio[100]", fsize=12, valueColor=(0, 0, 0), format="%3.2f"
	DrawText 160, 255, "Qeff(-4)/Qeff(+4) = "
	ValDisplay Q4_ratio_neg_to_pos, pos={265,240}, size={35,15}, bodyWidth=0, value=#"Qeff_neg4_pos4_ratio[100]", fsize=12, valueColor=(0, 0, 0), format="%3.2f"
	DrawText 310, 255, "Qeff(-5)/Qeff(+5) = "
	ValDisplay Q5_ratio_neg_to_pos, pos={415,240}, size={35,15}, bodyWidth=0, value=#"Qeff_neg5_pos5_ratio[100]", fsize=12, valueColor=(0, 0, 0), format="%3.2f"
	DrawText 460, 255, "Qeff(-6)/Qeff(+6) = "
	ValDisplay Q6_ratio_neg_to_pos, pos={565,240}, size={35,15}, bodyWidth=0, value=#"Qeff_neg6_pos6_ratio[100]", fsize=12, valueColor=(0, 0, 0), format="%3.2f"
	DrawText 610, 255, "independent of diameter"


/// !!!!! include in waves available: Qeff_neg2_neg1_ratio_Wiedensohler, Qeff_neg3_neg1_ratio_Wiedensohler, Qeff_pos2_pos1_ratio_Wiedensohler, Qeff_pos3_pos1_ratio_Wiedensohler

//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Dcrit_supersat_kappa_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-25
//
//
// Description: This sets up a panel to calculate and display relations between 
//		the critical diameter, the supersaturation, and kappa.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: 
//		Update_for_Dcrit_supersat_kappa_relations_panel when any value is changed
//		Choose_Dcrit_or_supersat_or_kappa when any control box is selected
// eee graph ...
//		Do_Dcrit_supersat_kappa_relations_panel_info_button when "i" button is hit
//
// Calls required previously: none
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Declare quantities needed in function:
Variable/G DcritA, supersatA, kappaA // the "A" at the end is to avoid conflicts if any other routine uses these varaibles
Variable/G DcritA_value, supersatA_value, kappaA_value // these tell which radio buttons are selected
//
//
//*********************************************************************
//*********************************************************************
/////////// set defaults
// inputs
DcritA=100 // nm
supersatA=0.2 // %
kappaA=0.3456 // calculated offline
//
DcritA_value = 1 // Dcrit selected
supersatA_value=1 // supersat selected
kappaA_value=0 // kappa not selected; calculated from Dcrit and supersat
//
//
/////////////////////////////////////
//	make Dcrit-supersat-kappa panel
	KillWindow/Z Dcrit_supersat_kappa_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(400,50,600,270) /N=Dcrit_supersat_kappa_panel as "Dcrit-ss-κ"
//
//
/////////////////////////////////////
//	set up Dcrit-ss-kappa Relations title box
	TitleBox Dcrit_supersat_kappa_relations_title title="\Z20\f02D\f00\Bcrit\M\Z20\f02-ss-κ\f00 Relations", pos={10, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up graph Cd(Re) fits button
	Button Graph_Cd_Re_button,pos={35, 135}, size={130, 25}, proc=Graph_kappa_of_Dcrit_ss, title="\Z14Graph \f02κ\f00(\f02D\f00\Bcrit\M\Z14, \f02ss\f00)",fcolor=(0, 65535, 0)
// eeeee
//
/////////////////////////////////////
// set up Dcrit_ss_kappa relations info button
	Button Dcrit_supersat_kappa_relations_info_button,pos={80,170},size={40,40},proc=Do_Dcrit_supersat_kappa_relations_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// set up Dcrit_supersat_kappa relations variable input boxes
	GroupBox Group_Dcrit_supersat_kappa pos={25, 50}, size={150, 80}, labelBack=(65535, 50000, 50000)
//
//
// set up Dcrit_supersat_kappa relations variable input boxes
	CheckBox DcritA_selected, pos={32.5, 57.5}, size={20,20}, title=" ", proc=Choose_Dcrit_or_supersat_or_kappa, value=DcritA_value, mode=1
	DrawText 50,75, "\Z14D\Bcrit\M\Z14/nm"
	SetVariable DcritA_input, pos={100,55}, size={65,20}, bodyWidth=0, title=" ", fsize=14, format="%5.1f"
	SetVariable DcritA_input, value=DcritA, limits={10,1e3,1}, proc=Update_for_Dcrit_supersat_kappa_relations_panel
//
	CheckBox supersatA_selected, pos={32.5,82.5}, size={20,20}, title=" ", proc=Choose_Dcrit_or_supersat_or_kappa, value=supersatA_value, mode=1
	DrawText 50,100, "\Z14   ss/%"
	SetVariable supersatA_input, pos={100,80}, size={65,20}, bodyWidth=0, title=" ", fsize=14, format="%5.3f"
	SetVariable supersatA_input, value=supersatA, limits={0.01,2,0.01}, proc=Update_for_Dcrit_supersat_kappa_relations_panel
//
	CheckBox kappaA_selected, pos={32.5,107.5}, size={20,20}, title=" ", proc=Choose_Dcrit_or_supersat_or_kappa, value=kappaA_value, mode=1
	DrawText 50,125, "\Z14\f02    κ\f00 "	
	SetVariable kappaA_input, pos={100,105}, size={65,20}, bodyWidth=0, title=" ", fsize=14, format="%5.3f", disable=2
	SetVariable kappaA_input, value=kappaA, limits={0.01,2,0.01}, proc=Update_for_Dcrit_supersat_kappa_relations_panel
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Dcrit_supersat_kappa_relations_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-23
//
//
// Description: This provides the control for SetVariables in Make_Dcrit_supersat_kappa_panel 
//		by updating everything shown in that panel whenever an input is changed.
//
//	
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: DcritA, supersatA, kappaA
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Dcrit_supersat_kappa_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
// Declare other variables and waves
	NVAR DcritA, supersatA, kappaA
	NVAR DcritA_value, supersatA_value, kappaA_value
//
//
// this is if an entry is changed
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “DcritA”) == 0) // Dcrit changed, which means it was selected
			If (supersatA_value == 1) // supersat was also selected
				kappaA=(24/DcritA)^3/supersatA^2 // calculate kappa from Dcrit and supersat
			EndIf
//
			If (kappaA_value == 1) // kappa was also selected
				supersatA=sqrt((24/DcritA)^3/kappaA) // calculate supersat from Dcrit and kappa
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “supersatA”) == 0) // supersat changed, which means it was selected
			If (DcritA_value == 1) // Dcrit was also selected
				kappaA=(24/DcritA)^3/supersatA^2 // calculate kappa from Dcrit and supersat
			EndIf
//
			If (kappaA_value == 1) // kappa was also selected
				DcritA=24/(supersatA^2*kappaA)^(1/3) // calculate Dcrit from supersat and kappa
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “kappaA”) == 0) // kappa changed, which means it was selected
			If (DcritA_value == 1) // Dcrit was also selected
				supersatA=sqrt((24/DcritA)^3/kappaA) // calculate supersat from Dcrit and kappa
			EndIf
//
			If (supersatA_value == 1) // supersat was also selected
				DcritA=24/(supersatA^2*kappaA)^(1/3) // calculate Dcrit from supersat and kappa
			EndIf
		EndIf
//
//
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Choose_Dcrit_or_supersat_or_kappa(Choose_Dcrit_or_supersat_or_kappa_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2023-03-28
//
//
// Description: This provides the control for the check boxes for the choice of 
//		whether Dcrit, supersat, or kappa is held constant while another is varied.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Choose_Dcrit_or_supersat_or_kappa_box tells whether the box is checked for calculations.
//
// Quantities required for function: none
// Variables calculated in function: Choose_Dcrit_or_supersat_or_kappa_value
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Dcrit_supersat_kappa_panel (when checkbox for Dcrit, supersat, or kappa is checked)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//f
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& Choose_Dcrit_or_supersat_or_kappa_box
	NVAR DcritA_value, supersatA_value, kappaA_value
//
//
//	This determines which pair of boxes amoung Dcrit, supersat, and kappa is checked.
	If (Choose_Dcrit_or_supersat_or_kappa_box.eventcode == 2) // do only when mouse goes up (eventcode = 2)
//
		// disable all inputs
		SetVariable DcritA_input, disable=2 // disable this one
		SetVariable supersatA_input, disable=2 // disable this one
		SetVariable kappaA_input, disable=2 // disable this one
//
		StrSwitch (Choose_Dcrit_or_supersat_or_kappa_box.ctrlName)
			Case "DcritA_selected":
				DcritA_value=1 // select this one
				If (supersatA_value==1 & kappaA_value==1) // both other boxes are selected
					CheckBox supersatA_selected, value=0 // deselect this one
					supersatA_value=0
					Checkbox kappaA_selected, value=0 // deselect this one
					kappaA_value=0
				Else // this would be the second time
					Checkbox DcritA_selected, value=1 // select this one
					DcritA_value=1
					SetVariable DcritA_input, disable=0 // enable this one
					If (supersatA_value==1)
						SetVariable supersatA_input, disable=0 // enable this one
					EndIf
					If (kappaA_value==1)
						SetVariable kappaA_input, disable=0 // enable this one
					EndIf
				EndIf
				Break		
//
			Case "supersatA_selected":
				supersatA_value=1 // select this one
				If (DcritA_value==1 & kappaA_value==1) // both other boxes are selected
					Checkbox DcritA_selected, value=0 // deselect this one
					DcritA_value=0
					Checkbox kappaA_selected, value=0 // deselect this one
					kappaA_value=0
				Else // this would be the second time
					Checkbox supersatA_selected, value=1 // select this one
					supersatA_value=1
					SetVariable supersatA_input, disable=0 // enable this one
					If (DcritA_value==1)
						SetVariable DcritA_input, disable=0 // enable this one
					EndIf
					If (kappaA_value==1)
						SetVariable kappaA_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
//
			Case "kappaA_selected":
				kappaA_value=1 // select this one
				If (DcritA_value==1 & supersatA_value==1) // both other boxes are selected
					Checkbox DcritA_selected, value=0 // deselect this one
					DcritA_value=0
					Checkbox supersatA_selected, value=0 // deselect this one
					supersatA_value=0
				Else // this would be the second time
					Checkbox kappaA_selected, value=1 // select this one
					kappaA_value=1
					SetVariable kappaA_input, disable=0 // enable this one
					If (DcritA_value==1)
						SetVariable DcritA_input, disable=0 // enable this one
					EndIf
					If (supersatA_value==1)
						SetVariable supersatA_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
		EndSwitch
	EndIf
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Dcrit_supersat_kappa_relations_panel_info_button(Do_Dcrit_supersat_kappa_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-01-16
//
//
// Description: This calls Dcrit_supersat_kappa_panel_info when the 
//		Dcrit_ss_kappa_relations_info_button is hit in panel Dcrit_supersat_kappa_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: Do_Dcrit_supersat_kappa_info_Struct 
//		is the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Dcrit_supersat_kappa_relations_info
//
// Calls required previously: none
//
// Called by: Dcrit_supersat_kappa_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Do_Dcrit_supersat_kappa_info_Struct
//
//
	If (Do_Dcrit_supersat_kappa_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Dcrit_supersat_kappa_relations_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Dcrit_supersat_kappa_relations_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-03-28
//
//
// Description: This prints information on the relations among Dcrit, supersat, and kappa
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Dcrit_supersat_kappa_panel_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Dcrit_supersat_kappa_info_text
//
	Dcrit_supersat_kappa_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "Relations among the critical diameter, supersaturation, and kappa (κ)\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "---------------------------------------------------------------------\r\r"
//
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "Calculations relating the critical diameter, supersaturation, and kappa (κ) are based on the equation\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   κ = (24 nm/Dcrit)^3 × (%/ss)^2.\r"
	Dcrit_supersat_kappa_info_text= Dcrit_supersat_kappa_info_text + "The value 24 nm is D_σ/3×(2×100)^(2/3), where D_σ (called A by Petters and Kreidenweis) is equal to\r"
	Dcrit_supersat_kappa_info_text= Dcrit_supersat_kappa_info_text + "   (4 × σ_w × MW_w)/(ρ_w × R_gas × T), or 2.1 nm at 298 K; the 100 converts supersaturation to %.\r\r"
//		
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "The quantity κ is NOT constant for a given substance; for example, for ammonium sulfate, a particle with\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   Dcrit =  25 nm activates at 1.28 % supersaturation, yielding κ = 0.55,\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   Dcrit =  50 nm activates at 0.43 % supersaturation, yielding κ = 0.59,\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   Dcrit = 100 nm activates at 0.15 % supersaturation, yielding κ = 0.64.\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "These values were calculated taking into account the dependences of practical osmotic coefficient, partial\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   molal volume, and surface tension on concentration, the first quantity being by far the most important.\r\r"
//
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "κ-theory, as outlined in Petters and Kreidenweise (2007), A single parameter representation of hygroscopic\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   growth and cloud condensation nucleus activity, Atmos. Chem. Phys., 7, 1961-1971, makes the assumptions\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   that the surface tension of the solution in the drop is that of water and that the water activity is\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   related to the drop diameter by a_w = 1-κ*D_dry^3/[D^3 - (1-κ)*D_dry^3]; this latter is an accurate\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   approximation for some substances, but it is not an exact relation for any substance.\r\r"
//
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "In their Eq. 10, they present a relationship similar to that above among Dcrit, ln(1+supersat), and kappa,\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   but there is no theoretical justification for using ln(1+supersat) instead of supersat, and within the\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   accuracy of the approximation, ln(1+supersat) can be replaed by supersat and the term (1-κ)*D_dry^3\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   can be neglected compared to D^3 in the denominator (as was done above).\r\r"
//
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "As κ for most substances varies considerably with concentration (and thus supersaturation), exact analysis\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   of this equation (i.e., higher-order corrections) is merely an academic exercise with no physical basis,\r"
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "   it must be concluded that κ provides a qualitative but not overly quantitative measure of hygroscopicity.\r\r"
//
	Dcrit_supersat_kappa_info_text = Dcrit_supersat_kappa_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Dcrit_supersat_kappa_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(770,50,1550,575)/N=Dcrit_supersat_kappa_info_notebook
	Notebook Dcrit_supersat_kappa_info_notebook, text=Dcrit_supersat_kappa_info_text, fsize=11
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_core_shell_activation_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This sets up a panel that allows the user to calculate activation of core-shell particles (including core diameter = 0).
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Update_for_core_shell_activation_panel (when input changed), 
//			Do_core_shell_activation_info_button (when "i" button is hit)
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	Variable/G D_core_input, T_coat_input, D_equiv_coat_input, kappa_input
//
	Variable/G D_act, s_act_pct, s_act_core_pct, water_activity_for_core_shell
	Variable/G volume_growth_factor, equivalent_radial_growth_factor
//
// Set defaults
	D_core_input=100 //nm
	T_coat_input=10 //nm
	D_equiv_coat_input=90 // nm
	kappa_input=0.2
//
// These have been calculated from the above defaults
	D_act=460.8 // nm
	s_act_pct=0.30 // pct
	s_act_core_pct=2.1 // pct
	water_activity_for_core_shell=0.99850
//
	volume_growth_factor=133.0
	equivalent_radial_growth_factor=5.10 // equal cube root of volume_growth_factor
//
//
/////////////////////////////////////
//	Make Core-shell activation panel
	Killwindow/Z Core_shell_activation_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(50,50,250,435) /N=Core_shell_activation_panel as "Core-shell Activation"
//
//
/////////////////////////////////////
//	set up title box
	TitleBox core_shell_box title="\Z20Core-shell Activation", size={200, 40}, pos={5, 10},fcolor=(0,0,65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up info button
	Button Core_shell_activationinfo_button,pos={80,335},size={40,40},proc=Do_core_shell_activation_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// set up selection boxes
	GroupBox Make_core_shell_activation_inputs pos={25,55}, size={145,110}, labelBack=(65535, 50000, 50000)
//	
	DrawText 30, 80, "\Z14\f02D\f00\Bcore\M\Z14/nm"
	DrawText 30, 105, "\Z14\f02T\f00\Bcoat\M\Z14/nm"
	DrawText 30, 130, "\Z14\f02D\f00\Beq,coat\M\Z14/nm"
	DrawText 55, 155, "\Z14\f02κ\f00\Bcoat"
	SetVariable D_core_input,pos={90,60},size={70,20},limits={0,inf,1},title=" ",value=D_core_input, fsize=14, format="%6.2f", proc=Update_for_core_shell_activation_panel
	SetVariable T_coat_input,pos={90,85},size={70,20},limits={0,inf,1},title=" ",value=T_coat_input, fsize=14, format="%6.2f", proc=Update_for_core_shell_activation_panel
	SetVariable D_equiv_coat_input,pos={100,110},size={60,20},limits={0,inf,1},title=" ",value=D_equiv_coat_input, fsize=14, format="%5.2f", proc=Update_for_core_shell_activation_panel
	SetVariable kappa_input,pos={90,135},size={70,20},limits={0,2,0.005},title=" ",value=kappa_input, fsize=14, format="%5.4f", proc=Update_for_core_shell_activation_panel
//
//
/////////////////////////////////////
// set up result boxes
	GroupBox Core_shell_activation_outputs pos={35,170}, size={130,155}, labelBack=(50000, 50000, 50000)
//
	DrawText 55, 195, "\Z14\f02D\f00\Bact\M\Z14/nm"
	ValDisplay D_act, pos={110, 175}, size={45, 20}, bodywidth=0, value=#"D_act", fsize=12, format="%5.1f"
//
	DrawText 65,220, "\Z14\f02s\f00\Bact\M\Z14/%"
	ValDisplay s_act_pct, pos={110,200}, size={45,20}, bodywidth=0, value=#"s_act_pct", fsize=12, format="%4.3f"
//	
	DrawText 55,245, "\Z14\f02s\f00\Bact,core\M\Z14/%"
	ValDisplay s_act_core_pct, pos={120,225}, size={35,20}, bodywidth=0, value=#"s_act_core_pct", fsize=12, format="%4.2f"
//
	DrawText 60,270, "\Z14\f02a\f00\Bw,act\M\Z14"
	ValDisplay water_activity_for_core_shell, pos={100,250}, size={55,20}, bodywidth=0, value=#"water_activity_for_core_shell", fsize=12, format="%6.5f"
//	
	DrawText 60,295, "\Z14\f02GF\f00\Bcoat,V\M\Z14"
	ValDisplay volume_growth_factor, pos={115,275}, size={40,20}, bodywidth=0, value=#"volume_growth_factor", fsize=12, format="%4.1f"
//	
	DrawText 40,320, "\Z14\f02GF\f00\Bcoat,D(equiv)\M\Z14"
	ValDisplay equivalent_radial_growth_factor, pos={120,300}, size={35,20}, bodywidth=0, value=#"equivalent_radial_growth_factor", fsize=12, format="%4.2f"
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_core_shell_activation_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This provides the control for SetVariables in Core_shell_activation_panel by updating everything
//		shown in that panel whenever an input is changed.
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: D_core_input, T_coat_input, D_equiv_coat_input, kappa_input (global variables)
//
// Calls: Calculate_D_act_for_core_shell_activation(D_core, T_coat, kappa)
//
// Calls required previously: none
//
// Called by: Make_core_shell_activation_panel
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
	NVAR D_core_input, T_coat_input, D_equiv_coat_input, kappa_input
	NVAR D_act, s_act_pct, s_act_core_pct, water_activity_for_core_shell
	NVAR volume_growth_factor, equivalent_radial_growth_factor
//
//
	Variable D_sigma=2.1 // nm
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “D_core_input”) == 0) // calculate other quantities if D_core_input changed; !!! ASSUME T_coat remains the same
			D_equiv_coat_input=((D_core_input+2*T_coat_input)^3-D_core_input^3)^(1/3)
		EndIf
		If (cmpstr(ctrlName.vName, “T_coat_input”) == 0) // calculate other quantities if T_coat_input changed; !!! ASSUME D_core remains the same
			D_equiv_coat_input=((D_core_input+2*T_coat_input)^3-D_core_input^3)^(1/3)
		EndIf
		If (cmpstr(ctrlName.vName, “D_equiv_coat_input”) == 0) // calculate other quantities if D_equiv_coat_input changed; !!! ASSUME D_core remains the same
			T_coat_input=((D_core_input^3+D_equiv_coat_input^3)^(1/3) - D_core_input)/2
		EndIf
//
//
//////////////// calculate stuff with updated inputs
		D_act=Calculate_D_act_for_core_shell_activation(D_core_input, T_coat_input, kappa_input) // finds activation diameter
		s_act_pct=100*(D_sigma/D_act-kappa_input*D_equiv_coat_input^3/(D_act^3-D_core_input^3)) // calculates activation supersaturatio
		s_act_core_pct=100*(D_sigma/D_core_input)
//
		If (T_coat_input == 0)
			s_act_pct=s_act_core_pct // for no coating, it is purely Kelvin
		EndIf
//
		water_activity_for_core_shell=1-kappa_input*D_equiv_coat_input^3/(D_act^3-D_core_input^3) // calculates water activity of coating
		volume_growth_factor=(D_act^3-D_core_input^3)/D_equiv_coat_input^3
		equivalent_radial_growth_factor=volume_growth_factor^(1/3)
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_D_act_for_core_shell_activation(D_core, T_coat, kappa)
//
//
// written by Ernie Lewis
// last revision 2022-08-11
//
//
// Description: This calculates the activation supersaturation and diameter for a particle with an insoluble core
//		(which may have diameter zero) and with a coating characterized by kappa.
//
// The equation describing this system is s=D_sigma/D - kappa*D_equiv_coat^3/(D^3-D_core^3),
//		where D_equiv_coat^3=(D_core+2*T_coat)^3-D_core^3.
// Taking the derivative with respect to D and solving for D_act yields D_act^3-D0*D_act^2-D_core^3=0,
// 		where D0 = sqrt((3*kappa/D_sigma)*D_equiv_coat^3).
//
// The equation can also be written as D_act = D0 + D_core^3/D_act^2, from which it is clear that
//		D_act > D0, or D_act^3 = D_core^3 + D0*D_act^2, from which it follows that D_act > D_core.
//
// The solution can be obtained by iteration with D_act = D0 + D_core^3/D_act^2, 
//		but this doesn't work in the limit D0=0 (T_coat is VERY small).
// It can also be solved by Newton's method with f(D_act) = D_act^3 - D0*D_act^2 - D_core^3, which yields
//		D_act=(2*D_act^3-D_act^2*D0+D_core^3)/(3*D_act-2*D0)/D_act.
// At D_act=0, f(D_act) = -D_core^3, and the first derivative is always >= 0, and the second derivative > 0.
// Thus the iteration always converges unless 0 is selected as a starting guess for D_act.
// As D_act > D_core and D_act > D0, the largest of these two is selected for the starting guess for iteration.
//
// THE CORE GENERALLY MATTERS VERY LITTLE EXCEPT WHEN T_coat/nm IS LESS THAN ~0.1/kappa.
// Thus, D_act = D0*(1 + D_core^3/D0^3 + ...) if often a very good approximation.
// For a VERY thin coat, D_act = D_core*(1 + 1/3*D0/D_core + ...);
//		in this case, (D_core+2*T_coat)^3-D_core^3 = 6*Tcoat*D_core^2, and D0 = D_core * 3 * sqrt(2*Tcoat*kappa/D_sigma),
//		and D_act = D_core*(1 + sqrt(2*Tcoat*kappa/D_sigma)).
//
// The true equation that follows from the definition of kappa is 
//		s=D_sigma/D - kappa*((D_core+2*T_coat)^3 - D_core^3)/{(D^3 - D_core^3) + kappa*[(D_core+2*T_coat)^3-D_core^3]}, but the above one 
//		is typically used and the difference is minimal.
// The solution to the true equation can be found by replacing D_core^3 in the iteration loop by 
//		D_core^3 - kappa*((D_core+2*T_coat)^3 - D_core^3), or equivalently, by D_core^3 - D0^2*D_sigma/3.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		D_core is the diameter of the insoluble core in nm
//		T_coat is the coating thickness of a hygroscopic coating
//		kappa is the hygroscopicity of the hygroscopic coating
//
// Quantities required for function: D_core, T_coat, kappa
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Update_for_core_shell_activation_panel
//
// Return: D_act
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//
/////////////////// declare variables in call statement
	Variable D_core, T_coat, kappa
//
//
//////////////////// declare other variables needed
	Variable i_loop
	Variable D_sigma, D_equiv_coat, D0, D_act
	D_sigma=2.1 // nm
	D_equiv_coat=((D_core+2*T_coat)^3-D_core^3)^(1/3)
	D0=sqrt(3*kappa/D_sigma*D_equiv_coat^3) // not a physical diameter, but used in calculations
//
//
	If (T_coat == 0) // no coating
		D_act=D_core
		Return D_act
	EndIF
//
//
	D_act=max(D0, D_core) // start iteration with one that is dominant
	FOR (i_loop=0;i_loop<10;i_loop+=1) // iterate 10 times; this should be more than sufficient
		D_act=(2*D_act^3-D_act^2*D0+D_core^3)/(3*D_act-2*D0)/D_act // Newton's method
//		Were the exact equation (i.e., following from the definition of kappa) to be used, 
//			D_core^3 would be replaced by D_core^3 - D0^2*D_sigma/3.
	ENDFOR
//
//
Return D_act
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_core_shell_activation_info_button(core_shell_activation_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calls Print_core_shell_activation_info which prints information on the routine and results.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		core_shell_activation_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_core_shell_activation_info
//
// Calls required previously: none
//
// Called by: Make_core_shell_activation_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &core_shell_activation_info_Struct
//
//
	If (core_shell_activation_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_core_shell_activation_info()
	EndIf
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_core_shell_activation_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the core-shell activation routine.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_core_shell_activation_info_button
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Core_shell_activation_info_text
//
//
	Core_shell_activation_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "Core-Shell Activation Information\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "---------------------------------\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "This panel calculates activation properties of a particle consisting of an insoluble core and a coating with hygroscopicity κ.\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "It is assumed that κ is constant and thus independent of particle diameter, which it typically is not.\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "The user inputs the core diameter (D_core), the coating thickness (T_coat) or equivalent diameter of the coating (D_eq,coat), and κ, \r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   and the activation diameter and superaturation at activation are calculated from s = Dσ/D - κ*D_equiv_coat^3/(D^3 - D_core^3),\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   where D_equiv_coat^3=(D_core+2*T_coat)^3-D_core^3, and Dσ, which is approximately 2.1 nm, is determined from the\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   surface tension, temperature, density of water, etc.\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "If T_coat or D_equiv_coat is changed, the other quantity is calculated from it and the value of D_core.\r\r"
	
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "Even for a VERY thin coating, the equivalent diameter of the coating is quite substantial, and thus the activation properties\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   are VERY nearly independent of the core diameter unless the coating is EXTREMELY thin, less than ~Dσ/(18κ), or ~(0.1 nm)/κ.\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "The equation is solved using Newton's method and will converge for any D_core and T_coat with any nonzero initial value of D_act.\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "As D_act > D_core and D_act > D0 ≡ sqrt(3*kappa/D_sigma*D_equiv_coat^3), the initial value selected is max(D_coat, D0).\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "A good approximation for most situations is D_act ≈ D0*(1 + D_core^3/D0^3).\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "A good approximation for VERY thin coatings is D_act ≈ D_core*(1 + 1/3*D0/D_core).\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "s_act_core is equal to Dσ/D_act and applies for an insoluble core with no coating, in which case D_act = D_core.\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "a_w,act is the water activity of the hydrated coating, equal to 1 - κ*D_equiv_coat^3/(D_act^3 - D_core^3).\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "D_equiv_coat is the diameter or the coating were it a sphere.\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "GF_coat,V is the volumetric growth factor of the coating, equal to (D_act^3-d_core^3)/[(D_core+2*T_coat)^3-D_core^3], \r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   or κ/(1 - aw_act); thus, a_w,act = 1 - κ/GF_coat,V.\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "GF_coat,D(equiv) is the cube root of GF_coat,V, and would be the radial growth factor of the coating were it a sphere.\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "The equation used is technically inconsistent with the exact definition of κ, which would result in the equation \r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   s = Dσ/D - κ*D_equiv_coat^3/[(D^3-D_core^3) + κ*D_equiv_coat^3], but the equation above is the one typically used to \r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   calculate activation properties and the difference, which is minimial, is equivalent to assuming that the vapor pressure\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   lowering is directly proportional to the mole fraction of the solute rather than the solute:water mole ratio.\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "Additionally, it must be noted that the κ approach makes other assumptions that are not valid, such as constancy of κ;\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   for instance, when calculated according to the actual definition, κ at activation for a pure ammonium sulfate particle is \r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   0.55 for D_equiv_coat=25 nm, 0.64 for D_equiv_coat=100 nm, and 0.70 for D_equiv_coat=500 nm.\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "If the actual definition of kappa were used, a_w,act would be 1 - κ*D_equiv_coat^3/[(D_act^3 - D_core^3) + κ*D_equiv_coat^3],\r"
	Core_shell_activation_info_text = Core_shell_activation_info_text + "   equivalent to aw_act = 1 - κ/(GF_coat_V + κ).\r\r"
//
	Core_shell_activation_info_text = Core_shell_activation_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print informaiton
	KillWindow/Z Core_shell_activation_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(275,50,1225,725)/N=Core_shell_activation_info_notebook
	Notebook Core_shell_activation_info_notebook, text=Core_shell_activation_info_text
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Daero_Dgeo_relations_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2025-06-01
//
//
// Description: This sets up a panel to calculate relations between geometric and
//		aerodynamic diameter of a spherical particle.
//		Temperature and pressure can be changed, as these determine the mean free path.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: 
//		Update_for_Daero_Dgeo_relations_panel when any value is changed
//		Choose_rho_or_Dgeo_or_Daero when any control box is selected
//		Do_Daero_Dgeo_relations_panel_info_button when "i" button is hit
//
// Calls required previously: none
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Declare quantities needed in function:
Variable/G TempC_aero_geo, Pres_hPa_aero_geo
Variable/G rhoo, Dgeo, Daero
Variable/G rhoo_value, Dgeo_value, Daero_value // these tell which radio buttons are selected
//
//
//*********************************************************************
//*********************************************************************
/////////// set defaults
// inputs
TempC_aero_geo=20 // deg C
Pres_hPa_aero_geo=1013.25 // hPa
//
rhoo=2.0 // g/cm^3
Dgeo=100 // nm
Daero=167.5 // nm (calculated offline)
//
rhoo_value=1 // rhoo selected
Dgeo_value=1 // Dgeo selected
Daero_value=0 // Daero not selected; calculated from rhoo and Dgeo
//
//
/////////////////////////////////////
//	make Daero-Dgeo relations panel
	KillWindow/Z Daero_Dgeo_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(100,50,280,305) /N=Daero_Dgeo_panel as "Daero-Dgeo Relations"
//
//
/////////////////////////////////////
//	set up Daero_Dgeo Relations title box
	TitleBox Daero_Dgeo_relations_title title="\Z20\f02D\f00\Baero\M\Z20<-->\f02D\f00\Bgeo", pos={20, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up Daero_Dgeo relations info button
	Button Daero_Dgeo_relations_info_button,pos={70,205},size={40,40},proc=Do_Daero_Dgeo_relations_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// set up temperature and pressure input boxes (these will determine the mean free path)
	GroupBox Group_T_P_forDaero_Dgeo pos={10, 55}, size={160, 55}, labelBack=(65535, 50000, 50000)
//
//
	DrawText 25, 80, "\Z14\f02T\f00/°C"
	SetVariable TempC_aero_geo_input, pos={100, 60}, size={55,20}, bodyWidth=0, title=" ", fsize=14, format="%5.1f"
	SetVariable TempC_aero_geo_input, value=TempC_aero_geo, limits={-273.15,inf,1}, proc=Update_for_Daero_Dgeo_relations_panel
//
	DrawText 25, 105, "\Z14\f02P\f00/hPa"
	SetVariable Pres_hPa_aero_geo_input, pos={80, 85}, size={75,20}, bodyWidth=0, title=" ", fsize=14, format="%7.2f"
	SetVariable Pres_hPa_aero_geo_input, value=Pres_hPa_aero_geo, limits={0,inf,1}, proc=Update_for_Daero_Dgeo_relations_panel
//
//
/////////////////////////////////////
// set up Daero_Dgeo relations variable input boxes
	GroupBox Group_Daero_Dgeo pos={10, 115}, size={160, 80}, labelBack=(65535, 50000, 50000)
//
//
// set up Daero_Dgeo relations variable input boxes
	CheckBox rhoo_selected, pos={15, 122.5}, size={20,20}, title=" ", proc=Choose_rho_or_Dgeo_or_Daero, value=rhoo_value, mode=1
	DrawText 35,140, "\Z14\f02ρ\f00/(g cm\S-3\M)"
	SetVariable rhoo_input, pos={105,120}, size={55,20}, bodyWidth=0, title=" ", fsize=14, format="%5.2f"
	SetVariable rhoo_input, value=rhoo, limits={0.01,10,0.1}, proc=Update_for_Daero_Dgeo_relations_panel
//
	CheckBox Dgeo_selected, pos={15,147.5}, size={20,20}, title=" ", proc=Choose_rho_or_Dgeo_or_Daero, value=Dgeo_value, mode=1
	DrawText 35,165, "\Z14\f02D\f00\Bgeo\M\Z14/nn"
	SetVariable Dgeo_input, pos={100,145}, size={62.5,20}, bodyWidth=0, title=" ", fsize=14, format="%5.1f"
	SetVariable Dgeo_input, value=Dgeo, limits={0.01,1000,1}, proc=Update_for_Daero_Dgeo_relations_panel
//
	CheckBox Daero_selected, pos={15,172.5}, size={20,20}, title=" ", proc=Choose_rho_or_Dgeo_or_Daero, value=Daero_value, mode=1
	DrawText 35,190, "\Z14\f02D\f00\Baero\M\Z14/nm"	
	SetVariable Daero_input, pos={100,170}, size={62.5,20}, bodyWidth=0, title=" ", fsize=14, format="%5.1f", disable=2
	SetVariable Daero_input, value=Daero, limits={0.01,1000,1}, proc=Update_for_Daero_Dgeo_relations_panel
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Daero_Dgeo_relations_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2025-06-01
//
//
// Description: This provides the control for SetVariables in Make_Daero_Dgeo_relations_panel 
//		by updating everything shown in that panel whenever an input is changed.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: rhoo, Dgeo, Daero
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Daero_Dgeo_relations_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
// Declare other variables and waves
	NVAR TempC_aero_geo, Pres_hPa_aero_geo
	NVAR rhoo, Dgeo, Daero
	NVAR rhoo_value, Dgeo_value, Daero_value
//
//
// calculate the mean free path from Allen and Raabe (1982), based on Willeke (1976)
Variable TempK_aero_geo, mfp_0, P_ref, T_ref, T_Sutherland, mfp
TempK_aero_geo=TempC_aero_geo+273.15
mfp_0=67.3 // nm, value at 23 deg C and 1 atm (Willeke uses 65.3 nm)
P_ref=1013.25 // hPa
T_ref=296.15 // K
T_Sutherland=110.4 // K (Willeke uses 110.0)
mfp=mfp_0*(TempK_aero_geo/T_ref)*(P_ref/Pres_hPa_aero_geo)*(1+T_Sutherland/T_ref)/(1+T_Sutherland/TempK_aero_geo)
//
//
Variable Acunn, Bcunn, Ccunn
Acunn = 1.165
Bcunn = 0.483
Ccunn = 0.997
// from Kim et al., J. Res. NIST, 110, 31-54, 2005
Variable i, Kn_aero, Kn_geo, Cunn_aero, Cunn_geo, YY_geo, YY_aero
//
//
// this is if an entry is changed
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If ((cmpstr(ctrlName.vName, “TempC_aero_geo”) == 0) || (cmpstr(ctrlName.vName, “Pres_hPa_aero_geo”) == 0)) // TempC_aero_geo or Pres_hPa_aero_geo changed
			If((rhoo_value == 1) && (Dgeo_value == 1)) // rhoo and Dgeo selected 
//				calculate Daero from rhoo and Dgeo
				Kn_geo=2*mfp/Dgeo
				Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
				YY_geo=Dgeo^2*Cunn_geo*rhoo
				Daero=Dgeo*rhoo^(3/4) // good starting guess			
				For (i=0;i<10;i+=1) // iteration scheme from Ernie R. Lewis (2021): Optimal iteration and its application to some problems in aerosol science and particle dynamics, Aerosol Science and Technology, DOI:
					Kn_aero=2*mfp/Daero
					Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))
					Daero=(YY_geo^2/Daero/Cunn_aero^2)^(1/3)
				EndFor
			EndIf
//
			If((rhoo_value == 1) && (Daero_value == 1)) // rhoo and Daero selected 
//				calculate Dgeo from rhoo and Daero
				Kn_aero=2*mfp/Daero
				Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))
				YY_aero=Daero^2*Cunn_aero/rhoo
				Dgeo=Daero/rhoo^(3/4) // good starting guess			
				For (i=0;i<10;i+=1) // iteration scheme from Ernie R. Lewis (2021): Optimal iteration and its application to some problems in aerosol science and particle dynamics, Aerosol Science and Technology, DOI:
					Kn_geo=2*mfp/Dgeo
					Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
					Dgeo=(YY_aero^2/Dgeo/Cunn_geo^2)^(1/3)
				EndFor
			EndIf
//
			If((Dgeo_value == 1) && (Daero_value == 1)) // rhoo and Daero selected 
//				calculate rhoo from Dgeo and Daero
				Kn_geo=2*mfp/Dgeo
				Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
				Kn_aero=2*mfp/Daero
				Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))		
				rhoo=Daero^2*Cunn_aero/Dgeo^2/Cunn_geo // calculate rhoo from Dgeo and Daero
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “rhoo”) == 0) // rhoo changed, which means it was selected
			If (Dgeo_value == 1) // Dgeo was also selected
//				calculate Daero from rhoo and Dgeo
				Kn_geo=2*mfp/Dgeo
				Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
				YY_geo=Dgeo^2*Cunn_geo*rhoo
				Daero=Dgeo*rhoo^(3/4) // good starting guess			
				For (i=0;i<10;i+=1) // iteration scheme from Ernie R. Lewis (2021): Optimal iteration and its application to some problems in aerosol science and particle dynamics, Aerosol Science and Technology, DOI:
					Kn_aero=2*mfp/Daero
					Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))
					Daero=(YY_geo^2/Daero/Cunn_aero^2)^(1/3)
				EndFor
			EndIf
//
			If (Daero_value == 1) // Daero was also selected
//				calculate Dgeo from rhoo and Daero
				Kn_aero=2*mfp/Daero
				Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))
				YY_aero=Daero^2*Cunn_aero/rhoo
				Dgeo=Daero/rhoo^(3/4) // good starting guess			
				For (i=0;i<10;i+=1) // iteration scheme from Ernie R. Lewis (2021): Optimal iteration and its application to some problems in aerosol science and particle dynamics, Aerosol Science and Technology, DOI:
					Kn_geo=2*mfp/Dgeo
					Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
					Dgeo=(YY_aero^2/Dgeo/Cunn_geo^2)^(1/3)
				EndFor
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “Dgeo”) == 0) // Dgeo changed, which means it was selected
			If (rhoo_value == 1) // rhoo was also selected
//				calculate Daero from rhoo and Dgeo
				Kn_geo=2*mfp/Dgeo
				Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
				YY_geo=Dgeo^2*Cunn_geo*rhoo
				Daero=Dgeo*rhoo^(3/4) // good starting guess			
				For (i=0;i<10;i+=1) // iteration scheme from Ernie R. Lewis (2021): Optimal iteration and its application to some problems in aerosol science and particle dynamics, Aerosol Science and Technology, DOI:
					Kn_aero=2*mfp/Daero
					Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))
					Daero=(YY_geo^2/Daero/Cunn_aero^2)^(1/3)
				EndFor
			EndIf
//
			If (Daero_value == 1) // Daero was also selected
//				calculate rhoo from Dgeo and Daero
				Kn_geo=2*mfp/Dgeo
				Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
				Kn_aero=2*mfp/Daero
				Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))		
				rhoo=Daero^2*Cunn_aero/Dgeo^2/Cunn_geo // calculate rhoo from Dgeo and Daero
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “Daero”) == 0) // Daero changed, which means it was selected
			If (rhoo_value == 1) // rhoo was also selected
//				calculate Dgeo from rhoo and Daero
				Kn_aero=2*mfp/Daero
				Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))
				YY_aero=Daero^2*Cunn_aero/rhoo
				Dgeo=Daero/rhoo^(3/4) // good starting guess			
				For (i=0;i<10;i+=1) // iteration scheme from Ernie R. Lewis (2021): Optimal iteration and its application to some problems in aerosol science and particle dynamics, Aerosol Science and Technology, DOI:
					Kn_geo=2*mfp/Dgeo
					Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
					Dgeo=(YY_aero^2/Dgeo/Cunn_geo^2)^(1/3)
				EndFor
			EndIf
//
			If (Dgeo_value == 1) // Dgeo was also selected
//				calculate rhoo from Dgeo and Daero
				Kn_geo=2*mfp/Dgeo
				Cunn_geo=1+Kn_geo*(Acunn+Bcunn*exp(-Ccunn/Kn_geo))
				Kn_aero=2*mfp/Daero
				Cunn_aero=1+Kn_aero*(Acunn+Bcunn*exp(-Ccunn/Kn_aero))		
				rhoo=Daero^2*Cunn_aero/Dgeo^2/Cunn_geo // calculate rhoo from Dgeo and Daero
			EndIf
		EndIf
//
//
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Choose_rho_or_Dgeo_or_Daero(Choose_rho_or_Dgeo_or_Daero_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2025-06-01
//
//
// Description: This provides the control for the check boxes for the choice of 
//		whether rhoo, Dgeo, or Daero is held constant while another is varied.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Choose_rho_or_Dgeo_or_Daero_box tells whether the box is checked for calculations.
//
//
// Quantities required for function: none
// Variables calculated in function: Choose_rho_or_Dgeo_or_Daero_value
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Daero_Dgeo_relations_panel (when checkbox for rhoo, Dgeo, or Daero is checked)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//f
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& Choose_rho_or_Dgeo_or_Daero_box
	NVAR rhoo_value, Dgeo_value, Daero_value
//
//
//	This determines which pair of boxes amoung rhoo, Dgeo, and Daero is checked.
	If (Choose_rho_or_Dgeo_or_Daero_box.eventcode == 2) // do only when mouse goes up (eventcode = 2)
//
		// disable all inputs
		SetVariable rhoo_input, disable=2 // disable this one
		SetVariable Dgeo_input, disable=2 // disable this one
		SetVariable Daero_input, disable=2 // disable this one
//
		StrSwitch (Choose_rho_or_Dgeo_or_Daero_box.ctrlName)
			Case "rhoo_selected":
				rhoo_value=1 // select this one
				If (Dgeo_value==1 & Daero_value==1) // both other boxes are selected
					CheckBox Dgeo_selected, value=0 // deselect this one
					Dgeo_value=0
					Checkbox Daero_selected, value=0 // deselect this one
					Daero_value=0
				Else // this would be the second time
					Checkbox rhoo_selected, value=1 // select this one
					rhoo_value=1
					SetVariable rhoo_input, disable=0 // enable this one
					If (Dgeo_value==1)
						SetVariable Dgeo_input, disable=0 // enable this one
					EndIf
					If (Daero_value==1)
						SetVariable Daero_input, disable=0 // enable this one
					EndIf
				EndIf
				Break		
//
			Case "Dgeo_selected":
				Dgeo_value=1 // select this one
				If (rhoo_value==1 & Daero_value==1) // both other boxes are selected
					Checkbox rhoo_selected, value=0 // deselect this one
					rhoo_value=0
					Checkbox Daero_selected, value=0 // deselect this one
					Daero_value=0
				Else // this would be the second time
					Checkbox Dgeo_selected, value=1 // select this one
					Dgeo_value=1
					SetVariable Dgeo_input, disable=0 // enable this one
					If (rhoo_value==1)
						SetVariable rhoo_input, disable=0 // enable this one
					EndIf
					If (Daero_value==1)
						SetVariable Daero_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
//
			Case "Daero_selected":
				Daero_value=1 // select this one
				If (rhoo_value==1 & Dgeo_value==1) // both other boxes are selected
					Checkbox rhoo_selected, value=0 // deselect this one
					rhoo_value=0
					Checkbox Dgeo_selected, value=0 // deselect this one
					Dgeo_value=0
				Else // this would be the second time
					Checkbox Daero_selected, value=1 // select this one
					Daero_value=1
					SetVariable Daero_input, disable=0 // enable this one
					If (rhoo_value==1)
						SetVariable rhoo_input, disable=0 // enable this one
					EndIf
					If (Dgeo_value==1)
						SetVariable Dgeo_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
		EndSwitch
	EndIf
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Daero_Dgeo_relations_panel_info_button(Do_Daero_Dgeo_relations_panel_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2025-06-01
//
// Description: This calls Daero_Dgeo_relations_panel_info when the 
//		Do_Daero_Dgeo_relations_panel_info_button is hit in panel Daero_Dgeo_relations_panel.
//
//
// Version history: there are no previous versions
//
// Explanation of call parameters: Do_Daero_Dgeo_relations_panel_info_Struct
//		is the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Daero_Dgeo_relations_info
//
// Calls required previously: none
//
// Called by: Daero_Dgeo_relations_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Do_Daero_Dgeo_relations_panel_info_Struct
//
//
	If (Do_Daero_Dgeo_relations_panel_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Daero_Dgeo_relations_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Daero_Dgeo_relations_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2025-06-01
//
//
// Description: This prints information on Daero-Dgeo relations displayed in Make_Daero_Dgeo_relations_panel.

//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Daero_Dgeo_relations_panel_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Daero_Dgeo_relations_info_text
//
//
	Daero_Dgeo_relations_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Daero_Dgeo_relations_info_text = Daero_Dgeo_relations_info_text + "Relationship between Daero and Dgeo\r"
	Daero_Dgeo_relations_info_text = Daero_Dgeo_relations_info_text + "-----------------------------------\r\r"
//
	Daero_Dgeo_relations_info_text = Daero_Dgeo_relations_info_text + "The aerodynamic and geometric diameters of a spherical particle ρ with density are related by \r\r"
//
	Daero_Dgeo_relations_info_text = Daero_Dgeo_relations_info_text + "           ρ_0 * Daero^2 * C(Daero) = ρ * Dgeo^2 * C(Dgeo),\r\r"
//
	Daero_Dgeo_relations_info_text = Daero_Dgeo_relations_info_text + "   where ρ_0 = 1 g cm^(-3) and C(D) is the Cunningham correction.\r\r"
//
	Daero_Dgeo_relations_info_text = Daero_Dgeo_relations_info_text + "Temperature and pressure determine the mean free path and thus the value of the Cunningham correction.\r\r"
//
	Daero_Dgeo_relations_info_text = Daero_Dgeo_relations_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Daero_Dgeo_relations_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(370,50,1105,270)/N=Daero_Dgeo_relations_info_notebook
	Notebook Daero_Dgeo_relations_info_notebook, text=Daero_Dgeo_relations_info_text, fsize=11
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Re_Cd_relations_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-16
//
//
// Description: This sets up a panel to calculate and display relations between 
//		the Reynolds number Kn and the drag coefficient Cd.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: eee
//
// Calls required previously: none
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Declare quantities needed in function:
Variable/G Re_input, Cd_input, Cd_times_Re_squared_input, Re_by_Cd_input
//
//
//*********************************************************************
//*********************************************************************
/////////// set defaults
// inputs
Re_input=1
Cd_input=27.6 // calculated offline
Cd_times_Re_squared_input=Cd_input*Re_input^2
Re_by_Cd_input=Re_input/Cd_input
//
//
Make/O/D/N=1 Cd_input_wave, Re_input_wave
Cd_input_wave={Cd_input}
Re_input_wave={Re_input}
//
//
/////////////////////////////////////
//	make Re-Cd relations panel
	KillWindow/Z Re_Cd_relations_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(25,50,205,295) /N=Re_Cd_relations_panel as "Re-Cd Relations"
//
//
/////////////////////////////////////
//	set up Re_Cd Relations title box
	TitleBox Re_Cd_relations_title title="\Z20Re-Cd Relations", pos={15, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up graph Cd(Re) fits button
	Button Graph_Cd_Re_button,pos={25, 160}, size={130, 25}, proc=Graph_Cd_Re_info, title="\Z14Graph Cd(Re) fits",fcolor=(0, 65535, 0)
//
//
/////////////////////////////////////
// set up Re_Cd relations info button
	Button Re_Cd_relations_info_button,pos={70,195},size={40,40},proc=Do_Re_Cd_relations_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// group Re-Cd relations variable input box
	GroupBox Group_Re_Cd_inputs pos={15, 50}, size={155, 105}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up Re-Cd relations variable input boxes
	DrawText 20,75, "\Z14Re"
	SetVariable Re_input, pos={75,55}, size={90,20}, bodyWidth=0, title=" ", fsize=14, format="%6.4g"
	SetVariable Re_input, value=Re_input, limits={0,2e5,0.1}, proc=Update_for_Re_Cd_relations_panel
//
	DrawText 20,100, "\Z14Cd"
	SetVariable Cd_input, pos={75,80}, size={90,20}, bodyWidth=0, title=" ", fsize=14, format="%6.4g"
	SetVariable Cd_input, value=Cd_input, limits={0.39,inf,0.1}, proc=Update_for_Re_Cd_relations_panel
//
	DrawText 20,125, "\Z14Cd\Z12×\Z14Re\S2"
	SetVariable Cd_times_Re_squared_input, pos={75,105}, size={90,20}, bodyWidth=0, title=" ", fsize=14, format="%6.4g"
	SetVariable Cd_times_Re_squared_input, value=Cd_times_Re_squared_input, limits={0,inf,1}, proc=Update_for_Re_Cd_relations_panel
//
	DrawText 20,150, "\Z14Re/Cd"
	SetVariable Re_by_Cd_input, pos={75,130}, size={90,20}, bodyWidth=0, title=" ", fsize=14, format="%6.4g"
	SetVariable Re_by_Cd_input, value=Re_by_Cd_input, limits={0,inf,0.1}, proc=Update_for_Re_Cd_relations_panel
//
//
///////////////////////// make waves of Re, Cd, graph
Make/O/D/N=1000 Re_wave, Cd_wave, Cd_times_Re_squared_wave, Re_by_Cd_wave
Re_wave=10^(-2+x/1000*7.3) // goes from 0.01 to 196,200
Cd_wave=24/Re_wave*(1+0.15*Re_wave^0.681)+0.407/(1+8710/Re_wave) // Brown and Lawler, 2003
Cd_times_Re_squared_wave=Cd_wave*Re_wave^2
Re_by_Cd_wave=Re_wave/Cd_wave
//
//
Return 0
//
//
END


eee include others:

CCdd17=24/Re+3.648/Re^.323+.417*Re^.940/(5070+Re^.940) // Brown and Lawler 2004 eq. 17
CCdd19=24/Re+3.6/Re^.319+.407*Re/(8710+Re) // Brown and Lawler 2004 eq. 19

CdCheng=24/Re*(1+0.27*Re)^.43+0.47*(1-exp(-0.04*Re^.38)) // Cheng, Powder Technology v189, 2009

Make/O/D/N=1000 Cd_Stokes, Cd_half, Cd_Perry, Cd_Newton, Cd_White, Cd_Massey, Cd_Zahn, Cd_Ingebo, Cd_Oseen
Make/O/D/N=1000 Cd_Olson, Cd_Abraham, Cd_Serafini, Cd_Klyachko, Cd_SchillerNaumann

Cd_Stokes=24/RRee
Cd_half=12/RRee^0.5
Cd_Perry=18.5/RRee^0.6
Cd_Newton=0.44
Cd_White=24/RRee*(1+RRee/60 + RRee/4/(1+sqrt(RRee)))
Cd_Zahn=28/RRee^0.85 + 0.48
Cd_Ingebo=27/RRee^0.84


// EEEEEE !!!!!!! some of these used different definitions of Re

Cd_Carrier=24/RRee*(1+0.43*3/16*RRee)
Cd_Olson=24/RRee*(1+3/16*RREe)^0.5
Cd_Massey=24/RRee*sqrt(1+3/16*RRee)
Cd_Abraham=24/RRee*(1+RRee^0.5/9.06)^2
Cd_Serafini=24/RRee*(1+0.158*RRee^(2/3))
Cd_Klyachko=24/RRee*(1+1/6*RRee^(2/3))
Cd_SchillerNaumann=24/RRee*(1+0.15*RRee^.687)



Make/O/D/N=1000 pctdiff_Stokes, pctdiff_half, pctdiff_Perry, pctdiff_Newton, pctdiff_White, pctdiff_Massey, pctdiff_Zahn, pctdiff_Ingebo, pctdiff_Oseen
Make/O/D/N=1000 pctdiff_Olson, pctdiff_Abraham, pctdiff_Serafini, pctdiff_Klyachko, pctdiff_SchillerNaumann



pctdiff_Perry=100*(Cd_Perry/CCdd-1)
pctdiff_half=100*(Cd_half/CCdd-1)
pctdiff_Newton=100*(Cd_Newton/CCdd-1)

pctdiff_Zahn=100*(Cd_Zahn/CCdd-1)
pctdiff_Ingebo=100*(Cd_Ingebo/CCdd-1)
pctdiff_White=100*(Cd_White/CCdd-1)
pctdiff_Carrier=100*(Cd_Carrier/CCdd-1)
pctdiff_Massey=100*(Cd_Massey/CCdd-1)
pctdiff_Olson=100*(Cd_Olson/CCdd-1)
pctdiff_Abraham=100*(Cd_Abraham/CCdd-1)
pctdiff_Serafini=100*(Cd_Serafini/CCdd-1)
pctdiff_Klyachko=100*(Cd_Klyachko/CCdd-1)
pctdiff_SchillerNaumann=100*(Cd_SchillerNaumann/CCdd-1)





/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Re_Cd_relations_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-16
//
//
// Description: This provides the control for SetVariables in Make_Re_Cd_relations_panel 
//		by updating everything shown in that panel whenever an input is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: Re_input, Cd_input, Cd_times_Re_squared_input, Re_by_Cd_input
//
// Calls: eee
//
// Calls required previously: none
//
// Called by: Make_Re_Cd_relations_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
	Make/O/D/N=1 Cd_input_wave, Re_input_wave
//
//
// Declare other variables and waves
	NVAR Re_input, Cd_input, Cd_times_Re_squared_input, Re_by_Cd_input
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “Re_input”) == 0) // calculate other quantities if Re changed
		EndIf
//
		If (cmpstr(ctrlName.vName, “Cd_input”) == 0) // calculate other quantities if Cd changed
			Re_input=Calculate_Re_from_Cd(Cd_input)
		EndIf
//
		If (cmpstr(ctrlName.vName, “Cd_times_Re_squared_input”) == 0) // calculate other quantities if Re*Cd^2 changed
			Re_input=Calculate_Re_from_Cd_times_Re_squared(Cd_times_Re_squared_input)
		EndIf
//
		If (cmpstr(ctrlName.vName, “Re_by_Cd_input”) == 0) // calculate other quantities if Cd/Re changed
			Re_input=Calculate_Re_from_Re_by_Cd(Re_by_Cd_input)
		EndIf
//
//
// recalculate all
	Cd_input=24/Re_input*(1+0.150*Re_input^0.681)+0.407/(1+8710/Re_input) // Brown and Lawler, 2003
	Cd_times_Re_squared_input=Cd_input*Re_input^2
	Re_by_Cd_input=Re_input/Cd_input
//
//
	Cd_input_wave={Cd_input}
	Re_input_wave={Re_input}
//
//
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Re_Cd_relations_panel_info_button(Make_Re_Cd_relations_panel_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-01-16
//
// Description: This calls Re_Cd_relations_panel_info when the 
//		Re_Cd_relations_info_button is hit in panel Make_Cd_Re_relations_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: Make_Re_Cd_relations_panel_info_Struct 
//		is the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Re_Cd_relations_info
//
// Calls required previously: none
//
// Called by: Make_Re_Cd_relations_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Make_Re_Cd_relations_panel_info_Struct
//
//
	If (Make_Re_Cd_relations_panel_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Re_Cd_relations_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Re_Cd_relations_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-04-18
//
//
// Description: This prints information on the relations between Re and Cd.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Re_Cd_relations_panel_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Re_Cd_relations_info_text
//
	Re_Cd_relations_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Cd-Re Relations information\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "---------------------------\r\r"
//
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "These panels show various relations proposed for the drag coefficient, Cd, as a function of the\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "   Reynolds number, Re.\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "The Reynolds number of a spherical particle of diameter D moving at speed u in a gas with\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "   kinematic viscosity ν_g, Re = uD/ν_g, where g is the acceleration due to gravity, \r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "   quantifies the relative importance of inertia to viscous drag in the motion of the particle.\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "The drag coefficient for a spherical particle of density ρ_p moving at terminal velocity u_term\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "   in a gas with density ρ_g is Cd = Force/(π/2×D^2×u^2) = (4/3)(ρ_p/ρ_g)×D×g/u_term^2.\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Many authors use different definitions for Re and Cd, so caution is required.\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Rayleigh (1910) showed that for a rigid sphere, Cd depends only on Re.\r\r"
//
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "The quantity Re/Cd = (3/4)(ρ_g/ρ_p)×u^3/(g×ν_g) is independent of diameter, and\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "   the quantity Cd×Re^2 = (4/3)(ρ_p/ρ_g)×D^3×(g/ν_g^2) is independent of velocity.\r\r"
//
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "There are many approximations, but the one used here as the corect formulation is from\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "   Brown and Lawler (2003): Cd=24/Re×(1+0.15×Re^0.681)+0.407/(1+8710/Re).\r\r"

	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Common approximations are:\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Stokes' (1850) relation: Cd=24/Re, is valid for low Re.\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Oseen (1913) proposed an extension: Cd=24/Re×(1+3/16×Re).\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Carrier (1953) proposed a semi-empirical expression: Cd=24/Re×(1+0.08×Re).\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Serafini (1954) and others proposed the empirical approximation Cd=24/Re×[1+0.158×Re^(2/3)].\r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Abraham (1960) proposed the empirical approximation Cd=24/Re×[1+sqrt(Re)/9.06]^2.\r\r"
//
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "Approximations based on series expansions are from Stokes (1850), Oseen (1913), Carrier (1953), \r"
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "   Goldstein (1929), Illingworth (1963), Proudman & Pearson (1957), and Chester & Breach (1969).\r\r"
	
	Re_Cd_relations_info_text = Re_Cd_relations_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Re_Cd_relations_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(50,320,750,830)/N=Re_Cd_relations_info_notebook
	Notebook Re_Cd_relations_info_notebook, text=Re_Cd_relations_info_text, fsize=11
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Re_from_Cd(CCdd)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-16
//
//
// Description: This calculates the value of Re (the Reynolds number) from the drag coefficient Cd.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: Cd is the drag coefficient.
//
// Quantities required for function: Cd
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Re_Cd_relations_panel, Update_for_Re_Cd_relations_panel
//
// Return: RRee
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	Variable CCdd
//
//
// Declare other variables and waves
	Variable i_loop, RRee, RRee_new, dCd_dRe, Cd_new
//
//


// Cd(Re) is monotonically decreasing to 0.3895 at Re ~ 3969, then it flattens out. 
//*********************************************************************
//*********************************************************************
// use Newton's method - it converges very rapidly (unusally one or two steps)
	RRee=24/CCdd // inital guess; generally underestimates, but that's better than overestimating
	For (i_loop=1;i_loop<25;i_loop+=1)
		dCd_dRe=-24/RRee^2*(1+0.150*RRee^0.681)+24/RRee*(0.150*0.681/RRee^0.319)+0.407/(1+8710/RRee)^2*8710/RRee^2
		Cd_new=24/RRee*(1+0.150*RRee^0.681)+0.407/(1+8710/RRee)
		RRee_new=RRee-(Cd_new-CCdd)/dCd_dRe // this is Newton's method
		RRee=RRee_new
	EndFor
//
//
	Return RRee
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Re_from_Cd_times_Re_squared(Cd_times_Re_squared)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-16
//
//
// Description: This calculates the value of Re (the Reynolds number) from Cd*Re^2.
//
//	
// Version history: There are no previous versions.
//
// Explanation of call parameters: Cd_times_Re_squared is the drag coefficient times the Reynolds number squared.
//
// Quantities required for function: Cd_times_Re_squared
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Re_Cd_relations_panel, Update_for_Re_Cd_relations_panel
//
// Return: RRee
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	Variable Cd_times_Re_squared
//
//
// Declare other variables and waves
	Variable i_loop, RRee, CCdd, RRee_new
//
//
//*********************************************************************
//*********************************************************************
// iterate using scheme from my 2021 paper
	RRee=1/(24/Cd_times_Re_squared + sqrt(0.39/Cd_times_Re_squared)) // starting guess
	For (i_loop=1;i_loop<10;i_loop+=1)
		CCdd=24/RRee*(1+0.150*RRee^0.681)+0.407/(1+8710/RRee) // Brown and Lawler, 2003
		RRee_new=Cd_times_Re_squared^(2/3)/RRee^(1/3)/CCdd^(2/3)
		RRee=RRee_new
	EndFor
//
//
Return RRee
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Re_from_Re_by_Cd(Re_by_Cd)
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-16
//
//
// Description: This calculates the value of Re (the Reynolds number) from Re/Cd.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: Re_by_Cd is the Reynolds number divided by the drag coefficient.
//
// Quantities required for function: Re_by_Cd
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Re_Cd_relations_panel, Update_for_Re_Cd_relations_panel
//
// Return: Re
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	Variable Re_by_Cd
//
//
// Declare other variables and waves
	Variable i_loop, RRee, CCdd, RRee_new
//
//
//*********************************************************************
//*********************************************************************
// iterate using scheme from my 2021 paper
	RRee=sqrt(24*Re_by_Cd+0.39^2*Re_by_Cd^2) // starting guess
	For (i_loop=1;i_loop<10;i_loop+=1)
		CCdd=24/RRee*(1+0.150*RRee^0.681)+0.407/(1+8710/RRee) // Brown and Lawler, 2003
		RRee_new=RRee^(1/3)*Re_by_Cd^(2/3)*CCdd^(2/3)
		RRee=RRee_new
	EndFor
//
//
Return RRee
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_Cd_Re_info(Graph_Cd_Re_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2025-06-01
//
//
// Description: This calls Graph_Cd_of_Re() when the Graph_Cd_Re_button is hit in panel Make_Cd_Re_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Graph_Cd_Re_info_Struct - the structure for this button control
//
//
// Quantities required for function: none
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: Graph_coagulation_coefficient
// Calls required previously: none
// Called by: Make_Cd_Re_panel (when “Graph Cd(Re) info" button hit)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Graph_Cd_Re_Struct
//
//
	If (Graph_Cd_Re_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Graph_Cd_of_Re()
	EndIf
//
//
Return 0
//
//
End
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Graph_Cd_of_Re()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2025-06-01
//
//
// Description: This graphs Cd(Re) fits and displays the location of Cd(Re) in the panel Make_Cd_Re_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
// Variables calculated in function: none
// Waves created in function: none
// Free waves created in function: none
// Calls: Graph_coagulation_coefficient
// Calls required previously: none
// Called by: Graph_Cd_Re_info
// Return: 0
//
//
Wave Re_wave, Cd_wave, Re_input_wave, Cd_input_wave
//
//
/////// graph Cd(Re)
KillWindow/Z Cd_of_Re_graph // get rid of previous graph if it exists
Display/K=1/W=(225, 50, 875, 450) /N=Cd_of_Re_graph as "Cd(Re) graph"
AppendtoGraph Cd_wave vs Re_wave
ModifyGraph log=1,mirror=1,standoff=0, fsize=24, rgb=(0,0,0)
SetAxis left 0.1,400
SetAxis bottom 0.1, 2e5
//
Make/O/D/N=1000 Stokes, Oseen, Carrier, Serafini, Abraham, Cd_min
Stokes=24/Re_wave
Oseen=24/Re_wave*(1+3/16*Re_wave)
Carrier=24/Re_wave*(1+0.08*Re_wave)
Serafini=24/Re_wave*(1+0.158*Re_wave^(2/3))
Abraham=24/Re_wave*(1+sqrt(Re_wave)/9.06)^2
Cd_min=0.39
//
AppendtoGraph Stokes, Oseen, Carrier, Serafini, Abraham, Cd_min vs Re_wave
ModifyGraph rgb=(0,0,0), lsize(Cd_wave)=2, lstyle(Stokes)=3, lstyle(Oseen)=2, lstyle(Carrier)=4, lstyle(Serafini)=5, lstyle(Abraham)=6, lstyle(Cd_min)=1
Label left "\Z24Drag coefficient, C\Bd"
Label bottom "\Z24\r\rReynolds number, Re"
TextBox/C/N=text0/F=0/B=1/A=RT/X=2/Y=2 "\Z14\s(Cd_wave)C\Bd\M\Z14     \s(Cd_min)C\Bd,min\M\Z14 = 0.39\r\s(Stokes)Stokes (1850):   C\Bd\M\Z14 = 24/Re\r\s(Oseen)Oseen (1913):    C\Bd\M\Z14 = (24/Re)×(1+3/16×Re)\r\s(Carrier)Carrier (1953):    C\Bd\M\Z14 = (24/Re)×(1+0.08×Re)\r\s(Serafini)Serafini (1954):   C\Bd\M\Z14 = (24/Re)×(1+0.158×Re\S2/3\M\Z14)\r\s(Abraham)Abraham (1970): C\Bd\Z14 = (24/Re)×(1+Re\S1/2\M\Z14/9.06)\S2\M\Z14"
//
AppendtoGraph Cd_input_wave vs Re_input_wave
ModifyGraph rgb(Cd_input_wave)=(65535,0,0),mode(Cd_input_wave)=3,marker(Cd_input_wave)=19,msize(Cd_input_wave)=5
//
//
Make/O/D/N=1000 zero, pctdiff_Stokes, pctdiff_Oseen, pctdiff_Carrier, pctdiff_Serafini, pctdiff_Abraham
zero=0
pctdiff_Stokes=100*(Stokes/Cd_wave-1)
pctdiff_Oseen=100*(Oseen/Cd_wave-1)
pctdiff_Carrier=100*(Carrier/Cd_wave-1)
pctdiff_Serafini=100*(Serafini/Cd_wave-1)
pctdiff_Abraham=100*(Abraham/Cd_wave-1)
//
//
KillWindow/Z pctdiff_Cd_of_Re_graph // get rid of previous graph if it exists
Display/K=1/W=(225, 500, 875, 900) /N=pctdiff_Cd_of_Re_graph as "pctdiff of Cd(Re) graph"
AppendtoGraph zero, pctdiff_Stokes, pctdiff_Oseen, pctdiff_Carrier, pctdiff_Serafini, pctdiff_Abraham vs Re_wave
ModifyGraph log(bottom)=1,mirror=1,standoff=0, fsize=24, rgb=(0,0,0)
SetAxis left -100,100
SetAxis bottom 0.1, 2e5
ModifyGraph rgb=(0,0,0), lstyle(zero)=1, lstyle(pctdiff_Stokes)=3, lstyle(pctdiff_Oseen)=2, lstyle(pctdiff_Carrier)=4, lstyle(pctdiff_Serafini)=5, lstyle(pctdiff_Abraham)=6
Label left "\Z24 % difference"
Label bottom "\Z24\r\rReynolds number, Re"
TextBox/C/N=text0/F=0/B=1/A=RT/X=5/Y=5 "\Z16\s(pctdiff_Stokes)Stokes\r\s(pctdiff_Oseen)Oseen\r\s(pctdiff_Carrier)Carrier\r\s(pctdiff_Serafini)Serafini\r\s(pctdiff_Abraham)Abraham"
//
//

// EEEE !!!!!!! some of these used different definitions of Re


Make/O/D/N=1000 Goldstein, Illingworth, ProudmanPearson, ChesterBreach
Goldstein=24/Re_wave*(1+3/16*Re_wave-19/1280*Re_wave^2+71/20480*Re_wave^3-30179/34406400*Re_wave^4+122519/550502400*Re_wave^5) // with correction by Shanks, 1955
Illingworth=24/Re_wave*(1+3/16*Re_wave+9/160*Re_wave^2*(ln(Re_wave)+40*.133/9-ln(2))+81/2560*Re_wave^3*ln(Re_wave)-(81/2560*ln(2)+.0034/8)*Re_wave^3)
ProudmanPearson=24/Re_wave*(1+3/16*Re_wave+9/160*Re_wave^2*ln(Re_wave))
ChesterBreach=24/Re_wave*(1+3/16*Re_wave+9/160*Re_wave^2*(ln(Re_wave)+.57721566490+2/3*ln(2)-323/360)+27/640*Re_wave^3*ln(Re_wave))
//
Make/O/D/N=1000 pctdiff_Goldstein, pctdiff_Illingworth, pctdiff_ProudmanPearson, pctdiff_ChesterBreach
pctdiff_Goldstein=100*(Goldstein/Cd_wave-1)
pctdiff_Illingworth=100*(Illingworth/Cd_wave-1)
pctdiff_ProudmanPearson=100*(ProudmanPearson/Cd_wave-1)
pctdiff_ChesterBreach=100*(ChesterBreach/Cd_wave-1)
//
//
/////// graph Cd(Re) for series expressions
KillWindow/Z Cd_of_Re_series_graph // get rid of previous graph if it exists
Display/K=1/W=(900, 50, 1500, 450) /N=Cd_of_Re_series_graph as "Cd(Re) series graph"
AppendtoGraph Cd_wave vs Re_wave
ModifyGraph log=1,mirror=1,standoff=0, fsize=24, rgb=(0,0,0)
SetAxis left 0.1,400
SetAxis bottom 0.1, 100
//
AppendtoGraph Stokes, Oseen, Carrier, Goldstein, Illingworth, ProudmanPearson, ChesterBreach vs Re_wave
ModifyGraph rgb=(0,0,0), lsize(Cd_wave)=2, lstyle(Stokes)=3, lstyle(Oseen)=2, lstyle(Carrier)=4, lstyle(Goldstein)=5, lstyle(Illingworth)=6, lstyle(ProudmanPearson)=7, lstyle(ChesterBreach)=8
Label left "\Z24Drag coefficient, C\Bd"
Label bottom "\Z24\r\rReynolds number, Re"
TextBox/C/N=text0/F=0/B=1/A=LB/X=1/Y=1 "\Z16\s(Stokes)Stokes (1850)\r\s(Oseen)Oseen (1913)\r\s(Carrier)Carrier (1953)\r\s(Goldstein)Goldstein (1929)\r\s(Illingworth)Illingworth (1963)\r\s(ProudmanPearson)Proudman and Pearson (1957)\r\s(ChesterBreach)Chester and Breach (1969)"
//
//
KillWindow/Z pctdiff_Cd_of_Re_series_graph // get rid of previous graph if it exists
Display/K=1/W=(900, 500, 1500, 900) /N=pctdiff_Cd_of_Re_series_graph as "pctdiff of Cd(Re) series graph"
AppendtoGraph zero, pctdiff_Stokes, pctdiff_Oseen, pctdiff_Carrier, pctdiff_Goldstein, pctdiff_Illingworth, pctdiff_ProudmanPearson, pctdiff_ChesterBreach vs Re_wave
ModifyGraph log(bottom)=1,mirror=1,standoff=0, fsize=24, rgb=(0,0,0)
SetAxis left -50,50
SetAxis bottom 0.1, 100
ModifyGraph rgb=(0,0,0), lstyle(zero)=1, lstyle(pctdiff_Stokes)=3, lstyle(pctdiff_Oseen)=2, lstyle(pctdiff_Carrier)=4, lstyle(pctdiff_Goldstein)=5, lstyle(pctdiff_Illingworth)=6, lstyle(pctdiff_ProudmanPearson)=7, lstyle(pctdiff_ChesterBreach)=8
Label left "\Z24 % difference"
Label bottom "\Z24\r\rReynolds number, Re"
TextBox/C/N=text0/F=0/B=1/A=LB/X=1/Y=1 "\Z16\s(pctdiff_Stokes)Stokes\r\s(pctdiff_Oseen)Oseen\r\s(pctdiff_Carrier)Carrier\r\s(pctdiff_Goldstein)Goldstein\r\s(pctdiff_Illingworth)Illingworth\r\s(pctdiff_ProudmanPearson)Proudman and Pearson\r\s(pctdiff_ChesterBreach)Chester and Breach"
//
//
Return 0
//
//
END
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
Function Make_Wavelength_freq_wavenumber_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This sets up a panel to calculate relations between wavelength, wavenumber, and frequency.
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Update_for_Wavelength_freq_wavenumber_panel
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	Variable/G Wavelength_nm_input, Frequency_THz_input, Wavenumber_percm_input, Energy_ev_input, TempK_wavelength_input
//
//
/////////////////////////////////////
/////////////// set defaults
	Wavelength_nm_input = 500
	Frequency_THz_input = 599.585
	Wavenumber_percm_input = 20000
	Energy_ev_input = 2.47968
	TempK_wavelength_input = 28775.5
//
//
/////////////////////////////////////
//	make Wavelength/Freq/Wavenumber panel
	KillWindow/Z Wavelength_freq_wavenumber_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(50,50,280,515) /N=Wavelength_freq_wavenumber_panel as "Wavelength Relations"
//
/////////////////////////////////////
//	set up Wavelength/Freq/Wavenumber title box
	TitleBox Wavelength_freq_wavenumber_title title="\Z25Wavelength\r   Relations", pos={45, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// group wavelength variable inputs boxes
	GroupBox Group_wavelength_variable_inputs pos={50, 90}, size={130, 150}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up wavelength variable input boxes
	DrawText 55,115, "\Z14\f02λ\f00"
	SetVariable Wavelength_nm_input, pos={70,95}, size={70,20}, bodyWidth=0, title=" ", fsize=14, format="%6.0f"
	SetVariable Wavelength_nm_input, value=Wavelength_nm_input, limits={0,inf,1}, proc=Update_for_Wavelength_freq_wavenumber_panel
	DrawText 145,115, "\Z14nm"
//
	DrawText 55,145, "\Z14\f02ν\f00"
	SetVariable Frequency_THz_input, pos={70,125}, size={70,20}, bodyWidth=0, title=" ", fsize=14, format="%6.0f"
	SetVariable Frequency_THz_input, value=Frequency_THz_input, limits={0,inf,1}, proc=Update_for_Wavelength_freq_wavenumber_panel
	DrawText 145,145, "\Z14THz"
//
	DrawText 55,175, "\Z14\f02k\f00"
	SetVariable Wavenumber_percm_input, pos={70,155}, size={70,20}, bodyWidth=0, title=" ", fsize=14, format="%6.0f"
	SetVariable Wavenumber_percm_input, value=Wavenumber_percm_input, limits={0,inf,10}, proc=Update_for_Wavelength_freq_wavenumber_panel
	DrawText 145,175, "\Z14cm\S-1"
//
	DrawText 55,205, "\Z14\f02E\f00"
	SetVariable Energy_eV_input, pos={70,185}, size={70,20}, bodyWidth=0, title=" ", fsize=14, format="%6.3f"
	SetVariable Energy_eV_input, value=Energy_ev_input, limits={0,inf,0.001}, proc=Update_for_Wavelength_freq_wavenumber_panel
	DrawText 145,205, "\Z14eV"
//
	DrawText 55,235, "\Z14\f02T\f00"
	SetVariable TempK_wavelength_input, pos={70,215}, size={70,20}, bodyWidth=0, title=" ", fsize=14, format="%6.0f"
	SetVariable TempK_wavelength_input, value=TempK_wavelength_input, limits={0,inf,10}, proc=Update_for_Wavelength_freq_wavenumber_panel
	DrawText 145,235, "\Z14K"
//
//
/////////////////////////////////////
// group wavelength relations
	GroupBox Group_wavelength_relations pos={10,250}, size={210, 105}, labelBack=(50000, 50000, 50000)
//
//
	DrawText 15, 270, "\f02λ\f00 = \f02c/ν\f00 = 1/\f02k\f00 = \f02hc/E\f00 = \f02hc/\f00(\f02k\f00\BB\M\f02T\f00)"
	DrawText 15, 290, "\f02ν\f00 = \f02c/λ\f00 = \f02ck\f00=\f02E/h\f00 = \f02k\f00\BB\M\f02T/h\f00"
	DrawText 15, 310, "\f02k\f00 = 1/\f02λ\f00 = \f02ν/c\f00 = \f02E/\f00(\f02hc\f00) = \f02k\f00\BB\M\f02T/\f00(\f02hc\f00)"
	DrawText 15, 330, "\f02E\f00 = \f02hc/λ\f00 = \f02hν\f00 = \f02hck\f00 = \f02k\f00\BB\M\f02T"
	DrawText 15, 350, "\f02T\f00 = \f02hc/\f00(\f02k\f00\BB\M\f02λ\f00) = \f02hν/k\f00\BB\M = \f02hck/k\f00\BB\M = \f02E/k\f00\BB\M"
//
//
/////////////////////////////////////
// group constants used
	GroupBox Group_constants_used pos={30,365}, size={165, 90}, labelBack=(50000, 50000, 50000)
//
//
	DrawText 35,390, "\f02c\f00 ≡ 2.997 924 58 × 10\S8\M m s\S-1\M"
	DrawText 35,410, "\f02h\f00 ≡ 6.626 070 15 × 10\S-34\M J s"
	DrawText 35,430, "\f02k\f00\BB\M ≡ 1.380 649 × 10\S-23\M J K\S-1\M"
	DrawText 35,450, "\f02e\f00 ≡ 1.602 176 634 × 10\S-19\M C"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Wavelength_freq_wavenumber_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Descripton: This provides the control for SetVariables in Make_Wavelength_freq_wavenumber_panel by updating everything
//		shown in that panel whenever an input is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: Wavelength_nm_input, Frequency_THz_input, Wavenumber_percm_input, Energy_ev_input, TempK_wavelength_input
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Wavelength_freq_wavenumber_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
	NVAR Wavelength_nm_input, Frequency_THz_input, Wavenumber_percm_input, Energy_eV_input, TempK_wavelength_input
//
//
	Variable c_speed, h_Planck, e_charge, k_Boltzmann
	c_speed=2.99792458e8 // m/s
	h_Planck=6.62607015e-34 // J s
	e_charge=1.602176634e-19 // C
	k_Boltzmann=1.380649e-23 // J/K
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “Wavelength_nm_input”) == 0) // calculate other quantities if Wavelength_nm changed
			Frequency_THz_input = c_speed/Wavelength_nm_input*1e-3
			Wavenumber_percm_input = 1/Wavelength_nm_input*1e7
			Energy_eV_input = h_Planck*c_speed/wavelength_nm_input*1e9/e_charge
			TempK_wavelength_input = h_Planck*c_speed/wavelength_nm_input*1e9/k_Boltzmann
		EndIf
//
		If (cmpstr(ctrlName.vName, “Frequency_THz_input”) == 0) // calculate other quantities if Frequency_THZ_input changed
			Wavelength_nm_input = c_speed/Frequency_THz_input*1e-3
			Wavenumber_percm_input = Frequency_THz_input/c_speed*1e10
			Energy_eV_input = Frequency_THz_input*h_Planck*1e12/e_charge
			TempK_wavelength_input = Frequency_THz_input*h_Planck*1e12/k_Boltzmann
		EndIf
//
		If (cmpstr(ctrlName.vName, “Wavenumber_percm_input”) == 0) // calculate other quantities if Wavenumber_percm_input changed
			Wavelength_nm_input = 1/Wavenumber_percm_input*1e7
			Frequency_THz_input = Wavenumber_percm_input*c_speed*1e-10
			Energy_eV_input = Wavenumber_percm_input*c_speed*h_Planck*1e2/e_charge
			TempK_wavelength_input = Wavenumber_percm_input*c_speed*h_Planck*1e2/k_Boltzmann
		EndIf
//
		If (cmpstr(ctrlName.vName, “Energy_eV_input”) == 0) // calculate other quantities if Energy_eV_input changed
			Wavelength_nm_input = h_Planck*c_speed/Energy_eV_input*1e9/e_charge
			Frequency_THz_input = Energy_eV_input*e_charge/h_Planck*1e-12
			Wavenumber_percm_input = Energy_eV_input*e_charge/h_Planck/c_speed*1e-2	
			TempK_wavelength_input = Energy_eV_input*e_charge/k_Boltzmann
		EndIf
//
		If (cmpstr(ctrlName.vName, “TempK_wavelength_input”) == 0) // calculate other quantities if TempK_wavelength_input changed
			wavelength_nm_input = h_Planck*c_speed/TempK_wavelength_input*1e9/k_Boltzmann
			Frequency_THz_input = TempK_wavelength_input*k_Boltzmann/h_Planck*1e-12
			Wavenumber_percm_input = TempK_wavelength_input*k_Boltzmann/h_Planck/c_speed*1e-2
			Energy_eV_input = TempK_wavelength_input*k_Boltzmann/e_charge
		EndIf
//
//
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_color_temp_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This sets up a panel that allows the user to calculate color temperature from the ratio
//		of the integrated intensity in two wavelength ranges, or vice versa.
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: Do_Color_temp_info_button (when "i" hit), Update_for_Color_temp_panel, Calculate_color_temp_or_ratio, Graph_Planck_curve
//
// Calls required previously: none
//
// Called by: Ernie's Igor Tools menu
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	Variable/G color_temp_or_ratio_value
	color_temp_or_ratio_value=1 // calculate color temp
//
	Variable/G color_temp_region1_wavelength_min, color_temp_region1_wavelength_max
	Variable/G color_temp_region2_wavelength_min, color_temp_region2_wavelength_max
	Variable/G color_temperature, color_temperature_ratio
//
// Set defaults
	color_temp_region1_wavelength_min=350 //nm
	color_temp_region1_wavelength_max=800 //nm
//
	color_temp_region2_wavelength_min=650 //nm
	color_temp_region2_wavelength_max=800 //nm
//
	color_temperature=4000 //K
	color_temperature_ratio=0.438
//
//
/////////////////////////////////////
//	Make color temp panel
	Killwindow/Z color_temp_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(75,50,300,305) /N=Color_temp_panel as “Color Temperature”
//
//
/////////////////////////////////////
//	set up title box
	TitleBox color_temp title="\Z24Color Temperature", size={200, 100}
	TitleBox color_temp, pos={10, 10},fcolor=(0,0,65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up info button
	Button Color_temp_info_button,pos={92.5,210},size={40,40},proc=Do_Color_temp_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// set up selection boxes
	GroupBox Make_color_temp_inputs pos={10,55}, size={205,85}, labelBack=(65535, 50000, 50000)
//	
// Select min and max wavelengths for the two regions
	DrawText 60,80,"\Z16  Region 1  Region 2"
	DrawText 15, 105, "\Z14\f02λ\f00\Bmin\M\Z14/nm"
	DrawText 15, 130, "\Z14\f02λ\f00\Bmax\M\Z14/nm"
	DrawLine 137.5, 65, 137.5, 130
	SetVariable color_temp_region1_wavelength_min,pos={70,85},size={60,20},limits={0,inf,1},title=" ",value=color_temp_region1_wavelength_min, fsize=14, format="%4.0f", proc=Update_for_Color_temp_panel
	SetVariable color_temp_region1_wavelength_max,pos={70,110},size={60,20},limits={0,inf,1},title=" ",value=color_temp_region1_wavelength_max, fsize=14, format="%4.0f", proc=Update_for_Color_temp_panel
	SetVariable color_temp_region2_wavelength_min,pos={145,85},size={60,20},limits={0,inf,1},title=" ",value=color_temp_region2_wavelength_min, fsize=14, format="%4.0f", proc=Update_for_Color_temp_panel
	SetVariable color_temp_region2_wavelength_max,pos={145,110},size={60,20},limits={0,inf,1},title=" ",value=color_temp_region2_wavelength_max, fsize=14, format="%4.0f", proc=Update_for_Color_temp_panel
//
//
/////////////////////////////////////
// set up selection box for color temperature and ratio
	GroupBox Make_color_temp_ratio pos={40,150}, size={140,55}, labelBack=(65535, 50000, 50000)
//	
// Select color temperature or ratio
	CheckBox calc_color_temp_box, pos={45,155},size={60,20},title="\Z14T\Bcolor\M\Z14/K",proc=Calculate_color_temp_or_ratio,value=1,mode=1
	SetVariable color_temperature,pos={115,155},size={60,20},limits={0,inf,10},title=" ",value=color_temperature, fsize=14, format="%5.0f", proc=Update_for_Color_temp_panel
//
	CheckBox calc_color_temp_ratio_box, pos={45,180},size={50,20},title="\Z14Ratio\B2:1",proc=Calculate_color_temp_or_ratio,value=0,mode=1
	SetVariable color_temperature_ratio,pos={115,180},size={60,20},limits={0,inf,0.001},title=" ",value=color_temperature_ratio, fsize=14, format="%5.3f", proc=Update_for_Color_temp_panel
//
//
	Graph_Planck_curve()
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Color_temp_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This provides the control for SetVariables in Make_color_temp_panel by updating everything
//		shown in that panel whenever an input is changed.
//	
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: 
//		color_temp_region1_wavelength_min, color_temp_region1_wavelength_max
//		color_temp_region2_wavelength_min, color_temp_region2_wavelength_max
//		color_temp_or_ratio_value, color_temperature_ratio, color_temperature
//
// Calls: Calculate_color_temperature_ratio, Calculate_Temp_from_color_temperature_ratio, Graph_Planck_curve
//
// Calls required previously: none
//
// Called by: Make_color_temp_panel
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
NVAR color_temp_region1_wavelength_min, color_temp_region1_wavelength_max
NVAR color_temp_region2_wavelength_min, color_temp_region2_wavelength_max
NVAR color_temp_or_ratio_value, color_temperature_ratio, color_temperature
//
Variable ratio_region2_to_region1
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (color_temp_or_ratio_value == 1)
			color_temperature_ratio=Calculate_color_temperature_ratio()
		EndIf
//
		If (color_temp_or_ratio_value == 2)
			color_temperature=Calculate_Temp_from_color_temperature_ratio()
		EndIf
//
		Graph_Planck_curve()
//
	EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_color_temp_or_ratio(color_temp_or_ratio_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This provides the control for the check boxes for the choice of 
//		color temperature or ratio in Make_oolor_temp_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		color_temp_or_ratio_box tells whether the box is checked for color temperature or ratio
//
// Quantities required for function: color_temp_or_ratio_box
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_color_temp_panel (when checkbox for color temp or ratio is selected)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& color_temp_or_ratio_box
	NVAR color_temp_or_ratio_value
//
//
//	determine if lin_spacing or log_spacing box is checked
	StrSwitch (color_temp_or_ratio_box.ctrlName)
		Case "calc_color_temp_box":
			color_temp_or_ratio_value=1
			break
//
		Case "calc_color_temp_ratio_box":
			color_temp_or_ratio_value=2
			break
	EndSwitch
//
//
//	reset calc_color_temp and calc_color_temp_ratio checkboxes
	CheckBox calc_color_temp_box,value=color_temp_or_ratio_value==1
	CheckBox calc_color_temp_ratio_box,value=color_temp_or_ratio_value==2
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_color_temperature_ratio()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calculates the ratio of the energy emitted between two wavelength ranges
//		according to Planck's Law: dP/dlambda=2*h*c^2/lambda^5/(exp(h*c/(k*T*lambda))-1).
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function:
//		color_temp_region1_wavelength_min, color_temp_region1_wavelength_max, color_temp_region2_wavelength_min
//		color_temp_region2_wavelength_max, color_temperature, color_temperature_ratio
//
// Calls required previously: none
//
// Called by: Update_for_Color_temp_panel
//
// Return: color_temperature_ratio
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	NVAR color_temp_region1_wavelength_min, color_temp_region1_wavelength_max, color_temp_region2_wavelength_min
	NVAR color_temp_region2_wavelength_max, color_temperature, color_temperature_ratio
//
//
	Variable i, c_speed, h_Planck, k_Boltzmann
	c_speed=2.99792458e8 // m/s
	h_Planck=6.62607015e-34 // J s
	k_Boltzmann=1.380649e-23 // J/K
//
	Variable dlambda_region1, dlambda_region2, Planck_sum_region1, Planck_sum_region2
//
//
	Make/O/D/N=1001 lambda_region1, lambda_region2, Planck_region1, Planck_region2
//
//
//////////////////////////////////////////////////////////////////////
// Calculate stuff:
//	calculate integral for region 1
//	make lambda_region_1, Planck_region_1 (energy per wavelength) in 1000 intervals
	dlambda_region1=(color_temp_region1_wavelength_max-color_temp_region1_wavelength_min)/1000 // in nm
	lambda_region1=1e-9*(color_temp_region1_wavelength_min + x*dlambda_region1) // lambda now in m
	Planck_region1=2*h_Planck*c_speed^2/lambda_region1^5/(exp(h_Planck*c_speed/k_Boltzmann/color_temperature/lambda_region1)-1)
	Planck_sum_region1 = Sum(Planck_region1,1,1000)*dlambda_region1 // 1001 points, but only 1000 intervals
//
//
//	calculate integral for region 2
//	make lambda_region2, Planck_region2 (energy per wavelength) in 1000 intervals
	dlambda_region2=(color_temp_region2_wavelength_max-color_temp_region2_wavelength_min)/1000 // in nm
	lambda_region2=1e-9*(color_temp_region2_wavelength_min + x*dlambda_region2) // lambda now in m
	Planck_region2=2*h_Planck*c_speed^2/lambda_region2^5/(exp(h_Planck*c_speed/k_Boltzmann/color_temperature/lambda_region2)-1)
	Planck_sum_region2 = Sum(Planck_region2,1,1000)*dlambda_region2 // 1001 points, but only 1000 intervals
//
//
	color_temperature_ratio=Planck_sum_region2/Planck_sum_region1
//
//
Return color_temperature_ratio
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_Temp_from_color_temperature_ratio()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calculates the temperature from the color ratio of two wavelength regions
//		 according to Planck's Law: dP/dlambda=2*h*c^2/lambda^5/(exp(h*c/(k*T*lambda))-1).
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function:
//		color_temperature, color_temperature_ratio, color_temp_or_ratio_value
//		color_temp_region1_wavelength_min, color_temp_region1_wavelength_max
//		color_temp_region2_wavelength_min, color_temp_region2_wavelength_max
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Update_for_Color_temp_panel
//
// Return: color_temperature
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	NVAR color_temperature, color_temperature_ratio, color_temp_or_ratio_value
	NVAR color_temp_region1_wavelength_min, color_temp_region1_wavelength_max
	NVAR color_temp_region2_wavelength_min, color_temp_region2_wavelength_max
//
//
	Variable i, c_speed, h_Planck, k_Boltzmann
	c_speed=2.99792458e8 // m/s
	h_Planck=6.62607015e-34 // J s
	k_Boltzmann=1.380649e-23 // J/K
//
	Variable dlambda_region1, dlambda_region2, Planck_sum_region1, Planck_sum_region2, color_temp
//
//	
	Make/O/D/N=1001 lambda_region1, lambda_region2, Planck_region1, Planck_region2
	Make/O/D/N=101 temp_TempK, temp_color_ratio
//
//
//////////////////////////////////////////////////////////////////////
// Calculate stuff:
//	loop over temperatures
	For (i=0;i<numpnts(temp_TempK);i+=1)
		temp_TempK[i]=300+100*i
//		calculate integral for region 1
//		make lambda, Planck (energy per wavelength) in 1000 intervals
		dlambda_region1=(color_temp_region1_wavelength_max-color_temp_region1_wavelength_min)/1000 // in nm
		lambda_region1=1e-9*(color_temp_region1_wavelength_min + x*dlambda_region1) //lambda now in m
		Planck_region1=2*h_Planck*c_speed^2/lambda_region1^5/(exp(h_Planck*c_speed/k_Boltzmann/temp_TempK[i]/lambda_region1)-1)
		Planck_sum_region1 = Sum(Planck_region1,1,1000)*dlambda_region1 // 1001 points, but only 1000 intervals
//
//
//		calculate integral for region 2
//		make lambda, Planck (energy per wavelength) in 1000 intervals
		dlambda_region2=(color_temp_region2_wavelength_max-color_temp_region2_wavelength_min)/1000 // in nm
		lambda_region2=1e-9*(color_temp_region2_wavelength_min + x*dlambda_region2) //lambda now in m
		Planck_region2=2*h_Planck*c_speed^2/lambda_region2^5/(exp(h_Planck*c_speed/k_Boltzmann/temp_TempK[i]/lambda_region2)-1)
		Planck_sum_region2 = Sum(Planck_region2,1,1000)*dlambda_region2 // 1001 points, but only 1000 intervals
//
		temp_color_ratio[i]=Planck_sum_region2/Planck_sum_region1
//
	EndFor
//
//
// Now that color_ratio as f(TempK) is made, interpolate to find TempK that matches input value of ratio_region2_to_region1.
	color_temperature=interp(color_temperature_ratio, temp_color_ratio, temp_TempK)
//
//
Return color_temperature
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Graph_Planck_curve()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This graphs the Planck curve showing the energy emitted as a function of wavelength
//		according to Planck's Law: dP/dlambda=2*h*c^2/lambda^5/(exp(h*c/(k*T*lambda))-1).
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function:
//		color_temp_region1_wavelength_min, color_temp_region1_wavelength_max
//		color_temp_region2_wavelength_min, color_temp_region2_wavelength_max, color_temperature
//
// Calls: none
//
// Calls required previously: Make_color_temp_panel
//
// Called by: Make_color_temp_panel, Update_for_Color_temp_panel
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	NVAR color_temp_region1_wavelength_min, color_temp_region1_wavelength_max, color_temp_region2_wavelength_min, color_temp_region2_wavelength_max, color_temperature
//
//
	Variable i, c_speed, h_Planck, k_Boltzmann, Planck_max
	c_speed=2.99792458e8 // m/s
	h_Planck=6.62607015e-34 // J s
	k_Boltzmann=1.380649e-23 // J/K
//
//
	Variable dlambda_region1, dlambda_region2
	Variable lambda_min_all, lambda_max_all, dlambda_all
//
//
	Make/O/D/N=1001 lambda_region1, lambda_region2, Planck_region1, Planck_region2, lambda_all, Planck_all, zero
//
//
//////////////////////////////////////////////////////////////////////
// Calculate stuff:
//
	zero=0 // for graphing
//
//	make lambda_all, Planck_all (energy per wavelength) in 1000 intervals
	lambda_min_all=0
	lambda_max_all=2*max(color_temp_region1_wavelength_max, color_temp_region2_wavelength_max) // show graph twice as far as max wavelength
	dlambda_all=(lambda_max_all-lambda_min_all)/1000 // in nm
	lambda_all=(lambda_min_all + x*dlambda_all) // in nm
	Planck_all=2*h_Planck*c_speed^2/(1e-9*lambda_all)^5/(exp(h_Planck*c_speed/k_Boltzmann/color_temperature/(1e-9*lambda_all))-1)
	Planck_max=wavemax(Planck_all)
	Planck_all=Planck_all/Planck_max
//
//
//	make lambda_region_1, Planck_region_1 (energy per wavelength) in 1000 intervals
	dlambda_region1=(color_temp_region1_wavelength_max-color_temp_region1_wavelength_min)/1000 // in nm
	lambda_region1=(color_temp_region1_wavelength_min + x*dlambda_region1) // in nm
	Planck_region1=2*h_Planck*c_speed^2/(1e-9*lambda_region1)^5/(exp(h_Planck*c_speed/k_Boltzmann/color_temperature/(1e-9*lambda_region1))-1)
	Planck_region1=Planck_region1/Planck_max
//
//
//	make lambda_region2, Planck_region2 (energy per wavelength) in 1000 intervals
	dlambda_region2=(color_temp_region2_wavelength_max-color_temp_region2_wavelength_min)/1000 // in nm
	lambda_region2=(color_temp_region2_wavelength_min + x*dlambda_region2) // in nm
	Planck_region2=2*h_Planck*c_speed^2/(1e-9*lambda_region2)^5/(exp(h_Planck*c_speed/k_Boltzmann/color_temperature/(1e-9*lambda_region2))-1)
	Planck_region2=Planck_region2/Planck_max
//
//
//////////////////////////////////////////////////////////////////////
//	Make Planck graph
	KillWindow/Z Planck_graph // get rid of previous graph if it exists
	Display/W=(315, 50, 865, 405) /N=Planck_graph Planck_all vs lambda_all
	ModifyGraph standoff=0, mirror=1, axThick=2,fsize=24
	ModifyGraph rgb(Planck_all)=(0,0,0), lsize(Planck_all)=2
	Label bottom "Wavelength/nm"
	Label left "Planck function: dP/dλ"
//
//
	AppendtoGraph Planck_region1 vs lambda_region1
	ModifyGraph rgb(Planck_region1)=(0,0,0)
	ModifyGraph mode(Planck_region1)=7,hbFill(Planck_region1)=8,usePlusRGB(Planck_region1)=1,plusRGB(Planck_region1)=(0,0,65535)
//
//
	AppendtoGraph Planck_region2 vs lambda_region2
	ModifyGraph rgb(Planck_region2)=(0,0,0)
	ModifyGraph mode(Planck_region2)=7,hbFill(Planck_region2)=9,usePlusRGB(Planck_region2)=1,plusRGB(Planck_region2)=(65535,0,0)
	ModifyGraph plusRGB(Planck_region2)=(65535,0,0,26208) // this makes it partially transparent
//
//
	Make/O/D/N=2 lambda_region2_left, Planck_region2_left
	lambda_region2_left={color_temp_region2_wavelength_min, color_temp_region2_wavelength_min}
	Planck_region2_left={0,Planck_region2[0]}
	AppendtoGraph Planck_region2_left vs lambda_region2_left
	ModifyGraph rgb(Planck_region2_left)=(65535,0,0)
//
	Make/O/D/N=2 lambda_region2_right, Planck_region2_right
	lambda_region2_right={color_temp_region2_wavelength_max, color_temp_region2_wavelength_max}
	Planck_region2_right={0,Planck_region2[999]}
	AppendtoGraph Planck_region2_right vs lambda_region2_right
	ModifyGraph rgb(Planck_region2_right)=(65535,0,0)
//
//
// graph borders last so that they are not covered by others
	Make/O/D/N=2 lambda_region1_left, Planck_region1_left
	lambda_region1_left={color_temp_region1_wavelength_min, color_temp_region1_wavelength_min}
	Planck_region1_left={0,Planck_region1[0]}
	AppendtoGraph Planck_region1_left vs lambda_region1_left
	ModifyGraph rgb(Planck_region1_left)=(0,0,65535)
//
	Make/O/D/N=2 lambda_region1_right, Planck_region1_right
	lambda_region1_right={color_temp_region1_wavelength_max, color_temp_region1_wavelength_max}
	Planck_region1_right={0,Planck_region1[999]}
	AppendtoGraph Planck_region1_right vs lambda_region1_right
	ModifyGraph rgb(Planck_region1_right)=(0,0,65535)
//
	Appendtograph zero vs lambda_all // to remove color from the bottom axis
	ModifyGraph rgb(zero)=(0,0,0), lsize(zero)=2
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Color_temp_info_button(Color_temp_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This calls Print_Color_temp_info which prints information on the color temperature panel and calculations.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Color_temp_info_Struct - the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Color_temp_info()
//
// Calls required previously: none
//
// Called by: Display_Color_temp_info_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMButtonAction &Color_temp_info_Struct
//
//
	If (Color_temp_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Color_temp_info()
	EndIf
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Color_temp_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-01-12
//
//
// Description: This prints information on the color temperature panel and calculations.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Color_temp_info_button
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	String Color_temp_info_text
//
//
	Color_temp_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Color_temp_info_text = Color_temp_info_text + "Color Temperature Information\r"
	Color_temp_info_text = Color_temp_info_text + "-----------------------------\r\r"
//
	Color_temp_info_text=Color_temp_info_text + "The panel allows the user to choose two wavelength regions and either the color temperature\r"
	Color_temp_info_text=Color_temp_info_text + "   or the ratio of energy in the two regions (assuming blackbody radiation), from which the \r"
	Color_temp_info_text=Color_temp_info_text + "   other quantity is calculated and the Planck curve for that blackbody temperature is plotted,\r"
	Color_temp_info_text=Color_temp_info_text + "   with the two regions shown.\r\r"
//
	Color_temp_info_text=Color_temp_info_text + "----------------------- Bottom of Page ----------------------"
//
//
	KillWindow/Z Color_temp_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(75,345,765,545)/N=Color_temp_info_notebook
	Notebook Color_temp_info_notebook, text=Color_temp_info_text
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Display_Optical_instrument_wavelengths()
//
// Written by Ernie Lewis
// last revision 2025-01-22
//
//
// Description: This shows the wavelengths at which various optical instruments sample.
//
//
Make/O/D/N=3 TSI_3563_lambda, AirPhoton_lambda, Aurora_lambda, PSAP_lambda, Brechtel_TAP_lambda, DMT_PASS3_lambda, CAPS_lambda
TSI_3563_lambda={450, 550, 700} // neph, now discontinued; measures scattering
AirPhoton_lambda={450,532,632} // neph; measures scattering
Aurora_lambda={450, 525, 635} // neph; measures scattering
PSAP_lambda={470,535,660} // Particle Soot Absorption Photometer, filter-based; measures absorption
Brechtel_TAP_lambda={470,535,660} // essentiall the same as the PSAP; measures absorption
DMT_PASS3_lambda={450,532,781} // Photo-Acoustic Soot Spectrometer; measures absorption
CAPS_lambda={450,530,630} // Cavity-Attenuated Particle Spectrometer, extinction
//
Make/o/D/n=7 Aeth_lambda={370, 470, 520, 590, 660, 880, 950} // Aethalometer, filter-based; measures absorption
//
//
make/o/D/n=3 one={1,1,1}
make/o/D/n=7 two={2,2,2,2,2,2,2}
make/o/D/n=3 three={3,3,3}
make/o/D/n=3 four={4,4,4}
make/o/D/n=3 five={5,5,5}
make/o/D/n=3 six={6,6,6}
make/o/D/n=3 seven={7,7,7}
make/o/D/n=3 eight={8,8,8}
//
//
///////////////////////////// Show wavelengths on graph
Killwindow/Z Graph_Show_wavelengths
Display /W=(50,50,850,550) /N=Graph_Show_wavelengths
AppendtoGraph eight vs TSI_3563_lambda
AppendtoGraph seven vs AirPhoton_lambda
AppendtoGraph six vs Aurora_lambda
AppendtoGraph five vs PSAP_lambda
AppendtoGraph four vs Brechtel_TAP_lambda
AppendtoGraph three vs DMT_PASS3_lambda
AppendtoGraph two vs Aeth_lambda
AppendtoGraph one vs CAPS_lambda
//
ModifyGraph fSize(bottom)=24
ModifyGraph mirror=0
ModifyGraph tick(left)=3
ModifyGraph axThick(left)=0
ModifyGraph margin(left)=200
//
ModifyGraph mode=3, msize=5
ModifyGraph marker(eight)=16,marker(seven)=16,marker(six)=16
ModifyGraph marker(five)=19,marker(four)=19,marker(three)=19,marker(two)=19
ModifyGraph marker(one)=18
//
ModifyGraph rgb(eight)=(0,65535,0),rgb(seven)=(0,65535,0),rgb(six)=(0,65535,0)
ModifyGraph rgb(five)=(0,0,0),rgb(four)=(0,0,0),rgb(three)=(0,0,0),rgb(two)=(0,0,0)
ModifyGraph rgb(one)=(65535,0,0)
//
ModifyGraph mirror(left)=0,noLabel(left)=2,axThick(bottom)=2
Label bottom "\\Z24Wavelength/nm"
SetAxis bottom 300,1000
SetAxis left 0,10
//
TextBox/C/N=text0/F=0/B=1/A=LT/X=-25/Y=3 "\\Z20\r\r\r\r\\K(0,65535,0)TSI 3563 (discontinued)\r\rAir Photon\r\rAurora (formerly Ecotech)\r\r\\K(0,0,0)PSAP\r\rBrechtel TAP\r\rDMT PASS-3\r\rAethalometer\r\r\\K(65535,0,0)CAPS\r"
TextBox/C/N=text1/F=0/B=1/A=LT/X=-20/Y=0 "\\Z42\\f04Wavelengths of Optical Instruments"
//
//
/////////////////////////// Show color bar
// purple 400-450
// blue 450-500
// green 500-570
// yellow 580
// orange 590-620
// red 620-740
//
//
Make/O/D/n=101 lambda1=400+2.5*x
Make/o/D/n=101 zero=0
appendtograph zero vs lambda1
ModifyGraph lsize(zero)=10
ModifyGraph zColor(zero)={lambda1,*,*,Rainbow,1}
//
//
Make/O/D/n=51 lambda2=650+x
appendtograph zero vs lambda2
ModifyGraph lsize(zero#1)=10
ModifyGraph rgb(zero#1)=(65535,0,0)
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_Tube_flow_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2024-01-02
//
//
// Description: This sets up a panel to calculate and display information related to 
//	flow in a tube.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls:
//		Update_for_Tube_flow_panel when any value is changed
//		Choose_FlowRate_or_TubeDiam_or_MeanU when any control box is selected
//		Do_Tube_flow_panel_info_button when "i" button is hit
//
// Calls required previously: none
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Declare quantities needed in function:
Variable/G FlowRate, TubeDiam, MeanU, ReynoldsNumber, PressureDrop_psi_per_m, PressureDrop_torr_per_m
Variable/G FlowRate_value, TubeDiam_value, MeanU_value // these tell which radio buttons are selected
//
//
//*********************************************************************
//*********************************************************************
/////////// set defaults
// inputs
FlowRate=1 // liters per minute
TubeDiam=0.25 // in
MeanU=0.5263 // m/s, calculated offline
ReynoldsNumber=221 // calculated offline
PressureDrop_psi_per_m=0.00109 // psi/m, calculated offline
PressureDrop_torr_per_m=0.0565 // torr/m, calculated offline
//
FlowRate_value = 1 // FlowRate selected
TubeDiam_value=1 // Tube Diam selected
MeanU_value=0 // Mean velocity not selected; calculated from FlowRate and TubeDiam
//
//
/////////////////////////////////////
//	make FlowRate-TubeDiam-MeanU panel
	KillWindow/Z Tube_flow_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(150,100,350,380) /N=Tube_flow_panel as "FlowRate-D-U"
//
//
/////////////////////////////////////
//	set up FlowRate-TubeDiam-MeanU relations title box
	TitleBox FlowRate_TubeDiam_MeanU_relations_title title="\Z20Tube Flow Relations", pos={10, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up FlowRate-TubeDiam-MeanU relations info button
	Button FlowRate_TubeDiam_MeanU_relations_info_button,pos={80,230},size={40,40},proc=Do_Tube_flow_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// set up FlowRate-TubeDiam-MeanU relations variable input boxes
	GroupBox Group_FlowRate_TubeDiam_MeanU pos={15, 50}, size={170, 80}, labelBack=(65535, 50000, 50000)
//
//
// set up FlowRate-TubeDiam-MeanU relations variable input boxes
	CheckBox FlowRate_selected, pos={20, 57.5}, size={20,20}, title=" ", proc=Choose_Flowrate_or_TubeDiam_or_MeanU, value=FlowRate_value, mode=1
	DrawText 40,75, "\Z14Rate/(l/min)"
	SetVariable FlowRate_input, pos={120,55}, size={60,20}, bodyWidth=0, title=" ", fsize=14, format="%6.2f"
	SetVariable FlowRate_input, value=FlowRate, limits={0.01,1e4,1}, proc=Update_for_Tube_flow_panel
//
	CheckBox TubeDiam_selected, pos={20,82.5}, size={20,20}, title=" ", proc=Choose_Flowrate_or_TubeDiam_or_MeanU, value=TubeDiam_value, mode=1
	DrawText 40,100, "\Z14Diam/in"
	SetVariable TubeDiam_input, pos={120,80}, size={60,20}, bodyWidth=0, title=" ", fsize=14, format="%5.2f"
	SetVariable TubeDiam_input, value=TubeDiam, limits={0.1,100,0.1}, proc=Update_for_Tube_flow_panel
//
	CheckBox MeanU_selected, pos={20,107.5}, size={20,20}, title=" ", proc=Choose_Flowrate_or_TubeDiam_or_MeanU, value=MeanU_value, mode=1
	DrawText 40,125, "\Z14U\Bmean\M\Z14/(m/s)"	
	SetVariable MeanU_input, pos={120,105}, size={60,20}, bodyWidth=0, title=" ", fsize=14, format="%5.2f", disable=2
	SetVariable MeanU_input, value=MeanU, limits={0.01,100,0.1}, proc=Update_for_Tube_flow_panel
//
	DrawText 50, 160, "\Z14Re = "
	ValDisplay ReynoldsNumber_display, pos={85, 142.5}, size={50,20}, bodywidth=0, value=#"ReynoldsNumber", valueColor=(0,0,0),valueBackColor=(0,65535,0), fsize=14, format="%d"
//
	DrawText 20, 190, "\Z14P drop =                  psi m\S-1"
	ValDisplay Pressure_drop_psi_display, pos={77.5, 172.5}, size={65,20}, bodywidth=0, value=#"PressureDrop_psi_per_m",fsize=14, format="%6.5f"
//
	DrawText 20, 217.5, "\Z14           =                  torr m\S-1"
	ValDisplay Pressure_drop_torr_display, pos={77.5, 199.5}, size={60,20}, bodywidth=0, value=#"PressureDrop_torr_per_m",fsize=14, format="%6.4f"
//
//
	Make_FlowRate_DiamTube_graph()
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_Tube_flow_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2024-01-02
//
//
// Description: This provides the control for SetVariables in Make_Tube_flow_panel 
//		by updating everything shown in that panel whenever an input is changed.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: FlowRate, TubeDiam, MeanU
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Make_Tube_flow_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
// Declare other variables and waves
	NVAR FlowRate, TubeDiam, MeanU, ReynoldsNumber, PressureDrop_psi_per_m, PressureDrop_torr_per_m
	NVAR FlowRate_value, TubeDiam_value, MeanU_value
//
//
// this is if an entry is changed
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “FlowRate”) == 0) // FlowRate changed, which means it was selected
			If (TubeDiam_value == 1) // TubeDiam was also selected
				MeanU=FlowRate * (10^-3/60) / (Pi/4) / (TubeDiam/39.39)^2 // calculate MeanU (in m/s) from FlowRate (in l/min) and TubeDiam (in in)
			EndIf
//
			If (MeanU_value == 1) // MeanU was also selected
				TubeDiam=39.39 * sqrt(FlowRate * (10^-3/60) / (pi/4) / MeanU) // calculate TubeDiam (in in) from FlowRate (in lit/min) and MeanU (in m/s)
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “TubeDiam”) == 0) // TubeDiam changed, which means it was selected
			If (FlowRate_value == 1) // FlowRate was also selected
				MeanU=FlowRate * (10^-3/60) / (Pi/4) / (TubeDiam/39.39)^2 // calculate MeanU (in m/s) from FlowRate (in lit/min) and TubeDiam (in in)
			EndIf
//
			If (MeanU_value == 1) // MeanU was also selected
				FlowRate=60/10^-3 * (Pi/4) * (TubeDiam/39.39)^2 * MeanU // calculate FlowRate (in lit/min) from TubeDiam (in in) and MeanU (in m/s)
			EndIf
		EndIf
//
//
		If (cmpstr(ctrlName.vName, “MeanU”) == 0) // MeanU changed, which means it was selected
			If (FlowRate_value == 1) // Mass was also selected
				TubeDiam=39.39 * sqrt(FlowRate * (10^-3)/60 / (Pi/4) /MeanU) // calculate Diam (in in) from FlowRate (in lit/min) and MeanU (in m/s)
			EndIf
//
			If (TubeDiam_value == 1) // TubeDiam was also selected
				FlowRate=60/(10^-3) * (Pi/4) * (TubeDiam/39.39)^2 * MeanU // calculate FlowRate from TubeDiam and MeanU
			EndIf
		EndIf
//
//
		ReynoldsNumber=(TubeDiam/39.39) * MeanU/(1.5e-5)
		
//		show color coding for laminar (Re < 2300), transition (2300 < Re < 4000), or turbulent (Re > 4000)
		If (ReynoldsNumber < 2300)
			ValDisplay ReynoldsNumber_display, pos={85, 142.5}, size={50,20}, bodywidth=0, value=#"ReynoldsNumber", valueColor=(0,0,0),valueBackColor=(0,65535,0), fsize=14, format="%d"
		EndIf
		If (ReynoldsNumber > 4000)
			ValDisplay ReynoldsNumber_display, pos={85, 142.5}, size={50,20}, bodywidth=0, value=#"ReynoldsNumber", valueColor=(0,0,0),valueBackColor=(65535,0,0), fsize=14, format="%d"
		EndIf
		If ((ReynoldsNumber >= 2300) && (ReynoldsNumber <= 4000))
			ValDisplay ReynoldsNumber_display, pos={85, 142.5}, size={50,20}, bodywidth=0, value=#"ReynoldsNumber", valueColor=(0,0,0),valueBackColor=(65535,43690,0), fsize=14, format="%d"
		EndIf
//
//
		PressureDrop_psi_per_m=(128/Pi)*(1.8*10^(-5))*(FlowRate/1000/60)/(TubeDiam/39.39)^4*(14.7/(1.013*10^5))
		PressureDrop_torr_per_m=(128/Pi)*(1.8*10^(-5))*(FlowRate/1000/60)/(TubeDiam/39.39)^4*(760/(1.013*10^5))
//
//
	EndIf
//
//
	Make/O/D/N=1 FlowRate_DiamTube_Xvalue={TubeDiam}
	Make/O/D/N=1 FlowRate_DiamTube_Yvalue={FlowRate}
//
	SetAxis bottom 0,2*TubeDiam
	SetAxis left 0,100*TubeDiam // was 500; to keep a 50:1 aspect ratio
//
//
//		show color coding for laminar (Re < 2300), transition (2300 < Re < 4000), or turbulent (Re > 4000)
		If (ReynoldsNumber < 2300)
			ModifyGraph rgb(FlowRate_DiamTube_Yvalue)=(0,65535,0)
		EndIf
		If (ReynoldsNumber > 4000)
			ModifyGraph rgb(FlowRate_DiamTube_Yvalue)=(65535,0,0)
		EndIf
		If ((ReynoldsNumber >= 2300) && (ReynoldsNumber <= 4000))
			ModifyGraph rgb(FlowRate_DiamTube_Yvalue)=(65535,43690,0)
		EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Choose_Flowrate_or_TubeDiam_or_MeanU(Choose_Flowrate_or_TubeDiam_or_MeanU_box) : CheckBoxControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2024-01-02
//
//
// Description: This provides the control for the check boxes for the choice of 
//		whether FlowRate, TubeDiam, or MeanU is held constant while another is varied.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:
//		Choose_FlowRate_or_TubeDiam_or_MeanU_box tells whether the box is checked for calculations.
//
// Quantities required for function: none
// Variables calculated in function: Choose_FlowRate_or_TubeDiam_or_MeanU_value
// Waves created in function: none
// Free waves created in function: none
// Calls: none
// Calls required previously: none
// Called by: Make_Tube_flow_panel (when checkbox for FlowRate, TubeDiam, or MeanU is checked)
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMCheckboxAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 2 is Mouse up, checkbox toggles
//
//f
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMCheckboxAction& Choose_FlowRate_or_TubeDiam_or_MeanU_box
	NVAR FlowRate_value, TubeDiam_value, MeanU_value
//
//
//	This determines which pair of boxes amoung FlowRate, TubeDiam, and MeanU is checked.
	If (Choose_FlowRate_or_TubeDiam_or_MeanU_box.eventcode == 2) // do only when mouse goes up (eventcode = 2)
//
		// disable all inputs
		SetVariable FlowRate_input, disable=2 // disable this one
		SetVariable TubeDiam_input, disable=2 // disable this one
		SetVariable MeanU_input, disable=2 // disable this one
//
		StrSwitch (Choose_FlowRate_or_TubeDiam_or_MeanU_box.ctrlName)
			Case "FlowRate_selected":
				FlowRate_value=1 // select this one
				If (TubeDiam_value==1 & MeanU_value==1) // both other boxes are selected
					CheckBox TubeDiam_selected, value=0 // deselect this one
					TubeDiam_value=0
					Checkbox MeanU_selected, value=0 // deselect this one
					MeanU_value=0
				Else // this would be the second time
					Checkbox FlowRate_selected, value=1 // select this one
					FlowRate_value=1
					SetVariable FlowRate_input, disable=0 // enable this one
					If (TubeDiam_value==1)
						SetVariable TubeDiam_input, disable=0 // enable this one
					EndIf
					If (MeanU_value==1)
						SetVariable MeanU_input, disable=0 // enable this one
					EndIf
				EndIf
				Break		
//
			Case "TubeDiam_selected":
				TubeDiam_value=1 // select this one
				If (FlowRate_value==1 & MeanU_value==1) // both other boxes are selected
					Checkbox FlowRate_selected, value=0 // deselect this one
					FlowRate_value=0
					Checkbox MeanU_selected, value=0 // deselect this one
					MeanU_value=0
				Else // this would be the second time
					Checkbox TubeDiam_selected, value=1 // select this one
					TubeDiam_value=1
					SetVariable TubeDiam_input, disable=0 // enable this one
					If (FlowRate_value==1)
						SetVariable FlowRate_input, disable=0 // enable this one
					EndIf
					If (MeanU_value==1)
						SetVariable MeanU_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
//
			Case "MeanU_selected":
				MeanU_value=1 // select this one
				If (FlowRate_value==1 & TubeDiam_value==1) // both other boxes are selected
					Checkbox FlowRate_selected, value=0 // deselect this one
					FlowRate_value=0
					Checkbox TubeDiam_selected, value=0 // deselect this one
					TubeDiam_value=0
				Else // this would be the second time
					Checkbox MeanU_selected, value=1 // select this one
					MeanU_value=1
					SetVariable MeanU_input, disable=0 // enable this one
					If (FlowRate_value==1)
						SetVariable FlowRate_input, disable=0 // enable this one
					EndIf
					If (TubeDiam_value==1)
						SetVariable TubeDiam_input, disable=0 // enable this one
					EndIf
				EndIf
				Break
		EndSwitch
	EndIf
//
//
Return 0
//
//
End
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_Tube_flow_panel_info_button(Do_Tube_flow_panel_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2024-01-02
//
//
// Description: This calls Do_Tube_flow_panel_info when the 
//		eeeMass_Density_relations_info_button is hit in panel eeMass_Diam_Density_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: Do_Tube_flow_panel_info_Struct 
//		is the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_Tube_flow_panel_info
//
// Calls required previously: none
//
// Called by: eeeMass_Diam_Density_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Do_Tube_flow_panel_info_Struct
//
//
	If (Do_Tube_flow_panel_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_Tube_flow_panel_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_Tube_flow_panel_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2024-01-02
//
//
// Description: This prints information on the relations among Flow Rate, Tube Diameter, and Mean U
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_Tube_flow_panel_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Tube_flow_info_text
//
//
	Tube_flow_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Tube_flow_info_text = Tube_flow_info_text + "Relations among the Air Flow Rate, Tube Diameter, and Mean Velocity\r"
	Tube_flow_info_text = Tube_flow_info_text + "-------------------------------------------------------------------\r\r"
//
	Tube_flow_info_text = Tube_flow_info_text + "This panel displays relations among the volume flow rate of air, tube diameter,\r"
	Tube_flow_info_text = Tube_flow_info_text + "   and mean velocity, based on the equation FlowRate = (π/4) × Diam^2 × U_mean.\r\r"
//
	Tube_flow_info_text = Tube_flow_info_text + "For flow rate in liters/min, tube diameter in inches, and mean velocity in m/s,\r"
	Tube_flow_info_text = Tube_flow_info_text + "   FlowRate/(lit/min) = 30 × (Diam/in)^2 × U_mean/(m/s) for air.\r\r"
//
	Tube_flow_info_text = Tube_flow_info_text + "The Reynolds number, Re=Diam×U_mean/visc_air, equals 1680×(Diam/in)×U_mean/(m/s) at 20 °C and 1 atm.\r"
	Tube_flow_info_text = Tube_flow_info_text + "The viscosity of air varies with absolute temperature as T^1.8, an increase of about 0.9% per °C,\r"
	Tube_flow_info_text = Tube_flow_info_text + "   and it varies inversely with pressure.\r\r"
//
	Tube_flow_info_text = Tube_flow_info_text + "The flow is laminar if Re < 2300 and turblent if Re > 4000; between is a transition regime.\r"
	Tube_flow_info_text = Tube_flow_info_text + "The limits of these regimes (at 20 °C and 1 atm) are roughly FR ≡ 40×Diam and FR ≡ 70×Diam.\r\r"
//	
	Tube_flow_info_text = Tube_flow_info_text + "The pressure drop presented here is valid only for laminar flow.\r"
	Tube_flow_info_text = Tube_flow_info_text + "The pressure drop for turbulent flow depends on pipe roughness as well as flow parameters.\r\r"
//
	Tube_flow_info_text = Tube_flow_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z TubeFlow_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(150,420,890,770)/N=TubeFlow_info_notebook
	Notebook TubeFlow_info_notebook, text=Tube_flow_info_text, fsize=11
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_FlowRate_DiamTube_graph()



// eee have different regions color-coded



//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2024-01-02
//
//
// Description: This creates a graph that shows equal-contour lines of Reynolds Number Re
//		as functions of Flow Rate (in l/min) and Tube Diameter (in inches), and also shows 
//		contours at 2300 and 4000, the limits of laminar flow and turblent flow.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: FlowRate, TubeDiam
//
// Calls: none
//
// Calls required previously: Make_Tube_flow_panel
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
NVAR FlowRate, TubeDiam, ReynoldsNumber
//
//
Make/O/D/N=1001 D_in=0.01*x
Make/O/D/N=1001 FR_litpermin=0.5*x
//
Make/O/D/N=1001 FR_crit_lo=41*D_in // corresponds to Reynolds number 2300
Make/O/D/N=1001 FR_crit_hi=71*D_in // corresponds to Reynolds number 4000
//
//
///////////////////// Make Graph
KillWindow/Z FlowRate_DiamTube_graph // get rid of previous graph if it exists
Display/K=1/W=(370, 100, 1010, 600) /N=FlowRate_DiamTube_graph as "FlowRate_DiamTube graph"
AppendtoGraph FR_crit_lo, FR_crit_hi vs D_in
ModifyGraph mirror=1, fSize=24, standoff=0
SetAxis bottom 0,2*TubeDiam
SetAxis left 0,100*TubeDiam // was 500; to keep a 50:1 aspect ratio
Label left "\\Z24Flow rate/(lit min\\S-1\\M\\Z24)"
Label bottom "\\Z24Tube diameter/in"
ModifyGraph lsize=2,rgb=(0,0,0)
ModifyGraph lstyle(FR_crit_lo)=0,lsize(FR_crit_lo)=2,lstyle(FR_crit_hi)=0,lsize(FR_crit_hi)=2
TextBox/C/N=text0/F=0/A=MC/X=-15.00/Y=25.00"\Z24\K(65535,0,0)Turbulent"
TextBox/C/N=text1/F=0/A=MC/X=27.00/Y=-25.00"\Z24\K(0,65535,0)Laminar"
TextBox/C/N=text2/F=0/A=MC/X=27.00/Y=25.00"\Z24\K(65535,43690,0)Transition"
//
//
/////////////////// Make Re_matrix
Make/O/D/N=(1001,1001) Re_matrix=56/D_in[p]*FR_litpermin[q]
AppendMatrixContour Re_matrix vs {D_in, FR_litpermin}
ModifyContour Re_matrix autoLevels={1,7e3,15}
ModifyGraph rgb=(0,0,0)
//
//
//////////////////// Show point selected
Make/O/D/N=1 FlowRate_DiamTube_Xvalue={TubeDiam}
Make/O/D/N=1 FlowRate_DiamTube_Yvalue={FlowRate}
AppendtoGraph FlowRate_DiamTube_Yvalue vs FlowRate_DiamTube_Xvalue
ModifyGraph mode(FlowRate_DiamTube_Yvalue)=3,marker(FlowRate_DiamTube_Yvalue)=19,msize(FlowRate_DiamTube_Yvalue)=5
//
//		show color coding for laminar (Re < 2300), transition (2300 < Re < 4000), or turbulent (Re > 4000)
		If (ReynoldsNumber < 2300)
			ModifyGraph rgb(FlowRate_DiamTube_Yvalue)=(0,65535,0)
		EndIf
		If (ReynoldsNumber > 4000)
			ModifyGraph rgb(FlowRate_DiamTube_Yvalue)=(65535,0,0)
		EndIf
		If ((ReynoldsNumber >= 2300) && (ReynoldsNumber <= 4000))
			ModifyGraph rgb(FlowRate_DiamTube_Yvalue)=(65535,43690,0)
		EndIf
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Make_PSL_refractive_index_panel()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-08-28
//
//
// Description: This sets up a panel to give the refractive index of PSL as a function of wavelength.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: eee
//
// Calls required previously: none
//
// Called by: none
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Declare quantities needed in function:
Variable/G lambda_PSL_input, refractive_index_PSL_input
//
//
//*********************************************************************
//*********************************************************************
/////////// set defaults
// inputs
lambda_PSL_input=500 // nm
refractive_index_PSL_input=1.603 // calculated offline
//
//
Make/O/D/N=1 lambda_PSL_input_wave, refractive_index_PSL_input_wave
lambda_PSL_input_wave={lambda_PSL_input}
refractive_index_PSL_input_wave={refractive_index_PSL_input}
//
//
/////////////////////////////////////
//	make PSL refractive index panel
	KillWindow/Z PSL_refractive_index_panel // get rid of previous panel if it exists
	NewPanel/K=1 /W=(50,100,260,255) /N=PSL_refractive_index_panel as "PSL_refractive_index_panel"
//
//
/////////////////////////////////////
//	set up PSL Refractive Index title box
	TitleBox PSL_refractive_index_title title="\Z20PSL Refractive Index", pos={10, 10},fcolor=(0, 0, 65535), frame=4, labelBack=(5000,5000,5000,20000)
//
//
/////////////////////////////////////
// set up PSL refractive index info button
	Button PSL_refractive_index_info_button,pos={85,110},size={40,40},proc=Do_PSL_refractive_index_panel_info_button,title="\Z24i",fcolor=(50000,50000,65535)
//
//
/////////////////////////////////////
// group PSL refractive index input box
	GroupBox Group_PSL_refractive_index pos={45, 50}, size={120, 30}, labelBack=(65535, 50000, 50000)
//
//
/////////////////////////////////////
// set up PSL refractive index variable input boxes
	DrawText 50,75, "\Z16λ/nm:"
	SetVariable lambda_PSL_input, pos={100,55}, size={60,20}, bodyWidth=0, title=" ", fsize=14, format="%4.0f"
	SetVariable lambda_PSL_input, value=lambda_PSL_input, limits={400,1400,1}, proc=Update_for_PSL_refractive_index_panel
//
// eee nead ValDisplay here
	DrawText 15, 100, "\Z16 Refractive Index:"
	ValDisplay Refractive_Index_input, pos={145, 82.5}, size={45,20}, bodywidth=0, value=#"Refractive_Index_PSL_input", fsize=14, format="%5.3f"
//
//
///////////////////////// make waves of lambda_PSL, refractive_index_PSL, graph them
	Make/O/D/N=1000 lambda_PSL_wave, refractive_index_PSL_wave
	lambda_PSL_wave=400+x
	refractive_index_PSL_wave=1.5663+0.00785/(lambda_PSL_wave/1000)^2+0.000334/(lambda_PSL_wave/1000)^4
//
//
/////// graph Refractive Index (lambda)
	KillWindow/Z PSL_refractive_index_graph // get rid of previous graph if it exists
	Display/K=1/W=(300, 100, 900, 500) /N=PSL_refractive_index_graph as "PSL refractive index graph"
	AppendtoGraph Refractive_index_PSL_wave vs lambda_PSL_wave
	ModifyGraph mirror=1,standoff=0, fsize=24, rgb=(0,0,0)
	SetAxis left 1.55, 1.65
	SetAxis bottom 400, 1400
	Label left "\Z24Refractive index"
	Label bottom "\Z24Wavelength/nm"
//
	AppendtoGraph Refractive_index_PSL_input_wave vs lambda_PSL_input_wave
	ModifyGraph rgb(Refractive_index_PSL_input_wave)=(65535,0,0),mode(Refractive_index_PSL_input_wave)=3,marker(Refractive_index_PSL_input_wave)=19,msize(Refractive_index_PSL_input_wave)=5
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Update_for_PSL_refractive_index_panel(ctrlName) : SetVariableControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-08-28
//
//
// Description: This provides the control for SetVariables in Make_PSL_refractive_index_panel 
//		by updating everything shown in that panel whenever the wavelength is changed.
//	
// Version history: there are no previous versions
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Variables calculated in function: lambda_PSL_input, Refractive_index_PSL_input
//
// Calls: eee
//
// Calls required previously: none
//
// Called by: Make_PSL_refractive_index_panel (when a SetVariable is changed)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMSetVariableAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse up
//		eventcode 2 is Enter key
//		eventcode 3 is Live update
// 		eventcode 4 is Mouse scroll wheel up
//		eventcode 5 is Mouse scroll wheel down
// 		eventcode 6 is Value changed by dependency update
// 		eventcode 7 is Begin edit (Igor7 or later)
// 		eventcode 8 is End edit (Igor7 or later)
//		eventcode 9 is Mouse down (Igor8 or later)
//
//		Event code -1 is never sent to an old-style (non-structure parameter) action procedure.
//		Event code 1 is sent when the mouse is released after clicking the up-arrow or down-arrow buttons.
//			It is also sent for value changes caused by the mouse scroll wheel for a non-live mode control.
//		Event codes 4 and 5 are sent only for string SetVariables or numeric SetVariables whose increment setting is zero.
//			Otherwise the value change is signaled by event code 1.
//		For numeric SetVariables whose increment is non-zero, the mouse scroll wheel acts like a mouse click on the up-arrow button or down-arrow button.
//			That is, event code 1, mouse up, is more like "value changed".
//		Event code 6 is by default sent to only structure-based action procedures.
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	STRUCT WMSetVariableAction &ctrlName
//
//
	Make/O/D/N=1 lambda_PSL_input_wave, Refractive_index_PSL_input_wave
//
//
// Declare other variables and waves
	NVAR lambda_PSL_input, refractive_index_PSL_input
//
//
	If (ctrlName.eventcode == 1 || ctrlName.eventcode == 2) // do only when mouse goes up (eventcode = 1) or enter key hit (eventcode = 2)
		If (cmpstr(ctrlName.vName, “lambda_PSL_input”) == 0) // calculate refractive index if wavelength changed
			Refractive_index_PSL_input=Calculate_PSL_refractive_index(lambda_PSL_input)
		EndIf
//
//
		lambda_PSL_input_wave={lambda_PSL_input}
		Refractive_index_PSL_input_wave={Refractive_index_PSL_input}
//
//
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Do_PSL_refractive_index_panel_info_button(Make_PSL_refractive_index_panel_info_Struct) : ButtonControl
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-01-16
//
//
// Description: This calls Print_refractive_index_PSL_info when the 
//		Do_PSL_refractive_index_panel_info_button is hit in panel Make_PSL_refractive_index_panel.
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: Make_PSL_refractive_index_panel_info_Struct
//		is the structure for this button control
//
// Quantities required for function: none
//
// Calls: Print_refractive_index_PSL_info
//
// Calls required previously: none
//
// Called by: Make_PSL_refractive_index_panel (when "i" button hit)
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// WMButtonAction eventCode Field:
//		eventcode -3 is Control received keyboard focus (Igor8 or later)
//		eventcode -2 is Control lost keyboard focus (Igor8 or later)
// 		eventcode -1 is Control being killed
//		eventcode 1 is Mouse down
//		eventcode 2 is Mouse up
//		eventcode 3 is Mouse up outside control
// 		eventcode 4 is Mouse moved
//		eventcode 5 is Mouse enter
// 		eventcode 6 is Mouse leave
// 		eventcode 7 is Mouse dragged while outside control
//
//		Events 2 and 3 happen only after event 1.
//		Events 4, 5, and 6 happen only when the mouse is over the control but happen regardless of the mouse button state.
//		Event 7 happens only when the mouse is pressed inside the control and then dragged outside.
//
//
//*********************************************************************
//*********************************************************************
// Declare variables in call statement
	STRUCT WMButtonAction &Make_PSL_refractive_index_panel_info_Struct
//
//
	If (Make_PSL_refractive_index_panel_info_Struct.eventcode==2) // print info only if button clicked (event code 2 is mouse up)
		Print_refractive_index_PSL_info()
	EndIf
//
//
//*********************************************************************
//*********************************************************************
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_refractive_index_PSL_info()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2023-08-28
//
//
// Description: This prints information on the refractive index of PSL
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: none
//
// Calls: none
//
// Calls required previously: none
//
// Called by: Do_PSL_refractive_index_panel_info_button, Ernie's Igor Tools menu 
//
// Return: 0
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Refractive_index_PSL_info_text
//
//
	Refractive_index_PSL_info_text = "------------------------ Top of page ------------------------\r\r"
//
	Refractive_index_PSL_info_text = Refractive_index_PSL_info_text + "PSL Refractive Index information\r"
	Refractive_index_PSL_info_text = Refractive_index_PSL_info_text + "--------------------------------\r\r"
//
	Refractive_index_PSL_info_text = Refractive_index_PSL_info_text + "THIS NEEDS TO BE DONE\r\r"
//
	Refractive_index_PSL_info_text = Refractive_index_PSL_info_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z Refractive_index_PSL_info_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(300,550,900,950)/N=Refractive_index_PSL_info_notebook
	Notebook Refractive_index_PSL_info_notebook, text=Refractive_index_PSL_info_text, fsize=11
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Calculate_PSL_refractive_index(lambda_nm)
//
//
// written by Ernie Lewis
// version 1.01
// last revision 2021-11-17
//
//
// Description: This calculates the real part of the refractive index of PSL from 
//		Miles et al., JPhysChem, v114A, 2010 using equation 3 on p. 7079.
// This equation gives the value at 20 °C for lambda in micrometers.
// On p. 7080 they state that the imaginary part of the refractive index is 5e-4.
//
//
// Version history: There are no previous versions.
//
// define variables in call
	Variable lambda_nm
//
//
	Variable PSL_refractive_index
//
//
	PSL_refractive_index=1.5663+0.00785/(lambda_nm/1000)^2+0.000334/(lambda_nm/1000)^4
//
//
Return PSL_refractive_index
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function ShapeFactor_Ellipsoid()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// version 1.01
// last revision 2024-08-23
//
//
// Description: This graphs the shape factors for ellipsoids, defined as the drag force divided by 
//		the drag force on a sphere of equal volume.
// It is from Fuchs, 1964 pp 37-38, who cited Oseen, C. (1927) Neuere Methoden und Ergebnisse ill der Hydrodynamik. Leipzig, §18
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters:none 
//
//
// Quantities required for function: 
// Variables calculated in function: 
// Waves created in function: 
// Free waves created in function: 
// Calls: 
// Calls required previously: 
// Called by: 
// Return: 
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
//
////////////////////// Prolate spheroid
// beta_prolate = b/a
// volume of equivalent sphere = a^2*b = a^3*beta_prolate
// drag force ~ a*factor = a*beta_prolate^(1/3)*shape_factor
// thus shape factor = factor/beta_prolate^(1/3)
// shape factor of prolate sphere with beta=2 along polar axis is 0.956
Make/O/D/N=1000 beta_prolate=1.01+x/100
Make/O/D/N=1000 Factor_prolate_1=(4/3)*(beta_prolate^2-1)/((2*beta_prolate^2-1)/sqrt(beta_prolate^2-1)*ln(beta_prolate+sqrt(beta_prolate^2-1))-beta_prolate) // along polar axis
Make/O/D/N=1000 ShapeFactor_prolate_1=Factor_prolate_1/beta_prolate^(1/3)
Make/O/D/N=1000 Factor_prolate_2=(8/3)*(beta_prolate^2-1)/((2*beta_prolate^2-3)/sqrt(beta_prolate^2-1)*ln(beta_prolate+sqrt(beta_prolate^2-1))+beta_prolate) // transverse to polar axis
Make/O/D/N=1000 ShapeFactor_prolate_2=Factor_prolate_2/beta_prolate^(1/3)
Make/O/D/N=1000 ShapeFactor_prolate_random=1/3*ShapeFactor_prolate_1 + 2/3*ShapeFactor_prolate_2
//
//
////////////////////// Oblate spheroid
// beta_oblate = a/b
// volume of equivalent sphere = a^2*b = a^3/beta_oblate
// drag force ~ a*factor = a/beta_oblate^(1/3) * shape_factor
Make/O/D/N=1000 beta_oblate=1.01+x/100
Make/O/D/N=1000 Factor_oblate_1=(4/3)*(beta_oblate^2-1)/(beta_oblate*(beta_oblate^2-2)/sqrt(beta_oblate^2-1)*atan(sqrt(beta_oblate^2-1))+beta_oblate) // along polar axis
Make/O/D/N=1000 ShapeFactor_oblate_1=Factor_oblate_1*beta_oblate^(1/3) // this asymptotically goes to 8/(3*pi)=0.849 for large beta
Make/O/D/N=1000 Factor_oblate_2=(8/3)*(beta_oblate^2-1)/(beta_oblate*(3*beta_oblate^2-2)/sqrt(beta_oblate^2-1)*atan(sqrt(beta_oblate^2-1))-beta_oblate) // transverse to polar axis
Make/O/D/N=1000 ShapeFactor_oblate_2=Factor_oblate_2*beta_oblate^(1/3) // this asymptotically goes to 16/(9*pi)=0.566 for large beta
Make/O/D/N=1000 ShapeFactor_oblate_random=1/3*ShapeFactor_oblate_1 + 2/3*ShapeFactor_oblate_2
//
//
/////////////////// graph shape factors
KillWindow/Z Graph_shape_factor
Display /W=(150,100,750,500)/N=Graph_shape_factor
AppendtoGraph ShapeFactor_prolate_1, ShapeFactor_prolate_2, ShapeFactor_prolate_random vs beta_prolate
AppendtoGraph ShapeFactor_oblate_1, ShapeFactor_oblate_2, ShapeFactor_oblate_random vs beta_oblate
ModifyGraph mirror=1,fSize=24,standoff=0
SetAxis bottom 1, 10
TextBox/C/N=text0/F=0/A=LB/X=-1.50/Y=-11.80 "\\Z241" // this labels the lower axis at "1"
SetAxis left 0.8,2
Label bottom "\\Z24Ratio of major to minor axis"
Label left "\\Z24Shape factor"
ModifyGraph lstyle(ShapeFactor_prolate_1)=1,lstyle(ShapeFactor_prolate_2)=3,lstyle(ShapeFactor_prolate_random)=0
ModifyGraph lstyle(ShapeFactor_oblate_1)=1,lstyle(ShapeFactor_oblate_2)=3,lstyle(ShapeFactor_oblate_random)=0
ModifyGraph rgb(ShapeFactor_prolate_1)=(0,0,0),rgb(ShapeFactor_prolate_2)=(0,0,0), rgb(ShapeFactor_prolate_random)=(0,0,0)
ModifyGraph rgb(ShapeFactor_oblate_1)=(65535,0,0),rgb(ShapeFactor_oblate_2)=(65535,0,0),rgb(ShapeFactor_oblate_random)=(65535,0,0)
TextBox/C/N=text1/F=0/A=LT/X=3/Y=3 "\\Z16\\s(ShapeFactor_prolate_1) Prolate, along polar axis\r\\s(ShapeFactor_prolate_2) Prolate, transverse to polar axis";DelayUpdate
AppendText/N=text1 "\\s(ShapeFactor_prolate_random) Prolate, random\r\\s(ShapeFactor_oblate_1) Oblate, along polar axis";DelayUpdate
AppendText/N=text1 "\\s(ShapeFactor_oblate_2) Oblate, transverse to polar axis\r\\s(ShapeFactor_oblate_random) Oblate, random"
//
//







//////////////// set up graph to draw ellipses
KillWindow/Z Draw_ellipses
Display /W=(800,100,1400,500)/N=Draw_ellipses
//
//
///////// make prolate ellipse
Make/O/D/N=1000 theta, x_prolate, y_prolate, y_prolate_center
theta=2*Pi*(x/1000)
x_prolate=cos(theta)
y_prolate= 3*sin(theta)
y_prolate_center =0.1* 3*sin(theta)
//
AppendtoGraph y_prolate, y_prolate_center vs x_prolate
ModifyGraph lstyle(y_prolate_center)=3
//
// make polar axis
Make/O/D/N=5 x_prolate_polar_axis, y_prolate_polar_axis
x_prolate_polar_axis={0,0, -0.1, 0, 0.1}
y_prolate_polar_axis={-3.5, 4, 3.6, 4, 3.6}
AppendtoGraph y_prolate_polar_axis vs x_prolate_polar_axis
//
// make horizontal axis
Make/O/D/N=2 x_prolate_horizontal_axis, y_prolate_horizontal_axis
x_prolate_horizontal_axis={0,1}
y_prolate_horizontal_axis={0,0}
AppendtoGraph y_prolate_horizontal_axis vs x_prolate_horizontal_axis
//
//
TextBox/C/N=text0/F=0/A=LB/X=15.00/Y=-12.00 “\Z20Prolate”
TextBox/C/N=text1/F=0/A=LT/X=12/Y=6 "\Z20Polar axis"
TextBox/C/N=text2/F=0/A=LT/X=22/Y=42 “\Z20a”
TextBox/C/N=text3/F=0/A=LT/X=27/Y=55 “\Z20b”
//
//
///////// make oblate ellipse
Make/O/D/N=1000 x_oblate, y_oblate, y_oblate_center
x_oblate=3+cos(theta)
y_oblate=0.75*sin(theta)
y_oblate_center =0.5*0.75*sin(theta)
//
Appendtograph y_oblate, y_oblate_center vs x_oblate
ModifyGraph lstyle(y_oblate_center)=3
//
// make polar axis
Make/O/D/N=5 x_oblate_polar_axis, y_oblate_polar_axis
x_oblate_polar_axis={3,3, 2.9, 3, 3.1}
y_oblate_polar_axis={-3.5, 4, 3.6, 4, 3.6}
AppendtoGraph y_oblate_polar_axis vs x_oblate_polar_axis
//
// make horizontal axis
Make/O/D/N=2 x_oblate_horizontal_axis, y_oblate_horizontal_axis
x_oblate_horizontal_axis={3,4}
y_oblate_horizontal_axis={0,0}
AppendtoGraph y_oblate_horizontal_axis vs x_oblate_horizontal_axis
//
TextBox/C/N=text4/F=0/A=LB/X=75.00/Y=-12.00 “\Z20Oblate”
TextBox/C/N=text5/F=0/A=LT/X=72/Y=6 "\Z20Polar axis"
TextBox/C/N=text6/F=0/A=LT/X=88/Y=56 “\Z20a”
TextBox/C/N=text7/F=0/A=LT/X=81/Y=55 “\Z20b”
//
//
SetAxis left -3,5
SetAxis bottom -1, 4
ModifyGraph mirror=0,axThick=0,noLabel=2,rgb=(0,0,0)


//*********************************************************************
//*********************************************************************
// Define quantities needed in function
	String Ellipsoid_shape_factor_text
//
Ellipsoid_shape_factor_text="------------------------------------------------------------------ Top of page ------------------------------------------------------------------\r\r"
//
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "The above panel graphs the shape factor (χ) of an ellipsoid for prolate and oblate ellipsoids, moving either parallel (χ_||) and perpendicular (χ_⊥) to the polar axis,\r"
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "   where the shape factor is defined as the drag force divided by that of a sphere of equivalent volume.\r"
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "The shape factor for an ellipsoid moving at an angle θ to the polar axis is given by χ = χ_|| × cosθ + χ_⊥ × sinθ.\r"
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "The shape factor for an ellipsoid moving at random orientation (as it might in Brownian motion) is given by χ_random = 1/3 × χ_|| + 2/3 × χ_⊥.\r\r"
//
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "The shape factor can be less than unity, such as for a prolate ellipsoid along the polar axis and an oblate ellipsoid transverse to the polar axis, for some ratios of axes,\r"
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "   but the motions in these situations are not stable.\r\r"
//
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "The relations used are from Oseen, C. (1927), Neuere Methoden und Ergebnisse ill der Hydrodynamik. Leipzig, §18, cited in Fuchs, N. A. (1964), Mechanics of Aerosols, pp. 37-38.\r\r"
//
Ellipsoid_shape_factor_text=Ellipsoid_shape_factor_text + "----------------------------------------------------------------- Bottom of Page ----------------------------------------------------------------"
//
//
KillWindow/Z Ellipsoid_shape_factor_notebook // get rid of window if it exists
NewNotebook/F=0/K=1/W=(150,550,1400,800)/N=Ellipsoid_shape_factor_notebook
Notebook Ellipsoid_shape_factor_notebook, text=Ellipsoid_shape_factor_text, fsize=11
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Fit_data_to_different_orders()
//
//
//*********************************************************************
//*********************************************************************
// written by Ernie Lewis
// last revision 2022-07-31
//
//
// Description: This requests the names of the waves containing x- and y- data, renames them x_data and y_data,
//		fits the wave y_data to a linear, quadratic, cubic, and quartic of x_data,
//		plots the data and the various fits, and plots the differences of the fits.	
//
//
// Version history: There are no previous versions.
//
// Explanation of call parameters: none
//
// Quantities required for function: an input_x_data_wave and an input_y_data_wave
//
// Calls: none
//
// Calls required previously: none
//
// Called by: menu
//
// Return: none
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	String input_x_data_wave, input_y_data_wave
//
//
////////////// declare other quantities used in function
	Make/O/D/n=2 W_coef // this will be overwritten, but this way it exists
//
//
////////////// input x-data wave and y-data wave
	Prompt input_x_data_wave, "Input x-data wave"
	Prompt input_y_data_wave, "Input y-data wave"
	DoPrompt "input both waves", input_x_data_wave, input_y_data_wave
	If (V_Flag)
		Return -1 // user cancelled
	EndIF
//
//
////////////// rename waves
	Wave wave_x=$input_x_data_wave
	Wave wave_y=$input_y_data_wave
//
//
////////////// create new waves that are not referenced to original waves
	Make/O/D/N=(numpnts($input_x_data_wave)) x_data_wave=wave_x
	Make/O/D/N=(numpnts($input_y_data_wave)) y_data_wave=wave_y
//
//
//*********************************************************************
///////////////// make fits: linear, quadratic, cubic, quartic
////// line:
	CurveFit/Q line y_data_wave /X=x_data_wave /D
	Make/O/D/N=(numpnts(x_data_wave)) myfit_1=W_coef[0]+W_coef[1]*x_data_wave
	Make/O/D/N=(numpnts(x_data_wave)) myfit_1_diff=myfit_1-y_data_wave
//
////// quadratic:
	CurveFit/Q poly 3, y_data_wave /X=x_data_wave /D
	Make/O/D/N=(numpnts(x_data_wave)) myfit_2=W_coef[0]+W_coef[1]*x_data_wave+W_coef[2]*x_data_wave^2
	Make/O/D/N=(numpnts(x_data_wave)) myfit_2_diff=myfit_2-y_data_wave
//
////// cubic:
	CurveFit/Q poly 4, y_data_wave /X=x_data_wave /D
	Make/O/D/N=(numpnts(x_data_wave)) myfit_3=W_coef[0]+W_coef[1]*x_data_wave+W_coef[2]*x_data_wave^2+W_coef[3]*x_data_wave^3
	Make/O/D/N=(numpnts(x_data_wave)) myfit_3_diff=myfit_3-y_data_wave
//
////// quartic:
	CurveFit/Q poly 5, y_data_wave /X=x_data_wave /D
	Make/O/D/N=(numpnts(x_data_wave)) myfit_4=W_coef[0]+W_coef[1]*x_data_wave+W_coef[2]*x_data_wave^2+W_coef[3]*x_data_wave^3+W_coef[4]*x_data_wave^4
	Make/O/D/N=(numpnts(x_data_wave)) myfit_4_diff=myfit_4-y_data_wave
//
////// zero (for plotting)
	Make/O/D/N=(numpnts(x_data_wave)) y_zero=0
//
//
//*********************************************************************
///////////////// graph fits
	Killwindow/Z data_and_fits_graph
	Display /W=(200,150,850,550) /N=data_and_fits_graph
	Appendtograph y_data_wave, myfit_1, myfit_2, myfit_3, myfit_4 vs x_data_wave
	ModifyGraph mirror=1,fSize=24,standoff=0
	Label left "Y-data and fits"
	Label bottom "X-data"
	ModifyGraph rgb=(0,0,0) // this makes sure the trace for y_data is black
	ModifyGraph lstyle(myfit_1)=1, mode(myfit_1)=4, marker(myfit_1)=8, rgb(myfit_1)=(0,65535,0)
	ModifyGraph lstyle(myfit_2)=2, mode(myfit_2)=4, marker(myfit_2)=5, rgb(myfit_2)=(65535,0,0)
	ModifyGraph lstyle(myfit_3)=3, mode(myfit_3)=4, marker(myfit_3)=6, rgb(myfit_3)=(0,0,65535)
	ModifyGraph lstyle(myfit_4)=4, mode(myfit_4)=4, marker(myfit_4)=7, rgb(myfit_4)=(65535,0,65535)
	TextBox/C/N=text0/F=0/B=1/A=LT/X=5.00/Y=5.00 "\Z20\s(y_data)Data\r\s(myfit_1)linear fit\n\s(myfit_2)quadratic fit\n\s(myfit_3)cubic fit\n\s(myfit_4)quartic fit"
//
//
///////////////// graph differences
	Killwindow/Z differences_of_fits_graph
	Display /W=(900,150,1550,550) /N=differences_of_fits_graph
	Appendtograph y_zero, myfit_1_diff, myfit_2_diff, myfit_3_diff, myfit_4_diff vs x_data_wave
	ModifyGraph mirror=1,fSize=24,standoff=0
	Label left "Differences of fits from data"
	Label bottom "X-data"
	ModifyGraph lstyle(y_zero)=0, lsize(y_zero)=0.5, rgb(y_zero)=(0,0,0)
	ModifyGraph lstyle(myfit_1_diff)=1, mode(myfit_1_diff)=4, marker(myfit_1_diff)=8, rgb(myfit_1_diff)=(0,65535,0)
	ModifyGraph lstyle(myfit_2_diff)=2, mode(myfit_2_diff)=4, marker(myfit_2_diff)=5, rgb(myfit_2_diff)=(65535,0,0)
	ModifyGraph lstyle(myfit_3_diff)=3, mode(myfit_3_diff)=4, marker(myfit_3_diff)=6, rgb(myfit_3_diff)=(0,0,65535)
	ModifyGraph lstyle(myfit_4_diff)=4, mode(myfit_4_diff)=4, marker(myfit_4_diff)=7, rgb(myfit_4_diff)=(65535,0,65535)
	TextBox/C/N=text0/F=0/B=1/A=LT/X=5.00/Y=5.00 "\Z20Fit minus Data for:\r\s(myfit_1_diff)linear fit\n\s(myfit_2_diff)quadratic fit\n\s(myfit_3_diff)cubic fit\n\s(myfit_4_diff)quartic fit"
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
Function Print_List_of_functions_in_Ernies_Igor_tools()
//
//
//*********************************************************************
//*********************************************************************
// Define quantities needed in function:
	String List_of_functions_text
//
//
	List_of_functions_text = "------------------------ Top of page ------------------------\r\r"
//
	List_of_functions_text = List_of_functions_text + "--------------------------------------- List of Functions in Ernie's Igor Tools\r"
	List_of_functions_text = List_of_functions_text + "-------------------------------------------------------------------------------\r\r"
//
	List_of_functions_text = List_of_functions_text + "Function Print_About_Ernies_Igor_tools()\r\r"
//
	List_of_functions_text = List_of_functions_text + "--------------- Display stuff\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_symbols()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_Greek_alphabet()\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Greek_alphabet_button(Print_Greek_alphabet_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Greek_alphabet()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_SI_prefixes()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_SI_prefixes_info_button(SI_prefixes_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_SI_prefixes_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_physical_constants()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Physical_constants_info_button(Physical_constants_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_physical_constants_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_Gaussian_integrals()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_Earth_moon_sun_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Earth_moon_sun_info_button(Earth_moon_sun_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Earth_moon_sun_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_Standard_Atmosphere()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_conversions()\r\r"
//
	List_of_functions_text = List_of_functions_text + "--------------- Formula weight stuff\r"
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Input_chemical_formula_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Input_chemical_formula_panel(Calculate_chemical_formula_Struct) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function/S Calculate_Formula_Weight(Compound_String)\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Elements_waves()\r"
	List_of_functions_text = List_of_functions_text + "   Function Display_Elements()\r\r"
//
	List_of_functions_text = List_of_functions_text + "--------------- Substance properties\r"
	List_of_functions_text = List_of_functions_text + "   Function Set_defaults_for_property_panels()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_all_stuff_for_properties_panels()\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Input_Temp_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Input_Temp_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Input_Temp_panel_info_button(Input_Temp_panel_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Input_Temp_panel_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Input_Pres_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Input_Pres_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Input_Pres_panel_info_button(Input_Pres_panel_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Input_Pres_panel_info()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Air_properties_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Air_properties_info_button(Air_properties_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Air_properties_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Graph_air_properties_button(Graph_air_properties_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_Air_Properties()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_properties(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_density(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_Cp(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_Cv(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_mean_free_path(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_c_sound(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_dynamic_viscosity(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_air_thermal_conductivity(TempC, Pres_hPa)\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Water_vapor_in_air_properties_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Water_vapor_in_air_properties_info_button(Water_vapor_in_air_properties_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Water_vapor_in_air_properties_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_vapor_in_air_properties(TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_H2O_diffusivity_in_air(TempC, Pres_hPa)\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Water_properties_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Water_properties_info_button(Water_properties_info_Struct) : ButtonControl\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Water_properties_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_properties(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_density(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_Cp(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_Cv(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_latent_heat(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_c_sound(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_dynamic_viscosity(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_thermal_conductivity(TempC)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_water_surface_tension(TempC)\r\r"
//
	List_of_functions_text = List_of_functions_text + "--------------- Particle properties\r"
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Particle_properties_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Particle_properties_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Particle_properties_info_button(Particle_properties_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Particle_properties_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_particle_properties(DDpp, rho_p, TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_aerodynamic_diameter(DDpp, rho_p, TempC, Pres_hPa)\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Kn_Cunningham_relations_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Kn_Cunningham_relations_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Kn_Cunningham_relations_panel_info_button(Make_Kn_Cunningham_relations_panel_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Kn_Cunningham_relations_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Kn_from_Cunn(Cunn)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Kn_from_Kn_times_Cunn(Kn_times_Cunn)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Kn_from_Kn_squared_over_Cunn(Kn_squared_over_Cunn)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_d_onebyKn_d_Kn_times_Cunn(Kn)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_d_onebyKn_d_Kn_squared_over_Cunn(Kn)\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Mass_Diam_Density_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Mass_Diam_Density_relations_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Choose_Mass_or_Diam_or_Density(Choose_Mass_or_Diam_or_Density_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Mass_Diam_Density_relations_panel_info_button(Make_Mass_Diam_Density_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Mass_Diam_Density_relations_info()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Coagulation_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Coagulation_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Coagulation_information_button(Coagulation_information_button_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Coagulation_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Choose_Fuchs_or_Dahneke_coagulation(Choose_Fuchs_or_Dahneke_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_coagulation_quantities(Dp1, rho1, Dp2, rho2, coagulation_accommodation_coefficient, Fuchs_or_Dahneke_value, TempC, Pres_hPa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_coagulation_coefficient_button(Graph_coagulation_coefficient_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_coagulation_coefficient()\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_coagulation_efficiency_button(Graph_coagulation_efficiency_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_coagulation_efficiency()\r"
	List_of_functions_text = List_of_functions_text + "   Function Compare_Fuchs_Danheke_coagulation()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Coagulate_size_distribution_button(Coagulate_size_distribution_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Coagulate_size_distribution()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Charging_efficiencies_for_equal_Dmob_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Charging_efficiencies_for_equal_Dmob_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Charging_efficiencies_for_equal_Dmob_info_button(Charging_efficiencies_for_equal_Dmob_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Charging_efficiencies_for_equal_Dmob_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Whose_charging_efficiencies_for_equal_Dmob_proc(Whose_charging_efficiencies_for_equal_Dmob_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Dq_equal_mobility_as_Dq_actual(Dq_actual, Q_actual)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_charging_efficiencies_for_equal_Dmob()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_charging_efficiencies(D_for_Qeff, TempC, Whose_charging_efficiencies)\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Charging_efficiencies_for_same_Dp_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Charging_efficiencies_for_same_Dp_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Charging_efficiencies_for_same_Dp_info_button(Charging_efficiencies_for_same_Dp_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Charging_efficiencies_for_same_Dp_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Whose_charging_efficiencies_for_same_Dp_proc(Whose_charging_efficiencies_for_same_Dp_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Dmob_for_various_Q(Dmob_various_Q, Q_actual)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_charging_efficiencies_for_same_Dp_various_Q()\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Query_for_Graph_charging_efficiencies_info_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_charging_efficiencies_info_button(Graph_charging_efficiencies_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_charging_efficiencies_info()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Dcrit_supersat_kappa_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Dcrit_supersat_kappa_relations_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Choose_Dcrit_or_supersat_or_kappa(Choose_Dcrit_or_supersat_or_kappa_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Dcrit_supersat_kappa_relations_panel_info_button(Do_Dcrit_supersat_kappa_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Dcrit_supersat_kappa_relations_info()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_core_shell_activation_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_core_shell_activation_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_D_act_for_core_shell_activation(D_core, T_coat, kappa)\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_core_shell_activation_info_button(core_shell_activation_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_core_shell_activation_info()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Daero_Dgeo_relations_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Daero_Dgeo_relations_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Choose_rho_or_Dgeo_or_Daero(Choose_rho_or_Dgeo_or_Daero_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Daero_Dgeo_relations_panel_info_button(Do_Daero_Dgeo_relations_panel_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Daero_Dgeo_relations_info()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Re_Cd_relations_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Re_Cd_relations_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Re_Cd_relations_panel_info_button(Make_Re_Cd_relations_panel_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Re_Cd_relations_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Re_from_Cd(CCdd)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Re_from_Cd_times_Re_squared(Cd_times_Re_squared)\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Re_from_Re_by_Cd(Re_by_Cd)\r\r"
//
	List_of_functions_text = List_of_functions_text + "--------------- Misc tools\r"
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_Wavelength_freq_wavenumber_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Wavelength_freq_wavenumber_panel(ctrlName) : SetVariableControl\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_color_temp_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_Color_temp_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_color_temp_or_ratio(color_temp_or_ratio_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_color_temperature_ratio()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_Temp_from_color_temperature_ratio()\r"
	List_of_functions_text = List_of_functions_text + "   Function Graph_Planck_curve()\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Color_temp_info_button(Color_temp_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Color_temp_info()\r\r"
//
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Make_Tube_flow_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Update_for_Tube_flow_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Choose_Flowrate_or_TubeDiam_or_MeanU(Choose_Flowrate_or_TubeDiam_or_MeanU_box) : CheckBoxControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_Tube_flow_panel_info_button(Do_Tube_flow_panel_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_Tube_flow_panel_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_FlowRate_DiamTube_graph()\r\r"
//						
	List_of_functions_text = List_of_functions_text + "-------------------\r"
	List_of_functions_text = List_of_functions_text + "   Function Make_PSL_refractive_index_panel()\r"
	List_of_functions_text = List_of_functions_text + "   Function Update_for_PSL_refractive_index_panel(ctrlName) : SetVariableControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Do_PSL_refractive_index_panel_info_button(Make_PSL_refractive_index_panel_info_Struct) : ButtonControl\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_refractive_index_PSL_info()\r"
	List_of_functions_text = List_of_functions_text + "   Function Calculate_PSL_refractive_index(lambda_nm)\r\r"
//
	List_of_functions_text = List_of_functions_text + "   Function Fit_data_to_different_orders()\r\r"
//
	List_of_functions_text = List_of_functions_text + "--------------- List of functions\r"
	List_of_functions_text = List_of_functions_text + "   Function Print_List_of_functions_in_Ernies_Igor_tools()\r\r"
//
	List_of_functions_text = List_of_functions_text + "----------------------- Bottom of Page ----------------------"
//
//
// print information
	KillWindow/Z List_of_functions_notebook // get rid of window if it exists
	NewNotebook/F=0/K=1/W=(50,100,1100,800)/N=List_of_functions_notebook
	Notebook List_of_functions_notebook, text=List_of_functions_text
//
//
Return 0
//
//
END
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////
//
//
//
//
//
//
//
//
//
//
/////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////




// E - look at Newton's method iterations on lines 6368 and 7191; see if I can explain these better

// note that for calculation of Re from CD, this takes only the first part (Re <= 3500)

// work more on PSL Refractive index

// more details on Brown and Lawler


//put fsize on all notebooks