//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_HeaderPointerFromIndex
  // Global and IP variables accessed:     None Used

  // Method Type:    Private

  // Parameters:
C_LONGINT:C283($1;$Index_i)

  // Local Variables:     None Used

  // Returns:
C_POINTER:C301($0)

  // Created by Wayne Stewart (Apr 19, 2006)
  //     waynestewart@mac.com
  // ----------------------------------------------------

If (Count parameters:C259=0)
	$Index_i:=0
Else 
	$Index_i:=$1
End if 

Case of 
	: ($Index_i=0)
		$0:=->SLCT_Header_22
		
	Else 
		$0:=Get pointer:C304("SLCT_Header_"+String:C10($Index_i))
		
End case 


