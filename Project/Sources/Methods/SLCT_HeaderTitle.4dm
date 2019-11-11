//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_HeaderTitle (Column Number {; Header Title }) --> Header Title

  // Allows you to set or get the Header Title for a particular column
  // Returns the header title

  // Access: Shared

  // Parameters:
  //   $1 : Longint : The Column Number
  //   $2 : Text : A new header Title (optional)

  // Returns:
  //   $0 : Text : The current header Title

  // Created by Wayne Stewart (2018-10-16T13:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

SLCT_Init 

C_TEXT:C284($0)
C_LONGINT:C283($1)
C_TEXT:C284($2)

C_LONGINT:C283($ColumnNumber_i)

If (False:C215)
	C_TEXT:C284(SLCT_HeaderTitle ;$0;$2)
	C_LONGINT:C283(SLCT_HeaderTitle ;$1)
	
End if 


$ColumnNumber_i:=$1+1

If ($ColumnNumber_i>0) & ($ColumnNumber_i<=Storage:C1525.k.maxColumns)
	If (Count parameters:C259=2)
		SLCT_HeaderTitles_at{$ColumnNumber_i}:=$2
	End if 
	
	$0:=SLCT_HeaderTitles_at{$ColumnNumber_i}
	
Else 
	SLCT BUG ALERT (Current method name:C684;"Column Number out of range (1-22): "+String:C10($ColumnNumber_i))
	$0:=""
	
End if 