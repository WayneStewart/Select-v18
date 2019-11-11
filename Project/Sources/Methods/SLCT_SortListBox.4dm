//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_SortListBox

  // Global and IP variables accessed:     None Used

  // Method Type:    Private

  // Parameters:    None Used

  // Local Variables:
C_LONGINT:C283($NumberOfSorts_i;$ColToSort_1_i;$ColToSort_2_i;$ColToSort_3_i;$ColToSort_4_i;$LoopCounter_i)
C_BOOLEAN:C305($Col_1_b;$Col_2_b;$Col_3_b;$Col_4_b)
C_POINTER:C301($Header_ptr)

  // Returns:    Nothing

  // Created by Wayne Stewart (Mar 24, 2006)
  //     waynestewart@mac.com
  // ----------------------------------------------------

$NumberOfSorts_i:=Size of array:C274(SLCT_SortArray_ai)

$Col_1_b:=(SLCT_GetSort (1)>0)
$Col_2_b:=(SLCT_GetSort (2)>0)
$Col_3_b:=(SLCT_GetSort (3)>0)
$Col_4_b:=(SLCT_GetSort (4)>0)

$ColToSort_1_i:=Abs:C99(SLCT_GetSort (1))+1  // Add one because the first column is the index array
$ColToSort_2_i:=Abs:C99(SLCT_GetSort (2))+1
$ColToSort_3_i:=Abs:C99(SLCT_GetSort (3))+1
$ColToSort_4_i:=Abs:C99(SLCT_GetSort (4))+1

Case of 
	: ($NumberOfSorts_i=0)
		
	: ($NumberOfSorts_i=1)
		Case of 
			: ($Col_1_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>)
				
			: (Not:C34($Col_1_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<)
				
		End case 
		
	: ($NumberOfSorts_i=2)
		Case of 
			: ($Col_1_b) & ($Col_2_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;>)
				
				
			: ($Col_1_b) & (Not:C34($Col_2_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;<)
				
				
			: (Not:C34($Col_1_b)) & ($Col_2_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;>)
				
				
			: (Not:C34($Col_1_b)) & (Not:C34($Col_2_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;<)
				
				
		End case 
		
	: ($NumberOfSorts_i=3)
		Case of 
			: ($Col_1_b) & ($Col_2_b) & ($Col_3_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;>;$ColToSort_3_i;>)
				
			: ($Col_1_b) & ($Col_2_b) & (Not:C34($Col_3_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;>;$ColToSort_3_i;<)
				
			: ($Col_1_b) & (Not:C34($Col_2_b)) & ($Col_3_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;<;$ColToSort_3_i;>)
				
			: ($Col_1_b) & (Not:C34($Col_2_b)) & (Not:C34($Col_3_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;<;$ColToSort_3_i;<)
				
			: (Not:C34($Col_1_b)) & ($Col_2_b) & ($Col_3_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;>;$ColToSort_3_i;>)
				
			: (Not:C34($Col_1_b)) & ($Col_2_b) & (Not:C34($Col_3_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;>;$ColToSort_3_i;<)
				
			: (Not:C34($Col_1_b)) & (Not:C34($Col_2_b)) & ($Col_3_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;<;$ColToSort_3_i;>)
				
			: (Not:C34($Col_1_b)) & (Not:C34($Col_2_b)) & (Not:C34($Col_3_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;<;$ColToSort_3_i;<)
				
		End case 
		
	: ($NumberOfSorts_i>3)
		Case of 
			: ($Col_1_b) & ($Col_2_b) & ($Col_3_b) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;>;$ColToSort_3_i;>;$ColToSort_4_i;>)
				
			: ($Col_1_b) & ($Col_2_b) & ($Col_3_b) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;>;$ColToSort_3_i;>;$ColToSort_4_i;<)
				
				
			: ($Col_1_b) & ($Col_2_b) & (Not:C34($Col_3_b)) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;>;$ColToSort_3_i;<;$ColToSort_4_i;>)
				
				
			: ($Col_1_b) & ($Col_2_b) & (Not:C34($Col_3_b)) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;>;$ColToSort_3_i;<;$ColToSort_4_i;<)
				
				
			: ($Col_1_b) & (Not:C34($Col_2_b)) & ($Col_3_b) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;<;$ColToSort_3_i;>;$ColToSort_4_i;>)
				
				
			: ($Col_1_b) & (Not:C34($Col_2_b)) & ($Col_3_b) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;<;$ColToSort_3_i;>;$ColToSort_4_i;<)
				
				
			: ($Col_1_b) & (Not:C34($Col_2_b)) & (Not:C34($Col_3_b)) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;<;$ColToSort_3_i;<;$ColToSort_4_i;>)
				
				
			: ($Col_1_b) & (Not:C34($Col_2_b)) & (Not:C34($Col_3_b)) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;>;$ColToSort_2_i;<;$ColToSort_3_i;<;$ColToSort_4_i;<)
				
				
			: (Not:C34($Col_1_b)) & ($Col_2_b) & ($Col_3_b) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;>;$ColToSort_3_i;>;$ColToSort_4_i;>)
				
				
			: (Not:C34($Col_1_b)) & ($Col_2_b) & ($Col_3_b) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;>;$ColToSort_3_i;>;$ColToSort_4_i;<)
				
				
			: (Not:C34($Col_1_b)) & ($Col_2_b) & (Not:C34($Col_3_b)) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;>;$ColToSort_3_i;<;$ColToSort_4_i;>)
				
				
			: (Not:C34($Col_1_b)) & ($Col_2_b) & (Not:C34($Col_3_b)) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;>;$ColToSort_3_i;<;$ColToSort_4_i;<)
				
				
			: (Not:C34($Col_1_b)) & (Not:C34($Col_2_b)) & ($Col_3_b) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;<;$ColToSort_3_i;>;$ColToSort_4_i;>)
				
				
			: (Not:C34($Col_1_b)) & (Not:C34($Col_2_b)) & ($Col_3_b) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;<;$ColToSort_3_i;>;$ColToSort_4_i;<)
				
				
			: (Not:C34($Col_1_b)) & (Not:C34($Col_2_b)) & (Not:C34($Col_3_b)) & ($Col_4_b)
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;<;$ColToSort_3_i;<;$ColToSort_4_i;<)
				
				
			: (Not:C34($Col_1_b)) & (Not:C34($Col_2_b)) & (Not:C34($Col_3_b)) & (Not:C34($Col_4_b))
				LISTBOX SORT COLUMNS:C916(SLCT_ListBox_ab;$ColToSort_1_i;<;$ColToSort_2_i;<;$ColToSort_3_i;<;$ColToSort_4_i;<)
				
		End case 
End case 


  //```````````````````````
  //  Need to indicate sort, turn all off first
For ($LoopCounter_i;1;Storage:C1525.k.maxColumns)
	SLCT_HeaderPointerFromIndex ($LoopCounter_i)->:=0
End for 

$Header_ptr:=SLCT_HeaderPointerFromColumn ($ColToSort_1_i)
If (Is nil pointer:C315($Header_ptr))
Else 
	If ($Col_1_b)  //  Ascending Sort
		$Header_ptr->:=1
	Else 
		$Header_ptr->:=2
	End if 
End if 