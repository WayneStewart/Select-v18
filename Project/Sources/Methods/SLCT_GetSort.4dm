//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_GetSort
  // Global and IP variables accessed:     None Used

  // Method Type:    Private

  // Parameters:   
C_LONGINT:C283($1)  //  Which Column
C_LONGINT:C283($0)  //  The field we are sorting on

  // Local Variables:     None Used

  // Returns:    Nothing

  // Created by Wayne Stewart (Jan 4, 2005)
  //     waynestewart@mac.com
  // ----------------------------------------------------

If ($1>Size of array:C274(SLCT_SortArray_ai))
	$0:=0
Else 
	$0:=SLCT_SortArray_ai{$1}
End if 
