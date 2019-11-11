//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_WindowDimensions (Width; Height)

  // Allows you to set the dimensions of the Select window

  // Access: Shared

  // Parameters: 
  //   $1 : Longint : Width
  //   $2 : Longint : Height

  // Created by Wayne Stewart (2019-07-26T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_LONGINT:C283($1;$2)

  // ------------------------------------------------

SLCT_Init 

Slct.windowWidth:=$1  //  500
Slct.windowHeight:=$2  //  350