# Euler Problem #4 in PIR
# written by Bálint Szilakszi
# some modifications by chromatic
# This runs faster than the Perl 5 implementation with optimized Parrot ~1.7.0

.sub 'main'
    $I0 = 99
    $I1 = 99
    $I3 = 1
OUTMOST:
    if $I0 < 999 goto OUTER_LOOP
    goto FINISH
OUTER_LOOP:
    if $I1 < 999 goto INNER_LOOP
    $I1 = 99
    inc $I0
    goto OUTMOST
INNER_LOOP:
    inc $I1
    $I2 = $I0 * $I1

    # a hand-inlined function
    .local int val
    val = $I2

    .local int result
    result = 0

  LOOP:
    .local int mod_value
    mod_value = mod val, 10
    result += mod_value
    val /= 10
    result *= 10
    if val > 10 goto LOOP

  DONE:
    result += val
    # end of the hand-inlined function

    eq $I2, result, EQUAL_THING
    goto OUTER_LOOP
EQUAL_THING:
    $I4 = $I2
    if $I4 > $I3 goto SET_MAX
    goto OUTER_LOOP
SET_MAX:
    $I3 = $I4
    goto OUTER_LOOP
FINISH: say $I3
.end
