set PATH=%PATH%;"C:\Program Files\nodejs"

set VSINSTALLDIR=[% VSINSTALLDIR %]
set MSBUILDDIR=[% MSBUILDDIR %]
set MakePriExeFullPath=[% MakePriExeFullPath %]

npm run ionic -- cordova build windows --[% build_configuration %] -- --arch=[% build_arch %] --buildFlag /clp:Verbosity=normal --buildFlag /clp:UapAppxPackageBuildMode=StoreUpload --buildFlag /clp:AppxBundle=Always
