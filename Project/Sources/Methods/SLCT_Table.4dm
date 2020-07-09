//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Table {(->SLCT Table)}--> Pointer

  // Set the table pointer

  // Access: Private

  // Parameters:
  //   $1 : Pointer : The SLCT Table Pointer

  // Returns:
  //   $0 : Pointer : The SLCT Table Pointer

  // Created by Wayne Stewart (2020-06-30T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_POINTER:C301($0;$1)

If (False:C215)
	C_POINTER:C301(SLCT_Table ;$0;$1)
End if 

If (Count parameters:C259=1)
	Slct.tablePointer:=$1
End if 

$0:=Slct.tablePointer