# Sparrowdo::VSTS::YAML::Cordova

Sparrowdo module to generate VSTS yaml build definition steps for Cordova build.

# USAGE

## Windows

Note: Windows build requires ionic. This build mechanism uses ionic internally.

    $ cat sparrowfile

    module_run "VSTS::YAML::Cordova", %( 
      build-dir => ".build",
      os => "windows", # default value
      build-configuration => "debug", # build configuration, default value  
      build-arch => "x86" # build architecture, default value  
    );

    $ sparrowdo --no_sudo --local_mode


If only need to create VSTS source code, use `prepare-only` flag:


    prepare-only => True


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

# Platforms supported

* Windows
* iOS

# Author

Aleksei Melezhik


