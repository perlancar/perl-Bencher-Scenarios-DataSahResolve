package Bencher::Scenario::DataSahResolve::Resolve;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Sah::Schema::poseven; # to pull dependency
use Sah::Schema::posint;  # to pull dependency

our $scenario = {
    summary => 'Benchmark resolving',
    participants => [
        {
            fcall_template => 'Data::Sah::Resolve::resolve_schema(<schema>)',
        },
    ],

    datasets => [
        {name=>"int"           , args=>{schema=>'int'}},
        {name=>"posint"        , args=>{schema=>'posint'}},
        {name=>"poseven"       , args=>{schema=>'poseven'}},
    ],
};

1;
# ABSTRACT:
