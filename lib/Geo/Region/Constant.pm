package Geo::Region::Constant;

use v5.8.1;
use utf8;
use strict;
use warnings;
use parent 'Exporter';

use constant AFRICA             => '002';
use constant AMERICAS           => '019';
use constant ASIA               => '142';
use constant AUSTRALASIA        => '053';
use constant CARIBBEAN          => '029';
use constant CENTRAL_AMERICA    => '013';
use constant CENTRAL_ASIA       => '143';
use constant EASTERN_AFRICA     => '014';
use constant EASTERN_ASIA       => '030';
use constant EASTERN_EUROPE     => '151';
use constant EUROPE             => '150';
use constant EUROPEAN_UNION     => 'EU';
use constant LATIN_AMERICA      => '419';
use constant MELANESIA          => '054';
use constant MICRONESIAN_REGION => '057';
use constant MIDDLE_AFRICA      => '017';
use constant NORTH_AMERICA      => '003';
use constant NORTHERN_AFRICA    => '015';
use constant NORTHERN_AMERICA   => '021';
use constant NORTHERN_EUROPE    => '154';
use constant OCEANIA            => '009';
use constant OUTLYING_OCEANIA   => 'QO';
use constant POLYNESIA          => '061';
use constant SOUTH_AMERICA      => '005';
use constant SOUTHEAST_ASIA     => '035';
use constant SOUTHERN_AFRICA    => '018';
use constant SOUTHERN_ASIA      => '034';
use constant SOUTHERN_EUROPE    => '039';
use constant WESTERN_AFRICA     => '011';
use constant WESTERN_ASIA       => '145';
use constant WESTERN_EUROPE     => '155';
use constant WORLD              => '001';

our $VERSION = '0.05';

our @EXPORT_OK = qw(
    AFRICA
    AMERICAS
    ASIA
    AUSTRALASIA
    CARIBBEAN
    CENTRAL_AMERICA
    CENTRAL_ASIA
    EASTERN_AFRICA
    EASTERN_ASIA
    EASTERN_EUROPE
    EUROPE
    EUROPEAN_UNION
    LATIN_AMERICA
    MELANESIA
    MICRONESIAN_REGION
    MIDDLE_AFRICA
    NORTH_AMERICA
    NORTHERN_AFRICA
    NORTHERN_AMERICA
    NORTHERN_EUROPE
    OCEANIA
    OUTLYING_OCEANIA
    POLYNESIA
    SOUTH_AMERICA
    SOUTHEAST_ASIA
    SOUTHERN_AFRICA
    SOUTHERN_ASIA
    SOUTHERN_EUROPE
    WESTERN_AFRICA
    WESTERN_ASIA
    WESTERN_EUROPE
    WORLD
);

our %EXPORT_TAGS = ( all => \@EXPORT_OK );

1;

__END__

=encoding UTF-8

=head1 NAME

Geo::Region::Constant - Constants for UN M.49 and CLDR region codes

=head1 VERSION

This document describes Geo::Region::Constant v0.05, built with Unicode CLDR v26.

=head1 SYNOPSIS

    use Geo::Region::Constant qw( AFRICA AMERICAS ASIA EUROPE OCEANIA );

    use Geo::Region::Constant qw( :all );

=head1 DESCRIPTION

Exportable constants for UN M.49 region codes, including CLDR extensions,
designed for use with L<Geo::Region>.

=head2 Constants

No constants are exported by default. They may all be exported using the C<:all>
export tag.

    WORLD                   001
    • AFRICA                002
      ◦ EASTERN_AFRICA      014
      ◦ MIDDLE_AFRICA       017
      ◦ NORTHERN_AFRICA     015
      ◦ SOUTHERN_AFRICA     018
      ◦ WESTERN_AFRICA      011
    • AMERICAS              019
      ◦ CARIBBEAN           029
      ◦ CENTRAL_AMERICA     013
      ◦ LATIN_AMERICA       419
      ◦ NORTH_AMERICA       003
      ◦ NORTHERN_AMERICA    021
      ◦ SOUTH_AMERICA       005
    • ASIA                  142
      ◦ CENTRAL_ASIA        143
      ◦ EASTERN_ASIA        030
      ◦ SOUTHEAST_ASIA      035
      ◦ SOUTHERN_ASIA       034
      ◦ WESTERN_ASIA        145
    • EUROPE                150
      ◦ EASTERN_EUROPE      151
      ◦ EUROPEAN_UNION      EU
      ◦ NORTHERN_EUROPE     154
      ◦ SOUTHERN_EUROPE     039
      ◦ WESTERN_EUROPE      155
    • OCEANIA               009
      ◦ AUSTRALASIA         053
      ◦ MELANESIA           054
      ◦ MICRONESIAN_REGION  057
      ◦ OUTLYING_OCEANIA    QO
      ◦ POLYNESIA           061

=head1 SEE ALSO

=over

=item L<Geo::Region::Constant>: Geographical regions and groupings using UN M.49
and CLDR data

=item L<Unicode CLDR: UN M.49 Territory
Containment|http://unicode.org/cldr/charts/26/supplemental/territory_containment_un_m_49.html>

=item L<United Nations: UN M.49 Standard Country, Area, & Region
Codes|http://unstats.un.org/unsd/methods/m49/m49regin.htm>

=back

=head1 AUTHOR

Nick Patch <patch@cpan.org>

This project is brought to you by L<Perl CLDR|http://perl-cldr.github.io/> and
L<Shutterstock|http://www.shutterstock.com/>. Additional open source projects
from Shutterstock can be found at
L<code.shutterstock.com|http://code.shutterstock.com/>.

=head1 COPYRIGHT AND LICENSE

© 2014 Shutterstock, Inc.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
