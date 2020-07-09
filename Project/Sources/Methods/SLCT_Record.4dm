//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: Fnd_Select_Record (->Table{; Selection{; Allow Search{; Allow Create}}}) 

  // Method Type:     Protected

  // Parameters: 
C_POINTER:C301($1)  //   The table to select a record from
C_TEXT:C284($2)  //   "Empty"   : Start with empty selection in this table
  //                  "Current" : Use the current selection  < Default >
  //                  "xxx"     : Use this set to create the selection
  //                  "All"     : Use All Records
C_BOOLEAN:C305($3)  //   True = allow user to search from within dialog, default is false
C_BOOLEAN:C305($4)  //   True = allow user to create a new record, default is false
C_LONGINT:C283($0)  //  The record number

  // Local Variables:   
C_LONGINT:C283($ParameterCount_i)

C_TEXT:C284($errorMethod_t;$Exception_t)

  // Returns:     Nothing

  // Created by Wayne Stewart (15/04/2004)
  //     waynestewart@mac.com
  // ----------------------------------------------------

SLCT_Init 

$0:=No current record:K29:2


$ParameterCount_i:=Count parameters:C259

If ($ParameterCount_i=0)
	$Exception_t:="No table passed."
Else 
	$Exception_t:=""
	SLCT_Table ($1)
End if 

If (Length:C16($Exception_t)=0) & ($ParameterCount_i>1)
	Case of 
		: ($2="Empty") | ($2="")
			REDUCE SELECTION:C351((Slct.tablePointer)->;0)
		: ($2="Current") | ($2="")
			  //  Do nothing
		: ($2="All")
			ALL RECORDS:C47((Slct.tablePointer)->)
		Else 
			$errorMethod_t:=Method called on error:C704
			ON ERR CALL:C155("SLCT_DummyMethod")
			USE SET:C118($2)
			Case of 
				: (Error=0)  //  No error
				: (Error=39)  // 
					$Exception_t:="39: The set "+$2+" does not exist."
				Else 
					$Exception_t:=String:C10(Error)+": Unexpected error."
			End case 
			CLEAR SET:C117($2)
			Error:=0
			  // Restore the previous error handler.
			ON ERR CALL:C155($errorMethod_t)
	End case 
End if 

If (Length:C16($Exception_t)=0)
	Case of 
		: ($ParameterCount_i=4)
			SLCT_Button ("New";$4)
			SLCT_Button ("Search";$3)
			
		: ($ParameterCount_i=3)
			SLCT_Button ("New";False:C215)
			SLCT_Button ("Search";$3)
			
		Else 
			SLCT_Button ("New";False:C215)
			SLCT_Button ("Search";False:C215)
			
	End case 
	
	SLCT_LoadArrays 
	$0:=SLCT_Dialog 
	
	SLCT_Unload   //  Free up memory
Else 
	
	SLCT BUG ALERT (Current method name:C684;$Exception_t)
End if 