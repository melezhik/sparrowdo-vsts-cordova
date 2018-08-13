set PATH=%PATH%;"C:\Program Files\nodejs"
set VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional
set MSBUILDDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin
npm run ionic -- cordova build windows --[% build_configuration %] --arch=[% build_arch %]
