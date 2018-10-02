use strict;
use File::Path qw(remove_tree);

my $path = $ARGV[0] or die "usage: remove-old-packages.pl path";

if (-d $path){
  remove_tree($path) or die "can't remove direrctory $path, error: $!";
  print "directory [$path] removed OK\n";
}

