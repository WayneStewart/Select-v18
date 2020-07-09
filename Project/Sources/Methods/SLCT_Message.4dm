//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: 
If (False:C215)
	SLCT_Message 
End if 

  // Global and IP variables accessed:     None Used

  // Method Type:    Protected

  // Parameters:    None Used
C_LONGINT:C283($1;$2;$0)
C_TEXT:C284($3)
  // Local Variables:     None Used
C_LONGINT:C283($NumberOfParameters_i)
C_LONGINT:C283($ApplicationType_i;$ProgressBar_i)

  // Returns:    Nothing

  // Created by Wayne Stewart (28/05/2004)
  //     waynestewart@mac.com

  // Modified by: Wayne Stewart (May 6, 2009)
  //  Change for v11
  // ----------------------------------------------------

$NumberOfParameters_i:=Count parameters:C259
$ApplicationType_i:=Application type:C494

If ($NumberOfParameters_i=0)  //  We are displaying the message
	
	
	If (Records in selection:C76((Slct.tablePointer)->)>=Slct.messageRecordLimit)
		
		$ProgressBar_i:=Progress New 
		
		Progress SET TITLE ($ProgressBar_i;Get localized string:C991("MtB_Slct_NetworkTraffic");-1;"";True:C214)
		
		
	End if 
	
	
	
	
Else 
	Case of 
		: (($1=4D Remote mode:K5:5) & ($ApplicationType_i=4D Remote mode:K5:5))  //  We are specifying 4D Remote Mode & we are in 4D Remote Mode
			Slct.messageRecordLimit:=$2
			Slct.messageText:=$3
		: (($1#4D Remote mode:K5:5) & ($ApplicationType_i#4D Remote mode:K5:5))  //  We are specifying not 4D Remote Mode & we are not in 4D Remote Mode
			Slct.messageRecordLimit:=$2
			Slct.messageText:=$3
		Else 
			  //  ignore
	End case 
End if 

$0:=$ProgressBar_i
