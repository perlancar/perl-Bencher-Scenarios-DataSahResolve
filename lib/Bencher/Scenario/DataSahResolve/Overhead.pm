package Bencher::Scenario::DataSahResolve::Overhead;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark the overhead of resolving schemas',
    participants => [
        {
            name => 'resolve_schema',
            perl_cmdline_template => ["-MData::Sah::Resolve=resolve_schema", "-e", 'for (@{ <schemas> }) { resolve_schema($_) }'],
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
