//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Wayne Stewart
  // Date and time: 03/12/08, 13:53:59
  // ----------------------------------------------------
  // Method: Fnd_Slct_Message2
  // Description
  // 
  //
  // Parameters
C_LONGINT:C283($1)

C_LONGINT:C283($WindowID_i)
  // ----------------------------------------------------

If (Count parameters:C259=0)
	<>Fnd_Slct_MssgWindow_i:=New process:C317(Current method name:C684;64*1024;"$"+Current method name:C684;1)
Else 
	$WindowID_i:=Open form window:C675("Fnd_Slct_Message";Palette form window:K39:9;Horizontally centered:K39:1;Vertically centered:K39:4;*)
	DIALOG:C40("Fnd_Slct_Message";*)
	CLOSE WINDOW:C154
End if 
