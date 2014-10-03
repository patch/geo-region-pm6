[![Build status](https://travis-ci.org/perl-cldr/geo-region-pm5.png)](https://travis-ci.org/perl-cldr/geo-region-pm5)
[![Coverage status](https://coveralls.io/repos/perl-cldr/geo-region-pm5/badge.png)](https://coveralls.io/r/perl-cldr/geo-region-pm5)
[![CPAN version](https://badge.fury.io/pl/Geo-Region.png)](http://badge.fury.io/pl/Geo-Region)

# NAME

Geo::Region - Geographical Region Sets using UN M.49 and CLDR data

# VERSION

This document describes Geo::Region v0.00\_1.

# SYNOPSIS

```perl
use Geo::Region;

$caribbean = Geo::Region->new(region => '029');

if ( $caribbean->contains('PR') ) {
    say 'Caribbean contains Puerto Rico!';
}

say 'Countries in the Caribbean are: ', join(' ', $caribbean->countries);
```

# DESCRIPTION

Geographical Region Sets using UN M.49 and CLDR data

## Attributes

- region

    UN M.49 region code

## Methods

- contains
- countries

# SEE ALSO

- [Unicode CLDR: UN M.49 Territory Containment](http://unicode.org/cldr/charts/latest/supplemental/territory_containment_un_m_49.html)
- [United Nations: UN M.49 Standard Country or Area Codes](http://unstats.un.org/unsd/methods/m49/m49regin.htm)
- [Wikipedia: UN M.49](http://en.wikipedia.org/wiki/UN_M.49)
- ["Territory-Containment" in Locale::CLDR](https://metacpan.org/pod/Locale::CLDR#Territory-Containment)

# AUTHOR

Nick Patch <patch@cpan.org>

# COPYRIGHT AND LICENSE

© 2014 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
