//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_CopyColumnSizes
  //  Branch 2004

  // Global and IP variables accessed:     None Used

  // Method Type:    Private

  // Parameters:    None Used

  // Local Variables:     None Used
C_LONGINT:C283($CurrentColumn_i;$NumberofColumns_i;$TableNumber_i;$TotalWidth_i;$ColumnWidth_i)
C_LONGINT:C283($left_i;$top_i;$right_i;$bottom_i)
C_TEXT:C284($Command_t)
C_LONGINT:C283($Left_i;$top_i;$right_i;$bottom_i;$Width_i;$Height_i;$WidthViaColumns_i)

  // Returns:    Nothing

  // Created by Wayne Stewart (May 13, 2005)
  //     waynestewart@mac.com
  // ----------------------------------------------------


$TableNumber_i:=Table:C252(Slct.tablePointer)
$Command_t:="SLCT_Widths ("
$NumberofColumns_i:=Size of array:C274(SLCT_Fields_aptr)
$TotalWidth_i:=0

For ($CurrentColumn_i;2;$NumberofColumns_i)  //  Start at 2 => ignore first column
	$ColumnWidth_i:=LISTBOX Get column width:C834(*;SLCT_ColumnNames_at{$CurrentColumn_i})
	$TotalWidth_i:=$TotalWidth_i+$ColumnWidth_i
	$Command_t:=$Command_t+String:C10($ColumnWidth_i)
	$Command_t:=$Command_t+";"
	
End for 

$Command_t:=Substring:C12($Command_t;1;Length:C16($Command_t)-1)
$Command_t:=$Command_t+")"
$Command_t:=$Command_t+"`  TotalWidth: "+String:C10($TotalWidth_i)

$WidthViaColumns_i:=$TotalWidth_i+40

GET WINDOW RECT:C443($Left_i;$top_i;$right_i;$bottom_i)
$Width_i:=$right_i-$Left_i
$Height_i:=$bottom_i-$top_i

$Command_t:=$Command_t+Char:C90(13)+"SLCT_WindowDimensions ("
$Command_t:=$Command_t+String:C10($WidthViaColumns_i)
$Command_t:=$Command_t+";"
$Command_t:=$Command_t+String:C10($Height_i)
$Command_t:=$Command_t+") //  via columns"

$Command_t:=$Command_t+Char:C90(13)+"SLCT_WindowDimensions ("
$Command_t:=$Command_t+String:C10($Width_i)
$Command_t:=$Command_t+";"
$Command_t:=$Command_t+String:C10($Height_i)
$Command_t:=$Command_t+")"



SET TEXT TO PASTEBOARD:C523($Command_t)

  // Example output
  // SLCT_Widths (120;120;482)  `  TotalWidth: 722
  // SLCT_WindowDimensions (777;516)