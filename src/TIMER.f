
: SECONDS ( SECONDS -- MICROSECONDS )
  F4240 * ;

: MILLISECONDS ( MILLISECONDS -- MICROSECONDS )
  3E8 * ;

CREATE DELAY
    E49D0004 , \	pop	{r0}		; (ldr r0, [sp], #4)
    E59F1018 , \	ldr	r1, [pc, #24]	; 8024 <_start+0x24>
    E1C120D0 , \	ldrd	r2, [r1]
    E1A04002 , \	mov	r4, r2
    E1C120D0 , \	ldrd	r2, [r1]
    E0422004 , \	sub	r2, r2, r4
    E1520000 , \	cmp	r2, r0
    9AFFFFFB , \	bls	8010 <_start+0x10>
    E12FFF1E , \	bx	lr
    FE003004 , \	.word	0xfe003004
    DOES> JSR DROP ;
