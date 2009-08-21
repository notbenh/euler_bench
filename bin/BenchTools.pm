package BenchTools;
use strict;
use warnings;
use 5.010;
use Cwd qw{abs_path};
use File::Basename;
use File::Find;
use Data::Dumper;
use Scalar::Util qw{looks_like_number};
use List::Util qw{min max};
use YAML qw{LoadFile};
use Benchmark::Stopwatch::Pause; 

use Exporter qw{import};
use Memoize;
our @EXPORT = qw{
   D
   root_dir
   base_dir
   config
   solutions
   problems
   problems_hash
   languages
   languages_hash
   build_runs
   run_command
};

sub D (@){print Dumper(@_)}; #so I'm lazy 

memoize('root_dir');
sub root_dir { 
   my $root_dir = [fileparse(abs_path(__FILE__))]->[1];
   my $base_dir = base_dir();
   $root_dir =~ s/(.*)$base_dir.?/$1/; # cd ..
   return $root_dir;
}

memoize('base_dir');
sub base_dir { basename([fileparse(abs_path(__FILE__))]->[1]) }

memoize('config');
sub config { LoadFile( [fileparse(abs_path(__FILE__))]->[1] . 'config.yaml') }

memoize('solutions');
sub solutions {
   my $root_dir = root_dir();
   my $solutions = {};
   find(sub{ my $p = $File::Find::name; 
             $p =~ s/$root_dir//; 
             my ($lang,$prob,$solution) = split /[\/]/, $p;
             $solutions->{$lang}->{$prob}->{$solution} = $File::Find::name
               if $lang !~ m/^(?:bin|inc|[.]git)/ 
               && defined $lang        # language should be in a useful format
               && length $lang
               && defined $solution    # we should have a solution
               && length $solution     
               && $solution !~ m/^[.]/ # hide any 'hidden' file
               ;
           }, $root_dir);
   return $solutions;
}

memoize('problems');
sub problems { return map{keys %$_} values %{solutions()} }
memoize('problems_hash');
sub problems_hash { return {map{$_=>1} problems } }

memoize('languages');
sub languages { return keys %{solutions()} }
memoize('languages_hash');
sub languages_hash { return {map{$_=>1} languages } }

memoize('build_runs');
sub build_runs {
   my $requested = shift;
   [ map{ my $lang=$_; 
D {LANG => $lang};
        map { my $interp = $_;
D {LANG => $interp};
              map{ my $prob = $_;
D {LANG => $prob};
                   map{ { language    => $lang,
                          interpreter => $interp,
                          problem     => $prob,
                          file        => $_,
                          %{ run_command( join ' ', $interp, $_, (config()->{hide_cmd_output}) ? '&> /dev/null' : '',
                                          $requested->{opt}->{count}
                                        )
                           }
                        };
                      } sort values %{solutions()->{$lang}->{$prob}} #4 now get every path
                 } @{$requested->{prob}}                   #3 for every problem that was requested
            } @{ config()->{language}->{$lang}->{interp} } #2 for every interep for that language in the config
        } @{$requested->{lang}}                            #1 for every language requested
   ];
}

sub run_command {
   my ($cmd,$count) = @_;
   my $sw = Benchmark::Stopwatch::Pause->new->start->pause;
   for (1..$count) {
      $sw->unpause($_);
      my $rv = qx($cmd); #better trap output for use if needed
      $sw->pause;
      # if you want to check the results.... do it here.
   }
   $sw->stop;

   my $data = $sw->as_unpaused_data;
   shift @{$data->{laps}}; # no point in keeping _start_
   my @times = map{$_->{elapsed_time}} @{$data->{laps}};
   return { max   => max(@times),
            min   => min(@times),
            times => \@times,
            total => $data->{total_elapsed_time},
            avg   => $data->{total_elapsed_time}/scalar(@times),
          };

}


1;
