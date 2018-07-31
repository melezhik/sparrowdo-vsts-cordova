set -e
set -x

npm run cordova -- build ios --release --device

find . -type f -name "*.ipa"


