//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Widths
  // Global and IP variables accessed:     None Used

  // Method Type:    Protected

  // Parameters:    
C_LONGINT:C283(${1})
C_TEXT:C284($0)

  // Local Variables:     None Used

  // Returns:    Nothing

  // Created by Wayne Stewart (Jan 4, 2005)
  //     waynestewart@mac.com
  // ----------------------------------------------------

C_LONGINT:C283($LoopCounter_i;$NumberOfParameters_i;$TableNumber_i;$CumulativeTotal_i;$NumberOfColumns_i;$AverageWidth_i;$Remainder_i)
C_TEXT:C284($ColumnWidths_t)
$NumberOfParameters_i:=Count parameters:C259
$TableNumber_i:=Table:C252(SLCT_Table_ptr)

$NumberOfColumns_i:=Size of array:C274(SLCT_Fields_aptr)-1  // the index array doesn't count


Case of 
	: ($NumberOfParameters_i=0)  //  Just return the text object with the column widths
		$ColumnWidths_t:=SLCT_Widths_t
		
	: ($1=-1)  //  Even lengths
		$ColumnWidths_t:=""
		
	Else   //  Assigned lengths have been passed
		$CumulativeTotal_i:=0
		$ColumnWidths_t:=""
		For ($LoopCounter_i;1;$NumberOfParameters_i)
			$CumulativeTotal_i:=$CumulativeTotal_i+${$LoopCounter_i}
			$ColumnWidths_t:=$ColumnWidths_t+String:C10(${$LoopCounter_i};"0000")
		End for 
		SLCT_Widths_t:=$ColumnWidths_t
		
End case 

If (Length:C16($ColumnWidths_t)=0)  //  This means we need equal lengths
	C_LONGINT:C283($Width_i;$Left_i;$top_i;$right_i;$bottom_i)
	GET WINDOW RECT:C443($Left_i;$top_i;$right_i;$bottom_i)
	$Width_i:=$right_i-$Left_i-40  //  Either side of listbox 2o pixels
	$Width_i:=$Width_i-15  //  The scroll bar
	
	$ColumnWidths_t:=""
	
	$AverageWidth_i:=$Width_i\$NumberOfColumns_i  //  Width of area is 428 (not counting last column)
	$Remainder_i:=$Width_i%$NumberOfColumns_i
	
	For ($LoopCounter_i;1;$NumberOfColumns_i-1)
		$ColumnWidths_t:=$ColumnWidths_t+String:C10($AverageWidth_i;"0000")
	End for 
	$ColumnWidths_t:=$ColumnWidths_t+String:C10($AverageWidth_i+$Remainder_i;"0000")
	
	SLCT_Widths_t:=$ColumnWidths_t
End if 


$0:=SLCT_Widths_t