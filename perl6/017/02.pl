use v6;

# Euler Project #17: http://projecteuler.net/index.php?section=problems&id=17
# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
# words, how many letters would be used?
#
# Notes say something about "and" in numbers, but I have ignored this as I
# have no idea how to count this.
#
# Obvious optimizations: Just store the number of letters in each word rather
# than the actual string.  That's harder to test, but would be vastly more
# efficient.

my %number_lengths = (
    1 => 3,
    2 => 3,
    3 => 5,
    4 => 4,
    5 => 4,
    6 => 3,
    7 => 5,
    8 => 5,
    9 => 4,
    10 => 3,
    11 => 6,
    12 => 6,
    13 => 8,
    14 => 8,
    15 => 7,
    16 => 7,
    17 => 9,
    18 => 8,
    19 => 8,
    20 => 6,
    30 => 6,
    40 => 5,
    50 => 5,
    60 => 5,
    70 => 7,
    80 => 6,
    90 => 6
);

for 1..9 -> $n
{
    %number_lengths{$n * 100} = %number_lengths{$n} + 7;
}

sub NumberLength(@numbers, %number_lengths, $number)
{
    given $number
    {
        when 0 { return 4; }
        when 1000 { return 11; }
    }
    my $n = $number;
    my $length = 0;
    while ($n > 0)
    {
        my $biggest = @numbers.grep({$_ <= $n}).max;
        $length += %number_lengths{$biggest};
        $n -= $biggest;
    }
    return $length;   
}

my @numbers = %number_lengths.keys.map({+$_});
my $letter = 0;
for 1..1000 -> $number
{
    $letter += NumberLength(@numbers, %number_lengths, $number);
}
say $letter;
