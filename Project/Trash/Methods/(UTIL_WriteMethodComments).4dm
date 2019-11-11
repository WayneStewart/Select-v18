//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: UTIL_WriteMethodComments {(Method Name; Do not use)} 

  // This method will create documentation comments
  //   it is based on the assumption that you format your
  //    method header comments in the same manner as Foundation
  //  The first paramater is just used to trigger the method
  //   starting in a new process, you should not pass this parameter

  // Access: Shared

  // Parameters: 
  //   $1 : Text : Either pass "" to do all methods or a specific method name
  //   $2 : Longint : Do not use this

  // Created by Wayne Stewart 
  // ----------------------------------------------------

If (False:C215)  //  Copy this to your Compiler Method!
	C_TEXT:C284(UTIL_WriteMethodComments ;$1)
	C_LONGINT:C283(UTIL_WriteMethodComments ;$2)
End if 

C_TEXT:C284($1)
C_LONGINT:C283($2;$ProcessID_i;$StackSize_i;$NumberOfMethods_i;$CurrentMethod_i;$Position_i)
C_TEXT:C284($MethodCode_t;$FirstChars_t;$MethodName_t;$ThreadSafe_t;$ThreadSafeSection_t)

ARRAY TEXT:C222($MethodNames_at;0)
ARRAY TEXT:C222($MethodCode_at;0)
ARRAY TEXT:C222($MethodComments_at;0)



$StackSize_i:=0

If (Count parameters:C259=2)
	
	BRING TO FRONT:C326(1)  //  This will save all methods before we start
	
	METHOD GET PATHS:C1163(Path project method:K72:1;$MethodNames_at)
	
	$MethodName_t:=$1
	
	If (Length:C16($MethodName_t)>0)  //  A method name or prefix has been specified
		
		$NumberOfMethods_i:=Count in array:C907($MethodNames_at;$MethodName_t)
		
		If ($NumberOfMethods_i=1)  // exactly one match (use this specific method)
			ARRAY TEXT:C222($MethodNames_at;0)
			APPEND TO ARRAY:C911($MethodNames_at;$MethodName_t)
		Else 
			
			$NumberOfMethods_i:=Size of array:C274($MethodNames_at)
			For ($CurrentMethod_i;$NumberOfMethods_i;1;-1)  // Go Backwards
				If ($MethodNames_at{$CurrentMethod_i}=($MethodName_t+"@"))
				Else 
					DELETE FROM ARRAY:C228($MethodNames_at;$CurrentMethod_i)
				End if 
				
			End for 
			
		End if 
		
		
		
	End if 
	
	$NumberOfMethods_i:=Size of array:C274($MethodNames_at)
	
	METHOD GET CODE:C1190($MethodNames_at;$MethodCode_at)
	
	ARRAY TEXT:C222($MethodComments_at;$NumberOfMethods_i)
	
	For ($CurrentMethod_i;1;$NumberOfMethods_i)
		$MethodCode_t:=$MethodCode_at{$CurrentMethod_i}
		
		$Position_i:=Position:C15("comment added and reserved by 4D.\r";$MethodCode_t)
		
		$MethodCode_t:=Substring:C12($MethodCode_t;$Position_i+Length:C16("comment added and reserved by 4D.\r"))
		
		If (False:C215)  //  Threadsafe section (v15r5 and greater)
			
			  // C_OBJECT($Attributes_o)
			  // METHOD GET ATTRIBUTES($MethodNames_at{$CurrentMethod_i};$Attributes_o)
			  // $ThreadSafe_t:=OB Get($Attributes_o;"preemptive")
			
			Case of 
				: ($ThreadSafe_t="capable") | ($ThreadSafe_t="indifferent")
					$ThreadSafeSection_t:="\rPREEMPTIVE\r"
					
				: ($ThreadSafe_t="incapable")
					$ThreadSafeSection_t:="\rCOOPERATIVE\r"
					
			End case 
			
			$MethodCode_t:=Replace string:C233($MethodCode_t;"\r  // Access: Shared\r";"\r  // Access: Shared\r"+$ThreadSafeSection_t)
			$MethodCode_t:=Replace string:C233($MethodCode_t;"\r  // Access: Private\r";"\r  // Access: Private\r"+$ThreadSafeSection_t)
			
		End if   //  End Threadsafe section
		
		$MethodCode_t:=Replace string:C233($MethodCode_t;"  // ----------------------------------------------------\r";"")
		$MethodCode_t:=Replace string:C233($MethodCode_t;"// ----------------------------------------------------\r";"")
		
		$MethodCode_t:=Replace string:C233($MethodCode_t;"  // Project Method: ";"")
		$MethodCode_t:=Replace string:C233($MethodCode_t;"// Project Method: ";"")
		
		$MethodCode_t:=Replace string:C233($MethodCode_t;"  // ";"")
		$MethodCode_t:=Replace string:C233($MethodCode_t;"// ";"")
		
		$Position_i:=Position:C15("Created by";$MethodCode_t)
		
		$MethodCode_t:=Substring:C12($MethodCode_t;1;($Position_i-3))
		
		$FirstChars_t:=Substring:C12($MethodCode_t;1;2)
		While ($FirstChars_t="\r\r")
			$MethodCode_t:=Substring:C12($MethodCode_t;2)
			$FirstChars_t:=Substring:C12($MethodCode_t;1;2)
		End while 
		
		$MethodComments_at{$CurrentMethod_i}:=$MethodCode_t
		
		
	End for 
	
	METHOD SET COMMENTS:C1193($MethodNames_at;$MethodComments_at)
	
	
	
	
Else 
	
	If (Count parameters:C259=1)
		$MethodName_t:=$1
	Else 
		$MethodName_t:=""
	End if 
	
	  // This version allows for any number of processes
	  // $ProcessID_i:=New Process(Current method name;$StackSize_i;Current method name;0)
	
	  // On the other hand, this version allows for one unique process
	$ProcessID_i:=New process:C317(Current method name:C684;$StackSize_i;Current method name:C684;$MethodName_t;0;*)
	
	RESUME PROCESS:C320($ProcessID_i)
	SHOW PROCESS:C325($ProcessID_i)
	BRING TO FRONT:C326($ProcessID_i)
End if 