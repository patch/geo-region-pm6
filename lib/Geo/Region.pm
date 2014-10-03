package Geo::Region;

use v5.8.1;
use utf8;

use Moo;
use namespace::clean;

our $VERSION = '0.00_1';

my %parent_of = map { $_ => '029' } qw(
    AG AI AW BB BL BQ BS CU CW DM DO GD GP HT
    JM KN KY LC MF MQ MS PR SX TC TT VC VG VI
);

has region => (
    is       => 'ro',
    required => 1,
);

sub contains {
    my ($self, $region) = @_;
    return exists $parent_of{$region}
        && $parent_of{$region} eq $self->region;
}

1;

__END__

=encoding UTF-8

=head1 NAME

Geo::Region - Geographical Region & Territory Sets

=head1 VERSION

This document describes Geo::Region v0.00_1.

=head1 SYNOPSIS

    use Geo::Region;

    $caribbean = Geo::Region->new(region => '029');

=head1 DESCRIPTION

Geographical Region & Territory Sets

=head2 Attributes

=over

=item region

UN M.49 region code

=back

=head2 Methods

=over

=item contains

=back

=head1 SEE ALSO

=over

=item L<Unicode CLDR: UN M.49 Territory Containment|http://unicode.org/cldr/charts/latest/supplemental/territory_containment_un_m_49.html>

=item L<United Nations: UN M.49 Standard Country or Area Codes|http://unstats.un.org/unsd/methods/m49/m49regin.htm>

=item L<Wikipedia: UN M.49|http://en.wikipedia.org/wiki/UN_M.49>

=back

=head1 AUTHOR

Nick Patch <patch@cpan.org>

=head1 COPYRIGHT AND LICENSE

© 2014 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
