//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Info (request) --> Text

  // Returns information about the component.
  // See the Fnd_Gen_ComponentInfo method for more information.

  // Method Type: Protected

  // Parameters: 
  //   $1 : Text : Requested information

  // Returns: 
  //   $0 : Text : The answer to the request

  // Created by Wayne Stewart
  // ----------------------------------------------------

C_TEXT:C284($0;$1;$request_t;$reply_t)

$request_t:=$1

SLCT_Init 

Case of 
	: ($request_t="version")
		$reply_t:="17.0.5"
		
	: ($request_t="name")
		$reply_t:="Select"
		
	Else 
		$reply_t:="Fnd_LabelNotRecognized"
End case 

$0:=$reply_t