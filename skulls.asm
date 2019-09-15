BasicUpstart2(init)

        * = $4000 "Main Program"
init: 	
		jsr $e544	// clear screen
		lda #$07
		sta $d020	// set background to 7
		lda #%00000001
		sta $d015  	// turn on sprite 0
		lda #$0d    // 13 * 64 -> 832  ($d -> 13)
		sta $07f8	// set sprite data location ($07f8 -> 2040)

		// set sprite 0 pos x,y
		lda #$00
		sta $d000	// sprite 0 x
		lda $5002
		sta $d001 	// sprite 0 y

start:	lda #$ff
		sta $5000   // loop counter starting from $ff
loop:	inc $d000	
		ldx $d000   // copy x pos to x
		ldy $d010
		cpy #$ff
		beq adjust_x_to_read_sine
back_from_adjust_x:
		lda $5002,x // copy sin(x) to a
		adc #$64    // add $64 to a
		sta $d001   // set pos y

		jmp set_msb_on
back_from_msb_on:		
		jmp set_msb_off
back_from_msb_off:
		lda #$ff
		sta $5001	// inner loop counter starting from $ff
inner_loop:
		nop
		.for(var i=0;i<20;i++) nop 
		dec $5001
		bne inner_loop
		
		dec $5000
		bne loop
		
		jmp start

adjust_x_to_read_sine:
		pha
		txa
		adc #$37 // dec 55
		tax
		pla
		jmp back_from_adjust_x

set_msb_on:
		lda $d000
		cmp #$ff
		bne back_from_msb_on 
		// there is $ff in a
		sta $d010
		lda #$00
		sta $d000
		jmp back_from_msb_off

set_msb_off:
		lda $d010
		cmp #$ff
		bne back_from_msb_off
		lda $d000
		cmp #$54
		beq off
		jmp back_from_msb_off

off: 	lda #$00
		sta $d010
		lda #$00
		sta $d000
		jmp back_from_msb_off

		* = $0340 "Sprite data"
		.byte $00,$00,$00,$20,$00,$04,$60,$00
		.byte $06,$11,$ff,$88,$09,$00,$90,$01
		.byte $00,$80,$01,$00,$80,$0f,$7e,$f0
		.byte $08,$00,$10,$08,$24,$10,$08,$00
		.byte $10,$08,$00,$10,$08,$00,$10,$0a
		.byte $a5,$50,$00,$00,$00,$00,$00,$00
		.byte $02,$00,$40,$04,$00,$20,$18,$00
		.byte $18,$08,$00,$10,$00,$00,$00,$03

		* = $5002 "Sine data"
		.byte $14,$15,$17,$18,$19,$1A,$1B,$1D
		.byte $1E,$1F,$20,$21,$22,$23,$23,$24
		.byte $25,$26,$26,$27,$27,$27,$28,$28
		.byte $28,$28,$28,$28,$28,$27,$27,$27
		.byte $26,$26,$25,$24,$23,$23,$22,$21
		.byte $20,$1F,$1E,$1D,$1B,$1A,$19,$18
		.byte $17,$15,$14,$13,$11,$10,$0F,$0E
		.byte $0D,$0B,$0A,$09,$08,$07,$06,$05
		.byte $05,$04,$03,$02,$02,$01,$01,$01
		.byte $00,$00,$00,$00,$00,$00,$00,$01
		.byte $01,$01,$02,$02,$03,$04,$05,$05
		.byte $06,$07,$08,$09,$0A,$0B,$0D,$0E
		.byte $0F,$10,$11,$13
		.byte $14,$15,$17,$18,$19,$1A,$1B,$1D
		.byte $1E,$1F,$20,$21,$22,$23,$23,$24
		.byte $25,$26,$26,$27,$27,$27,$28,$28
		.byte $28,$28,$28,$28,$28,$27,$27,$27
		.byte $26,$26,$25,$24,$23,$23,$22,$21
		.byte $20,$1F,$1E,$1D,$1B,$1A,$19,$18
		.byte $17,$15,$14,$13,$11,$10,$0F,$0E
		.byte $0D,$0B,$0A,$09,$08,$07,$06,$05
		.byte $05,$04,$03,$02,$02,$01,$01,$01
		.byte $00,$00,$00,$00,$00,$00,$00,$01
		.byte $01,$01,$02,$02,$03,$04,$05,$05
		.byte $06,$07,$08,$09,$0A,$0B,$0D,$0E
		.byte $0F,$10,$11,$13
		.byte $14,$15,$17,$18,$19,$1A,$1B,$1D
		.byte $1E,$1F,$20,$21,$22,$23,$23,$24
		.byte $25,$26,$26,$27,$27,$27,$28,$28
		.byte $28,$28,$28,$28,$28,$27,$27,$27
		.byte $26,$26,$25,$24,$23,$23,$22,$21
		.byte $20,$1F,$1E,$1D,$1B,$1A,$19,$18
		.byte $17,$15,$14,$13,$11,$10,$0F,$0E
		.byte $0D,$0B,$0A,$09,$08,$07,$06,$05
		.byte $05,$04,$03,$02,$02,$01,$01,$01
		.byte $00,$00,$00,$00,$00,$00,$00,$01
		.byte $01,$01,$02,$02,$03,$04,$05,$05
		.byte $06,$07,$08,$09,$0A,$0B,$0D,$0E
		.byte $0F,$10,$11,$13
