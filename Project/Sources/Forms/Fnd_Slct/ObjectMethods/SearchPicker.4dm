  //Searchpicker sample code



  // Local Variables
C_TEXT:C284($SearchPicker_t;$HelpText_t;$ObjectName_t)

C_POINTER:C301($ListBoxObject_ptr)

$ListBoxObject_ptr:=->SLCT_ListBox_ab
$ObjectName_t:=OBJECT Get name:C1087(Object current:K67:2)
  // ----------------------------------------------------

Case of 
	: (Form event code:C388=On Load:K2:1)
		SearchPicker SET HELP TEXT ($ObjectName_t;"Any text column")
		  //4Vet_OutputFastSearchSetupForm($ObjectName_t)
		  //OBJ_Text(v4_Process_o;"Previous Search";"")
		
		OBJECT SET ENABLED:C1123(*;"Type@";True:C214)
		
	: (Form event code:C388=On Data Change:K2:15)
		SLCT_FilterRows ($ListBoxObject_ptr;$ObjectName_t)
		
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET ENABLED:C1123(*;"Type@";False:C215)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		OBJECT SET ENABLED:C1123(*;"Type@";True:C214)
		
		
End case 





  //Case of 

  //: (Form event=On Load)

  //  // Init the var itself
  //  // this can be done anywhere else in your code
  //C_TEXT(SLCT_Filter_t)

  //  // the let's customise the SearchPicker (if needed)

  //C_BOOLEAN($Customise)
  //$Customise:=True

  //C_TEXT($ObjectName_t)
  //$ObjectName_t:=OBJECT Get name(Object current)

  //  // The exemple below shows how to set a label (ex : "name") inside the search zone

  //If ($Customise)

  //SearchPicker SET HELP TEXT ($ObjectName_t;"Name")

  //End if 

  //: (Form event=On Data Change)

  //  // Reset to blank state
  //If (Length(SLCT_Filter_t)=0)
  //SLCT_RowControl_Init (Size of array(SLCT_ListBox_ab);0)  // All rows visible
  //Else 
  //SLCT_RowControl_Init (Size of array(SLCT_ListBox_ab);lk row is hidden)

  //$Filter_t:="@"+SLCT_Filter_t+"@"
  //For ($Array_i;1;6)
  //  //SLCT_Text_at3
  //$ThisArray_ptr:=Get pointer("SLCT_Text_at"+String($Array_i))

  //$NumberOfHits_i:=Count in array($ThisArray_ptr->;$Filter_t)
  //$LastHit_i:=1
  //For ($Hit_i;1;$NumberOfHits_i)
  //$Row_i:=Find in array($ThisArray_ptr->;$Filter_t;$LastHit_i)
  //SLCT_RowControl_ai{$Row_i}:=0  //  Row is now visible
  //End for 



  //End for 

  //End if 


  //End case 
