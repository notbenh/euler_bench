use 5.10.0;

my @primes = (2,3);
my @spokes = (0);
my $spix = 1;
my $spth = 9;

my $prime_cnt = 2;
my $z = $primes[-1];

while ( $prime_cnt < 10_001 ) {
	$z += 2;	# skip evens
	add_spoke();

	my $ix = 1;	# skip factors of 2
	while ( $ix < $spix ) {
		$spokes[$ix] += $primes[$ix]
			if ( $spokes[$ix] < $z );

		if ( $z == $spokes[$ix] ) {
			$z += 2;
			add_spoke();
			$ix = 1;
		}
		else {
			$ix += 1;
		}
	}

	push(@primes, $z);
	++$prime_cnt;
}

sub add_spoke {
	if ( $z == $spth ) {
		$spokes[$spix] = $spth;
		$spix += 1;
		$spth = $primes[$spix] ** 2;
	}
}

say $primes[-1];
