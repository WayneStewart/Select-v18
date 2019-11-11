C_POINTER:C301($obj_ptr)


If (Form event code:C388=On Load:K2:1)
	
	$obj_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Fnd_Dlg_Text1_t")
	
	
	<>SLCT_FontName_t:=OBJECT Get font:C1069(*;"Fnd_Dlg_Text1_t")  // Usually Lucida Grande
	<>SLCT_FontSize_i:=OBJECT Get font size:C1070(*;"Fnd_Dlg_Text1_t")
	OBJECT GET COORDINATES:C663(*;"Fnd_Dlg_Text1_t";$Left_i;$Top_i;$Right_i;$Bottom_i)
	  //<>SLCT_FontHeight_i:=$Bottom_i-$Top_i
	
	
	<>SLCT_SmallFontName_t:=OBJECT Get font:C1069(*;"Fnd_Dlg_Text2_t")  // Usually Lucida Grande
	<>SLCT_SmallFontSize_i:=OBJECT Get font size:C1070(*;"Fnd_Dlg_Text2_t")
	  //OBJECT GET COORDINATES(*;"Fnd_Dlg_Text2_t";$Left_i;$Top_i;$Right_i;$Bottom_i)
	  //<>SLCT_SmallFontHeight_i:=$Bottom_i-$Top_i
	
	
	
	CANCEL:C270
	
	
End if 
