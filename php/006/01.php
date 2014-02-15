<?
    $n = $argv[1];

    if ($n == '') {
        $n = 100;
    }

    $sum_of_squares = 0;
    $square_of_sum  = 0;

    for ( $i = 1; $i <= $n; $i++ ) {
        $sum_of_squares += $i*$i;
    }

    $square_of_sum = pow(($n * ($n+1) / 2),2);

    $diff = abs($sum_of_squares - $square_of_sum);

    printf("%d\n", $diff);
?>
