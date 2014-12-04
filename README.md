[![Build status](https://travis-ci.org/patch/geo-region-pm5.png)](https://travis-ci.org/patch/geo-region-pm5)
[![Coverage status](https://coveralls.io/repos/patch/geo-region-pm5/badge.png)](https://coveralls.io/r/patch/geo-region-pm5)
[![CPAN version](https://badge.fury.io/pl/Geo-Region.png)](http://badge.fury.io/pl/Geo-Region)

# NAME

Geo::Region - Geographical regions and groupings using UN M.49 and CLDR data

# VERSION

This document describes Geo::Region v0.04, built with Unicode CLDR v26.

# SYNOPSIS

```perl
use Geo::Region;

# Americas (019)
$amer = Geo::Region->new(19);

# Europe (150), Western Asia (145), and Africa (002)
$emea = Geo::Region->new([ 150, 145, 2 ]);

# Asia (142) and Oceania (009), excluding Western Asia (145)
$apac = Geo::Region->new([ 142, 9 ], exclude => 145);

if ( $amer->contains($country) ) {
    # country is in the Americas (US, MX, BR, etc.)
}
elsif ( $emea->contains($country) ) {
    # country is in Europe, the Middle East, and Africa (FR, SA, ZW, etc.)
}
elsif ( $apac->contains($country) ) {
    # country is in Asia-Pacific (JP, TH, AU, etc.)
}
```

# DESCRIPTION

This class is used to create geographical regions and groupings of subregions
and countries. Default regional groupings are provided using the [Unicode CLDR
v26 Territory
Containment](http://unicode.org/cldr/charts/26/supplemental/territory_containment_un_m_49.html)
data, which is an extension of the United Nations [UN
M.49 (Rev.3)](http://unstats.un.org/unsd/methods/m49/m49regin.htm) standard.

## Regions

Regions and subregions are represented with UN M.49 region codes, such as **419**
for Latin America and **035** for Southeast Asia. Either the official format
using a three-digit `0`-padded string like `'035'` or an integer like `35`
may be used with this class. Note when using the `0`-padded format that it must
be quoted as a string so as not to be treated as on octal literal. The CLDR also
adds two additional two-letter region codes which are supported: **EU** for the
European Union and **QO** for Outlying Oceania.

## Countries

Countries and territories are represented with ISO 3166-1 alpha-2 country codes,
such as **JP** for Japan and **AQ** for Antarctica, and are case insensitive.
Unlike with region codes, the three-digit forms of country codes are not
currently supported, nor are three-letter codes. The deprecated code **UK** for
the United Kingdom is supported as an alias of the official code **GB**.

## Constructor

The `new` class method is used to construct a Geo::Region object along with the
`include` argument and optional `exclude` argument.

- `include`

    Accepts either a single region code or an array reference of region or country
    codes to be included in the resulting custom region. When passed to the `new`
    constructor as the first or only argument, the value may be given without the
    `include` key.

    ```perl
    # countries in the European Union
    Geo::Region->new(include => 'EU')
    Geo::Region->new('EU')

    # countries in Asia plus Russia
    Geo::Region->new(include => [ 142, 'RU' ])
    Geo::Region->new([ 142, 'RU' ])
    ```

- `exclude`

    Accepts values in the same format as `include`. This can be used to exclude
    countries or subregions from a region.

    ```perl
    # countries in Europe which are not in the European Union
    Geo::Region->new(include => 150, exclude => 'EU')
    Geo::Region->new(150, exclude => 'EU')
    ```

## Methods

- `contains`

    Given a country or region code, determines if the region represented by the
    Geo::Region instance contains it.

    ```perl
    if ( $region->contains($country) ) {
    ```

- `is_within`

    Given a region code, determines if all the countries and regions represented by
    the Geo::Region instance are within it.

    ```perl
    if ( $subregion->is_within($region) ) {
    ```

- `countries`

    Returns a list of country codes of the countries within the region represented
    by the Geo::Region instance.

    ```perl
    for ( $region->countries ) {
    ```

# SEE ALSO

- [Unicode CLDR: UN M.49 Territory
Containment](http://unicode.org/cldr/charts/26/supplemental/territory_containment_un_m_49.html)
- [United Nations: UN M.49 Standard Country, Area, & Region
Codes](http://unstats.un.org/unsd/methods/m49/m49regin.htm)
- [Locale::CLDR: Territory Containment](https://metacpan.org/pod/Locale::CLDR#Territory-Containment)

# AUTHOR

Nick Patch <patch@cpan.org>

This project is brought to you by [Perl CLDR](http://perl-cldr.github.io/) and
[Shutterstock](http://www.shutterstock.com/). Additional open source projects
from Shutterstock can be found at
[code.shutterstock.com](http://code.shutterstock.com/).

# COPYRIGHT AND LICENSE

© 2014 Shutterstock, Inc.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
