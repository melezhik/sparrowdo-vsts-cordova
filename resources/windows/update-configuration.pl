#!perl

use strict;
use File::Copy;

my $source_code_branch = @ARGV[0];

print "update configuration for env: $source_code_branch (data)\n=================================\n";

if ( $source_code_branch && -d "src/env/$source_code_branch/" && -d "src/assets/jsons/" ) {

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
} elsif ( ! -d "src/assets/jsons/" ) {
  warn "src/assets/jsons/ does not exit, hope it's ok ... nothing to do"
} else {
  warn "directory src/env/$source_code_branch/ does not exit, hope it's ok ... nothing to do"
}

print "update configuration for env: $source_code_branch (cmd)\n=================================\n";

if ( $source_code_branch && -d "src/env/$source_code_branch/" ) {
  my @commands;
  opendir(my $dh, "src/env/$source_code_branch/" ) || die "Can't open directory src/env/$source_code_branch/ to read: $!";
  while ( my $i = readdir $dh) {
    $i =~ /.*\.cmd/ or next;
    -f "src/env/$source_code_branch/$i" or next;
    push @commands, $i;
  }
  closedir $dh;

  for my $c (sort { $a <=> $b } @commands){
    print "executing src/env/$source_code_branch/$c ... \n";
    system("src/env/$source_code_branch/$c") == 0 or die "Failed to execute [src/env/$source_code_branch/$c]: $!";
  }

} else {
  warn 'source branch is not set, is Build.SourceBranchName empty? .... nothing to do'
}

