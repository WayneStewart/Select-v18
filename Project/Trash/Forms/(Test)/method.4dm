If (Form event code:C388=On Timer:K2:25)
	
	
	If (Fnd_Slct_MssgWindow_i=-1)
	Else 
		CLOSE WINDOW:C154
		Fnd_Slct_MssgWindow_i:=-1
	End if 
	
	
End if 