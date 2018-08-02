set -e
set -x

# security unlock-keychain -p passwOrD ~/Library/Keychains/login.keychain-db

if test -d 'platforms/osx'; then
  echo "platform/ios exists, skip 'npm run cordova platform add osx'"
else
  mkdir -p www
  npm run cordova platform add osx
fi

npm run cordova -- build osx --debug --device

find . -type f -name "*.ipa"


