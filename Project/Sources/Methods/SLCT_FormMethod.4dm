//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_FormMethod
  //  Branch 2004

  // Global and IP variables accessed:     None Used

  // Method Type:    Private

  // Parameters:    None Used

  // Local Variables:    
C_LONGINT:C283($RecordNumber_i)

  // Returns:    Nothing

  // Created by Wayne Stewart (Jan 4, 2005)
  //     waynestewart@mac.com
  // Modified by Dave Batton on Mar 19, 2006
  //   Added an On Timer event to clear the type-ahead buffer.

  // Modified by: Wayne Stewart (3/12/08)
  //   Got rid of the On Outside Call section
  //   No longer possible without Foundation
  // ----------------------------------------------------

Case of 
	: (Form event code:C388=On Load:K2:1)
		SLCT_OnLoad 
		
	: (Form event code:C388=On Timer:K2:25)
		  // DB060319 - Clear the type-ahead buffer. See SLCT_TypeAhead .
		Form:C1466.TypeAheadString:=""
		SET TIMER:C645(0)
		
		
	: (Form event code:C388=On Outside Call:K2:11)
		  //$RecordNumber_i:=Fnd_IO_RecordEdited 
		  //If ($RecordNumber_i#No current record )
		  //READ ONLY(SLCT_Table ->)
		  //GOTO RECORD(SLCT_Table ->;$RecordNumber_i)
		  //SLCT_LoadArrays 
		  //If (Size of array(SLCT_ListBox_ab)>0)
		  //SLCT_ListBox_ab{1}:=True
		  //End if 
		  //ACCEPT
		  //End if 
		
	: (Form event code:C388=On Unload:K2:2)
		SLCT_StoreConfiguration 
		
End case 


OBJECT SET ENABLED:C1123(*;"SLCT_ChooseButton_i";(Find in array:C230(SLCT_ListBox_ab;True:C214)>-1))
