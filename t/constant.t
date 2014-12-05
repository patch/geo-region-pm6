use utf8;
use open qw( :encoding(UTF-8) :std );
use Test::Most tests => 6;
use Geo::Region::Constant qw( :all );

is WORLD,            '001', 'world region';
is EUROPE,           '150', 'continent region';
is EASTERN_EUROPE,   '151', 'subcontinent region';
is LATIN_AMERICA,    '419', 'grouping region';
is OUTLYING_OCEANIA, 'QO',  'subcontinent region, CLDR extension';
is EUROPEAN_UNION,   'EU',  'grouping region, CLDR extension';
