#!perl

use strict;
use File::Copy;

my $source_code_branch = @ARGV[0];


if ( $source_code_branch && -d "src/env/$source_code_branch/" ) {

  print "update configuration for env: $source_code_branch\n=================================\n";

  opendir(my $dh, "src/env/$source_code_branch/" ) || die "Can't open directory src/env/$source_code_branch/ to read: $!";
  while ( my $i = readdir $dh) {
    $i =~ /.*\.json/ or next;
    -f "src/env/$source_code_branch/$i" or next;
    print "copy src/env/$source_code_branch/$i ==> src/assets/jsons/$i ... \n";
    copy("src/env/$source_code_branch/$i","src/assets/jsons/$i") or die "Copy failed: $!";
  }
  closedir $dh;
} elsif ( ! $source_code_branch ) {
  warn 'source branch is not set, is Build.SourceBranchName empty? .... nothing to do'
} else {
  warn "directory src/env/$source_code_branch/ does not exit, hope it's ok ... nothing to do"
}

