//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: Compiler_Fnd_Slct
  //  Branch 2004

  // Method Type:    Private

  // Parameters:     None Used

  // Local Variables:     None Used

  // Returns:    Nothing
  // Created by Wayne Stewart (20/04/2004)
  //     waynestewart@mac.com
  // ----------------------------------------------------


  //C_BOOLEAN(<>SLCT_Initialized_b)
If (False:C215)
	
	ARRAY TEXT:C222(<>SLCT_IconPaths_at;0)
	ARRAY PICTURE:C279(<>SLCT_Icons_apic;0)
	
End if 


If (Slct.initialised=Null:C1517)
	
	C_OBJECT:C1216(Slct;slctConfig)
	
	ARRAY TEXT:C222(SLCT_Format_at;0)
	
	ARRAY POINTER:C280(SLCT_Fields_aptr;0)
	ARRAY POINTER:C280(SLCT_Arrays_aptr;0)
	
	ARRAY TEXT:C222(SLCT_ColumnNames_at;0)
	ARRAY TEXT:C222(SLCT_HeaderNames_at;0)
	
	ARRAY TEXT:C222(SLCT_Text_at1;0)
	ARRAY TEXT:C222(SLCT_Text_at2;0)
	ARRAY TEXT:C222(SLCT_Text_at3;0)
	ARRAY TEXT:C222(SLCT_Text_at4;0)
	ARRAY TEXT:C222(SLCT_Text_at5;0)
	ARRAY TEXT:C222(SLCT_Text_at6;0)
	
	ARRAY DATE:C224(SLCT_Date_ad1;0)
	ARRAY DATE:C224(SLCT_Date_ad2;0)
	ARRAY DATE:C224(SLCT_Date_ad3;0)
	
	ARRAY REAL:C219(SLCT_Real_ar1;0)
	ARRAY REAL:C219(SLCT_Real_ar2;0)
	ARRAY REAL:C219(SLCT_Real_ar3;0)
	
	ARRAY LONGINT:C221(SLCT_Long_ai1;0)
	ARRAY LONGINT:C221(SLCT_Long_ai2;0)
	ARRAY LONGINT:C221(SLCT_Long_ai3;0)
	
	ARRAY BOOLEAN:C223(SLCT_Bool_ab1;0)
	ARRAY BOOLEAN:C223(SLCT_Bool_ab2;0)
	ARRAY BOOLEAN:C223(SLCT_Bool_ab3;0)
	
	ARRAY PICTURE:C279(SLCT_Pict_apic1;0)
	ARRAY PICTURE:C279(SLCT_Pict_apic2;0)
	ARRAY PICTURE:C279(SLCT_Pict_apic3;0)
	
	ARRAY LONGINT:C221(SLCT_Index_ai;0)
	ARRAY BOOLEAN:C223(SLCT_ListBox_ab;0)
	
	ARRAY LONGINT:C221(SLCT_SortArray_ai;0)
	
	ARRAY LONGINT:C221(SLCT_RowControl_ai;0)
	
	ARRAY TEXT:C222(SLCT_HeaderTitles_at;0)
	
End if 

If (False:C215)
	C_OBJECT:C1216(SLCT_WindowGeometry_Get ;$0)
	C_OBJECT:C1216(SLCT_WindowGeometry_Set ;$1)
	
	C_OBJECT:C1216(SLCT_Configuration ;$0;$1)
	
	C_LONGINT:C283(SLCT_Message ;$1;$2;$0)
	C_TEXT:C284(SLCT_Message ;$3)
	
	C_TEXT:C284(SLCT_SetFormText ;$1;$2)
	C_TEXT:C284(SLCT_Button ;$1)
	C_BOOLEAN:C305(SLCT_Button ;$2;$0)
	
	C_POINTER:C301(SLCT_Record ;$1)
	C_TEXT:C284(SLCT_Record ;$2)
	C_BOOLEAN:C305(SLCT_Record ;$3)
	C_BOOLEAN:C305(SLCT_Record ;$4)
	C_LONGINT:C283(SLCT_Record ;$0)
	
	C_LONGINT:C283(SLCT_Dialog ;$0)
	
	
	C_POINTER:C301(SLCT_SetFields ;${1})
	C_POINTER:C301(SLCT_Table ;$1;$0)
	
	C_LONGINT:C283(SLCT_Widths ;${1})
	C_TEXT:C284(SLCT_Widths ;$0)
	
	C_LONGINT:C283(SLCT_SetSort ;${1})
	C_LONGINT:C283(SLCT_GetSort ;$1;$0)
	
	C_TEXT:C284(SLCT_Info ;$0;$1)
	
	C_TEXT:C284(SLCT_TypeAhead ;$1)
	
	C_TEXT:C284(SLCT_Icon ;$1;$0)
	
	C_BOOLEAN:C305(SLCT_HideControls ;$1;$0)
	
	C_POINTER:C301(SLCT_GetSortColumnArray ;$1;$0)
	C_POINTER:C301(SLCT_SetListBoxFonts ;$1)
	
	C_LONGINT:C283(SLCT_RowHeight ;$1;$0)
	
	C_LONGINT:C283(SLCT_WindowDimensions ;$1;$2)
	
	C_TEXT:C284(SLCT_VariableName ;$0)
	C_POINTER:C301(SLCT_VariableName ;$1)
	
	C_TEXT:C284(SLCT_Format ;$2;$0)
	C_LONGINT:C283(SLCT_Format ;$1)
	
	C_POINTER:C301(SLCT_ArrayPointerFromIndex ;$0)
	C_LONGINT:C283(SLCT_ArrayPointerFromIndex ;$1)
	
	C_POINTER:C301(SLCT_HeaderPointerFromIndex ;$0)
	C_LONGINT:C283(SLCT_HeaderPointerFromIndex ;$1)
	
	C_BOOLEAN:C305(SLCT_HorizontalScrollBar ;$1;$0)
	
	C_POINTER:C301(SLCT_HeaderPointerFromColumn ;$0)
	C_LONGINT:C283(SLCT_HeaderPointerFromColumn ;$1)
	
	C_TEXT:C284(SLCT_GetIndexedString ;$0;${1})
	
	
	C_POINTER:C301(SLCT_ChildTable ;$1;$0)
	
	C_BOOLEAN:C305(SLCT_RunningInFoundation ;$1;$0)
	
	C_LONGINT:C283(SLCT_LoadArraysOnServer ;$1)
	C_POINTER:C301(SLCT_LoadArraysOnServer ;$2;$3)
	
	C_LONGINT:C283(000_Testing ;$1)
	
	C_TEXT:C284(SLCT BUG ALERT ;$1;$2)
	
	C_LONGINT:C283(SLCT_RowControl_Init ;$1;$2)
	
	C_POINTER:C301(SLCT_FilterRows ;$1)
	C_TEXT:C284(SLCT_FilterRows ;$2)
	
	C_TEXT:C284(SLCT_HeaderTitle ;$0;$2)
	C_LONGINT:C283(SLCT_HeaderTitle ;$1)
	
	C_TEXT:C284(SLCT_HeaderTitles ;${1})
	
	C_TEXT:C284(UTIL_WriteMethodComments ;$1)
	C_LONGINT:C283(UTIL_WriteMethodComments ;$2)
	
End if 