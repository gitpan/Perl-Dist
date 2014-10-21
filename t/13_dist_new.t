#!/usr/bin/perl

use strict;
BEGIN {
	$|  = 1;
	$^W = 1;
}

use Test::More;
BEGIN {
	unless ( $^O eq 'MSWin32' ) {
		plan( skip_all => 'Not on Win32' );
		exit(0);
	}
	plan( tests => 10 );
}

use File::Spec::Functions ':ALL';
use t::lib::Test;





#####################################################################
# Constructor Test

# Create the dist object
my $dist = t::lib::Test->new1(13);
isa_ok( $dist, 't::lib::Test1' );

# Run the dist object, and ensure everything we expect was created
ok( $dist->run, '->run ok' );
ok( -f catfile( qw{ t tmp13 image c bin dmake.exe } ), 'Found dmake.exe' );
ok( -f catfile( qw{ t tmp13 image c bin startup Makefile.in } ), 'Found startup' );
