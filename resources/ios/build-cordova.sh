set -e
set -x

# security unlock-keychain -p passwOrD ~/Library/Keychains/login.keychain-db

npm run cordova -- build ios --release --device

find . -type f -name "*.ipa"


