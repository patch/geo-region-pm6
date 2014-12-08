use Test;
use Geo::Region;

plan 8;

subtest {
    plan 2;
    my $r = Geo::Region.new;

    nok       $r.is_within(1),      'not within world';
    is_deeply $r.countries, list(), 'no countries';
}, 'default empty region';

subtest {
    plan 2;
    my $r = Geo::Region.new(include => []);

    nok       $r.is_within(1),      'not within world';
    is_deeply $r.countries, list(), 'no countries';
}, 'explicit empty region';

subtest {
    plan 44;
    my $r = Geo::Region.new(include => 1);

    ok $r.is_within(1),    'region is within itself';
    ok $r.contains(1),     'region contains itself';
    ok $r.contains(2),     'region contains subregion';
    ok $r.contains(11),    'region contains subsubregion';
    ok $r.contains('011'), 'region contains subsubregion string';
    ok $r.contains('BF'),  'region contains country';
    ok $r.contains('bf'),  'region contains lowercase country';
    ok $r.contains( 1, 2, 11, 'BF' ), 'multiple containment args';
    ok $r.contains([1, 2, 11, 'BF']), 'arrayref containment arg';

    is        $r.countries.elems,      256,               'has expected # of countries';
    cmp_ok    $r.countries.join, '~~', /^<:Lu>+$/,        'countries are uppercase';
    is_deeply $r.countries,            $r.countries.sort, 'countries are sorted';

    # these codes are: 1. deprecated; 2. grouping; and 3. aliases
    for <
        AN BU CS DD FX NT QU SU TP YD YU ZR
        EU QO
        QU UK
    > -> $code {
        ok $r.contains($code),        "contains code $code";
        isnt $code, $r.countries.any, "does not return code $code";
    }
}, 'World (001) superregion';

subtest {
    plan 12;
    my $r = Geo::Region.new(include => 'MX');

    ok $r.contains('MX'),  'country contains itself';
    ok $r.contains('mx'),  'country contains itself, case insensitive';
    ok $r.is_within('MX'), 'country is within itself';
    ok $r.is_within('mx'), 'country is within itself, case insensitive';
    ok $r.is_within(13),   'within Central America (013) region';
    ok $r.is_within(19),   'within Americas (019) region';
    ok $r.is_within(1),    'within World (001) region';
    ok $r.is_within(3),    'within North America (003) grouping';
    ok $r.is_within(419),  'within Latin America (419) grouping';
    ok $r.is_within( 1, 3, 13, 19, 419, 'MX' ), 'multiple within args';
    ok $r.is_within([1, 3, 13, 19, 419, 'MX']), 'arrayref within arg';
    is_deeply $r.countries, list('MX'), 'only one country in a country';
}, 'Mexico (MX) country';

subtest {
    plan 6;
    my $r = Geo::Region.new(include => [143, 'RU']);

    ok  $r.contains(143, 'RU'), 'contains both included regions';
    ok  $r.contains('KZ'),      'contains regions within any included';
    ok  $r.is_within(1),        'within regions shared by all included';
    nok $r.is_within(143),      'not within either included region';
    nok $r.is_within('RU'),     'not within either included region';

    is_deeply(
        $r.countries,
        <KG KZ RU TJ TM UZ>,
        'return all countries within any included'
    );
}, 'Central Asia (143) + Russia (RU)';

subtest {
    plan 5;
    my $r = Geo::Region.new(include => 150, exclude => 'EU');

    ok  $r.contains('CH'), 'contains countries !within excluded region';
    ok  $r.contains(155),  'contains regions within included region';
    nok $r.contains('EU'), '!contains excluded region';
    nok $r.contains('FR'), '!contains countries within excluded region';

    is_deeply(
        $r.countries,
        <AD AL AX BA BY CH FO GG GI IM IS JE LI MC MD ME MK NO RS RU SJ SM UA VA XK>,
        'return all countries within included except excluded'
    );
}, 'Europe (150) − European Union (EU)';

subtest {
    plan 6;
    my $r = Geo::Region.new(include => 'QU');

    ok $r.is_within('EU'), 'within official region';
    ok $r.is_within('QU'), 'within deprecated region';
    ok $r.contains('EU'),  'contains official region';
    ok $r.contains('QU'),  'contains deprecated region';
    ok $r.contains('GB'),  'contains official country';
    ok $r.contains('UK'),  'contains deprecated country';
}, 'deprecated alias QU for EU';

subtest {
    plan 5;
    my $r = Geo::Region.new(include => 'UK');

    ok $r.is_within('GB'), 'within official country';
    ok $r.is_within('UK'), 'within deprecated country';
    ok $r.contains('GB'),  'contains official country';
    ok $r.contains('UK'),  'contains deprecated country';
    is_deeply $r.countries, list('GB'), 'only official countries';
}, 'deprecated alias UK for GB';
