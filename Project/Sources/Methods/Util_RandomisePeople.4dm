//%attributes = {"invisible":true}
  // Util_RandomisePeople
  // Created by Wayne Stewart (2019-07-25T14:00:00Z)
  //  Method is an autostart type
  //     wayne@4dsupport.guru
  // ----------------------------------------------------
C_LONGINT:C283($Index_i;$NumberOfFlags_i;$NumberOfPeople_i;$Person_i;$ProcessID_i;$Response_i;$StackSize_i)
C_PICTURE:C286($Face_pic)
C_TEXT:C284($DesiredProcessName_t;$Form_t;$URL_t)

ARRAY TEXT:C222($Countries_at;0)

  // ----------------------------------------------------

$StackSize_i:=0
$Form_t:=""
$DesiredProcessName_t:=Current method name:C684

If (Current process name:C1392=$DesiredProcessName_t)
	
	ALL RECORDS:C47([Flags:2])
	SELECTION TO ARRAY:C260([Flags:2]Code:2;$Countries_at)
	REDUCE SELECTION:C351([Flags:2];0)
	UNLOAD RECORD:C212([Flags:2])
	
	ALL RECORDS:C47([People:1])
	
	$NumberOfFlags_i:=Size of array:C274($Countries_at)
	$NumberOfPeople_i:=Records in selection:C76([People:1])
	
	FIRST RECORD:C50([People:1])
	For ($Person_i;1;$NumberOfPeople_i)
		Repeat 
			$Index_i:=(Random:C100%($NumberOfFlags_i))+1
		Until (($Index_i>=1) & ($Index_i<=$NumberOfFlags_i))
		[People:1]country:6:=$Countries_at{$Index_i}
		$URL_t:="https://randomuser.me/api/portraits/"
		
		Repeat 
			$Index_i:=(Random:C100%(99-0+1))+0
		Until (($Index_i>=0) & ($Index_i<=99))
		
		If ([People:1]gender:9="female")
			$URL_t:=$URL_t+"women/"  ///1.jpg
		Else 
			$URL_t:=$URL_t+"men/"
		End if 
		
		$URL_t:=$URL_t+String:C10($Index_i)+".jpg"
		
		$Response_i:=HTTP Get:C1157($URL_t;$Face_pic;*)
		
		If ($Response_i=200)
			[People:1]face:8:=$Face_pic
		End if 
		
		SAVE RECORD:C53([People:1])
		NEXT RECORD:C51([People:1])
	End for 
	
	REDUCE SELECTION:C351([People:1];0)
	UNLOAD RECORD:C212([People:1])
	
Else 
	  // This version allows for any number of processes
	  // $ProcessID_i:=New Process(Current method name;$StackSize_i;$DesiredProcessName_t)
	
	  // On the other hand, this version allows for one unique process
	$ProcessID_i:=New process:C317(Current method name:C684;$StackSize_i;$DesiredProcessName_t;*)
	
	RESUME PROCESS:C320($ProcessID_i)
	SHOW PROCESS:C325($ProcessID_i)
	BRING TO FRONT:C326($ProcessID_i)
End if 