//%attributes = {"invisible":true,"shared":true}
  // ----------------------------------------------------
  // User name (OS): Wayne Stewart
  // Date and time: May 8, 2009, 13:00:57
  // ----------------------------------------------------
  // Method: SLCT_DisplayIcon
  // Description
  // 
  //
  // Parameters
  // ### Wayne Stewart Apr 20, 2006 - Always display logo now 
  // GET PICTURE FROM LIBRARY(SLCT_Icon ;SLCT_IconPicture_pic)
  //   Modified by: Wayne Stewart (2/12/08)
  //    Now use icon in resources folder

C_TEXT:C284($Delimiter_t;$Path_t)
C_PICTURE:C286($Pic;$SLCT_IconPicture_pic)
C_BOOLEAN:C305($HideDefaultButton_b)

  // ----------------------------------------------------

SLCT_Init 

$Delimiter_t:=Folder separator:K24:12

If (Slct.iconName=Null:C1517)
	Slct.iconName:=SLCT Note Icon
End if 

If (Find in array:C230(<>SLCT_IconPaths_at;Slct.iconName)>0)  // Check if we've previously loaded it
	
	$SLCT_IconPicture_pic:=<>SLCT_Icons_apic{Find in array:C230(<>SLCT_IconPaths_at;Slct.iconName)}
Else 
	
	PICTURE LIBRARY LIST:C564($Pictures_ai;$Pictures_at)
	
	Case of 
		: (Slct.iconName=SLCT Stop Icon) | (Slct.iconName=SLCT Warn Icon) | (Slct.iconName=SLCT Note Icon) | (Slct.iconName=SLCT Question Icon)
			GET PICTURE FROM LIBRARY:C565(Slct.iconName;$SLCT_IconPicture_pic)
			
			
			
		: (Find in array:C230($Pictures_at;Slct.iconName)>0)
			GET PICTURE FROM LIBRARY:C565(Slct.iconName;$SLCT_IconPicture_pic)  // JUst display a default image
			
		Else 
			$Path_t:=Slct.iconName
			$Path_t:=Replace string:C233($Path_t;$Delimiter_t+$Delimiter_t;$Delimiter_t)  // get rid of any double delimiters
			
			If (Test path name:C476($Path_t)=Is a document:K24:1)  // They may have provided the full path
				READ PICTURE FILE:C678($Path_t;$Pic)
				If (OK=1)
					$SLCT_IconPicture_pic:=$Pic
				End if 
				
			Else   //  They just provided the icon name of an icon in the resource folder
				$Path_t:=Get 4D folder:C485(Current resources folder:K5:16;*)  //  First of all assume it's in the resource folder
				$Path_t:=$Path_t+Slct.iconName
				$Path_t:=Replace string:C233($Path_t;$Delimiter_t+$Delimiter_t;$Delimiter_t)  // get rid of any double delimiters
				If (Test path name:C476($Path_t)=Is a document:K24:1)
					READ PICTURE FILE:C678($Path_t;$Pic)
					If (OK=1)
						$SLCT_IconPicture_pic:=$Pic
					End if 
				End if 
				
			End if 
			
	End case 
	
End if 


If (Picture size:C356($SLCT_IconPicture_pic)=0)  // Just display a default image
	GET PICTURE FROM LIBRARY:C565(SLCT Note Icon;$SLCT_IconPicture_pic)
End if 

If (Find in array:C230(<>SLCT_IconPaths_at;Slct.iconName)=-1)  // So we don't need to read from the disk again
	APPEND TO ARRAY:C911(<>SLCT_IconPaths_at;Slct.iconName)
	APPEND TO ARRAY:C911(<>SLCT_Icons_apic;$SLCT_IconPicture_pic)
End if 

Slct.IconPicture:=$SLCT_IconPicture_pic

