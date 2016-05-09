#! /bin/bash

TEST_CMD="xcodebuild test -project MZOpenWeatherApp-Swift/MZOpenWeatherApp-Swift.xcodeproj -scheme MZOpenWeatherApp-Swift -destination 'platform=iOS Simulator,name=iPhone 4s,OS=9.3'"
#-destination 'platform=iOS Simulator,name=iPhone 5,OS=9.3' -destination 'platform=iOS Simulator,name=iPhone 5s,OS=9.3'"

which -s xcpretty
XCPRETTY_INSTALLED=$?

if [[ $TRAVIS || $XCPRETTY_INSTALLED == 0 ]]; then
eval "${TEST_CMD} | xcpretty"
else
eval "$TEST_CMD"
fi
