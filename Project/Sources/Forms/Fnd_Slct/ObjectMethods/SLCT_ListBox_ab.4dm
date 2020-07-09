If (Form event code:C388=On Double Clicked:K2:5)
	ACCEPT:C269
End if 

OBJECT SET ENABLED:C1123(*;"SLCT_ChooseButton_i";(Find in array:C230(SLCT_ListBox_ab;True:C214)>-1))