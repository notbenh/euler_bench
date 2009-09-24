# Euler Problem #1 in PIR
# Jonathan "Duke" Leto <jonathan@leto.net>

.sub 'main' :main
   .local pmc sum, max, m, i
   i   = new 'Integer'
   sum = new 'Integer'
   max = new 'Integer'
   m   = new 'Integer'
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
