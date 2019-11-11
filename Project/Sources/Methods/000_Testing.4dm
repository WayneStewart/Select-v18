//%attributes = {}
  //SHOW ON DISK(Structure file)

  // 000_Testing
  // Created by Wayne Stewart (2017-06-28T14:00:00Z)
  //  Method is an autostart type
  //     wayne@4dsupport.guru
  // ----------------------------------------------------

C_LONGINT:C283($1;$ProcessID_i;$StackSize_i;$WindowID_i)

If (False:C215)  //  Copy this to your Compiler Method!
	C_LONGINT:C283(000_Testing ;$1)
End if 

  // ----------------------------------------------------

SLCT_Init 


$StackSize_i:=0

If (Count parameters:C259=1)
	
	READ ONLY:C145(*)
	
	$WindowID_i:=Open form window:C675("TestForm";Plain form window:K39:10;Horizontally centered:K39:1;Vertically centered:K39:4;*)
	
	
	ALL RECORDS:C47([People:1])
	DIALOG:C40("TestForm")
	CLOSE WINDOW:C154($WindowID_i)
	
Else 
	  // This version allows for any number of processes
	  // $ProcessID_i:=New Process(Current method name;$StackSize_i;Current method name;0)
	
	  // On the other hand, this version allows for one unique process
	$ProcessID_i:=New process:C317(Current method name:C684;$StackSize_i;Current method name:C684;0;*)
	
	RESUME PROCESS:C320($ProcessID_i)
	SHOW PROCESS:C325($ProcessID_i)
	BRING TO FRONT:C326($ProcessID_i)
End if 
