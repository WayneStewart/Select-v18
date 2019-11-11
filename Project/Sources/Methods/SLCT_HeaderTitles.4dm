//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_HeaderTitles ( Title1 {; Title2 {; TitleN }}) --> Header Title

  // Allows you to all the Header Titles (max 22) at once

  // Access: Shared

  // Parameters:
  //   $1 : Text : Header Title
  //   $2 : Text : Header Title (optional)
  // …
  //   $N : Text : Header Title (optional)

  // Returns:
  //   $0 : Text : The current header Title

  // Created by Wayne Stewart (2018-10-16T13:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_TEXT:C284(${1})

C_LONGINT:C283($ColumnNumber_i)

If (False:C215)
	C_TEXT:C284(SLCT_HeaderTitles ;${1})
End if 

SLCT_Init 

For ($ColumnNumber_i;1;Count parameters:C259)
	If ($ColumnNumber_i>Storage:C1525.k.maxColumns)
		$ColumnNumber_i:=Count parameters:C259+1  // Just ignore the rest
		
	Else 
		SLCT_HeaderTitles_at{$ColumnNumber_i+1}:=${$ColumnNumber_i}
		
	End if 
End for 

