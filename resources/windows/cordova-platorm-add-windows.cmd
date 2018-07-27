set PATH=%PATH%;"C:\Program Files\nodejs"

IF EXIST platforms\windows\CordovaApp.sln (
echo 'platforms\windows\CordovaApp.sln exist - skip this step'
) ELSE (
node_modules\.bin\cordova.cmd platform add windows
)

