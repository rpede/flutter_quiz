#!/usr/bin/env bash

# If "debug" arg is given we run in brower, otherwise run headless
if [ "$1" = "debug" ]; then
  DRIVER=chrome
else
  DRIVER=web-server
fi

# Download chromedriver
pushd test_driver
CHROMEDRIVER=chromedriver-linux64/chromedriver
if [ ! -f "$CHROMEDRIVER" ]; then
    wget https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/linux64/chromedriver-linux64.zip
    unzip chromedriver-linux64.zip chromedriver-linux64/chromedriver
fi

# Start chromedriver
chromedriver --port=4444 &
popd

# Run tests
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d $DRIVER

pkill chromedriver