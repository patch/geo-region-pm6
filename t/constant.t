use Test;
use Geo::Region::Constant;

plan 6;

is WORLD,            '001', 'world region';
is EUROPE,           '150', 'continent region';
is EASTERN_EUROPE,   '151', 'subcontinent region';
is LATIN_AMERICA,    '419', 'grouping region';
is OUTLYING_OCEANIA, 'QO',  'subcontinent region, CLDR extension';
is EUROPEAN_UNION,   'EU',  'grouping region, CLDR extension';
