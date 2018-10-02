use strict;
use File::Path qw(make_path remove_tree);

my $path = $ARGV[0] or die "usage: remove-old-packages.pl path";

if (-d $path){
  remove_tree($path) or die "can't remove directory $path, error: $!";
  print "directory [$path] removed OK\n";
} else {
  print "directory [$path] does not exit, SKIP removal\n";
}

if (-d "binaries"){
  remove_tree("binaries") or die "can't remove directory binaries, error: $!";
  print "directory [binaries] removed OK\n";
} else {
  print "directory [binaries] does not exit, SKIP removal\n";
}

