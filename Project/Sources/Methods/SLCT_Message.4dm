//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Message
  // Global and IP variables accessed:     None Used
C_LONGINT:C283(SLCT_MssgRecordLimit_i)
C_TEXT:C284(SLCT_MssgText_t)

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
	
	
	If (Records in selection:C76(SLCT_Table_ptr->)>=SLCT_MssgRecordLimit_i)
		
		$ProgressBar_i:=Progress New 
		
		Progress SET TITLE ($ProgressBar_i;Get localized string:C991("MtB_Slct_NetworkTraffic");-1;"";True:C214)
		
		
	End if 
	
	
	
	
Else 
	Case of 
		: (($1=4D Remote mode:K5:5) & ($ApplicationType_i=4D Remote mode:K5:5))  //  We are specifying 4D Remote Mode & we are in 4D Remote Mode
			SLCT_MssgRecordLimit_i:=$2
			SLCT_MssgText_t:=$3
		: (($1#4D Remote mode:K5:5) & ($ApplicationType_i#4D Remote mode:K5:5))  //  We are specifying not 4D Remote Mode & we are not in 4D Remote Mode
			SLCT_MssgRecordLimit_i:=$2
			SLCT_MssgText_t:=$3
		Else 
			  //  ignore
	End case 
End if 

$0:=$ProgressBar_i
