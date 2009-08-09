use v6;

sub IsPalindromicIn10($n)
{
    return (~$n).flip eq ~$n;
}

sub IsPalindromicIn2($n)
{
    my $bin = sprintf("%b", $n);
    return $bin.flip eq $bin;
}

my $upper_limit = 10000; # should be 1000000, but that takes forever to run on
                         # Rakudo right now.
my @p = gather loop (my $i = 1; $i < $upper_limit; $i+=2) 
               { 
                   take +$i if IsPalindromicIn10($i) && IsPalindromicIn2($i); 
               };
@p.perl.say;
@p.map({sprintf("%b", $_)}).perl.say;
say [+] @p;