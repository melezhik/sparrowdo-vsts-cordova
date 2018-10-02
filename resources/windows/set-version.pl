#!perl

use strict;

use JSON qw{decode_json};

my $build_version = @ARGV[0];

# see https://stackoverflow.com/questions/1188284/net-large-revision-numbers-in-assemblyversionattribute
# why

$build_version = $build_version - 35365 * (sprintf "%d",  $build_version / 35365);

open JSON, "package.json" or die "can't open package.jspon to read";
my $js = join "", <JSON>;
close JSON;

my $version = decode_json($js)->{ version};

system("npm run cordova-set-version -- -v $version.$build_version")  == 0 
  or die "npm run cordova-set-version -- -v $version.$build_version failed: $?";


