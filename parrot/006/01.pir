# Copyright (C) 2009, Jonathan "Duke" Leto <jonathan@leto.net>

.sub 'main'
    .local int sum, squaresum
    sum       = 0
    squaresum = 0
    $I1       = 1
  loop:
    sum       += $I1
    $I2        = $I1 * $I1
    squaresum += $I2
    if $I1 >= 100 goto done
    inc $I1
    goto loop
  done:
    $I3 = sum * sum
    $I4 = $I3 - squaresum
    print $I4
    print "\n"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

