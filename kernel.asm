bits 32				; generate code for 32 bit proc
section .text		; code section

	; Multiboot header
	align 4
	dd 0x1badb002			; magic
	dd 0x00					; flags
	dd -(0x1badb002 + 0x00)	; checksum: magic + flags + checksum = 0

global start
extern kmain

start:
	cli				; clear interrupts
	call kmain
	hlt
