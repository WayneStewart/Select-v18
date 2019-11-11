//%attributes = {"invisible":true}


  //  //ALL RECORDS([People])

  //  //


  //$Path_t:=Get 4D folder(Current resources folder)+"flags"+Folder separator

  //DOCUMENT LIST($Path_t;$Flags_at)

  //$NumberOfFlags_i:=Size of array($Flags_at)

  //For ($flag_i;1;$NumberOfFlags_i)
  //$FileName_t:=$Path_t+$Flags_at{$flag_i}

  //If (Test path name($FileName_t)=Is a document)

  //READ PICTURE FILE($FileName_t;$Flag_pic)
  //CREATE RECORD([Flags])
  //[Flags]Code:=Replace string($Flags_at{$flag_i};".png";"")
  //[Flags]icon:=$Flag_pic
  //SAVE RECORD([Flags])
  //UNLOAD RECORD([Flags])
  //End if 

  //End for 