//mega65 memory map
VIC:{

    .label SCREEN = $0800
    .label MEMORY_SETUP = $D018
    .label COLOR_RAM = $D800 //this is only 1K until you set $D030 bit 1
    .label BORDER_COLOR = $D020
    .label SCREEN_COLOR = $D021
    .label RASTER_LINE = $D012
    .label YSCROLL = $D017
    .label XSCROLL = $D016
    .label BANKING_REG = $D030
}

SID:{
    .label VOICE3_LSB_FREQ = $D40E
    .label VOICE3_MSB_FREQ = $D40F
    .label VOICE3_CONTROL_REG = $D412
    .label VOICE3_VALUE = $D41B

    .label WAVE_VOICE_VALUE_NOISE = $80 //sid wave value, 128 bit-7 on all other bits off.
    .label NOISE_OSC3_READ_ONLY = $D41b    //sid osc noise byte - read only  
}

KERNAL:{
    .label CHROUT = $FFD2 //routine to print a chart to the screen
    .label GETIN = $FFE4 //get character from current input device
    .label INPUT = $FFCF //input chacter from from channel
}
  