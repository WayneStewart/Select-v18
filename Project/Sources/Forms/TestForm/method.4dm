If (Form event code:C388=On Close Box:K2:21)
	CANCEL:C270
End if 

If (Form event code:C388=On Load:K2:1)
	C_POINTER:C301($object_ptr)
	$object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Row Height")
	$object_ptr->:=Storage:C1525.font.listRowHeight
	
End if 