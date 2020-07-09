//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_Unload

  // Method Type:    Private

C_PICTURE:C286($Temp_pic)
  // Created by Wayne Stewart (Jan 4, 2005)
  //     waynestewart@mac.com
  //  This method resets all variable RAM items to zero storage
  //  and resets Slct to default values
  // ----------------------------------------------------


SLCT_Reset 

ARRAY POINTER:C280(SLCT_Fields_aptr;0)
ARRAY POINTER:C280(SLCT_Arrays_aptr;0)

ARRAY TEXT:C222(SLCT_ColumnNames_at;0)
ARRAY TEXT:C222(SLCT_HeaderNames_at;0)

ARRAY LONGINT:C221(SLCT_SortArray_ai;0)
ARRAY TEXT:C222(SLCT_Format_at;0)

ARRAY TEXT:C222(SLCT_Text_at1;0)
ARRAY TEXT:C222(SLCT_Text_at2;0)
ARRAY TEXT:C222(SLCT_Text_at3;0)
ARRAY TEXT:C222(SLCT_Text_at4;0)
ARRAY TEXT:C222(SLCT_Text_at5;0)
ARRAY TEXT:C222(SLCT_Text_at6;0)

ARRAY DATE:C224(SLCT_Date_ad1;0)
ARRAY DATE:C224(SLCT_Date_ad2;0)
ARRAY DATE:C224(SLCT_Date_ad3;0)

ARRAY REAL:C219(SLCT_Real_ar1;0)
ARRAY REAL:C219(SLCT_Real_ar2;0)
ARRAY REAL:C219(SLCT_Real_ar3;0)

ARRAY LONGINT:C221(SLCT_Long_ai1;0)
ARRAY LONGINT:C221(SLCT_Long_ai2;0)
ARRAY LONGINT:C221(SLCT_Long_ai3;0)

ARRAY BOOLEAN:C223(SLCT_Bool_ab1;0)
ARRAY BOOLEAN:C223(SLCT_Bool_ab2;0)
ARRAY BOOLEAN:C223(SLCT_Bool_ab3;0)

ARRAY PICTURE:C279(SLCT_Pict_apic1;0)
ARRAY PICTURE:C279(SLCT_Pict_apic2;0)
ARRAY PICTURE:C279(SLCT_Pict_apic3;0)

ARRAY LONGINT:C221(SLCT_Index_ai;0)
ARRAY BOOLEAN:C223(SLCT_ListBox_ab;0)

