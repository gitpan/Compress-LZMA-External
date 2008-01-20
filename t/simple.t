#!perl
use strict;
use warnings;
use lib 'lib';
use Test::More tests => 3;
use Compress::LZMA::External;

my $data = 'X' x 1000;

my $compressed = compress($data);
is( length($compressed), 25 );

my $uncompressed = decompress($compressed);
is( length($uncompressed), 1000 );
is( $uncompressed, $data );
