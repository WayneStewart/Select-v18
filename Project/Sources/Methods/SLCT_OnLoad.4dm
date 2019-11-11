//%attributes = {"invisible":true}
  // ----------------------------------------------------

  //Project Method: SLCT_OnLoad

  // Onload method for the SLCT dialog

  //Access: Private

  //Created by Wayne Stewart(2019-11-05T13:00:00Z)
  //wayne@4dsupport.guru
  // ----------------------------------------------------


C_LONGINT:C283($bottom_i;$ColumnNumber_i;$ColumnWidth_i;$CurrentRecord_i;$CurrentWidth_i;$left_i;$ListBoxWidth_i;$NumberOfColumns_i;$NumberOfRecords_i;$right_i)
C_LONGINT:C283($TableNumber_i;$top_i;$WindowWidth_i)
C_POINTER:C301($ColumnVariable_ptr;$HeaderVariable_ptr;$Table_ptr)
C_TEXT:C284($ColumnHeaderText_t;$ColumnName_t;$ColumWidths_t;$HeaderName_t)


  //  Make certain the component is initialised
SLCT_Init 


  // ----------------------------------------------------
  //  Assign the local variables
  // ----------------------------------------------------
$Table_ptr:=SLCT_Table_ptr
$TableNumber_i:=Table:C252($Table_ptr)

  // ----------------------------------------------------
  //  Write the labels
  // ----------------------------------------------------
If (Length:C16(SLCT_Text1_t)=0)
	SLCT_SetFormText 
End if 

  // ----------------------------------------------------
  //  Inititialise the type ahead string to blank
  // ----------------------------------------------------
Form:C1466.TypeAheadString:=""

  // ----------------------------------------------------
  //  Localise the button text
  // ----------------------------------------------------

  // Modified by: Wayne Stewart (2/12/08)
  //  No longer used => xliff commands used instead

  //Fnd_Gen_ButtonText (->SLCT_NewButton_i;Fnd_Gen_GetString ("Fnd_Slct";"NewBttn");Align left ;->SLCT_FindButton_i)
  //Fnd_Gen_ButtonText (->SLCT_FindButton_i;Fnd_Gen_GetString ("Fnd_Slct";"FindBttn");Align left )
  //Fnd_Gen_ButtonText (->SLCT_ChooseButton_i;Fnd_Gen_GetString ("Fnd_Slct";"ChooseBttn");Align right ;->SLCT_CancelButton_i)
  //Fnd_Gen_ButtonText (->SLCT_CancelButton_i;Fnd_Gen_GetString ("Fnd_Slct";"CancelBttn");Align right )
  //Fnd_Gen_ButtonText (->SLCT_Size_CopyButton_i;Fnd_Gen_GetString ("Fnd_Slct";"CopyBttn");Align left )

  // ----------------------------------------------------
  //  Show or Hide the buttons
  // ----------------------------------------------------
OBJECT SET VISIBLE:C603(*;"SLCT_NewButton_i";SLCT_Button ("New"))
OBJECT SET VISIBLE:C603(SLCT_FindButton_i;SLCT_Button ("Search"))

If ((Not:C34(SLCT_Button ("New"))) & (SLCT_Button ("Search")))
	
	OBJECT GET COORDINATES:C663(SLCT_FindButton_i;$left_i;$top_i;$right_i;$bottom_i)
	$Right_i:=$right_i-$left_i  //  Actually this is now the width
	$left_i:=20  //  New button position
	$top_i:=310
	$bottom_i:=330
	$right_i:=$left_i+$Right_i
	OBJECT MOVE:C664(SLCT_FindButton_i;$left_i;$top_i;$right_i;$bottom_i;*)
End if 

If (Macintosh option down:C545) | (Is compiled mode:C492(*)) | (SLCT_HideControls )
	OBJECT SET VISIBLE:C603(SLCT_Size_CopyButton_i;False:C215)  //  Make them invisible
Else 
	OBJECT SET VISIBLE:C603(SLCT_Size_CopyButton_i;True:C214)
End if 

SLCT_DisplayIcon 

  // ----------------------------------------------------
  // ### Wayne Stewart Apr 20, 2006 - new method
  //  Remove and reinsert the arrays
  // ----------------------------------------------------

LISTBOX DELETE COLUMN:C830(SLCT_ListBox_ab;1;LISTBOX Get number of columns:C831(SLCT_ListBox_ab))
$NumberOfColumns_i:=Size of array:C274(SLCT_Arrays_aptr)
For ($ColumnNumber_i;1;$NumberOfColumns_i)
	$ColumnVariable_ptr:=SLCT_Arrays_aptr{$ColumnNumber_i}
	$ColumnName_t:=SLCT_ColumnNames_at{$ColumnNumber_i}
	$HeaderVariable_ptr:=SLCT_ColHeaders_aptr{$ColumnNumber_i}
	$HeaderName_t:=SLCT_HeaderNames_at{$ColumnNumber_i}
	LISTBOX INSERT COLUMN:C829(SLCT_ListBox_ab;$ColumnNumber_i;$ColumnName_t;$ColumnVariable_ptr->;$HeaderName_t;$HeaderVariable_ptr->)
	
	If ($ColumnNumber_i=1)
		OBJECT SET VISIBLE:C603(*;$ColumnName_t;False:C215)
		
	Else 
		If (Length:C16(SLCT_Format_at{$ColumnNumber_i})>0)
			OBJECT SET FORMAT:C236(*;$ColumnName_t;SLCT_Format_at{$ColumnNumber_i})
		End if 
		
		  // Modified by: Wayne Stewart (2/12/08)
		  //  Alteration for v11 & possible no Foundation
		
		Case of 
			: (Length:C16(SLCT_HeaderTitles_at{$ColumnNumber_i})>0)
				$ColumnHeaderText_t:=SLCT_HeaderTitles_at{$ColumnNumber_i}
				
			: (SLCT_RunningInFoundation )
				EXECUTE METHOD:C1007("Fnd_VS_FieldName";$ColumnHeaderText_t;SLCT_Fields_aptr{$ColumnNumber_i})
				
			Else 
				$ColumnHeaderText_t:=Field name:C257(SLCT_Fields_aptr{$ColumnNumber_i})
				
		End case 
		
		OBJECT SET TITLE:C194(*;$HeaderName_t;$ColumnHeaderText_t)
		OBJECT SET VISIBLE:C603(*;$ColumnName_t;True:C214)
	End if 
	
End for 

  // ----------------------------------------------------
  // Once columns have been inserted resize them
  // ----------------------------------------------------
$ColumWidths_t:=SLCT_Widths 
$CurrentWidth_i:=0

For ($ColumnNumber_i;1;$NumberOfColumns_i)
	$ColumnName_t:=SLCT_ColumnNames_at{$ColumnNumber_i}
	
	Case of 
		: ($ColumnNumber_i=1)
			  //  No need to set width
			
		: ($ColumnNumber_i=$NumberOfColumns_i)
			  // Get window dimensions
			GET WINDOW RECT:C443($left_i;$top_i;$right_i;$bottom_i)
			$WindowWidth_i:=$right_i-$left_i
			$ListBoxWidth_i:=$WindowWidth_i-40
			  //  Resize the last column
			
			  //OBJECT GET COORDINATES(*;"SLCT_ListBox_ab";$left_i;$top_i;$right_i;$bottom_i)
			  //$ColumnWidth_i:=$right_i-($left_i+15)  // The listbox width
			$ColumnWidth_i:=$ListBoxWidth_i-$CurrentWidth_i
			If ($ColumnWidth_i>0)
				LISTBOX SET COLUMN WIDTH:C833(*;$ColumnName_t;$ColumnWidth_i)
			End if 
			
		Else 
			$ColumnWidth_i:=Num:C11(Substring:C12($ColumWidths_t;(($ColumnNumber_i-2)*4)+1;4))
			$CurrentWidth_i:=$CurrentWidth_i+$ColumnWidth_i
			LISTBOX SET COLUMN WIDTH:C833(*;$ColumnName_t;$ColumnWidth_i)
			
	End case 
	
End for 

  // ----------------------------------------------------
  //  Sort and identify sorted column
  // ----------------------------------------------------
SLCT_SortListBox 

  // ----------------------------------------------------
  //  Sort and identify sorted column
  // ----------------------------------------------------
OBJECT SET SCROLLBAR:C843(SLCT_ListBox_ab;SLCT_HorizontalScrollBar ;True:C214)

  // ----------------------------------------------------
  //  Set the fonts
  // ----------------------------------------------------
OBJECT SET FONT:C164(*;"@";Storage:C1525.font.largeName)
OBJECT SET FONT STYLE:C166(*;"@";Plain:K14:1)
OBJECT SET FONT SIZE:C165(*;"@";Storage:C1525.font.largeSize)

OBJECT SET FONT:C164(*;"SLCT_Text2_t";Storage:C1525.font.smallName)
OBJECT SET FONT STYLE:C166(*;"SLCT_Text2_t";Plain:K14:1)
OBJECT SET FONT SIZE:C165(*;"SLCT_Text2_t";Storage:C1525.font.smallSize)

SLCT_SetListBoxFonts (->SLCT_ListBox_ab)

OBJECT SET RGB COLORS:C628(SLCT_ListBox_ab;0x0000;0x00FFFFFF;0x00EDF3FE)  // iTunes Blue = 0x00EDF3FE

  // ----------------------------------------------------
  //  Set the row height
  // ----------------------------------------------------
LISTBOX SET ROWS HEIGHT:C835(SLCT_ListBox_ab;SLCT_RowHeight )

$NumberOfRecords_i:=Size of array:C274(SLCT_Index_ai)

If ($NumberOfRecords_i=0)
	POST KEY:C465(Character code:C91("f");Command key mask:K16:1)
Else 
	ARRAY BOOLEAN:C223(SLCT_ListBox_ab;$NumberOfRecords_i)
	SLCT_ListBox_ab{1}:=True:C214
	
	For ($CurrentRecord_i;2;$NumberOfRecords_i)
		SLCT_ListBox_ab{$CurrentRecord_i}:=False:C215
	End for 
End if 

SLCT_RowControl_Init (Size of array:C274(SLCT_ListBox_ab))