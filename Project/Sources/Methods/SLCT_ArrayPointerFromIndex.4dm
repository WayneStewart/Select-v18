//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_ArrayPointerFromIndex (Col No) --> Pointer

  // Returns a pointer to the appropriate column

  // Access: Private

  // Parameters: 
  //   $1 : Longint : The column Number

  // Returns: 
  //   $0 : Pointer : Pointer to the column array

  // Created by Wayne Stewart (Apr 19, 2006)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------


C_LONGINT:C283($1;$Index_i)
C_POINTER:C301($0)


$Index_i:=$1

Case of 
	: ($Index_i=0)
		$0:=->SLCT_Index_ai
		
	: ($Index_i=1)
		$0:=->SLCT_Text_at1
		
	: ($Index_i=2)
		$0:=->SLCT_Text_at2
		
	: ($Index_i=3)
		$0:=->SLCT_Text_at3
		
	: ($Index_i=4)
		$0:=->SLCT_Text_at4
		
	: ($Index_i=5)
		$0:=->SLCT_Text_at5
		
	: ($Index_i=6)
		$0:=->SLCT_Text_at6
		
	: ($Index_i=7)
		$0:=->SLCT_Date_ad1
		
	: ($Index_i=8)
		$0:=->SLCT_Date_ad2
		
	: ($Index_i=9)
		$0:=->SLCT_Date_ad3
		
	: ($Index_i=10)
		$0:=->SLCT_Real_ar1
		
	: ($Index_i=11)
		$0:=->SLCT_Real_ar2
		
	: ($Index_i=12)
		$0:=->SLCT_Real_ar3
		
	: ($Index_i=13)
		$0:=->SLCT_Long_ai1
		
	: ($Index_i=14)
		$0:=->SLCT_Long_ai2
		
	: ($Index_i=15)
		$0:=->SLCT_Long_ai3
		
	: ($Index_i=16)
		$0:=->SLCT_Bool_ab1
		
	: ($Index_i=17)
		$0:=->SLCT_Bool_ab2
		
	: ($Index_i=18)
		$0:=->SLCT_Bool_ab3
		
	: ($Index_i=19)
		$0:=->SLCT_Pict_apic1
		
	: ($Index_i=20)
		$0:=->SLCT_Pict_apic2
		
	: ($Index_i=21)
		$0:=->SLCT_Pict_apic3
		
End case 


