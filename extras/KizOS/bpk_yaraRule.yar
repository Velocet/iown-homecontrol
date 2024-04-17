/* Somfy Binary PacKage (BPK/BPK2) YARA Rule */
/* TODO: Animeo IP MAC OUI Check: 73:6D:66 ("smf") or ("qmf") cause of multicast bit */

rule SomfyBPK {
meta:
  desc = "Somfy Binary PacKage (BPK/BPK2) File Type"
  weight = 1
strings:
  $filetype_bpk       = {53 4F 46 59 00} // SOFY
  $bootloader         = {50 42 4c 00 00} // P_BL
  $bootloader_version = {50 42 4c 56 00} // P_BL_V
  $kernel             = {50 4b 45 52 00} // P_KER
  $rootfs             = {50 52 46 53 00} // P_RFS
  $firmware_version   = {46 57 56 00 00} // FW_V
  //$description.gz     = {44 45 63 43 00} // DEcC - Wrong?
  //$description.gz     = {44 45 53 43 00} // DESC
  //$description        = {44 45 5A 43 00} // DEZC
condition:
  // BPK signature at offset 0 ...
  ($filetype_bpk at 0) or (uint32(0) == $filetype_bpk)
}
