//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_TypeAhead


  // Method Type:    Private

  // Parameters:    None Used

  // Local Variables:     None Used

  // Returns:

  // Created by Wayne Stewart (Jan 4, 2005)
  //     waynestewart@mac.com
  // Modified by Dave Batton on Mar 19, 2006
  //   Made a bunch of modifications to support multi-character type-ahead.
  // ----------------------------------------------------

C_TEXT:C284($1)

C_LONGINT:C283($ArrayPosition_i;$asciiValue_i;$SortColumn_i;$TypeOfSortedArray_i)
C_POINTER:C301($SortedArray_Ptr;$Header_Ptr)
C_TEXT:C284($Character_t)

If (False:C215)
	C_TEXT:C284(SLCT_TypeAhead ;$1)
End if 



  //<>Fnd_SlctSortArray_ai{1}  This is the main sort column

Form:C1466.TypeAheadString:=Form:C1466.TypeAheadString+$1  // Add this character to the existing type-ahead buffer.

$Character_t:=Uppercase:C13(Form:C1466.TypeAheadString)  //  Makes no sense for searching but when I am decrementing ascii values it will be a time saver

$SortedArray_Ptr:=SLCT_GetSortColumnArray (->SLCT_ListBox_ab)  // DB060319 - Now calls this new private method.

If (Not:C34(Is nil pointer:C315($SortedArray_Ptr)))  // DB060319 - Added this test for safety.
	  //$SortColumn_i:=Abs(◊Fnd_SlctSortArray_ai{1})
	  //$SortedArray_Ptr:=◊SLCT_ArraysBeingShown_ptr{Table(SLCT_Table )}{$SortColumn_i}
	$TypeOfSortedArray_i:=Type:C295($SortedArray_Ptr->)
	
	If (($TypeOfSortedArray_i=Text array:K8:16) | ($TypeOfSortedArray_i=String array:K8:15))
		Repeat 
			$ArrayPosition_i:=Find in array:C230($SortedArray_Ptr->;$Character_t+"@")
			If (Length:C16($Character_t)=1)  // DB060319 - Added
				$asciiValue_i:=Character code:C91($Character_t)-1
				$Character_t:=Char:C90($asciiValue_i)
			Else 
				$asciiValue_i:=49  // Not used, but tested below.
				$Character_t:=Substring:C12($Character_t;1;Length:C16($Character_t)-1)  // Try just the first letter if we couldn't match all letters.
			End if 
		Until (($ArrayPosition_i>0) | ($asciiValue_i<48))  //  i.e. 0
		
		If ($ArrayPosition_i>0)
			LISTBOX SELECT ROW:C912(SLCT_ListBox_ab;$ArrayPosition_i;lk replace selection:K53:1)  // DB060319 - Added
			OBJECT SET SCROLL POSITION:C906(SLCT_ListBox_ab;$ArrayPosition_i)  // DB060319 - Added
			
		End if 
	End if 
End if 

If (Length:C16(Form:C1466.SortedHeader)>0)
	$Header_Ptr:=OBJECT Get pointer:C1124(Object named:K67:5;Form:C1466.SortedHeader)
	$Header_Ptr->:=Form:C1466.SortDirection
	
	Form:C1466.SortedHeader:=""
	Form:C1466.SortDirection:=0
	
End if 

SET TIMER:C645(60)  // Clears the type-ahead buffer after one second of inactivity. See SLCT_FormMethod.