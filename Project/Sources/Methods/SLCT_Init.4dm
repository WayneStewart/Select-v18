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


If (Storage:C1525.appl.initialised=Null:C1517)
	
	Use (Storage:C1525)
		Storage:C1525.appl:=New shared object:C1526("initialised";True:C214;"Version";"17.0")
		
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

If (Slct.initialised=Null:C1517)
	
	Compiler_SLCT 
	
	Slct_Reset 
	
	ARRAY TEXT:C222(SLCT_Format_at;Storage:C1525.k.maxColumns)
	ARRAY TEXT:C222(SLCT_HeaderTitles_at;Storage:C1525.k.maxColumns)
	
	
	
End if 