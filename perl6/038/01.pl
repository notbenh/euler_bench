use v6;

sub ConcatenatedProduct($integer, $n)
{
    return ((1..$n) >>*>> $integer).join;
}

sub IsPandigital($n)
{
    return $n.chars == 9
        && $n ~~ m/1/
        && $n ~~ m/2/
        && $n ~~ m/3/
        && $n ~~ m/4/
        && $n ~~ m/5/
        && $n ~~ m/6/
        && $n ~~ m/7/
        && $n ~~ m/8/
        && $n ~~ m/9/;
}

sub FindPotential(@seeds, $n)
{
    return @seeds.map({;$_ => ConcatenatedProduct($_,$n);}).grep({IsPandigital($_.value)});
}

# Okay: we know that ConcatenatedProduct(9, 5) is a solution, 918273645. We're
# looking for the max solution, and the beginning of each answer is our seed
# number. Therefore, seed numbers must have a first digit of 9 to be worth
# considering.  We can rule out 2 or 3 digit seeds, because any multiplier
# greater than 1 will give a 3 or 4 digit result (respectively), and there's
# no integer solution N for 2+3N = 9 or 3+4N = 9.

my @candidates;
@candidates.push: FindPotential(8..9, 5);
@candidates.push: FindPotential(9123..9876, 2);

die "Error -- even obvious solution missed!" if (@candidates.elems == 0);

@candidates.sort({.key}).max.perl.say;
