  // On Host Database Event database method
C_LONGINT:C283($1)
Case of 
	: ($1=On before host database startup:K74:3)
		  // put code here that you want to execute before the "On Startup" database method
		  // of the host database
	: ($1=On after host database startup:K74:4)
		  // put code here that you want to execute after the "On Startup"
		  // database method of the host database
		
		SLCT_Init 
		
		
		
	: ($1=On before host database exit:K74:5)
		  // put code here that you want to execute before the "On Exit"
		  // database method of the host database
	: ($1=On after host database exit:K74:6)
		  // put code here that you want to execute after the "On Exit"
		  // database method of the host database
End case 