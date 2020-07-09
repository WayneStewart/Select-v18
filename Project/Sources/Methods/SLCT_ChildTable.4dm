//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_ChildTable ({Pointer}) --> Pointer

  // Allows you set and retrieve the child table via pointer

  // Access: Shared

  // Parameters: 
  //   $1 : Pointer : To set the table (optional)

  // Returns: 
  //   $0 : Pointer : The Current table

  // Created by Wayne Stewart (2017-05-28T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------


If (False:C215)
	C_POINTER:C301(SLCT_ChildTable ;$1;$0)
End if 

C_POINTER:C301($1;$0)


SLCT_Init 

If (Count parameters:C259=1)
	Slct.childPointer:=$1
End if 

$0:=Slct.childPointer

