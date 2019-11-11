//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Format

  // Global and IP variables accessed:     None Used

  // Method Type:    Protected

  // Parameters:
C_LONGINT:C283($1;$Column_i)
C_TEXT:C284($2;$Format_t)

  // Local Variables:

  // Returns:
C_TEXT:C284($0)

  // Created by Wayne Stewart (Apr 19, 2006)
  //     waynestewart@mac.com
  // ----------------------------------------------------

$Column_i:=$1+1  //  Bypass the index array

If (Size of array:C274(SLCT_Format_at)=0)
	ARRAY TEXT:C222(SLCT_Format_at;Storage:C1525.k.maxColumns)
End if 

If ($Column_i<=Size of array:C274(SLCT_Format_at))
	If (Count parameters:C259=2)
		$Format_t:=$2
		SLCT_Format_at{$Column_i}:=$Format_t
	End if 
	$Format_t:=SLCT_Format_at{$Column_i}
End if 

$0:=$Format_t