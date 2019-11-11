//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: Shell_CenterWindow (width; height{; type{; title{; over frontmost}}})

  // Centers a new window over the frontmost window.  If there is no frontmost
  //   window, it centers the new window on the main monitor.

  // Protected

  // Parameters: 
  //   $1 : Longint : Width for the new window
  //   $2 : Longint : Height of the new window
  //   $3 : Longint : The window type (optional)
  //   $4 : Text : The window title (optional)
  //   $5 : Longint : One of the Shell position constants: (optional)
  //           Shell_WindowCenterOnScreen = Centered on main screen
  //           Shell_WindowCenterOverFrontWind = Centered over frontmost window
  //           Shell_WindowOffsetOverFrontWind = Offset over frontmost window

  // Returns: Longint : The new window's reference number

  // Created by 4D, Inc. on May 2, 2003
  // ----------------------------------------------------

C_LONGINT:C283($0;$1;$2;$3;$5;$width;$height;$left;$top;$right;$bottom;$type;$position)
C_LONGINT:C283($backLeft;$backTop;$backRight;$backBottom)
C_TEXT:C284($4;$title)

$width:=$1
$height:=$2

If (Count parameters:C259>=3)  // A window type was specified.
	$type:=$3
Else 
	$type:=Modal dialog box:K34:2
End if 

If (Count parameters:C259>=4)  // Make sure we have a window title.
	$title:=$4
Else 
	$title:=""
End if 

If (Count parameters:C259>=5)  // Where to put the window.
	$position:=$5
Else 
	$position:=<>Shell_kCenterOnScreen_i
End if 

GET WINDOW RECT:C443($backLeft;$backTop;$backRight;$backBottom;Frontmost window:C447)

  // If the window we got is 4D's hidden custom menus window, or no
  //   window, just treat it like the center on the screen option.
If (($position=<>Shell_kCenterOnScreen_i) | (($backRight-$backLeft)<3))
	$backLeft:=0
	$backTop:=0
	$backRight:=Screen width:C187
	$backBottom:=Screen height:C188*0.6667  // Just looks better for most purposes.
End if 

If ($position=<>Shell_kOffsetOverFrontWindow_i)
	$left:=$backLeft+20
	$top:=$backTop+20
Else 
	$left:=(($backRight-$backLeft-$width)\2)+$backLeft
	$top:=(($backBottom-$backTop-$height)\2)+$backTop
End if 

If ($top<=(Menu bar height:C440+24))
	$top:=Menu bar height:C440+24
End if 

If ($left<=2)
	$left:=2
End if 

$right:=$left+$width
$bottom:=$top+$height

$0:=Open window:C153($left;$top;$right;$bottom;$type;$title;"")
