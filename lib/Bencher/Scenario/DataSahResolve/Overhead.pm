package Bencher::Scenario::DataSahResolve::Overhead;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Sah::Schema::perl::distname; # to pull dependency
use Sah::Schema::perl::modname;  # to pull dependency
use Sah::Schema::poseven;        # to pull dependency
use Sah::Schema::posint;         # to pull dependency

our $scenario = {
    summary => 'Benchmark the overhead of resolving schemas',
    modules => {
        'Data::Sah' => {},
        'Data::Sah::Normalize' => {},
        'Data::Sah::Resolve' => {},
    },
    participants => [
        {
            name => 'resolve_schema',
            perl_cmdline_template => ["-MData::Sah::Resolve=resolve_schema", "-e", 'for (@{ <schemas> }) { resolve_schema($_) }'],
        },
        {
            name => 'normalize_schema',
            perl_cmdline_template => ["-MData::Sah::Normalize=normalize_schema", "-e", 'for (@{ <schemas> }) { normalize_schema($_) }'],
        },
        {
            name => 'gen_validator',
            perl_cmdline_template => ["-MData::Sah=gen_validator", "-e", 'for (@{ <schemas> }) { gen_validator($_, {return_type=>q(str)}) }'],
        },
    ],

    datasets => [
        {name=>"int"           , args=>{schemas=>'[q(int)]'}},
        {name=>"perl::modname" , args=>{schemas=>'[q(perl::modname)]'}},
        {name=>"5-schemas"     , args=>{schemas=>'[q(int),q(perl::distname),q(perl::modname),q(posint),q(poseven)]'}},
    ],
};

1;
# ABSTRACT:
