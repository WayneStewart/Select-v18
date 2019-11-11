//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT BUG ALERT

  // Displays an alert and drops into the debugger

  // Access: Private

  // Parameters:
  //   $1 : Text : Method Name
  //   $2 : Text : Description of error

  // Created by Wayne Stewart (2017-06-27T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_TEXT:C284($1)

C_TEXT:C284($2)

If (False:C215)
	C_TEXT:C284(SLCT BUG ALERT ;$1)
End if 


ALERT:C41($1+Char:C90(13)+$2)

TRACE:C157