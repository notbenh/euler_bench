my $current_triangle_num = 0;
my $counter = 0;

while( num_factors($current_triangle_num) <= 500 ) {
    $current_triangle_num += ++$counter;
}
say $current_triangle_num;

sub count_factors($num) {
    my $candidate_factor = $num;
    my $factor_count = 0;

    while( $candidate_factor-- % $num == 0 ) {
        
    }
}
