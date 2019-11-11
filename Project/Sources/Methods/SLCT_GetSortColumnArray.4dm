//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_GetSortColumnArray (->list box) --> Pointer

  // Returns the column number of the sorted column.
  // May return a Nil pointer if there is no sort column.

  // Access Type: Private

  // Parameters: 
  //   $1 : Pointer : The list box

  // Returns: 
  //   $0 : Pointer : The sorted array 

  // Created by Dave Batton on Mar 19, 2006
  // ----------------------------------------------------


C_POINTER:C301($0;$1;$listBox_ptr;$array_ptr;$nil_ptr)
C_LONGINT:C283($column_i)

$listBox_ptr:=$1

ARRAY TEXT:C222($columnNames_at;0)
ARRAY TEXT:C222($headerNames_at;0)
ARRAY POINTER:C280($columnVars_aptr;0)
ARRAY POINTER:C280($headerVars_aptr;0)
ARRAY BOOLEAN:C223($visibleColumns_ai;0)
ARRAY POINTER:C280($styles_aptr;0)

LISTBOX GET ARRAYS:C832($listBox_ptr->;$columnNames_at;$headerNames_at;$columnVars_aptr;$headerVars_aptr;$visibleColumns_ai;$styles_aptr)



For ($column_i;1;Size of array:C274($headerVars_aptr))
	If ($headerVars_aptr{$column_i}->#0)
		$array_ptr:=$columnVars_aptr{$column_i}
		Form:C1466.SortedHeader:=$headerNames_at{$column_i}
		Form:C1466.SortDirection:=$headerVars_aptr{$column_i}->
	End if 
End for 

$0:=$array_ptr