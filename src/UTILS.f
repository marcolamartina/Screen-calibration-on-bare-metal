
HEX

\ UTILS

1 CONSTANT ENABLE
0 CONSTANT DISABLE


: BITMASK ( VALUE - 2^VALUE )
  1 SWAP LSHIFT ;


: SET_BIT ( VALUE ADDRESS BIT_POSITION -- )
  BITMASK ROT
  0= IF
    INVERT OVER @ AND
  ELSE
    OVER @ OR
  THEN SWAP ! ;


: GET_BIT ( ADDRESS POSITION_BIT -- VALUE )
  SWAP @ SWAP RSHIFT 2 MOD ;


: MASK ( BIT_POSITION_INITIAL BIT_POSITION_FINAL -- MASK )
  BITMASK 2* 1- SWAP BITMASK 1- - ;


: SET ( VALUE ADDRESS BIT_POSITION_INITIAL BIT_POSITION_FINAL -- )
  2DROP ! ;


: GET ( ADDRESS BIT_POSITION_INITIAL BIT_POSITION_FINAL -- VALUE )
  OVER >R \ DUPLICATE BIT_POSITION_INITIAL ONTO THE RETURN STACK
  MASK SWAP @ AND \ REGISTER'S CONTENT AND MASK
  R> RSHIFT ; \ RIGHT SHIFT


: R@ \ ( -- n )
  R> R> DUP >R SWAP >R ;

: ++ \ ( VARIABLE -- )
  1 SWAP +! ;

: -- \ ( VARIABLE -- )
  1 SWAP -! ;

: /100 \ ( N -- N )
  64 / ;