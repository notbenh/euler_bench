#!/usr/local/bin/perl

use strict; use warnings;

#Problem 79
#
#A common security method used for online banking is to ask the user for three random characters from a passcode. For example, if the passcode was 531278, they may asked for the 2nd, 3rd, and 5th characters; the expected reply would be: 317.
#
#The text file, keylog.txt, contains fifty successful login attempts.
#
#Given that the three characters are always asked for in order, analyse the file so as to determine the secret passcode of unknown length.




# assumptions - every digit that is in the passcode is in the file
# no digit is repeated in the sequence


open my $fh, 'keylog.txt' or die "no open keylog.txt: $!\n";

my @entries = <$fh>;   # slurp it in
my $passcode =  $entries[0];


foreach my $entry ( @entries ){
    chomp $entry;

    my ($first, $second, $third) = split //, $entry;

    my $first_chunk  = substr $entry, 0, 2;
    my $second_chunk = substr $entry, 1, 3;

    #print "first chunk: $first_chunk\n";
    #print "second chunk: $second_chunk\n";

    # insert new digits
    $passcode =~ s/$first/$first_chunk/   unless $passcode =~ /$second/ ;
    $passcode =~ s/$second/$first_chunk/  unless $passcode =~ /$first/ ;
    $passcode =~ s/$second/$second_chunk/ unless $passcode =~ /$third/ ;
    $passcode =~ s/$third/$second_chunk/  unless $passcode =~ /$second/;

    $passcode =~ s/$second(.*)$first/$first$1$second/;
    $passcode =~ s/$third(.*)$second/$second$1$third/;

    #print "entry: $entry, passcode: $passcode\n";

    #remove duplicates:
    my %count;
    $passcode = join('', map { $count{ $_ }++ ? '' : $_ } split //, $passcode );

}

print "Passcode: $passcode\n";
