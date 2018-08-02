set -e
set -x

# security unlock-keychain -p passwOrD ~/Library/Keychains/login.keychain-db

npm run cordova -- build osx --debug --device

find . -type f -name "*.ipa"


