package Geo::Region;

use v5.8.1;
use utf8;
use Scalar::Util qw( looks_like_number weaken );
use List::Util qw( all any );
use Moo;

our $VERSION = '0.00_01';

my %children_of = (
    # regions of subregions
    '001' => [qw( 002 009 019 142 150 )],
    '002' => [qw( 011 014 015 017 018 )],
    '003' => [qw( 013 021 029 )],
    '009' => [qw( 053 054 057 061 QO )],
    '019' => [qw( 003 005 013 021 029 419 )],
    '142' => [qw( 030 034 035 143 145 )],
    '150' => [qw( 039 151 154 155 EU QU )],
    '419' => [qw( 005 013 029 )],
    # regions of countries and territories
    '005' => [qw( AR BO BR CL CO EC FK GF GY PE PY SR UY VE )],
    '011' => [qw( BF BJ CI CV GH GM GN GW LR ML MR NE NG SH SL SN TG )],
    '013' => [qw( BZ CR GT HN MX NI PA SV )],
    '014' => [qw( BI DJ ER ET KE KM MG MU MW MZ RE RW SC SO TZ UG YT ZM ZW )],
    '015' => [qw( DZ EA EG EH IC LY MA SD SS TN )],
    '017' => [qw( AO CD CF CG CM GA GQ ST TD ZR )],
    '018' => [qw( BW LS NA SZ ZA )],
    '021' => [qw( BM CA GL PM US )],
    '029' => [qw( AG AI AN AW BB BL BQ BS CU CW DM DO GD GP HT JM KN KY LC MF MQ MS PR SX TC TT VC VG VI )],
    '030' => [qw( CN HK JP KP KR MN MO TW )],
    '034' => [qw( AF BD BT IN IR LK MV NP PK )],
    '035' => [qw( BN BU ID KH LA MM MY PH SG TH TL TP VN )],
    '039' => [qw( AD AL BA CS ES GI GR HR IT ME MK MT PT RS SI SM VA XK YU )],
    '053' => [qw( AU NF NZ )],
    '054' => [qw( FJ NC PG SB VU )],
    '057' => [qw( FM GU KI MH MP NR PW )],
    '061' => [qw( AS CK NU PF PN TK TO TV WF WS )],
    '143' => [qw( KG KZ TJ TM UZ )],
    '145' => [qw( AE AM AZ BH CY GE IL IQ JO KW LB NT OM PS QA SA SY TR YD YE )],
    '151' => [qw( BG BY CZ HU MD PL RO RU SK SU UA )],
    '154' => [qw( AX DK EE FI FO GB GG IE IM IS JE LT LV NO SE SJ )],
    '155' => [qw( AT BE CH DD DE FR FX LI LU MC NL )],
    'EU'  => [qw( AT BE BG CY CZ DE DK EE ES FI FR GB GR HR HU IE IT LT LU LV MT NL PL PT RO SE SI SK )],
    'QO'  => [qw( AC AQ BV CC CP CX DG GS HM IO TA TF UM )],
);

# codes excluded from country list due to being deprecated or grouping container
my %noncountries = map { $_ => 1 } qw(
    AN BU CS DD EU FX NT QO QU SU TP YD YU ZR
);

sub coerce_regions {
    map  { looks_like_number $_ ? sprintf('%03d', $_) : uc }
    grep { defined }
    map  { ref eq 'ARRAY' ? @$_ : $_ } @_
}

use namespace::clean;

has _regions => (
    is       => 'ro',
    coerce   => sub { [ coerce_regions(shift) ] },
    default  => sub { [] },
    init_arg => 'region',
);

has _excludes => (
    is       => 'ro',
    coerce   => sub { [ coerce_regions(shift) ] },
    default  => sub { [] },
    init_arg => 'exclude',
);

has _children => (
    is      => 'lazy',
    builder => sub {
        my $self = shift;
        my $build_children;

        $build_children = sub { map {
            $_, exists $children_of{$_}
                     ? $build_children->(@{$children_of{$_}})
                     : ()
        } @_ };

        my %excludes = map { $_ => 1 }
                           $build_children->(@{$self->_excludes});

        my %children = map  { $_ => 1 }
                       grep { !exists $excludes{$_} }
                            $build_children->(@{$self->_regions});

        weaken $build_children;
        return \%children;
    },
);

has _parents => (
    is      => 'lazy',
    builder => sub {
        my @regions = @{shift->_regions};
        my ($build_parents, %count);

        $build_parents = sub { map {
             my $region = $_;
             $region, $build_parents->(grep {
                 any { $_ eq $region } @{$children_of{$_}}
             } keys %children_of);
        } @_ };

        my %parents = map  { $_ => 1 }
                      grep { ++$count{$_} == @regions }
                           $build_parents->(@regions);

        weaken $build_parents;
        return \%parents;
    },
);

has _countries => (
    is      => 'lazy',
    builder => sub { [
        sort
        grep { /^[A-Z]{2}$/ && !exists $noncountries{$_} }
        keys %{shift->_children}
    ] },
);

sub contains {
    my ($self, @regions) = @_;
    return all { exists $self->_children->{$_} } coerce_regions(@regions);
}

sub is_within {
    my ($self, @regions) = @_;
    return all { exists $self->_parents->{$_} } coerce_regions(@regions);
}

sub countries {
    my ($self) = @_;
    return @{$self->_countries};
}

1;

__END__

=encoding UTF-8

=head1 NAME

Geo::Region - Geographical regions and groupings using UN M.49 and CLDR data

=head1 VERSION

This document describes Geo::Region v0.00_01.

=head1 SYNOPSIS

    use Geo::Region;

    # Americas (019)
    $amer = Geo::Region->new(region => 19);

    # Europe (150), Western Asia (145), and Africa (002)
    $emea = Geo::Region->new(region => [ 150, 145, 2 ]);

    # Asia (142) and Oceania (009), excluding Western Asia (145)
    $apac = Geo::Region->new(region => [ 142, 9 ], exclude => 145);

    if ( $amer->contains($country) ) {
        # country is in the Americas
    }
    elsif ( $emea->contains($country) ) {
        # country is in Europe, the Middle East, and Africa
    }
    elsif ( $apac->contains($country) ) {
        # country is in Asia-Pacific
    }

=head1 DESCRIPTION

This class is used to create geographical regions and groupings of subregions
and countries. Default regional groupings are provided using the Unicode CLDR
v26 Territory Containment data, which is an extension of the United Nations M.49
standard.

=head2 Regions

Regions and subregions are represented with UN M.49 region codes, such as B<419>
for Latin America and B<035> for Southeast Asia. Either the official format
using a three-digit C<0>-padded string like C<'035'> or an integer like C<35>
may be used with this class. Note when using the C<0>-padded format that it must
be quoted as a string so as not to be treated as on octal literal. The CLDR also
adds two additional two-letter region codes which are supported: B<EU> for the
European Union and B<QO> for Outlying Oceania.

=head2 Countries

Countries and territories are represented with ISO 3166-1 alpha-2 country codes,
such as B<JP> for Japan and B<AQ> for Antarctica, and are case insensitive.
Unlike with region codes, the three-digit forms of country codes are not used by
the CLDR or this class.

=head2 Constructor

The C<new> class method is used to construct a Geo::Region object along with the
C<region> argument and optional C<exclude> argument.

=over

=item C<region>

Accepts either a single region code or an array reference of region or country
codes, resulting in a custom region.

    # countries in the Europen Union
    Geo::Region->new(region => 'EU')

    # countries in Asia plus Russia
    Geo::Region->new(region => [ 142, 'RU' ])

=item C<exclude>

Accepts values in the same format as C<region>. This can be used to exclude
countries or subregions from a region.

    # countries in Europe which are not in the European Union
    Geo::Region->new(region => 150, exclude => 'EU')

=back

=head2 Methods

=over

=item C<contains>

Given a country or region code, determines if the region represented by the
Geo::Region instance contains it.

    if ( $region->contains($country) ) {

=item C<is_within>

Given a region code, determines if all the countries and regions represented by
the Geo::Region instance are within it.

    if ( $subregion->is_within($region) ) {

=item C<countries>

Returns a list of country codes of the countries within the region represented
by the Geo::Region instance.

    for ( $region->countries ) {

=back

=head1 SEE ALSO

=over

=item L<Unicode CLDR: UN M.49 Territory Containment|http://unicode.org/cldr/charts/latest/supplemental/territory_containment_un_m_49.html>

=item L<United Nations: UN M.49 Standard Country, Area, & Region Codes|http://unstats.un.org/unsd/methods/m49/m49regin.htm>

=item L<Locale::CLDR: Territory Containment|Locale::CLDR/Territory-Containment>

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
