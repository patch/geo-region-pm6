module Geo::Region::Constant;

constant AFRICA             is export = '002';
constant AMERICAS           is export = '019';
constant ASIA               is export = '142';
constant AUSTRALASIA        is export = '053';
constant CARIBBEAN          is export = '029';
constant CENTRAL_AMERICA    is export = '013';
constant CENTRAL_ASIA       is export = '143';
constant EASTERN_AFRICA     is export = '014';
constant EASTERN_ASIA       is export = '030';
constant EASTERN_EUROPE     is export = '151';
constant EUROPE             is export = '150';
constant EUROPEAN_UNION     is export = 'EU';
constant LATIN_AMERICA      is export = '419';
constant MELANESIA          is export = '054';
constant MICRONESIAN_REGION is export = '057';
constant MIDDLE_AFRICA      is export = '017';
constant NORTH_AMERICA      is export = '003';
constant NORTHERN_AFRICA    is export = '015';
constant NORTHERN_AMERICA   is export = '021';
constant NORTHERN_EUROPE    is export = '154';
constant OCEANIA            is export = '009';
constant OUTLYING_OCEANIA   is export = 'QO';
constant POLYNESIA          is export = '061';
constant SOUTH_AMERICA      is export = '005';
constant SOUTHEAST_ASIA     is export = '035';
constant SOUTHERN_AFRICA    is export = '018';
constant SOUTHERN_ASIA      is export = '034';
constant SOUTHERN_EUROPE    is export = '039';
constant WESTERN_AFRICA     is export = '011';
constant WESTERN_ASIA       is export = '145';
constant WESTERN_EUROPE     is export = '155';
constant WORLD              is export = '001';

=begin pod

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

=end pod
