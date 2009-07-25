# This uses typed variables to see the speed impact, otherwise the same as 01

my Int $prime_cnt = 2;
my Int $i = 3;
while ( $prime_cnt < 10001 ) {
    $i += 2;
    if ( is_prime($i) ) {
        $prime_cnt++;
        #say "$i is prime ($prime_cnt)";
    }
}
say $i;


sub is_prime( Int $n) {

    my $x = 3;
    while ( $x <= sqrt $n ) {
        return 0 unless $n % $x;
        $x += 2;
    }

    return 1;
}
