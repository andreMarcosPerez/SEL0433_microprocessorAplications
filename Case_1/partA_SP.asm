;*******************************************************************************
; @INSTITUTION
;  University of Sao Paulo | Sao Carlos School of Engineering | SEL
;------------------------------------------------------------------------------
; @DISCIPLINE
;  Name: SEL0433 | Applications of Microprocessors I
;  Professor: Evandro Luis Linhari Rodrigues
;  Semester: 2017\01
;------------------------------------------------------------------------------
; @DEVELOPMENT
;  MCU:	Intel 8052
;  IDE: MCU 8051 v1.5.7
;  Compiler: IDE native assembler
;------------------------------------------------------------------------------
; @WARRANTY
;  Copyright (c) 2017 Andre Marcos Perez
;  The software is provided by "as is", without warranty of any kind, express or
;  implied, including but not limited to the warranties of merchantability,
;  fitness for a particular purpose and noninfringement. In no event shall the
;  authors or copyright holders be liable for any claim, damages or other
;  liability, whether in an action of contract, tort or otherwise, arising from,
;  out of or in connection with the software or the use or other dealings in the
;  software.
;------------------------------------------------------------------------------
; @EXERCISE
;  Case: # 1
;  Part: # A
;------------------------------------------------------------------------------
; @AUTHOR
;  Name:  Andre Marcos Perez
;  Email: andre.marcos.perez@usp.br
;  #USP:  8006891
;*******************************************************************************

;*******************************************************************************
; @CONSTANT
;  Code's constants
;------------------------------------------------------------------------------
	INTERNAL_RAM_SP_ADDRESS	EQU	81H
;*******************************************************************************

;*******************************************************************************
; @CODE
;  Main code
;------------------------------------------------------------------------------
	ORG	0
	LCALL	CHECK_ENDIANNESS
	SJMP	$
;*******************************************************************************

;*******************************************************************************
; @ROUTINE
;  CHECK_ENDIANNESS
;------------------------------------------------------------------------------
; @Description
;  Checks whether the processor is big endian or little endian and returns its
;  endianness on the F0 flag stored on the sfr PSW. Only works if the address
;  of the label CHECK_ENDIANNESS is stored on the first half of the internal rom,
;  between 0000H and 00FFH.
;------------------------------------------------------------------------------
; @Precondition
; INTERNAL_RAM_SP_ADDRESS: The address of the SP SFR stored on internal ram must 
;   			   be defined on this constant
;------------------------------------------------------------------------------
; @Param
;  Void
;------------------------------------------------------------------------------
; @Returns
;  F0: Equals 0 if the processor is big-endian and equals 1 otherwise
;------------------------------------------------------------------------------
; @See
;  https://en.wikipedia.org/wiki/Endianness
;------------------------------------------------------------------------------
CHECK_ENDIANNESS:
	MOV	R0,INTERNAL_RAM_SP_ADDRESS
	DEC	R0
	CJNE	@R0,#00H,LITTLE_ENDIAN
	CLR	F0
	RET
LITTLE_ENDIAN:
	SETB	F0
	RET
;*******************************************************************************
	END
