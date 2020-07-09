//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_hideControls (Hide) --> Boolean

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
	: (Slct.hideControls=Null:C1517)
		$0:=False:C215
		
	: (Count parameters:C259=1)
		Slct.hideControls:=$1
		$0:=Slct.hideControls
		
	Else 
		$0:=Slct.hideControls
		
End case 
