BasicUpstart2(start)
        * = $4000 "Main Program"
start:  lda #$07
		sta $d020	// set background to 7
		lda #$ff
		sta $d015  	// turn on all sprites
		lda #$d     // 13 * 64 -> 832  (D h -> 13 d)
		sta $07f8	// set sprite data location ($07f8 h -> 2040 d)

		// lda #$00
		// sta $0340
		// lda #$00
		// sta $0341
		// lda #$00
		// sta $0342
		// lda #$20
		// sta $0343
		// lda #$00
		// sta $0344
		// lda #$04
		// sta $0345
		// lda #$60
		// sta $0346
		// lda #$00
		// sta $0347
		// lda #$06
		// sta $0348
		// lda #$11
		// sta $0349
		// lda #$ff
		// sta $034a
		// lda #$88
		// sta $034b
		// lda #$09
		// sta $034c
		// lda #$00
		// sta $034d
		// lda #$90
		// sta $034e
		// lda #$01
		// sta $034f
		// lda #$00
		// sta $0350
		// lda #$80
		// sta $0351
		// lda #$01
		// sta $0352
		// lda #$00
		// sta $0353
		// lda #$80
		// sta $0354
		// lda #$0f
		// sta $0355
		// lda #$7e
		// sta $0356
		// lda #$f0
		// sta $0357
		// lda #$08
		// sta $0358
		// lda #$00
		// sta $0359
		// lda #$10
		// sta $035a
		// lda #$08
		// sta $035b
		// lda #$24
		// sta $035c
		// lda #$10
		// sta $035d
		// lda #$08
		// sta $035e
		// lda #$00
		// sta $035f
		// lda #$10
		// sta $0360
		// lda #$08
		// sta $0361
		// lda #$00
		// sta $0362
		// lda #$10
		// sta $0363
		// lda #$08
		// sta $0364
		// lda #$00
		// sta $0365
		// lda #$10
		// sta $0366
		// lda #$0a
		// sta $0367
		// lda #$a5
		// sta $0368
		// lda #$50
		// sta $0369
		// lda #$00
		// sta $036a
		// lda #$00
		// sta $036b
		// lda #$00
		// sta $036c
		// lda #$00
		// sta $036d
		// lda #$00
		// sta $036e
		// lda #$00
		// sta $036f
		// lda #$02
		// sta $0370
		// lda #$00
		// sta $0371
		// lda #$40
		// sta $0372
		// lda #$04
		// sta $0373
		// lda #$00
		// sta $0374
		// lda #$20
		// sta $0375
		// lda #$18
		// sta $0376
		// lda #$00
		// sta $0377
		// lda #$18
		// sta $0378
		// lda #$08
		// sta $0379
		// lda #$00
		// sta $037a
		// lda #$10
		// sta $037b
		// lda #$00
		// sta $037c
		// lda #$00
		// sta $037d
		// lda #$00
		// sta $037e
		// lda #$03
		// sta $037f

		lda #$64
		sta $d000	// sprite 0 x
		lda #$64
		sta $d001 	// sprite 0 y
loop:	inc $d000
		.for(var j=0; j<10000; j++) {
			nop
		}		
		jmp loop		

		*=$0340 "Sprite data"
sprite_0:
		.byte $00,$00,$00,$20,$00,$04,$60,$00
		.byte $06,$11,$ff,$88,$09,$00,$90,$01
		.byte $00,$80,$01,$00,$80,$0f,$7e,$f0
		.byte $08,$00,$10,$08,$24,$10,$08,$00
		.byte $10,$08,$00,$10,$08,$00,$10,$0a
		.byte $a5,$50,$00,$00,$00,$00,$00,$00
		.byte $02,$00,$40,$04,$00,$20,$18,$00
		.byte $18,$08,$00,$10,$00,$00,$00,$03
sinus:
		.byte $00,$01,$03,$04,$05,$06,$07,$09,$0A,$0B,$0C,$0D,$0E,$0F,$0F,$10
 		.byte $11,$12,$12,$13,$13,$13,$14,$14,$14,$14,$14,$14,$14,$13
 		.byte $13,$13,$12,$12,$11,$10,$0F,$0F,$0E,$0D,$0C,$0B,$0A,$09,$07
 		.byte $06,$05,$04,$03,$01,$00,-1,-3,-4,-5,-6,-7,-9,-10,-11,-12
 		.byte  -13,-14,-15,-15,-16,-17,-18,-18,-19,-19,-19,-20
 		.byte  -20,-20,-20,-20,-20,-20,-19,-19,-19,-18,-18,-17
 		.byte  -16,-15,-15,-14,-13,-12,-11,-10,-9,-7,-6,-5,-4,-3,-1
		jmp *