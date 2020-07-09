//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: Fnd_Select_Button

  // Method Type:     Private

  // Parameters:

  // Local Variables:

  // Returns:

  // Created by Wayne Stewart (20/04/2004)
  //     waynestewart@mac.com
  // ----------------------------------------------------

C_BOOLEAN:C305($0)
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

C_LONGINT:C283($BitToSet_i)

If (False:C215)
	C_BOOLEAN:C305(SLCT_Button ;$0)
	C_TEXT:C284(SLCT_Button ;$1)
	C_BOOLEAN:C305(SLCT_Button ;$2)
End if 

If ($1="New")
	$BitToSet_i:=1
Else 
	$BitToSet_i:=2
End if 

If (Count parameters:C259=2)
	If ($2)
		slct.buttonFlags:=slct.buttonFlags ?+ $BitToSet_i
	Else 
		slct.buttonFlags:=slct.buttonFlags ?- $BitToSet_i
	End if 
End if 

$0:=slct.buttonFlags ?? $BitToSet_i