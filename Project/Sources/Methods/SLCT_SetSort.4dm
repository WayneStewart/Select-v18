//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_SetSort

  // Method Type:    Protected

  // Parameters:  
C_LONGINT:C283(${1})  //  Column Numbers

  // Local Variables:    
C_LONGINT:C283($NumPars_i;$LoopCounter_i)

  // Returns:    Nothing

  // Created by Wayne Stewart (Jan 4, 2005)
  //     waynestewart@mac.com
  // ----------------------------------------------------

$NumPars_i:=Count parameters:C259
If ($NumPars_i>4)  //  Maximum search depth
	$NumPars_i:=4
End if 
ARRAY LONGINT:C221(SLCT_SortArray_ai;$NumPars_i)

For ($LoopCounter_i;1;$NumPars_i)
	SLCT_SortArray_ai{$LoopCounter_i}:=${$LoopCounter_i}
End for 