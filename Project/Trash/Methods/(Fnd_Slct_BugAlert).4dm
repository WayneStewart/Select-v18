//%attributes = {"invisible":true}

  // ----------------------------------------------------
  // User name (OS): Wayne Stewart
  // Date and time: 02/12/08, 15:38:16
  // ----------------------------------------------------
  // Method: Fnd_Slct_BugAlert
  // Description
  // 
  //
  // Parameters
C_TEXT:C284($Method_t;$1)
C_TEXT:C284($Explanation_t;$2)

  // ----------------------------------------------------

$Method_t:=$1

If (Count parameters:C259>=2)
	$Explanation_t:=$2
End if 

ALERT:C41("A problem has occurred in the "+$Method_t+" method.\r\r"+$Explanation_t+"\r\rPlease notify the database developer.")

TRACE:C157
