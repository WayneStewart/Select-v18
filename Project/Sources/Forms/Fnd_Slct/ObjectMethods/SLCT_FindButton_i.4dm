  // ----------------------------------------------------
  // Object Method: ◊SLCT_FindButton_i

  // 20/3/2006 - Revised by Dave to improve window handling 
  // ----------------------------------------------------

C_POINTER:C301($CurrentTable_Ptr)


Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		
		If (SLCT_RunningInFoundation )
			EXECUTE METHOD:C1007("Fnd_Gen_CurrentTable";$CurrentTable_Ptr)  //  Preserve current table
			EXECUTE METHOD:C1007("Fnd_Gen_CurrentTable";*;Slct.tablePointer)  //  Set this to the correct table
			EXECUTE METHOD:C1007("Fnd_Find_Info";*;"Ignore")  //  This will initialize the find component
			EXECUTE METHOD:C1007("Fnd_Wnd_Position";*;2)  // Fnd_Wnd_CenterOnWindow)  //  We don't want to try to open a sheet window on top of another sheet window
			EXECUTE METHOD:C1007("Fnd_Hook_Shell_Find";*)  //  Display the find window
			
			$CurrentTable_Ptr:=Slct.tablePointer  //  Preserve current table
			If (OK=1)
				SLCT_LoadArrays 
				SLCT_SortListBox 
				If (Size of array:C274(SLCT_ListBox_ab)>0)  // Start with first selected
					SLCT_ListBox_ab{1}:=True:C214
				End if 
			End if 
			
			EXECUTE METHOD:C1007("Fnd_Gen_CurrentTable";$CurrentTable_Ptr;$CurrentTable_Ptr)
			
		Else 
			$CurrentTable_Ptr:=Slct.tablePointer  //  Preserve current table
			QUERY:C277($CurrentTable_Ptr->)
			
			If (OK=1)
				SLCT_LoadArrays 
				SLCT_SortListBox 
				If (Size of array:C274(SLCT_ListBox_ab)>0)  // Start with first selected
					SLCT_ListBox_ab{1}:=True:C214
				End if 
			End if 
		End if 
		
End case 

OBJECT SET ENABLED:C1123(*;"SLCT_ChooseButton_i";(Find in array:C230(SLCT_ListBox_ab;True:C214)>-1))