use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use English;
use Test::More tests => 1;

BEGIN { use_ok 'Geo::Region' }

diag join ', ' => (
    "Geo::Region v$Geo::Region::VERSION",
    "Moo v$Moo::VERSION",
    "Perl $PERL_VERSION ($EXECUTABLE_NAME)",
);
