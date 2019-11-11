//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_RowHeight (Height in pixels) --> Longint

  // Pass the desired row height in pixels

  // Access: Shared

  // Parameters: 
  //   $1 : Longint : row height

  // Returns: 
  //   $0 : Longint : row height

  // Created by Wayne Stewart (2019-07-26T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_LONGINT:C283($1;$0)
  // ----------------------------------------------------

SLCT_Init 

Case of 
	: (Count parameters:C259=1)
		Slct.RowHeight:=$1
		$0:=Slct.RowHeight
		
	: (Slct.RowHeight=Null:C1517)
		$0:=Storage:C1525.font.listRowHeight
		
	Else 
		$0:=Slct.RowHeight
		
End case 
