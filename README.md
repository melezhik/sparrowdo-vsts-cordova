# Sparrowdo::VSTS::YAML::Cordova

Sparrowdo module to generate VSTS yaml build definition steps for Cordova build.

# Platform supported

* Windows

For building Cordova for iOS/OSx see [Sparrowdo::Cordova::OSx::Build](https://github.com/melezhik/sparrowdo-cordova-osx-build) module.

# Prerequisites

* Perl5
* Ionic
* Powershell

# Usage

    $ cat sparrowfile

    module_run "VSTS::YAML::Cordova", %( 
      build-dir => "vsts/build",
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
    
# Platforms supported

* Windows

# Author

Aleksei Melezhik


