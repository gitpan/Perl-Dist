package Perl::Dist;

use version; $VERSION = qv("0.0.4")->stringify;
use strict;
use warnings; 

1; # modules must return true

__END__

#--------------------------------------------------------------------------#
# main pod documentation 
#--------------------------------------------------------------------------#

=head1 NAME

Perl::Dist - Create binary Perl distributions

=head1 DESCRIPTION

The Perl::Dist namespace encompasses creation of pre-packaged, binary
distributions of Perl, such as executable installers for Win32.  While initial
efforts are targeted at Win32, there is hope that this may become a more
general support tool for Perl application deployment.

Packages in this namespace include both "builders" and "distributions".
Builder packages automate the generation of distributions.  Distribution
packages contain configuration files for a particular builder, extra files to
be bundled with the pre-packaged binary, and documentation.  Distribution
namespaces are also recommended to consolidate bug reporting using rt.cpan.org.
I<Distribution packages should not contain the pre-packaged install files
themselves.>

=head2 BUILDERS

There is currently only the default builder:

=over

=item *

L<Perl::Dist::Builder> -- an alpha version of a distribution builder

=back

=head2 DISTRIBUTIONS

Currently available distributions include:

=over

=item *

L<Perl::Dist::Vanilla> -- an experimental "core Perl" distribution intended
for distribution developers

=item *

L<Perl::Dist::Strawberry> -- a practical Win32 Perl release for
experienced Perl developers to experiment and test the installation of various
CPAN modules under Win32 conditions

=back

=head1 ROADMAP

Everything is currently alpha, at best.  These packages have been released
to enable community support in ongoing development.

Some specific items for development include:

=over

=item *

Bug-squashing Win32 compatibility problems in popular modules

=item *

Refactoring the initial builder for greater modularity and control of the
build process

=item *

Support for Win32 *.msi installation files instead of standalone *.exe
installers

=item *

Better uninstall support and upgradability

=back

=head1 SEE ALSO

=over

=item *

L<http://win32.perl.org/>

=item *

L<http://vanillaperl.com>

=item *

L<irc://irc.perl.org/#win32>

=back

=head1 AUTHOR

David A. Golden (DAGOLDEN)

dagolden@cpan.org

http://dagolden.com/

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2006 by David A. Golden

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.

=cut
