set -e
set -x

pwd

ls -l

npm install

npm install cordova

[%- IF use_ionic_build %]
  npm run ionic:build:prod
[%- END %]


