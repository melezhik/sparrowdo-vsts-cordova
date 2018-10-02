use strict;
use File::Copy;


my $build_version = @ARGV[0] or die "usage: copy-appx-files.pl build_version build_configuration build_arch";

my $build_configuration = @ARGV[1] or die "usage: copy-appx-files.pl build_version build_configuration build_arch";

my $build_arch = @ARGV[2] or die "usage: copy-appx-files.pl build_version build_configuration build_arch";

# see https://stackoverflow.com/questions/1188284/net-large-revision-numbers-in-assemblyversionattribute
# why

$build_version = $build_version - 35365 * (sprintf "%d",  $build_version / 35365);


if ( $build_configuration eq 'debug' ){

  my $path = "platforms/windows/AppPackages/CordovaApp.Windows10_0.1.0.".
  $build_version.
  "_".$build_arch."_".$build_configuration."_Test/CordovaApp.Windows10_0.1.0.".
  $build_version."_".$build_arch."_".$build_configuration.".appx";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";

  $path = "platforms/windows/AppPackages/CordovaApp.Windows10_0.1.0.".
  $build_version."_".$build_arch."_".$build_configuration."_Test/CordovaApp.Windows10_0.1.0.".
  $build_version."_".$build_arch."_".$build_configuration.".appxsym";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";
}

if ( $build_configuration eq 'release' ){

  my $path = "platforms/windows/AppPackages/CordovaApp.Windows10_0.1.0.".
  $build_version."_".$build_arch."_Test/CordovaApp.Windows10_0.1.0.".
  $build_version."_".$build_arch.".appx";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";

  $path = "platforms/windows/AppPackages/CordovaApp.Windows10_0.1.0.".
  $build_version."_".$build_arch."_Test/CordovaApp.Windows10_0.1.0.".
  $build_version."_".$build_arch.".appxsym";

  print "copy $path => binaries/ ... \n";
  copy("$path","binaries/$path") or die "Copy failed: $!";

}

