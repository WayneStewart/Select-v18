//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: Fnd_Select_Button

  // Method Type:     Private

  // Parameters:
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

  // Local Variables:  
C_LONGINT:C283($ParameterCount_i)
C_LONGINT:C283($BitToSet_i)  //C_STRING(255;$Exception_t)

  // Returns: 
C_BOOLEAN:C305($0)

  // Created by Wayne Stewart (20/04/2004)
  //     waynestewart@mac.com
  // ----------------------------------------------------

If ($1="New")
	$BitToSet_i:=1
Else 
	$BitToSet_i:=2
End if 

If (Count parameters:C259=2)
	If ($2)
		SLCT_Button_i:=SLCT_Button_i ?+ $BitToSet_i
	Else 
		SLCT_Button_i:=SLCT_Button_i ?- $BitToSet_i
	End if 
End if 

$0:=SLCT_Button_i ?? $BitToSet_i
