use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::Class::Load qw( t/lib );

TestsFor::Geo::Region->new->runtests;
