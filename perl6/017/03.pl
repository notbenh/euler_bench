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

my %number_lengths = (
    0 => 0, # special case -- we only hit this one as the $ones on a multiple of ten
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

my $one_to_ninety_nine = 0;
for 1..19 -> $number
{
    $one_to_ninety_nine += %number_lengths{$number};
}
for 20..99 -> $number
{
    my $ones = $number % 10;
    $one_to_ninety_nine += %number_lengths{$number - $ones} + %number_lengths{$ones};
}

my $letter = 10 * $one_to_ninety_nine;
for 1..9 -> $hundreds
{
    # 7 below is for "hundred"
    $letter += (%number_lengths{$hundreds} + 7) * 100;
}
$letter += 11; # 11 is for "one thousand"

say $letter;
