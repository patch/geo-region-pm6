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

1;
