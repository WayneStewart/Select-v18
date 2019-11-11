C_LONGINT:C283($RecNumber_i)
C_POINTER:C301($object_ptr)
ALL RECORDS:C47([People:1])

QUERY:C277([People:1];[People:1]country:6="@a@")

SLCT_HeaderTitles ("Christian Name";"Surname";"Date of Birth";"Country";"Thumbnail")

SLCT_SetFields (->[People:1];->[People:1]first_name:2;->[People:1]last_name:3;->[People:1]birthday:5;->[Flags:2]icon:3;->[People:1]face:8)
SLCT_SetFormText ("Choose Client...";"Please choose the Person…")
SLCT_SetSort (1)  //  Sort > on column 2 & > on Column 1

SLCT_Widths (192;214;87;106;93)  //  TotalWidth: 692
SLCT_WindowDimensions (732;450)  //  via columns

$object_ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Row Height")

SLCT_Format (4;Char:C90(Scaled to fit prop centered:K6:6))
SLCT_Format (5;Char:C90(Scaled to fit prop centered:K6:6))

SLCT_RowHeight ($object_ptr->)

SLCT_Icon (Get 4D folder:C485(Current resources folder:K5:16;*)+"images"+Folder separator:K24:12+"Superman.png")
SLCT_Message (4D Remote mode:K5:5;1000;"Network Traffic...")
SLCT_Message (4D Local mode:K5:1;5000;"Loading Data...")
$RecNumber_i:=SLCT_Record (->[People:1];"Current";True:C214;True:C214)

If ($RecNumber_i>-1)
	GOTO RECORD:C242([People:1];$RecNumber_i)
	
	ALERT:C41([People:1]first_name:2+" was chosen.")
	
End if 

ALL RECORDS:C47([People:1])