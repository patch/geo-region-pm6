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

sub methods :Test(3) {
    my $region = shift->{region};
    can_ok $region, 'contains'
        or return 'public methods not found';
    ok $region->contains('PR'),  'Caribbean (029) contains Puerto Rico (PR)';
    ok !$region->contains('US'), 'does not contain United States (US)';
}

1;
