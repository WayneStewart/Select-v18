//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // User name (OS): Wayne Stewart
  // Date and time: 02/12/08, 14:27:54
  // ----------------------------------------------------
  // Method: SLCT_GetIndexedString
  // Description
  // 
  //
  // Parameters
C_TEXT:C284($Label_t;$1)
C_TEXT:C284($Subst_t;${2})
C_TEXT:C284($0;$String)
  // Local Variables
C_LONGINT:C283($CurrentParameter_i;$NumberOfParameters_i;$SubstIndex_i)

  // ----------------------------------------------------

$Label_t:=$1

$NumberOfParameters_i:=Count parameters:C259
$String:=Get localized string:C991($Label_t)

For ($CurrentParameter_i;2;$NumberOfParameters_i)
	$SubstIndex_i:=$CurrentParameter_i-1
	$Subst_t:=${$CurrentParameter_i}
	$String:=Replace string:C233($String;"<<"+String:C10($SubstIndex_i)+">>";$Subst_t)
End for 

$0:=$String