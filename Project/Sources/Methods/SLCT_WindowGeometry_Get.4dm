//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_WindowGeometry_Get -> Object

  // Retrieves the SLCT Window Geometry

  // Returns
C_OBJECT:C1216($0)

  // Created by Wayne Stewart (2020-07-06T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

SLCT_Init 

$0:=slctConfig

slctConfig:=Null:C1517