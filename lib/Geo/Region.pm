package Geo::Region;

use v5.8.1;
use utf8;
use Scalar::Util qw( looks_like_number weaken );
use List::Util qw( any );
use List::MoreUtils qw( uniq );

use Moo;
use namespace::clean;

our $VERSION = '0.00_1';

my %children_of = (
    '001' => [qw( 002 009 019 142 150 )],
    '002' => [qw( 011 014 015 017 018 )],
    '003' => [qw( 013 021 029 )],
    '009' => [qw( 053 054 057 061 QO )],
    '019' => [qw( 005 013 021 029 )],
    '142' => [qw( 030 034 035 143 145 )],
    '150' => [qw( 039 151 154 155 )],
    '419' => [qw( 005 013 029 )],
    '005' => [qw( AR BO BR CL CO EC FK GF GY PE PY SR UY VE )],
    '011' => [qw( BF BJ CI CV GH GM GN GW LR ML MR NE NG SH SL SN TG )],
    '013' => [qw( BZ CR GT HN MX NI PA SV )],
    '014' => [qw( BI DJ ER ET KE KM MG MU MW MZ RE RW SC SO TZ UG YT ZM ZW )],
    '015' => [qw( DZ EA EG EH IC LY MA SD SS TN )],
    '017' => [qw( AO CD CF CG CM GA GQ ST TD )],
    '018' => [qw( BW LS NA SZ ZA )],
    '021' => [qw( BM CA GL PM US )],
    '029' => [qw( AG AI AW BB BL BQ BS CU CW DM DO GD GP HT JM KN KY LC MF MQ MS PR SX TC TT VC VG VI )],
    '030' => [qw( CN HK JP KP KR MN MO TW )],
    '034' => [qw( AF BD BT IN IR LK MV NP PK )],
    '035' => [qw( BN ID KH LA MM MY PH SG TH TL VN )],
    '039' => [qw( AD AL BA ES GI GR HR IT ME MK MT PT RS SI SM VA XK )],
    '053' => [qw( AU NF NZ )],
    '054' => [qw( FJ NC PG SB VU )],
    '057' => [qw( FM GU KI MH MP NR PW )],
    '061' => [qw( AS CK NU PF PN TK TO TV WF WS )],
    '143' => [qw( KG KZ TJ TM UZ )],
    '145' => [qw( AE AM AZ BH CY GE IL IQ JO KW LB OM PS QA SA SY TR YE )],
    '151' => [qw( BG BY CZ HU MD PL RO RU SK UA )],
    '154' => [qw( AX DK EE FI FO GB GG IE IM IS JE LT LV NO SE SJ )],
    '155' => [qw( AT BE CH DE FR LI LU MC NL )],
    'EU'  => [qw( AT BE BG CY CZ DE DK EE ES FI FR GB GR HR HU IE IT LT LU LV MT NL PL PT RO SE SI SK )],
    'QO'  => [qw( AC AQ BV CC CP CX DG GS HM IO TA TF UM )],
);

has _regions => (
    is       => 'ro',
    coerce   => sub { [
        map { looks_like_number $_ ? sprintf('%03d', $_) : uc }
            ref $_[0] eq 'ARRAY' ? @{$_[0]} : $_[0]
    ] },
    required => 1,
    init_arg => 'region',
);

has _children => (
    is      => 'lazy',
    builder => sub {
        my $build_children;
        my $tmp = $build_children = sub { map {
            exists $children_of{$_} ? ($_, $build_children->(@{$children_of{$_}})) : $_
        } @_ };
        weaken $build_children;
        return [ $build_children->(@{shift->_regions}) ];
    },
);

has _parents => (
    is      => 'lazy',
    builder => sub {
        my @regions = @{shift->_regions};
        my $build_parents;
        my $tmp = $build_parents = sub { map {
             my $region = $_;
             ($region, $build_parents->(grep {
                 any { $_ eq $region } @{$children_of{$_}}
             } keys %children_of));
        } @_ };
        weaken $build_parents;
        my %count;
        return [ grep { ++$count{$_} == @regions } $build_parents->(@regions) ];
    },
);

has _contains_child => (
    is      => 'lazy',
    builder => sub { +{ map { $_ => 1 } @{shift->_children} } },
);

has _within_parent => (
    is      => 'lazy',
    builder => sub { +{ map { $_ => 1 } @{shift->_parents} } },
);

has _countries => (
    is      => 'lazy',
    builder => sub { [
        uniq sort grep { !exists $children_of{$_} } @{shift->_children}
    ] },
);

sub contains {
    my ($self, $region) = @_;
    return exists $self->_contains_child->{$region};
}

sub is_within {
    my ($self, $region) = @_;
    return exists $self->_within_parent->{$region};
}

sub countries {
    my ($self) = @_;
    return @{$self->_countries};
}

1;

__END__

=encoding UTF-8

=head1 NAME

Geo::Region - Geographical Region Sets using UN M.49 and CLDR data

=head1 VERSION

This document describes Geo::Region v0.00_1.

=head1 SYNOPSIS

    use Geo::Region;

    $caribbean = Geo::Region->new(region => '029');

    if ( $caribbean->contains('PR') ) {
        say 'Caribbean contains Puerto Rico!';
    }

    say 'Countries in the Caribbean are: ', join(' ', $caribbean->countries);

=head1 DESCRIPTION

Geographical Region Sets using UN M.49 and CLDR data

=head2 Attributes

=over

=item region

UN M.49 region code

=back

=head2 Methods

=over

=item contains

=item is_within

=item countries

=back

=head1 SEE ALSO

=over

=item L<Unicode CLDR: UN M.49 Territory Containment|http://unicode.org/cldr/charts/latest/supplemental/territory_containment_un_m_49.html>

=item L<United Nations: UN M.49 Standard Country or Area Codes|http://unstats.un.org/unsd/methods/m49/m49regin.htm>

=item L<Wikipedia: UN M.49|http://en.wikipedia.org/wiki/UN_M.49>

=item L<Locale::CLDR/Territory-Containment>

=back

=head1 AUTHOR

Nick Patch <patch@cpan.org>

=head1 COPYRIGHT AND LICENSE

© 2014 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
