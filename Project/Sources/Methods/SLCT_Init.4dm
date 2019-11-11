//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Init

  // Initialises the component

  // Access: Private

  // Created by Wayne Stewart (2019-07-26T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_LONGINT:C283($LoopCounter_i;$NumberOfTables_i;$InnerLoopCounter_i;$WindowID_i)


  // ----------------------------------------------------


If (Storage:C1525.appl.Initialised=Null:C1517)
	
	Use (Storage:C1525)
		Storage:C1525.appl:=New shared object:C1526("Initialised";True:C214;"Version";"17.0")
		
		Storage:C1525.k:=New shared object:C1526(\
			"maxColumns";22)
		
	End use 
	
	Util_FontDiscovery 
	
	ARRAY TEXT:C222($Components_at;0)
	COMPONENT LIST:C1001($Components_at)
	
	SLCT_RunningInFoundation (Find in array:C230($Components_at;"Foundation@")>0)
	
	  // These are the only IP vars used in component
	ARRAY TEXT:C222(<>SLCT_IconPaths_at;0)
	ARRAY PICTURE:C279(<>SLCT_Icons_apic;0)
	
	
End if 

If (Slct.Initialised=Null:C1517)
	
	Compiler_SLCT 
	
	SLCT:=New object:C1471("Initialised";True:C214)
	
	ARRAY TEXT:C222(SLCT_Format_at;Storage:C1525.k.maxColumns)
	ARRAY TEXT:C222(SLCT_HeaderTitles_at;Storage:C1525.k.maxColumns)
	
	
	SLCT_HorizontalScrollBar (False:C215)
	SLCT_WindowDimensions (0;0)  // This will force default size
	
	SLCT.Initialised:=True:C214
	
End if 