//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Table

  // Method Type:     Private

  // Parameters: 
C_POINTER:C301($1;SLCT_Table_ptr)

  // Local Variables:      None Used

  // Returns: 
C_POINTER:C301($0)

  // Created by Wayne Stewart (16/04/2004)
  //     waynestewart@mac.com
  // ----------------------------------------------------

If (Count parameters:C259=1)
	SLCT_Table_ptr:=$1
End if 

$0:=SLCT_Table_ptr