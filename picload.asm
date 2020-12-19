;*******************************************************************************
;*
;* Setup the display list and image with a simple DLI at load time 
;* from a file.
;*
;*******************************************************************************
                      
; ==========================================================================
; Atari System Includes (MADS assembler)
	icl "ANTIC.asm" ; Display List registers
	icl "GTIA.asm"  ; Color Registers.
	icl "POKEY.asm" ;
	icl "PIA.asm"   ; Controllers
	icl "OS.asm"    ;
	icl "DOS.asm"   ; LOMEM, load file start, and run addresses.
; --------------------------------------------------------------------------

; ==========================================================================
; Macros (No code/data declared)
	icl "macros.asm"

; --------------------------------------------------------------------------

; ==========================================================================
; Declare some Page Zero variables.
; The Atari OS owns the first half of Page Zero.
; --------------------------------------------------------------------------

	ORG $E4     

; Let's make some code to pause here to make sure the display is off
; WHILE the program loads all its data into memory and bashes on 
; some registers in a rude and unlicensed way.

Init_TurnOffScreen

	lda #0
	sta SDMCTL  ; Turn off screen DMA
	
	lda RTCLOK60
	
b_Init_WaitForTopOfFrame	
	cmp RTCLOK60
	beq b_Init_WaitForTopOfFrame
	
	rts

; ==========================================================================

; A Place to wait at the end to sit and watch the screen

LoopHereForevah  
	jmp LoopHereForevah


; ==========================================================================

; Changing the greens to reds to make the elf more festive.

DLIForElf
	pha
	
	lda #$4A     ; reddish
	sta WSYNC   
	sta COLPF1
	lda #$32     ; dark redish
	sta COLPF2

	pla
	
	rti

; ==========================================================================

	; Make DOS execute the screen off immediately, so we can bang on the
	; registers and shove a display list into memory on top of the 
	; likely current display list and screen memory for DOS.

	ORG DOS_INIT_ADDR
	.word Init_TurnOffScreen
	
; ==========================================================================

; Slap data into the registers. . . .

DISPLAY_LIST = $8F98  ; This is where graphics mode 7 is on any 48K or more Atari.

	mDiskDPoke SDLSTL,DISPLAY_LIST
	
	mDiskDPoke VDSLST,DLIForElf

	ORG COLOR0
	.byte $0C,$CC,$F6,$00,$0E ; 
	
	ORG DISPLAY_LIST	
	icl "image.asm"   ; display list and screen memory.

	mDiskPoke NMIEN, [NMI_DLI|NMI_VBI]

	mDiskPoke SDMCTL, [ENABLE_DL_DMA|PLAYFIELD_WIDTH_NORMAL]
	
; ==========================================================================

	mDiskDPoke DOS_RUN_ADDR,LoopHereForevah

