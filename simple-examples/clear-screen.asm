.const SCREEN = $03ff        // one before the address of the start of the screen in RAM

BasicUpstart2(main)          // automatically make the basic sys call to start the program

* = $1000                    // where to start our program in RAM

main:
    jsr cls
    rts

cls:
    lda #32                  // put the value for a space in the Accumulator
    ldx #250                 // let's fill the 1000 (40 * 25) screen addresses in chunks of 250

cls_loop:                    // fill 4 screen addresses with the value from the Accumulator (a space) 
    sta SCREEN, X            // + 250, 249, 248, ..., 1
    sta SCREEN + $00fa, X    // + 500, 499, 498, ..., 251
    sta SCREEN + $01f4, X    // + 750, 749, 748, ..., 501
    sta SCREEN + $02ee, X    // +1000, 999, 998, ..., 751

    dex                      // dcrementing makes the comparison (with 0) easier on the next line
    bne cls_loop             // keep filling 4 addresses until they're all done (x = 0)

    rts
