//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_LoadArrays
  // Global and IP variables accessed:      None Used
  //C_POINTER(<>SLCT_TempPtr)  Only required because we can't get a pointer to a local variable

  // Method Type:     Private

  // Parameters:     None Used

  // Local Variables:  
C_TEXT:C284($CommandToExecute_t)
C_LONGINT:C283($NumberOfColumns_i)
C_LONGINT:C283($CurrentColumn_i;$CurrentSortItem_i;$ProgressBar_i)
ARRAY BOOLEAN:C223($SLCT_ShowArray_ab;0)
C_LONGINT:C283($PositionInArray_i;$TableNumber_i)
ARRAY POINTER:C280($afp;0)
ARRAY POINTER:C280($aap;0)
C_POINTER:C301($tp)
  // Returns:     Nothing

  // Created by Wayne Stewart (21/05/2004)
  //     waynestewart@mac.com
  // ----------------------------------------------------

SET AUTOMATIC RELATIONS:C310(True:C214;False:C215)
$tp:=Slct.tablePointer
$TableNumber_i:=Table:C252($tp)
$NumberOfColumns_i:=Size of array:C274(SLCT_Fields_aptr)
ARRAY POINTER:C280($afp;$NumberOfColumns_i)
ARRAY POINTER:C280($aap;$NumberOfColumns_i)

  //COPY ARRAY(<>SLCT_ShowArray_ab{$TableNumber_i};$SLCT_ShowArray_ab)
$PositionInArray_i:=0
For ($CurrentColumn_i;1;$NumberOfColumns_i)
	$PositionInArray_i:=$PositionInArray_i+1
	$afp{$CurrentColumn_i}:=SLCT_Fields_aptr{$CurrentColumn_i}  //  This is the field
	$aap{$CurrentColumn_i}:=SLCT_Arrays_aptr{$CurrentColumn_i}
End for 

$ProgressBar_i:=SLCT_Message 

SLCT_LoadArraysOnServer ($NumberOfColumns_i;->$afp;->$aap)



ARRAY BOOLEAN:C223(SLCT_ListBox_ab;Size of array:C274($aap{1}->))  //  Resize the list box
If ($ProgressBar_i>0)
	Progress QUIT ($ProgressBar_i)
End if 

  //If (<>SLCT_MssgWindow_i>0)
  //CALL PROCESS(<>SLCT_MssgWindow_i)
  //<>SLCT_MssgWindow_i:=-1
  //End if 

SET AUTOMATIC RELATIONS:C310(False:C215;False:C215)  //  This will restore
