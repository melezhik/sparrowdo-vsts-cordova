set -e
set -x

# security unlock-keychain -p passwOrD ~/Library/Keychains/login.keychain-db

if test -d 'platforms/ios'; then
  echo "platform/ios exists, skip 'npm run cordova platform add ios'"
else
  mkdir -p www
  npm run cordova platform add ios
fi

npm run cordova -- build ios --debug --device

find . -type f -name "*.ipa"


