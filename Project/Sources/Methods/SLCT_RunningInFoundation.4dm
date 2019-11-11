//%attributes = {"invisible":true,"shared":true}

  // ----------------------------------------------------
  // Project Method: SLCT_RunningInFoundation


If (False:C215)
	C_BOOLEAN:C305(SLCT_RunningInFoundation ;$1;$0)
End if 

  // Method Type:    Protected

  // Parameters:
C_BOOLEAN:C305($1)

  // Local Variables:     None Used

  // Returns:
C_BOOLEAN:C305($0)

  // Created by Wayne Stewart Feb 13, 2012
  //     waynestewart@mac.com
  // ----------------------------------------------------

SLCT_Init 

If (Count parameters:C259=1)
	
	Use (Storage:C1525.appl)
		Storage:C1525.appl.foundationAvailable:=$1
	End use 
End if 

$0:=Storage:C1525.appl.foundationAvailable  //<>SLCT_Fnd_Available_b