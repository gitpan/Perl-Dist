#!/usr/bin/perl

use strict;
BEGIN {
	$|  = 1;
	$^W = 1;
}

# Skip if not on Windows
use Test::More;
BEGIN {
	unless ( $^O eq 'MSWin32' ) {
		plan( skip_all => 'Not on Win32' );
		exit(0);
	}
	unless ( $ENV{TEST_PERLDIST_ALL} ) {
		plan( skip_all => 'Skipping multi-hour tests to avoid breaking CPAN Testers' );
		exit(0);
	}
	plan( tests => 11 );
}

use File::Path ();
use File::Spec::Functions ':ALL';
use_ok( 't::lib::Test' );

# Create the dist object
my $dist = t::lib::Test->new1;
isa_ok( $dist, 't::lib::Test1' );

# Run the dist object, and ensure everything we expect was created
ok( $dist->run, '->run ok' );
ok( -f "C:\\tmp\\sp\\image\\dmake\\bin\\dmake.exe", 'Found dmake.exe' );
ok( -f "C:\\tmp\\sp\\image\\dmake\\bin\\startup\\Makefile.in", 'Found startup' );
