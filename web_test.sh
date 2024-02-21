#!/usr/bin/env bash

# See https://docs.flutter.dev/cookbook/testing/integration/introduction#5b-web
CHROME_VERSION="122.0.6261.57"

# If "debug" arg is given we run in brower, otherwise run headless
if [ "$1" = "debug" ]; then
  DRIVER=chrome
else
  DRIVER=web-server
fi
echo "Driver $DRIVER"

# Download chromedriver to ./test_driver
# linux64	https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/linux64/chromedriver-linux64.zip
# mac-arm64	https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/mac-arm64/chromedriver-mac-arm64.zip
# mac-x64	https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/mac-x64/chromedriver-mac-x64.zip
# win32	https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/win32/chromedriver-win32.zip
# win64	https://storage.googleapis.com/chrome-for-testing-public/122.0.6261.57/win64/chromedriver-win64.zip
if ! (type chromedriver &> /dev/null) || [ ! -f "chromedriver" ]; then
  dart run test_driver/download_chromedriver.dart 
fi

# Start chromedriver
if (type chromedriver &> /dev/null); then
  chromedriver --port=4444 &
else
  ./chromedriver --port=4444 &
fi
sleep 2s

# Run tests
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/app_test.dart \
  -d $DRIVER

pkill chromedriver