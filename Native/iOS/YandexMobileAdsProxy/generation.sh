
pod install

#
# Сборка для айфона
#

xcodebuild archive \
-workspace YandexMobileAdsProxy.xcworkspace \
-scheme YandexMobileAdsProxy \
-configuration Release \
-sdk iphoneos \
-arch arm64 \
-archivePath archives/ios_device.xcarchive \
SKIP_INSTALL=NO


#
# Сборка для эмулятора
#


xcodebuild archive \
-workspace YandexMobileAdsProxy.xcworkspace \
-scheme YandexMobileAdsProxySimulator \
-configuration Release \
-sdk iphonesimulator \
-arch arm64 -arch x86_64 \
-archivePath archives/ios_device_simulator.xcarchive \
SKIP_INSTALL=NO


#
# Объединение
#


rm -rf ./xcframeworks

xcodebuild -create-xcframework \
-archive archives/ios_device_simulator.xcarchive -framework YandexMobileAdsProxy.framework \
-archive archives/ios_device.xcarchive -framework YandexMobileAdsProxy.framework \
-output xcframeworks/YandexMobileAdsProxy.xcframework

rm -rf ./build
rm -rf ./archives
