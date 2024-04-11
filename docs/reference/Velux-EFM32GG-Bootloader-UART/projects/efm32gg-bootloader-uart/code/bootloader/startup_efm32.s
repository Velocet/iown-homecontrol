; *----------------------------------------------------------------------------
; * @file:    startup_efm32.s
; * @purpose: CMSIS Cortex-M3 Core Device Startup File
; *           for the Silicon Labs EFM32 Gecko Device Series
; * @version x.xx
; *----------------------------------------------------------------------------
; * <b>Copyright 2015 Silicon Laboratories, Inc. http://www.silabs.com</b>
; *----------------------------------------------------------------------------
; *
; * This file is licensed under the Silabs License Agreement. See the file
; * "Silabs_License_Agreement.txt" for details. Before using this software for
; * any purpose, you must agree to the terms of that agreement.
; *
; *----------------------------------------------------------------------------

        MODULE  ?cstartup

        ;; Forward declaration of sections.
        SECTION CSTACK:DATA:NOROOT(3)
        SECTION .intvec:CODE:NOROOT(2)

        EXTERN  __iar_program_start
        PUBLIC  __vector_table
        PUBLIC  __Vectors, __Vectors_End, __Vectors_Size
        PUBLIC  exit, _exit, __exit

        DATA

__vector_table
        DCD     sfe(CSTACK)
        DCD     __iar_program_start

__Vectors_End
__Vectors       EQU   __vector_table
__Vectors_Size  EQU   __Vectors_End - __Vectors


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Define exit symbols to avoid the default versions
;;
        THUMB

        SECTION .text:CODE:REORDER:NOROOT(2)
exit:
_exit:
__exit:
        B exit

        END
