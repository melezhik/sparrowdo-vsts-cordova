# Sparrowdo::VSTS::YAML::Cordova

Sparrowdo module to generate VSTS yaml build definition steps for Cordova build.

# USAGE

## Windows

    $ cat sparrowfile

    module_run "VSTS::YAML::Cordova", %( 
      build-dir => ".build",
      os => "windows", # default value
      use-ionic-build => true, # default value
      build => True, # whether to run build command or not, default value is False
      build-configuration => "--debug", # msbuild configuration, default value,
      build-flags => '/p:Platform=x86 /p:AppxBundle=Always', #  msbuild build flags, default value is empty string
    );

    $ sparrowdo --no_sudo --local_mode

## iOS

    $ cat sparrowfile

    module_run "VSTS::YAML::Cordova", %( 
      build-dir => ".build",
      os => "ios"
      use-ionic-build => true # default value
      build => True, # whether to run build command or not, default value is False
      team-id => "FG35JLLMXX4A" # development team id
    );

    $ sparrowdo --no_sudo --local_mode

## OSx

    $ cat sparrowfile

    module_run "VSTS::YAML::Cordova", %(
      build-dir => ".build",
      os => "osx"
      use-ionic-build => true # default value
      build => True, # whether to run build command or not, default value is False
      team-id => "FG35JLLMXX4A" # development team id
    );

    $ sparrowdo --no_sudo --local_mode

# Platforms supported

* Windows
* iOS
* OSx

# Author

Aleksei Melezhik


