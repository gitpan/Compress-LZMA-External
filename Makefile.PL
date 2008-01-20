#!perl
use strict;
use Config;
use warnings;
use ExtUtils::MakeMaker;
use File::Spec::Functions;

print "Looking for lzma in path... ";
my $found = find('lzma');

if ($found) {
    print "found it at $found\n";
} else {
    print "didn't find it\n";
    die "****************************************************************
Compress::LZMA::External could not find program 'lzma'. Please 
install it and try again. For Ubuntu: sudo apt-get install lzma 
****************************************************************\n";
}

WriteMakefile(
    NAME         => 'Compress::LZMA::External',
    VERSION_FROM => 'lib/Compress/LZMA/External.pm',
    AUTHOR       => 'Leon Brocard <acme@astray.com>',
    LICENSE      => 'perl',
    PREREQ_PM    => { 'Test::More' => '0', }
);

sub find {
    my $binary   = shift;
    my $path_sep = $Config{path_sep};
    my $exe_ext  = $Config{exe_ext};
    foreach my $dir ( split $path_sep, $ENV{PATH} ) {
        my $filename = catfile( $dir, $binary );
        return $filename if -x "$filename$exe_ext";
    }
    return 0;
}
