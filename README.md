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


### Visual studio project creation

If only need to create VS source code, use `prepare-only` flag:


    prepare-only => True


### MSBuild/VS configuration

Use following parameter to adjust MSBuild and Visual Studio settings:

    Parameter               | Meaning                            | Default value
    ===============================================================================================================================================
    vs-inst-dir             | Visual  Studio install directory   | C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional
    ms-build-dir            | MS Build exe install directory     | C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin
    make-pri-exe-full-path  | Path to MakePri.exe tool           | C:\Program Files (x86)\Windows Kits\10\bin\10.0.17134.0\x86\MakePri.exe
    ===============================================================================================================================================
    
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


