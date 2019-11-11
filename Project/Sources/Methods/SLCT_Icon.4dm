//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Icon (Icon Name)--> Text

  // Pass here the name of an icon to be displayed on the Select dialog
  // You can use any of the following contants:
  // SLCT Note Icon, SLCT Question Icon,
  // SLCT Stop Icon, or SLCT Warn Icon
  // Alternatively you can pass a file path to a picture file
  // or the name of a picture in the picture library

  // Access: Shared

  // Parameters: 
  //   $1 : Text : An Icon Name (optional)

  // Returns: 
  //   $0 : Text : The current icon

  // Created by Wayne Stewart (2019-07-25T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_TEXT:C284($1;$0)

SLCT_Init 

If (Count parameters:C259=1)
	SLCT.IconName:=$1
End if 

If (Length:C16(SLCT.IconName)=0)  //  In case this is blank
	SLCT.IconName:=SLCT Question Icon
End if 

$0:=SLCT.IconName