//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: SLCT_LoadArraysOnServer
  // Method Type:    Private
  // Parameters:
C_LONGINT:C283($1;$NumberOfColumns_i)
C_POINTER:C301($2;$afp_ptr)
C_POINTER:C301($3;$aap_ptr)

  // Local Variables:

  // Created by Wayne Stewart (Aug 26, 2015)
  //     waynestewart@mac.com
  //   
  // ----------------------------------------------------
If (False:C215)
	SLCT_LoadArraysOnServer 
End if 

$NumberOfColumns_i:=$1
$afp_ptr:=$2
$aap_ptr:=$3

ARRAY POINTER:C280($afp;$NumberOfColumns_i)
ARRAY POINTER:C280($aap;$NumberOfColumns_i)

COPY ARRAY:C226($afp_ptr->;$afp)
COPY ARRAY:C226($aap_ptr->;$aap)

Case of 
	: ($NumberOfColumns_i=1)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->)
		
	: ($NumberOfColumns_i=2)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->)
		
	: ($NumberOfColumns_i=3)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->)
		
	: ($NumberOfColumns_i=4)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->)
		
	: ($NumberOfColumns_i=5)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->)
		
	: ($NumberOfColumns_i=6)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->)
		
	: ($NumberOfColumns_i=7)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->)
		
	: ($NumberOfColumns_i=8)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->)
		
	: ($NumberOfColumns_i=9)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->)
		
	: ($NumberOfColumns_i=10)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->)
		
	: ($NumberOfColumns_i=11)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->)
		
	: ($NumberOfColumns_i=12)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->)
		
	: ($NumberOfColumns_i=13)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->)
		
	: ($NumberOfColumns_i=14)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->)
		
	: ($NumberOfColumns_i=15)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->)
		
	: ($NumberOfColumns_i=16)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->;$afp{16}->;$aap{16}->)
		
	: ($NumberOfColumns_i=17)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->;$afp{16}->;$aap{16}->;$afp{17}->;$aap{17}->)
		
	: ($NumberOfColumns_i=18)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->;$afp{16}->;$aap{16}->;$afp{17}->;$aap{17}->;$afp{18}->;$aap{18}->)
		
	: ($NumberOfColumns_i=19)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->;$afp{16}->;$aap{16}->;$afp{17}->;$aap{17}->;$afp{18}->;$aap{18}->;$afp{19}->;$aap{19}->)
		
	: ($NumberOfColumns_i=20)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->;$afp{16}->;$aap{16}->;$afp{17}->;$aap{17}->;$afp{18}->;$aap{18}->;$afp{19}->;$aap{19}->;$afp{20}->;$aap{20}->)
		
	: ($NumberOfColumns_i=21)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->;$afp{16}->;$aap{16}->;$afp{17}->;$aap{17}->;$afp{18}->;$aap{18}->;$afp{19}->;$aap{19}->;$afp{20}->;$aap{20}->;$afp{21}->;$aap{21}->)
		
	: ($NumberOfColumns_i=22)
		SELECTION TO ARRAY:C260($afp{1}->;$aap{1}->;$afp{2}->;$aap{2}->;$afp{3}->;$aap{3}->;$afp{4}->;$aap{4}->;$afp{5}->;$aap{5}->;$afp{6}->;$aap{6}->;$afp{7}->;$aap{7}->;$afp{8}->;$aap{8}->;$afp{9}->;$aap{9}->;$afp{10}->;$aap{10}->;$afp{11}->;$aap{11}->;$afp{12}->;$aap{12}->;$afp{13}->;$aap{13}->;$afp{14}->;$aap{14}->;$afp{15}->;$aap{15}->;$afp{16}->;$aap{16}->;$afp{17}->;$aap{17}->;$afp{18}->;$aap{18}->;$afp{19}->;$aap{19}->;$afp{20}->;$aap{20}->;$afp{21}->;$aap{21}->;$afp{22}->;$aap{22}->)
		
End case 

