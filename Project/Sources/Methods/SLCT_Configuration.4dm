//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Configuration {(Configuration Object)} --> Object

  // Allows the storing and retrieval of configuration data

  // Access: Shared

  // Parameters:
  //   $1 : Object : Config Data

  // Returns:
  //   $0 : Object : Config Data

  // Created by Wayne Stewart (2020-06-30T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_OBJECT:C1216($0;$1)

If (False:C215)
	C_OBJECT:C1216(SLCT_Configuration ;$0;$1)
End if 

SLCT_Init 

If (Count parameters:C259=1)
	slctConfig:=$1
End if 

$0:=slctConfig  // Always return