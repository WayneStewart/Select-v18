//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: Shell_CenterFormWindow (->table; form name{; type{; title{; position}}})

  // Similar to 4D's Open form window function, but with a few more options.
  //   We can open the new window centered over the frontmost window of the
  //   current process.
  // If you pass a window type of Regular window, but the window's properties
  //   are set for fixed width and fixed height, the window type will be changed
  //   to Plain fixed sized window for a better looking interface on Macintosh.

  // Protected

  // Parameters:
  //   $1 : Pointer : Pointer to the form's table
  //   $2 : Text : The name of the form
  //   $3 : Longint : The window type (optional)
  //   $4 : Text : The window title (optional)
  //   $5 : Longint : One of the Shell position constants: (optional)
  //           Shell_WindowCenterOnScreen = Centered on main screen
  //           Shell_WindowCenterOverFrontWind = Centered over frontmost window
  //           Shell_WindowOffsetOverFrontWind = Offset over frontmost window

  // Returns:
  //   $0 : Longint : The new window's reference number

  // Created by 4D, Inc. on May 2, 2003
  // ----------------------------------------------------

C_POINTER:C301($1;$tablePtr)
C_TEXT:C284($2;$4;$formName;$title)
C_LONGINT:C283($0;$3;$5;$windowRef;$width;$height;$type;$numPages;$position)
C_BOOLEAN:C305($fixedWidth;$fixedHeight)

$tablePtr:=$1
$formName:=$2

If (Count parameters:C259>=3)  // A window type was specified.
	$type:=$3
Else 
	$type:=Movable dialog box:K34:7
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

$windowRef:=0  // The default return value.

If (Is nil pointer:C315($tablePtr))
	FORM GET PROPERTIES:C674($formName;$width;$height;$numPages;$fixedWidth;$fixedHeight)
Else 
	FORM GET PROPERTIES:C674($tablePtr->;$formName;$width;$height;$numPages;$fixedWidth;$fixedHeight)
End if 

If (($width=0) & ($height=0))
	ALERT:C41("The '"+$formName+"' form does not exist.")
	TRACE:C157
	
Else 
	If (($fixedWidth) & ($fixedHeight) & ($type=Regular window:K27:1))
		$type:=Plain fixed size window:K34:6
	End if 
	$windowRef:=Fnd_Slct_CenterWindow ($width;$height;$type;$title;$position)
End if 

$0:=$windowRef