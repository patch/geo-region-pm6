[![Build status](https://travis-ci.org/perl-cldr/geo-region-pm5.png)](https://travis-ci.org/perl-cldr/geo-region-pm5)
[![Coverage status](https://coveralls.io/repos/perl-cldr/geo-region-pm5/badge.png)](https://coveralls.io/r/perl-cldr/geo-region-pm5)
[![CPAN version](https://badge.fury.io/pl/Geo-Region.png)](http://badge.fury.io/pl/Geo-Region)

# NAME

Geo::Region - Geographical regions of countries using UN M.49 and CLDR data

# VERSION

This document describes Geo::Region v0.00\_1.

# SYNOPSIS

```perl
use Geo::Region;

# Americas (019)
$amer = Geo::Region->new(region => 19);

# Europe (150), Western Asia (145), and Africa (002)
$emea = Geo::Region->new(region => [150, 145, 2]);

# Asia (142) and Oceania (009), excluding Western Asia (145)
$apac = Geo::Region->new(region => [142, 9], exclude => 145);

if ($amer->contains($country)) {
    # country is in the Americas
}
elsif ($emea->contains($country)) {
    # country is in Europe, the Middle East, and Africa
}
elsif ($apac->contains($country)) {
    # country is in Asia-Pacific
}
```

# DESCRIPTION

Geographical regions of countries using UN M.49 and CLDR data

## Attributes

- `region`

    UN M.49 region code, ISO 3166-1 alpha-2 country code, or an array reference of
    such codes.

- `exclude`

    Same format as `region`.

## Methods

- `contains`
- `is_within`
- `countries`

# SEE ALSO

- [Unicode CLDR: UN M.49 Territory Containment](http://unicode.org/cldr/charts/latest/supplemental/territory_containment_un_m_49.html)
- [United Nations: UN M.49 Standard Country, Area, & Region Codes](http://unstats.un.org/unsd/methods/m49/m49regin.htm)
- [Locale::CLDR: Territory Containment](https://metacpan.org/pod/Locale::CLDR#Territory-Containment)

# AUTHOR

Nick Patch <patch@cpan.org>

This project is brought to you by L<Perl CLDR|http://perl-cldr.github.io/> and
L<Shutterstock|http://www.shutterstock.com/>. Additional open source projects
from Shutterstock can be found at
L<code.shutterstock.com|http://code.shutterstock.com/>.

# COPYRIGHT AND LICENSE

© 2014 Shutterstock, Inc.

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
