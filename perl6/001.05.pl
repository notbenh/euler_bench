my $s = 0;
$s += $_ for grep { $_ % 3 == 0 or $_ % 5 == 0}, (1..1000);
say $s;



