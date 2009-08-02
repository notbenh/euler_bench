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

my %number_names = (
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen",
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
);

for 1..9 -> $n
{
    %number_names{$n * 100} = %number_names{$n} ~ " hundred";
}

sub NumberName(%number_names, $number)
{
    given $number
    {
        when 0 { return "zero"; }
        when 1000 { return "one thousand"; }
    }
    my $n = $number;
    my $name = "";
    while ($n > 0)
    {
        $name ~= " " if $name.chars > 0;
        my $biggest = %number_names.keys.grep({$_ <= $n}).map({+$_}).max;
        $name ~= %number_names{$biggest};
        $n -= $biggest;
    }
    return $name;   
}

my $letter = 0;
for 1..1000 -> $number
{
    my $name = NumberName(%number_names, $number);
    # say "$number => $name";
    $name.subst(rx/<alpha>/, { $letter++ }, :g);
}
say $letter;