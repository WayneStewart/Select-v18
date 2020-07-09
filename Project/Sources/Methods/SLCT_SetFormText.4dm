//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_SetFormText ({Name of table being listed {; Name of related table }})

  // Description

  // Access: Shared

  // Parameters: 
  //   $1 : Text : Name of table being listed
  //   $2 : Text : Name of related table

  // Created by Wayne Stewart (2017-05-28T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------


  // ----------------------------------------------------
  // Project Method: SLCT_SetFormText
  // Global and IP variables accessed:     None Used
  //  SLCT_MssgText_t  
  //  SLCT_Text1_t
  //  SLCT_Text2_t
  //  Slct.tablePointer

  // Method Type:    Protected

  // Parameters:
C_TEXT:C284($1;$2)

  // Local Variables:
C_TEXT:C284($SelectTable_t;$CurrentTable_t)
C_LONGINT:C283($NumberOfParameters_i)
C_POINTER:C301($ChildTable_ptr)
  // Returns:    

  // Created by Wayne Stewart 
  //     waynestewart@mac.com
  // ### wbs Jan 4, 2005 - Modified for Fnd_Loc

  // Modified by: Wayne Stewart (2/12/08)
  //  Replaced Fnd_Loc with xliff mechanism

  // ----------------------------------------------------

SLCT_Init 

$NumberOfParameters_i:=Count parameters:C259

If ($NumberOfParameters_i=2)  //  This is the easiest. do it first
	Slct.mainText:=$1
	Slct.explanatoryText:=$2
	
Else 
	If (SLCT_RunningInFoundation )
		EXECUTE METHOD:C1007("fnd_gen_currentTable";$ChildTable_ptr)
		SLCT_ChildTable ($ChildTable_ptr)
		EXECUTE METHOD:C1007("Fnd_VS_TableName";$SelectTable_t;Slct.tablePointer)
		EXECUTE METHOD:C1007("Fnd_VS_TableName";$CurrentTable_t;Slct.childPointer)
	Else 
		SLCT_ChildTable (Current form table:C627)
		$SelectTable_t:=Table name:C256(Slct.tablePointer)
		$CurrentTable_t:=Table name:C256(Slct.childPointer)
	End if 
	
	Case of 
		: ($NumberOfParameters_i=0)
			Slct.mainText:=SLCT_GetIndexedString ("MtB_Slct_MainText";Lowercase:C14($SelectTable_t))
			Slct.explanatoryText:=SLCT_GetIndexedString ("MtB_Slct_ExplanatoryText";Lowercase:C14($SelectTable_t);Lowercase:C14($CurrentTable_t))
			
		: ($NumberOfParameters_i=1)
			Slct.mainText:=$1
			Slct.explanatoryText:=SLCT_GetIndexedString ("MtB_Slct_ExplanatoryText";Lowercase:C14($SelectTable_t);Lowercase:C14($CurrentTable_t))
			
	End case 
End if 

If (Length:C16(Slct.mainText)>0)
	Slct.mainText[[1]]:=Uppercase:C13(Slct.mainText)
End if 

If (Length:C16(Slct.explanatoryText)>0)
	Slct.explanatoryText[[1]]:=Uppercase:C13(Slct.explanatoryText)
End if 