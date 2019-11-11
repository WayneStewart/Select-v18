//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method:SLCT_SetListBoxFonts (->list box)

  // There's a bug in 4D Insider 2004.x that prevents list boxes from
  //   using their style sheets in a component. So we work around it
  //   with this method.
  // The listbox header variables must be declared for this to work
  //   in a compiled database. Otherwise you'll get runtime errors. I
  //   tried to find a way around this but wasn't able to.

  // Access Type: Private

  // Parameters: 
  //   $1 : Pointer : The list box to fix

  // Returns: Nothing

  // Created by Dave Batton on Jul 10, 2005
  // ----------------------------------------------------

SLCT_Init 

C_POINTER:C301($1;$listBox_ptr)
C_LONGINT:C283($listFontSize_i;$headerFontSize_i;$column_i)
C_TEXT:C284($listfontName_t)

$listBox_ptr:=$1

$listfontName_t:=Storage:C1525.font.largeName
$listFontSize_i:=Storage:C1525.font.listItem
$headerFontSize_i:=Storage:C1525.font.listHeader

  // Then the message list font.
ARRAY TEXT:C222($columnNames_at;0)
ARRAY TEXT:C222($headerNames_at;0)
ARRAY POINTER:C280($columnVariables_aptr;0)
ARRAY POINTER:C280($headerVariables_aptr;0)
ARRAY BOOLEAN:C223($columnVisible_ab;0)
ARRAY POINTER:C280($columnStyles_aptr;0)
LISTBOX GET ARRAYS:C832($listBox_ptr->;$columnNames_at;$headerNames_at;$columnVariables_aptr;$headerVariables_aptr;$columnVisible_ab;$columnStyles_aptr)

For ($column_i;1;Size of array:C274($columnVariables_aptr))
	OBJECT SET FONT:C164($columnVariables_aptr{$column_i}->;$listfontName_t)
	OBJECT SET FONT SIZE:C165($columnVariables_aptr{$column_i}->;$listFontSize_i)
	
	OBJECT SET FONT:C164($headerVariables_aptr{$column_i}->;$listfontName_t)
	OBJECT SET FONT SIZE:C165($headerVariables_aptr{$column_i}->;$headerFontSize_i)
End for 
