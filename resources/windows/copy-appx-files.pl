use strict;
use File::Copy;
use JSON qw{decode_json};


my $build_id = @ARGV[0] or die "usage: copy-appx-files.pl build_id build_configuration build_arch";

my $build_configuration = @ARGV[1] or die "usage: copy-appx-files.pl build_version build_id build_arch";

my $build_arch = @ARGV[2] or die "usage: copy-appx-files.pl build_version build_id build_arch";

# see https://stackoverflow.com/questions/1188284/net-large-revision-numbers-in-assemblyversionattribute
# why

my $revision = $build_id - 35365 * (sprintf "%d",  $build_id / 35365);


open JSON, "package.json" or die "can't open package.jspon to read";
my $js = join "", <JSON>;
close JSON;

my $main_version = decode_json($js)->{version};

print "copy appx file ...\n";
print "main version (taken from package.json) - $main_version ...\n";
print "build_id - $build_id ...\n";
print "revision version (calculated by build_id) - $revision ...\n";
print "arch - $build_arch ...\n";
print "configuration - $build_configuration ...\n";

if ( $build_configuration eq 'debug' ){

  my $path = "platforms/windows/AppPackages/CordovaApp.Windows10_$main_version.".
  $revision.
  "_".$build_arch."_".$build_configuration."_Test/CordovaApp.Windows10_$main_version.".
  $revision."_".$build_arch."_".$build_configuration.".appx";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";

  $path = "platforms/windows/AppPackages/CordovaApp.Windows10_$main_version.".
  $revision."_".$build_arch."_".$build_configuration."_Test/CordovaApp.Windows10_$main_version.".
  $revision."_".$build_arch."_".$build_configuration.".appxsym";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";
}

if ( $build_configuration eq 'release' ){

  my $path = "platforms/windows/AppPackages/CordovaApp.Windows10_$main_version.".
  $revision."_".$build_arch."_Test/CordovaApp.Windows10_$main_version.".
  $revision."_".$build_arch.".appx";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";

  $path = "platforms/windows/AppPackages/CordovaApp.Windows10_$main_version.".
  $revision."_".$build_arch."_Test/CordovaApp.Windows10_$main_version.".
  $revision."_".$build_arch.".appxsym";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";

}

