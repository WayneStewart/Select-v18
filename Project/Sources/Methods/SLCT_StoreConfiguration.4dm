//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_SaveConfiguration



  // Examines the current listbiox state and stores that

  // Access: Private

  // Created by Wayne Stewart (2020-07-01T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_COLLECTION:C1488($Columns_c)
C_LONGINT:C283($bottom_i;$CurrentColumn_i;$Left_i;$NumberofColumns_i;$right_i;$top_i;$TotalWidth_i)
C_POINTER:C301($header_ptr)
C_TEXT:C284($headerName_t)

C_OBJECT:C1216($Column_o;$Config_o)

ARRAY BOOLEAN:C223($visibleColumns_ab;0)
ARRAY POINTER:C280($columnVars_aptr;0)
ARRAY POINTER:C280($headerVars_aptr;0)
ARRAY POINTER:C280($styles_aptr;0)
ARRAY TEXT:C222($columnNames_at;0)
ARRAY TEXT:C222($headerNames_at;0)


If (False:C215)
	SLCT_StoreConfiguration 
End if 

$Config_o:=New object:C1471

$Config_o.tableNumber:=Table:C252(Slct.tablePointer)

C_COLLECTION:C1488($Columns_c)

LISTBOX GET ARRAYS:C832(SLCT_ListBox_ab;$columnNames_at;$headerNames_at;$columnVars_aptr;$headerVars_aptr;$visibleColumns_ab;$styles_aptr)

$NumberofColumns_i:=Size of array:C274($columnNames_at)

$Columns_c:=New collection:C1472

For ($CurrentColumn_i;1;$NumberofColumns_i)  //  Start at 2 => ignore first column
	$Column_o:=New object:C1471
	$Column_o.columnNumber:=$CurrentColumn_i
	$Column_o.columnName:=$columnNames_at{$CurrentColumn_i}
	$Column_o.columnWidth:=LISTBOX Get column width:C834(*;$Column_o.columnName)
	$headerName_t:=$headerNames_at{$CurrentColumn_i}
	$Column_o.headerTitle:=OBJECT Get title:C1068(*;$headerName_t)
	
	$Columns_c.push($Column_o)
	
	
	
	
End for 

$Config_o.columns:=$Columns_c

GET WINDOW RECT:C443($Left_i;$top_i;$right_i;$bottom_i)

$Config_o.windowLeft:=$Left_i
$Config_o.windowTop:=$top_i
$Config_o.windowRight:=$right_i
$Config_o.windowBottom:=$bottom_i

slctConfig:=$Config_o

  //SLCT_Widths (176;214;87;106;93)  //  TotalWidth: 676
  //SLCT_WindowDimensions (716;450)  //  via columns
  //SLCT_WindowDimensions (732;450)

  // Columns
  //   Column Order within listbox
  //   Column Widths
  //   Sort order of selection

  //  Window
  //    Dimensions
  //    Position on screen