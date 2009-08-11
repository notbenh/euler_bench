my $current_triangle_num = 1;
my $counter = 1;

while( my $div_ct = count_divisors($current_triangle_num) and $div_ct < 500 ) {
    #say "$current_triangle_num has $div_ct divisors\n";
    $current_triangle_num += ++$counter;
}
say $current_triangle_num;

sub count_divisors {
    my $num = shift;

    my $candidate_divisor = $num;
    my $divisor_count = 0;

    #my @divisors;
    while( $candidate_divisor > 0 ) {
        if( $num % $candidate_divisor == 0 ) {
            $divisor_count++;
            #unshift @divisors, $candidate_divisor;
        }
        $candidate_divisor--;
    }

    #say "$num\n".join(',',@divisors);

    return $divisor_count;
}
