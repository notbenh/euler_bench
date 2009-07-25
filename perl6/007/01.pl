my $prime_cnt = 2;
my $i = 3;
while ( $prime_cnt < 10001 ) {
    $i += 2;
    if ( test_prime($i) ) {
        $prime_cnt++;
        #say "$i is prime ($prime_cnt)";
    }
}
say $i;


sub test_prime($n) {

    my $x = 3;
    while ( $x < $n ) {
        return 0 unless $n % $x;
        $x += 2;
    }

    return 1;
}
