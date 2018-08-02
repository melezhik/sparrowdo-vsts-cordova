set -e
set -x

pwd

ls -l

npm install

npm install cordova

[%- IF use_ionic_build %]
  npm run ionic:build:prod
[%- END %]

if test -d 'platforms/ios'; then
  echo "platform/ios exists, skip 'npm run cordova platform add ios'"
else
  mkdir -p www
  npm run cordova platform add ios
fi

