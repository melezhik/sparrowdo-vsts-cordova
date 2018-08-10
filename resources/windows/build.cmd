set PATH=%PATH%;"C:\Program Files\nodejs"
REM set  VSINSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional
set MSBUILDDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\MSBuild\15.0\Bin
REM node_modules\.bin\cordova.cmd build [% build_configuration %] windows --verbose -- [% ms_build_opts %]
[% IF build_configuration == '' ]
npm run ionic -- cordova build windows [% build_configuration %] -- --arch="[% build_arch %]"
