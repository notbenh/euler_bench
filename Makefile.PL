use strict;
use warnings;
use inc::Module::Install;
use 5.008001;

name 'EulerBench';
perl_version '5.010000';
version '0.1.0';
#all_from 'lib/Moose.pm';
license 'perl';

requires
    'App::Rad'              => '0';
requires
    'File::Fu'              => '0';
requires
    'Data::Dumper'          => '0';
requires
    'Scalar::Util'          => '0';
requires
    'List::Util'            => '0';
requires
    'File::Spec::Functions' => '0';
requires
    'Benchmark'             => '0';
requires
    'JSON'                  => '0';


auto_install;
WriteAll();
