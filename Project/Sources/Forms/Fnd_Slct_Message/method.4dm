If (Form event code:C388=On Timer:K2:25)
	REDRAW WINDOW:C456
	
End if 

If (Form event code:C388=On Load:K2:1)
	SET TIMER:C645(5)
	
End if 

If (Form event code:C388=On Outside Call:K2:11)
	CANCEL:C270
End if 