# Euler Problem #1 in PIR
# Jonathan "Duke" Leto <jonathan@leto.net>
# This appears to be the same speed as the Perl 5 implementation
# with Parrot  1.4.0

.sub 'main' :main
   .local int sum, max, m, i
   i   = 1
   max = 999
   sum = 0
loop:
    mod m, i, 3
    if m == 0 goto found
    mod m, i, 5
    if m == 0 goto found
    inc i
    if i > max goto done
    goto loop
found:
    sum = sum + i
    inc i
    if i > max goto done
    goto loop
done:
    say sum
.end
