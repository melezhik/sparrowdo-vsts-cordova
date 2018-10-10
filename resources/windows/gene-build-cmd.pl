use strict;

my $source_branch = $ENV{BUILD_SOURCEBRANCHNAME};
my $build_configuration = $ENV{"BUILD_".$source_branch."_CONFIGURATION"} || $ENV{"BUILD_DEFAULT_CONFIGURATION"};

if ($build_configuration){

  print "found build configuration for branch $source_branch: $build_configuration\n";

  my $source_dir = $ENV{BUILD_SOURCESDIRECTORY};
  open FILE, "$source_dir/cicd/Builds/uwp/files/build.cmd.tmpl"
  or die "can't open $source_dir/cicd/Builds/uwp/files/build.cmd to read: $!";
  my $d = join "", <FILE>;
  close FILE;

  $d=~s/(build windows --)(debug|release)/$1$build_configuration/;

  print "patched $source_dir/cicd/Builds/uwp/files/build.cmd:\n\n";
  print $d;

  open FILE, ">", "$source_dir/cicd/Builds/uwp/files/build.cmd"
  or die "can't open $source_dir/cicd/Builds/uwp/files/build.cmd to write: $!";
  print FILE $d;
  close FILE;

}

