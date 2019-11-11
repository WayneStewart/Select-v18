//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_SetFields
  // Global and IP variables accessed:     None Used

  // Method Type:    Protected

  // Parameters:
C_POINTER:C301(${1})

  // Local Variables:
C_TEXT:C284($ErrorMssg_t)
C_LONGINT:C283($NumberOfParameters_i;$NumberOfColumns_i;$NumberOfFieldsInTable_i)
C_LONGINT:C283($CurrentColumn_i;$Slct_TableNumber_i;$FieldType_i)
C_LONGINT:C283($indexPosition_i;$StopPosition_i)
C_POINTER:C301($Slct_Table_ptr;$Field_Ptr)
C_BOOLEAN:C305($FoundAnAvailArray_b;$SLCT_NoField_b)

  // Returns:    Nothing

  // Created by Wayne Stewart (Apr 19, 2006)
  //     waynestewart@mac.com

  // Allows the developer to set the fields to display in the select dialog
  //    if no fields are specified then the 2nd & 3rd field will be displayed.

  // ----------------------------------------------------

SLCT_Init 

$NumberOfParameters_i:=Count parameters:C259
$NumberOfColumns_i:=$NumberOfParameters_i

Case of 
	: ($NumberOfParameters_i=0)
		$ErrorMssg_t:="Method called without parameters."
		
	: ($NumberOfParameters_i=1)
		$ErrorMssg_t:="Method called without any field parameters."
		
	: ($NumberOfParameters_i-1>Storage:C1525.k.maxColumns)
		$ErrorMssg_t:="Too many fields were passed for the "+Table name:C256($1->)+" table."
		
	Else 
		SLCT_Table ($1)
		$Slct_Table_ptr:=$1
		$Slct_TableNumber_i:=Table:C252($Slct_Table_ptr)
		
End case 

If (Length:C16($ErrorMssg_t)=0)
	ARRAY POINTER:C280($PointerToAllArrays_aptr;Storage:C1525.k.maxColumns)
	  //ARRAY LONGINT($OrderOfArrays_ai;◊SLCT_MaxColumns_i)
	ARRAY POINTER:C280(SLCT_Fields_aptr;$NumberOfColumns_i)
	ARRAY POINTER:C280(SLCT_Arrays_aptr;$NumberOfColumns_i)
	ARRAY POINTER:C280(SLCT_ColHeaders_aptr;$NumberOfColumns_i)
	ARRAY TEXT:C222(SLCT_ColumnNames_at;$NumberOfColumns_i)
	ARRAY TEXT:C222(SLCT_HeaderNames_at;$NumberOfColumns_i)
	
	For ($CurrentColumn_i;1;Storage:C1525.k.maxColumns)
		$PointerToAllArrays_aptr{$CurrentColumn_i}:=->$SLCT_NoField_b  //  Assign all array pointers this "nil" pointer
	End for 
	
	For ($CurrentColumn_i;1;$NumberOfParameters_i)
		SLCT_Fields_aptr{$CurrentColumn_i}:=${$CurrentColumn_i}
		SLCT_Arrays_aptr{$CurrentColumn_i}:=->$SLCT_NoField_b  //  Assign all array pointers this "nil" pointer
	End for 
	
	SLCT_Arrays_aptr{1}:=->SLCT_Index_ai
	SLCT_ColHeaders_aptr{1}:=SLCT_HeaderPointerFromIndex   //  The index header doesn't need one
	SLCT_ColumnNames_at{1}:=SLCT_VariableName (SLCT_Arrays_aptr{1})
	SLCT_HeaderNames_at{1}:=SLCT_VariableName (SLCT_ColHeaders_aptr{1})
	
	For ($CurrentColumn_i;2;$NumberOfParameters_i)
		SLCT_Fields_aptr{$CurrentColumn_i}:=${$CurrentColumn_i}
		$FieldType_i:=Type:C295(SLCT_Fields_aptr{$CurrentColumn_i}->)  // what is the array type?
		Case of   //  Determine the array positions for the different types
			: (($FieldType_i=Is alpha field:K8:1) | ($FieldType_i=Is text:K8:3))
				$indexPosition_i:=0
				$StopPosition_i:=6
			: ($FieldType_i=Is date:K8:7)
				$indexPosition_i:=6
				$StopPosition_i:=19
			: ($FieldType_i=Is real:K8:4)
				$indexPosition_i:=9
				$StopPosition_i:=12
			: (($FieldType_i=Is longint:K8:6) | ($FieldType_i=Is integer:K8:5) | ($FieldType_i=Is time:K8:8))
				$indexPosition_i:=12
				$StopPosition_i:=15
			: ($FieldType_i=Is boolean:K8:9)
				$indexPosition_i:=15
				$StopPosition_i:=18
			: ($FieldType_i=Is picture:K8:10)
				$indexPosition_i:=18
				$StopPosition_i:=21
			Else 
				SLCT BUG ALERT (Current method name:C684;"Unexpected field type: "+String:C10($FieldType_i))
		End case 
		
		Repeat   //   Check if there is an available array for this type
			$FoundAnAvailArray_b:=False:C215
			$indexPosition_i:=$indexPosition_i+1
			If ($PointerToAllArrays_aptr{$indexPosition_i}=(->$SLCT_NoField_b))
				$FoundAnAvailArray_b:=True:C214
			End if 
		Until (($indexPosition_i=$StopPosition_i) | ($FoundAnAvailArray_b))
		
		If ($FoundAnAvailArray_b)
			$PointerToAllArrays_aptr{$indexPosition_i}:=SLCT_ArrayPointerFromIndex ($indexPosition_i)  //  This will stop it being reallocated
			SLCT_Arrays_aptr{$CurrentColumn_i}:=SLCT_ArrayPointerFromIndex ($indexPosition_i)
			SLCT_ColHeaders_aptr{$CurrentColumn_i}:=SLCT_HeaderPointerFromIndex ($indexPosition_i)
			SLCT_ColumnNames_at{$CurrentColumn_i}:=SLCT_VariableName (SLCT_Arrays_aptr{$CurrentColumn_i})
			SLCT_HeaderNames_at{$CurrentColumn_i}:=SLCT_VariableName (SLCT_ColHeaders_aptr{$CurrentColumn_i})
			
		Else 
			If (($FieldType_i=Is alpha field:K8:1) | ($FieldType_i=Is text:K8:3))
				SLCT BUG ALERT (Current method name:C684;"Maximum of 6 fields of this type: "+String:C10($FieldType_i))
				  //Fnd_Gen_BugAlert ("SLCT_SetFields";"Maximum of 6 fields of this type: "+String($FieldType_i))
			Else 
				SLCT BUG ALERT (Current method name:C684;"Maximum of 3 fields of this type: "+String:C10($FieldType_i))
				  //Fnd_Gen_BugAlert ("SLCT_SetFields";"Maximum of 3 fields of this type: "+String($FieldType_i))
			End if 
		End if 
		
	End for 
	
	
End if 

If (Length:C16($ErrorMssg_t)>0)
	SLCT BUG ALERT (Current method name:C684;$ErrorMssg_t)
	  //Fnd_Gen_BugAlert ("SLCT_SetFields";$ErrorMssg_t)
End if 