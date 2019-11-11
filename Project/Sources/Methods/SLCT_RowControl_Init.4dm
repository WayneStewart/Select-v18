//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_RowControl ($NumberOfRows_i {;State}))

  // Initialises the row control array to make all rows visible
  // Pass lk row is hidden as the 2nd parameter to make all rows invisible

  // Access: Shared

  // Parameters:
  //   $1 : Longint : The size of the array
  //   $2 : Longint : The State: default is 0: row visible (optional)

  // Created by Wayne Stewart (2018-09-15T14:30:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_LONGINT:C283($1)
C_LONGINT:C283($2)

C_LONGINT:C283($CurrRow_i;$NumberOfRows_i;$State_i)

If (False:C215)
	C_LONGINT:C283(SLCT_RowControl_Init ;$1;$2)
End if 

$NumberOfRows_i:=$1
If (Count parameters:C259=2)
	$State_i:=$2
Else 
	$State_i:=0  //  Visible
End if 

ARRAY LONGINT:C221(SLCT_RowControl_ai;$NumberOfRows_i)

For ($CurrRow_i;1;$NumberOfRows_i)
	SLCT_RowControl_ai{$CurrRow_i}:=$State_i
End for 