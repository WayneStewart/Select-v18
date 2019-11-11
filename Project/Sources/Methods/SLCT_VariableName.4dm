//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_VariableName
  // Global and IP variables accessed:     None Used

  // Method Type:    Protected

  // Parameters:
C_POINTER:C301($1)  //$1 is referenced variable

  // Local Variables:
C_TEXT:C284($VariableName_t)
C_LONGINT:C283($TableNumber_i;$FieldNumber_i)

  // Returns:
C_TEXT:C284($0)  //$0 is name of variable

  // Created by Wayne Stewart (Apr 19, 2006)
  //     waynestewart@mac.com
  //   This method is from the DSS library
  //     first published by Deep Sky Technology on
  //     the 4D Zine website.
  // ----------------------------------------------------

$VariableName_t:=""
RESOLVE POINTER:C394($1;$VariableName_t;$TableNumber_i;$FieldNumber_i)
$0:=$VariableName_t