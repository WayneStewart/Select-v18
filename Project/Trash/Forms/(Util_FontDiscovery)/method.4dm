C_LONGINT:C283($Bottom_i;$Left_i;$Right_i;$Top_i)
C_POINTER:C301($obj_ptr)

  //On Load Record

If (Form event code:C388=On Load:K2:1)
	
	  //TRACE
	
	$obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Fnd_Dlg_Text1_t")
	
	Use (Storage:C1525)
		Storage:C1525.font:=New shared object:C1526
	End use 
	
	Use (Storage:C1525.font)
		Storage:C1525.font.largeName:=OBJECT Get font:C1069(*;"Fnd_Dlg_Text1_t")
		Storage:C1525.font.largeSize:=OBJECT Get font size:C1070(*;"Fnd_Dlg_Text1_t")
		Storage:C1525.font.largeStyle:=OBJECT Get font style:C1071(*;"Fnd_Dlg_Text1_t")
		OBJECT GET COORDINATES:C663(*;"Fnd_Dlg_Text1_t";$Left_i;$Top_i;$Right_i;$Bottom_i)
		Storage:C1525.font.largeHeight:=$Bottom_i-$Top_i
		
		Storage:C1525.font.smallName:=OBJECT Get font:C1069(*;"Fnd_Dlg_Text2_t")
		Storage:C1525.font.smallSize:=OBJECT Get font size:C1070(*;"Fnd_Dlg_Text2_t")
		Storage:C1525.font.smallStyle:=OBJECT Get font style:C1071(*;"Fnd_Dlg_Text2_t")
		OBJECT GET COORDINATES:C663(*;"Fnd_Dlg_Text2_t";$Left_i;$Top_i;$Right_i;$Bottom_i)
		Storage:C1525.font.smallHeight:=$Bottom_i-$Top_i
		
		
	End use 
	
	
	CANCEL:C270
	
End if 