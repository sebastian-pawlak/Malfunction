; "Malfunction", Atari XL/XE Intro 32B
; (26 bytes of code + 6 bytes of header)
; code by tr1x / Agenda
; requirements: original Atari XL/XE 64KB PAL
; version: 1.0
; release date: 2021-03-13

vvblkd	equ $0224
switrom	equ $c8fc
xitvbv	equ $e462


	org $00b0

start	jmp switrom

	; VBLANK interrupt routine
vbrout	ldy #$0a
	inc vbrout+1
loop
opcode	lda #$01
	inc opcode+1
	sta $d000,y
	dey
	bpl loop
	jmp xitvbv


	org vvblkd
	.word .adr(vbrout)

	;run start