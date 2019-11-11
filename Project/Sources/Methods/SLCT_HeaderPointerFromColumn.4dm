//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_HeaderPointerFromColum
  // Global and IP variables accessed:     None Used

  // Method Type:    Private

  // Parameters:
C_LONGINT:C283($1;$ColumnNumber_i)

  // Local Variables:     None Used

  // Returns:
C_POINTER:C301($0)

  // Created by Wayne Stewart (Apr 20, 2006)
  //     waynestewart@mac.com
  // ----------------------------------------------------


$ColumnNumber_i:=$1

ARRAY TEXT:C222($arrColNames;0)  //Array string  Column object names
ARRAY TEXT:C222($arrHeaderNames;0)  //Array string  Header object names
ARRAY POINTER:C280($arrColVars;0)  //Array pointer  Pointers to column variables
ARRAY POINTER:C280($arrHeaderVars;0)  //Array pointer  Pointers to header variables
ARRAY BOOLEAN:C223($arrVisible;0)  //Array Boolean  Visibility of each column
ARRAY POINTER:C280($arrStyles;0)  //Array pointer  Pointer

LISTBOX GET ARRAYS:C832(SLCT_ListBox_ab;$arrColNames;$arrHeaderNames;$arrColVars;$arrHeaderVars;$arrVisible;$arrStyles)

If ($ColumnNumber_i<=Size of array:C274($arrHeaderNames))
	$0:=$arrHeaderVars{$ColumnNumber_i}
End if 