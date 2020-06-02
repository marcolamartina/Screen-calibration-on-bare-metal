SYSTIMER_CLO=0xFE003004

.global _start
_start:
  ldr r0, [r13], #4
  delay .req r0
  time_lo .req r2
  time_hi .req r3
  elapsed_time_lo .req r2
  start_time_lo .req r4
  ldr r1,=SYSTIMER_CLO
  ldrd time_lo, time_hi, [r1] /* Read current time (64-bit value) */
  mov start_time_lo, time_lo
  1:    ldrd time_lo, time_hi, [r1] /* Read current time (64-bit value) */
  sub elapsed_time_lo, time_lo, start_time_lo
  cmp elapsed_time_lo, delay
  bls 1b
  .unreq start_time_lo
  .unreq elapsed_time_lo
  .unreq delay
  .unreq time_hi
  .unreq time_lo
  bx lr
