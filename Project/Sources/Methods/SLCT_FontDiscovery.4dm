//%attributes = {"invisible":true}
  // ----------------------------------------------------
  // Project Method: Util_FontDiscovery

  // Discovers the native fonts on this computer 

  // Created by Wayne Stewart (2019-06-22T14:00:00Z)
  //     wayne@4dsupport.guru
  // ----------------------------------------------------


C_LONGINT:C283($WindowID_i)
C_TEXT:C284($Form_t)

$Form_t:="SLCT_FontDiscovery"

$WindowID_i:=Open form window:C675($Form_t;Plain form window:K39:10;On the right:K39:3;At the bottom:K39:6)
DIALOG:C40($Form_t)
CLOSE WINDOW:C154