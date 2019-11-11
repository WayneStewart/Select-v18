//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_HideControls (Hide) --> Boolean

  // Pass True to hide the developer controls

  // Access: Shared

  // Parameters: 
  //   $1 : Boolean : True = hide; False = Show

  // Returns: 
  //   $0 : Boolean : The current status

  // Created by Wayne Stewart (2019-07-26T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

SLCT_Init 

C_BOOLEAN:C305($1;$0)

Case of 
	: (Count parameters:C259=1)
		Slct.HideControls:=$1
		$0:=Slct.HideControls
		
	: (Slct.HideControls=Null:C1517)
		$0:=False:C215
		
	Else 
		$0:=Slct.HideControls
		
End case 
