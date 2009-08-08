use v6;

# based on code by PerlJam 
# btilly points out that $n must be divisible by 9, which leads to a further factor
# of three speedup. 

my $pass_start = 5;     # start at the first number divisible by nine after this one
my $pass_end = 17;      # 17 * 6 has an additional digit
loop
{
    loop (my $n = $pass_start + 4; $n < $pass_end; $n += 9)
    {
        my $digits = (2*$n).comb.sort;
        next unless ($digits ~~ /0|5/);
        # say "$n ==> $digits";
    
        if $digits eq (3*$n).comb.sort
           && $digits eq (4*$n).comb.sort
           && $digits eq (5*$n).comb.sort
           && $digits eq (6*$n).comb.sort
        {
            say $n;
            exit 0;
        }
    }
    
    $pass_start *= 10;
    $pass_end *= 10;
}
