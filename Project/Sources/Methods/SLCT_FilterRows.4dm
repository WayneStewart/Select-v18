//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_FilterRecords


  // Description

  // Access: Shared

  // Parameters:
  //   $1 : Type : Description
  //   $x : Type : Description (optional)

  // Created by Wayne Stewart (2018-09-15T14:30:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_POINTER:C301($1)
C_TEXT:C284($2)

C_LONGINT:C283($Array_i;$Hit_i;$LastHit_i;$NumberOfHits_i;$Row_i)
C_POINTER:C301($ListBoxObject_ptr;$ThisArray_ptr)
C_TEXT:C284($ObjectName_t;$SearchPicker_t)

If (False:C215)
	C_POINTER:C301(SLCT_FilterRows ;$1)
	C_TEXT:C284(SLCT_FilterRows ;$2)
End if 


$ListBoxObject_ptr:=$1

$ObjectName_t:=$2

$SearchPicker_t:=(OBJECT Get pointer:C1124(Object named:K67:5;$ObjectName_t))->

  // Reset to blank state
If (Length:C16($SearchPicker_t)=0)
	SLCT_RowControl_Init (Size of array:C274(SLCT_ListBox_ab);0)  // All rows visible
Else 
	SLCT_RowControl_Init (Size of array:C274(SLCT_ListBox_ab);lk row is hidden:K53:31)
	
	$SearchPicker_t:="@"+$SearchPicker_t+"@"
	
	For ($Array_i;1;6)
		  //SLCT_Text_at3
		$ThisArray_ptr:=Get pointer:C304("SLCT_Text_at"+String:C10($Array_i))
		
		$NumberOfHits_i:=Count in array:C907($ThisArray_ptr->;$SearchPicker_t)
		$LastHit_i:=1
		For ($Hit_i;1;$NumberOfHits_i)
			$Row_i:=Find in array:C230($ThisArray_ptr->;$SearchPicker_t;$LastHit_i)
			$LastHit_i:=$Row_i+1
			SLCT_RowControl_ai{$Row_i}:=0  //  Row is now visible
		End for 
		
	End for 
	
End if 