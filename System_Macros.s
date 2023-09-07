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