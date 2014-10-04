package TestsFor::Geo::Region;

use v5.8.1;
use utf8;
use parent qw( Test::Class );
use Test::More;
use Geo::Region;

sub setup :Test(setup) {
    shift->{region} = Geo::Region->new(region => '029');
}

sub object :Test(1) {
    my $region = shift->{region};
    isa_ok $region, 'Geo::Region';
}

sub methods :Test(11) {
    my $region = shift->{region};
    can_ok $region, qw( contains is_within countries )
        or return 'public methods not found';
    ok $region->contains('029'),   'contains itself (029)';
    ok $region->contains('PR'),    'contains Puerto Rico (PR)';
    ok !$region->contains('US'),   'does not contain the United States (US)';
    ok $region->is_within('029'),  'is within itself (029)';
    ok $region->is_within('419'),  'is within Latin America (419)';
    ok $region->is_within('003'),  'is within North America (003)';
    ok $region->is_within('019'),  'is within the Americas (019)';
    ok $region->is_within('001'),  'is within the World (001)';
    ok !$region->is_within('150'), 'is not within Europe (150)';
    is_deeply [$region->countries], [qw(
        AG AI AW BB BL BQ BS CU CW DM DO GD GP HT
        JM KN KY LC MF MQ MS PR SX TC TT VC VG VI
    )], 'countries within region';
}

1;
