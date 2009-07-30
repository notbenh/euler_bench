use v6;

# based on code by PerlJam 

my $pass_start = 5;     # start at the first number divisible by three after this one
my $pass_end = 17;      # 17 * 6 has an additional digit
loop
{
    loop (my $n = $pass_start + 1; $n < $pass_end; $n += 3)
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
