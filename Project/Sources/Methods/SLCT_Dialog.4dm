//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Dialog
  // Global and IP variables accessed:     None Used
C_LONGINT:C283($0)

C_LONGINT:C283($backBottom_i;$backLeft_i;$backRight_i;$backTop_i;$height_i;$SelectedRow_i;$width_i;$WindowID_i;$WindowPosition_i;$WindowType_i;$Wnd_Bottom_i;$Wnd_Left_i;$Wnd_Right_i;$Wnd_Top_i)

If (False:C215)
	C_LONGINT:C283(SLCT_Dialog ;$0)
End if 

  // Method Type:    Private

  // Parameters:    None Used

  // Local Variables:

  // Returns:    Nothing

  // Created by Wayne Stewart (Jan 4, 2005)
  //     waynestewart@mac.com
  // ----------------------------------------------------

SLCT_Init 

C_OBJECT:C1216($Form)

$0:=No current record:K29:2


If (Slct.windowWidth=Null:C1517)
	Slct.windowWidth:=750
	Slct.windowHeight:=500
Else 
	If (Slct.windowWidth=0)
		Slct.windowWidth:=750
		Slct.windowHeight:=500
	End if 
End if 

$width_i:=Slct.windowWidth
$height_i:=Slct.windowHeight

If (SLCT_RunningInFoundation )
	EXECUTE METHOD:C1007("Fnd_Wnd_Type";$WindowType_i)
	If ($WindowType_i=-1)
		If (Is Windows:C1573)
			EXECUTE METHOD:C1007("Fnd_Wnd_Type";$WindowType_i;Movable dialog box:K34:7)
		Else 
			EXECUTE METHOD:C1007("Fnd_Wnd_Type";$WindowType_i;Resizable sheet window:K34:16)
		End if 
	End if 
	
	EXECUTE METHOD:C1007("Fnd_Wnd_Position";$WindowPosition_i)
	If ($WindowPosition_i=-1)  //  Default setting, we can override
		EXECUTE METHOD:C1007("Fnd_Wnd_Type";$WindowType_i)
		If ($WindowType_i#Resizable sheet window:K34:16)  //  Don't change from resizeable window
			EXECUTE METHOD:C1007("Fnd_Wnd_Position";$WindowPosition_i;3)  // Fnd_Wnd_MacOSXSheet)
		End if 
	End if 
	
	EXECUTE METHOD:C1007("Fnd_Wnd_OpenWindow";$WindowID_i;Slct.windowWidth;Slct.windowHeight)
	
Else 
	
	GET WINDOW RECT:C443($backLeft_i;$backTop_i;$backRight_i;$backBottom_i)
	
	
	$Wnd_Left_i:=(($backRight_i-$backLeft_i-$width_i)\2)+$backLeft_i
	$Wnd_Top_i:=(($backBottom_i-$backTop_i-$height_i)\3)+$backTop_i
	
	If (Is Windows:C1573)
		$WindowType_i:=Modal form dialog box:K39:7
	Else 
		$WindowType_i:=Sheet form window:K39:12
		  //$WindowType_i:=Plain form window
	End if 
	
	If (($Wnd_Right_i=0) & ($Wnd_Bottom_i=0))
		$Wnd_Right_i:=$Wnd_Left_i+$width_i
		$Wnd_Bottom_i:=$Wnd_Top_i+$height_i
	End if 
	
	$WindowID_i:=Open window:C153($Wnd_Left_i;$Wnd_Top_i;$Wnd_Right_i;$Wnd_Bottom_i;$WindowType_i)
	
End if 

$Form:=New object:C1471(\
"NewRecord";False:C215;\
"SearchDialog";False:C215)

DIALOG:C40("Fnd_slct")

Case of 
	: (OK=1)
		$SelectedRow_i:=Find in array:C230(SLCT_ListBox_ab;True:C214)
		GOTO RECORD:C242(SLCT_Table_ptr->;SLCT_Index_ai{$SelectedRow_i})
		$0:=Record number:C243(SLCT_Table_ptr->)
		
	: ($Form.NewRecord)
		$0:=New record:K29:1
		
	Else 
		$0:=No current record:K29:2
		
End case 

C_PICTURE:C286($Blank_pic)
Slct.IconPicture:=$Blank_pic

CLOSE WINDOW:C154($WindowID_i)