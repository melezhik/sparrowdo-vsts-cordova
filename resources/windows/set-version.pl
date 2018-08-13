#!perl

use strict;

use JSON qw{decode_json};

my $build_version = @ARGV[0];

open JSON, "package.json" or die "can't open package.jspon to read";
my $js = join "", <JSON>;
close JSON;

my $version = decode_json($js)->{ version};

system("npm run cordova-set-version -- -v $version.$build_version")  == 0 
  or die "npm run cordova-set-version -- -v $version.$build_version failed: $?";


