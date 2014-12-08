module Geo::Region::Enum;

enum Region is export (
    Africa            => '002',
    Americas          => '019',
    Asia              => '142',
    Australasia       => '053',
    Caribbean         => '029',
    CentralAmerica    => '013',
    CentralAsia       => '143',
    EasternAfrica     => '014',
    EasternAsia       => '030',
    EasternEurope     => '151',
    Europe            => '150',
    EuropeanUnion     => 'EU',
    LatinAmerica      => '419',
    Melanesia         => '054',
    MicronesianRegion => '057',
    MiddleAfrica      => '017',
    NorthAmerica      => '003',
    NorthernAfrica    => '015',
    NorthernAmerica   => '021',
    NorthernEurope    => '154',
    Oceania           => '009',
    OutlyingOceania   => 'QO',
    Polynesia         => '061',
    SouthAmerica      => '005',
    SoutheastAsia     => '035',
    SouthernAfrica    => '018',
    SouthernAsia      => '034',
    SouthernEurope    => '039',
    WesternAfrica     => '011',
    WesternAsia       => '145',
    WesternEurope     => '155',
    World             => '001',
);

enum Country is export (
    # TODO
);

=begin pod

=head1 NAME

Geo::Region::Enum - Enumerations for UN M.49 and CLDR region codes

=head1 VERSION

This document describes Geo::Region::Enum for Perl 6, built with Unicode CLDR
v26.

=head1 SYNOPSIS

    use Geo::Region::Enum;

    Region::LatinAmerica   # '419'
    Region::EuropeanUnion  # 'EU'

=head1 DESCRIPTION

Exportable enumerations for UN M.49 region codes, including CLDR extensions,
designed for use with L<Geo::Region>.

=head2 Enumerations

=begin item
C<Region>

    World                  001
    • Africa               002
      ◦ EasternAfrica      014
      ◦ MiddleAfrica       017
      ◦ NorthernAfrica     015
      ◦ SouthernAfrica     018
      ◦ WesternAfrica      011
    • Americas             019
      ◦ Caribbean          029
      ◦ CentralAmerica     013
      ◦ LatinAmerica       419
      ◦ NorthAmerica       003
      ◦ NorthernAmerica    021
      ◦ SouthAmerica       005
    • Asia                 142
      ◦ CentralAsia        143
      ◦ EasternAsia        030
      ◦ SoutheastAsia      035
      ◦ SouthernAsia       034
      ◦ WesternAsia        145
    • Europe               150
      ◦ EasternEurope      151
      ◦ EuropeanUnion      EU
      ◦ NorthernEurope     154
      ◦ SouthernEurope     039
      ◦ WesternEurope      155
    • Oceania              009
      ◦ Australasia        053
      ◦ Melanesia          054
      ◦ MicronesianRegion  057
      ◦ OutlyingOceania    QO
      ◦ Polynesia          061

=end item

=begin item
C<Country>

TODO

=end item

=head1 SEE ALSO

=item L<Geo::Region> — Geographical regions and groupings using UN M.49 and CLDR
data
=item L<Unicode CLDR: UN M.49 Territory
Containment|http://unicode.org/cldr/charts/26/supplemental/territory_containment_un_m_49.html>
=item L<United Nations: UN M.49 Standard Country, Area, & Region
Codes|http://unstats.un.org/unsd/methods/m49/m49regin.htm>
=item L<Geo::Region::Constant|https://metacpan.org/pod/Geo::Region::Constant>
for Perl 5

=head1 AUTHOR

Nick Patch <patch@cpan.org>

=head1 COPYRIGHT AND LICENSE

© 2014 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl 6 itself.

=end pod
