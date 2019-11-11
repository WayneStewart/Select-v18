//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_HorizontalScrollBar {(New Value)} -> Boolean

  // Pass boolean to set horizontal scrollbar visibility
  //  True: horizontal scrollbar visibile
  //  False: horizontal scrollbar invisibile

  // Access: Shared

  // Parameters: 
  //   $1 : Boolean : Turn Horizontal scrollbar on (optional)

  // Returns: 
  //   $0 : Boolean : Current setting

  // Created by Wayne Stewart (2019-07-25T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_BOOLEAN:C305($1;$0)

SLCT_Init 

If (Count parameters:C259=1)
	Slct.HorizontalScrollBar:=$1
End if 

$0:=Slct.HorizontalScrollBar

