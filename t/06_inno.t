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
	};
	plan( tests => 27 );
}

use Perl::Dist::Inno ();





#####################################################################
# Main Tests

my $inno = Perl::Dist::Inno->new(
	app_name             => 'Strawberry Perl',
	app_ver_name         => 'Strawberry Perl 5.8.8 Alpha 3',
	app_publisher        => 'Vanilla Perl Project',
	app_publisher_url    => 'http://vanillaperl.org/',
	app_id               => 'strawberryperl',
	default_group_name   => 'Strawberry Perl',
	default_dir_name     => "C:\\",
	output_dir           => "C:\\",
	output_base_filename => 'strawberry-perl-5.8.8-alpha-3',
	source_dir           => "C:\\",
);
isa_ok( $inno, 'Perl::Dist::Inno' );
is( $inno->app_name             => 'Strawberry Perl', '->app_name ok' );
is( $inno->app_ver_name         => 'Strawberry Perl 5.8.8 Alpha 3', '->app_ver_name ok' );
is( $inno->app_publisher        => 'Vanilla Perl Project', '->app_publisher ok' );
is( $inno->app_publisher_url    => 'http://vanillaperl.org/', '->app_publisher_url ok' );
is( $inno->app_id               => 'strawberryperl', '->app_id ok' );
is( $inno->default_group_name   => 'Strawberry Perl', '->default_group_name ok' );
is( $inno->default_dir_name     => "C:\\", '->default_dir_name ok' );
is( $inno->output_dir           => "C:\\", '->output_dir ok' );
is( $inno->output_base_filename => 'strawberry-perl-5.8.8-alpha-3', '->output_base_filename ok' );
is( $inno->source_dir           => "C:\\" );
is( scalar($inno->files), 0,    '->files ok'    );
is( scalar($inno->icons), 0,    '->icons ok'    );
is( scalar($inno->registry), 0, '->registry ok' );
is_deeply( [ $inno->files ],    [], '->files ok'    );
is_deeply( [ $inno->icons ],    [], '->icons ok'    );
is_deeply( [ $inno->registry ], [], '->registry ok' );

# Add a file
is( $inno->add_file(
	source             => 'dmake\*',
	dest_dir           => '{app}\dmake',
	recurse_subdirs    => 1,
	create_all_subdirs => 1,
), 1, '->add_file returns true' );
is( scalar($inno->files), 1, '->files returns true' );
isa_ok( ($inno->files)[0], 'Perl::Dist::Inno::File' );

# Add an icon
is( $inno->add_icon(
	name        => '{group}\{cm:UninstallProgram,Strawberry Perl}',
	filename    => '{uninstallexe}',
), 1, '->add_icon returns true' );
is( scalar($inno->icons), 1, '->icons returns true' );
isa_ok( ($inno->icons)[0], 'Perl::Dist::Inno::Icon' );

# Add an environment variable
is( $inno->add_env( TERM => 'dumb' ), 1, '->add_env ok' );
is( scalar($inno->registry), 1, '->registry returns true' );
isa_ok( ($inno->registry)[0], 'Perl::Dist::Inno::Registry' );

# Check the output
is( $inno->as_string, <<'END_ISS', '->as_string ok' );
; Inno Setup Script for Strawberry Perl
; Generated by Perl::Dist::Inno

[Setup]
; Distribution Identification
AppName=Strawberry Perl
AppVerName=Strawberry Perl 5.8.8 Alpha 3
AppPublisher=Vanilla Perl Project
AppPublisherURL=http://vanillaperl.org/
AppId=strawberryperl

; Start Menu Icons
DefaultGroupName=Strawberry Perl
AllowNoIcons=yes

; Installation Path (This is always hard-coded)
DefaultDirName=C:\
DisableDirPath=yes

; Where the output goes
OutputDir=C:\
OutputBaseFilename=strawberry-perl-5.8.8-alpha-3

; Source location
SourceDir=C:\

; Win2K or newer required
MinVersion=4.0.950,4.0.1381

; Miscellaneous settings
Compression=lzma
SolidCompression=yes
ChangesEnvironment=yes

[Languages]
Name: eng; MessagesFile: compiler:Default.isl

[Files]
Source: dmake\*; DestDir: {app}\dmake; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: {group}\{cm:UninstallProgram,Strawberry Perl}; Filename: {uninstallexe}

[Registry]
Root: HKLM; Subkey: SYSTEM\CurrentControlSet\Control\Session Manager\Environment; ValueType: expandsz; ValueName: TERM; ValueData: "dumb"
END_ISS
