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

sub attributes :Test(2) {
    my $region = shift->{region};
    can_ok $region, 'region'
        or return 'attribute methods not found';
    is $region->region, '029', 'get region attribute';
}

sub methods :Test(4) {
    my $region = shift->{region};
    can_ok $region, qw( contains countries )
        or return 'public methods not found';
    ok $region->contains('PR'),  'Caribbean (029) contains Puerto Rico (PR)';
    ok !$region->contains('US'), 'does not contain United States (US)';
    is_deeply [$region->countries], [qw(
        AG AI AW BB BL BQ BS CU CW DM DO GD GP HT
        JM KN KY LC MF MQ MS PR SX TC TT VC VG VI
    )], 'countries within region';
}

1;
