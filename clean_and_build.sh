#! /bin/bash

BUILD_CMD="xcodebuild clean build -project MZOpenWeatherApp-Swift/MZOpenWeatherApp-Swift.xcodeproj -scheme MZOpenWeatherApp-Swift CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
eval "${BUILD_CMD} | xcpretty"
else
eval "$BUILD_CMD"
fi
