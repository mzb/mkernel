OUTPUT_FORMAT(elf32-i386)
ENTRY(start)
SECTIONS
{
	. = 0x100000; /* set location counter - beginning of code section */
	.text : { *(.text) } /* merge code sections from all inputs */
	.data : { *(.data) }
	.bss  : { *(.bss)  }
}
