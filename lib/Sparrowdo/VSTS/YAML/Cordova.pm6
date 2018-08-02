use v6;

unit module Sparrowdo::VSTS::YAML::Cordova:ver<0.0.2>;

use Sparrowdo;
use Sparrowdo::Core::DSL::Bash;
use Sparrowdo::Core::DSL::Template;
use Sparrowdo::Core::DSL::File;
use Sparrowdo::Core::DSL::Directory;

our sub tasks (%args) {

  my $os = %args<os> || 'windows';

  my $build-dir = %args<build-dir> || die "usage module_run '{ ::?MODULE.^name }' ,%(build-dir => dir)";

  directory "$build-dir/.cache";
  directory "$build-dir/files";

  if $os eq "windows" {
    tasks-windows(%args);
  } elsif $os eq "ios"  {
    tasks-ios(%args);
  } else {
    die "unsupported os: $os"
  }

}

our sub tasks-ios (%args) {

  my $build-dir = %args<build-dir>;

  template-create "$build-dir/files/install-cordova.sh", %(
    source => ( slurp %?RESOURCES{"ios/install-cordova.sh"}.Str  ),
    variables => %(
      use_ionic_build => %args<use-ionic-build>
    )
  );

  template-create "build.json", %(
    source => ( slurp %?RESOURCES{"ios/build.json"}.Str  ),
    variables => %(
      team_id => %args<team-id>
    )
  );

  file "$build-dir/files/build-cordova-ios.sh", %( content => slurp %?RESOURCES<ios/build-cordova.sh>.Str );

  template-create "$build-dir/.cache/build.yaml.sample", %(
    source => ( slurp %?RESOURCES<ios/build.yaml> ),
    variables => %(
      base_dir => "$build-dir/files",
      build => %args<build>,
    )
  );

  bash "cat $build-dir/.cache/build.yaml.sample >> $build-dir/build.yaml"

}

our sub tasks-osx (%args) {

  my $build-dir = %args<build-dir>;

  file "$build-dir/files/build-cordova-osx.sh", %( content => slurp %?RESOURCES<osx/build-cordova.sh>.Str );

  template-create "$build-dir/.cache/build.yaml.sample", %(
    source => ( slurp %?RESOURCES<osx/build.yaml> ),
    variables => %(
      base_dir => "$build-dir/files",
      build => %args<build>,
    )
  );

  bash "cat $build-dir/.cache/build.yaml.sample >> $build-dir/build.yaml"

}

our sub tasks-windows (%args) {

  my $build-dir = %args<build-dir>;

  my @list = <
    cordova-platorm-add-windows.cmd
    npm-install.cmd
    npm-install-cordova.cmd
    npm-run-ionic-build-prod.cmd
  >;


  for @list -> $i {
    file "$build-dir/files/$i", %( content => slurp %?RESOURCES{"windows/$i"}.Str );
  }

  
  my @bf = %args<build-flags>.split(/\s+/);
  my $bf;

  for @bf -> $f {
    $bf ~= "--buildFlag $f ";
  }

  template-create "$build-dir/files/cordova-build-windows.cmd", %(
    source => ( slurp %?RESOURCES<windows/cordova-build-windows.cmd> ),
    variables => %(
      ms_build_opts => $bf,
      build_configuration => %args<build-configuration> || "--debug",
    )
  );

  template-create "$build-dir/.cache/build.yaml.sample", %(
    source => ( slurp %?RESOURCES<windows/build.yaml> ),
    variables => %(
      base_dir => "$build-dir/files",
      use_ionic_build => %args<use-ionic-build> ?? 1 !! 0,
      build => %args<build>,
    )
  );

  bash "cat $build-dir/.cache/build.yaml.sample >> $build-dir/build.yaml"

}


