# Copyright (C) 2009, Jonathan "Duke" Leto <jonathan@leto.net>

.sub 'main'
    .local pmc sum, squaresum
    sum       = new 'Integer'
    squaresum = new 'Integer'
    $P1       = new 'Integer'
    $P2       = new 'Integer'
    $P3       = new 'Integer'
    $P4       = new 'Integer'
    sum       = 0
    squaresum = 0
    $P1       = 1
  loop:
    sum       += $P1
    $P2        = $P1 * $P1
    squaresum += $P2
    if $P1 >= 100 goto done
    inc $P1
    goto loop
  done:
    $P3 = sum * sum
    $P4 = $P3 - squaresum
    print $P4
    print "\n"
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

