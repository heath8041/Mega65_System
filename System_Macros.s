#import "../Mega65_System/memorymap.asm"

/**
 * .macro BasicUpstart65
 * 
 * Creates the 
 * <a href='#System_BasicUpstart65_Format'>Basic Upstart</a>
 * for the MEGA65 at location $2001
 * pointing to the given SYS entry address
 * 
 * @namespace System
 * 
 * @param {word} addr Pointer to the program entry point
 * 
 * .data BasicUpstart65_Format
 * 
 * @addr {word} $2001 Pointer to next end of command marker $2009
 * @addr {word} $2003 Basic Line number 10
 * @addr {dword} $2005 Basic "BANK 0"
 * @addr {word} $2009 Pointer to next snd of command marker after screencode string
 * @addr {word} $200b Basic Line number 20
 * @addr {byte} $200d Basic "SYS"
 * @addr {string} $200e Entry point as screencode string
 * @addr {byte} ???? Terminating Zero
 * @addr {word} ???? End of Basic terminating zeros
 * 
 */
 .macro System_BasicUpstart65(addr) {
	* = $2001
		.var addrStr = toIntString(addr)

		.byte $09,$20 //End of command marker (first byte after the 00 terminator)
		.byte $0a,$00 //10
		.byte $fe,$02,$30,$00 //BANK 0
		.byte <end, >end //End of command marker (first byte after the 00 terminator)
		.byte $14,$00 //20
		.byte $9e //SYS
		.text addrStr
		.byte $00
	end:
		.byte $00,$00	//End of basic terminators
}

/*
This function uses the VIC III banking register bit 1
to enable 2K of color ram at $D800 in bank 0.
the default configuration only has 1K color memory in bank 0
you need to turn this on if you are doing 80 char colums
otherwise you'll only get half of the screen to change colors.
*/
.macro System_Enable2KColorRamInBank0(){
	lda VIC.BANKING_REG //load it to acc
	ora #%00000001 //or with 1 to set only bit 1
	sta VIC.BANKING_REG //store it back
}

// .macro System_Store_Color_Ram_Pointer_on_Base_Page(){
//-------untested ---------
// //Store address $1F800 at base page address $40 - $43 .
// // ( Rememb er to use Little Endian order .)
// 	lda # $00
// 	sta $40
// 	lda # $F8
// 	sta $41
// 	lda # $01
// 	sta $42
// 	lda # $00 	
// 	sta $43
// }


