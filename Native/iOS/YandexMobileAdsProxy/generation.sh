copy_frameworks() {
    local SOURCE_DIR=$1
    local DEST_DIR=$2
    local EXCLUDE_FRAMEWORK=$3

    # Очищаем папку Frameworks (если существует)
    if [ -d "$DEST_DIR" ]; then
        rm -rf "$DEST_DIR"/*
    else
        mkdir -p "$DEST_DIR"
    fi

    # Копируем все .framework файлы, кроме исключенных
    find "$SOURCE_DIR" -name "*.framework" | while read -r framework; do
        framework_name=$(basename "$framework")
        if [ "$framework_name" != "$EXCLUDE_FRAMEWORK" ]; then
            cp -R "$framework" "$DEST_DIR"
        fi
    done
}


#
# Сборка для айфона
#


xcodebuild \
-workspace YandexMobileAdsProxy.xcworkspace \
-scheme YandexMobileAdsProxy \
-configuration Release \
-sdk iphoneos \
-derivedDataPath build

SOURCE_DIR="build/Build/Products/Release-iphoneos"
DEST_DIR="Frameworks"
EXCLUDE="YandexMobileAdsProxy.framework"

copy_frameworks "$SOURCE_DIR" "$DEST_DIR" "$EXCLUDE"

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


xcodebuild \
-workspace YandexMobileAdsProxy.xcworkspace \
-scheme YandexMobileAdsProxySimulator \
-configuration Release \
-sdk iphonesimulator \
-derivedDataPath build

SOURCE_DIR="build/Build/Products/Release-iphonesimulator"
DEST_DIR="Frameworks"
EXCLUDE="YandexMobileAdsProxy.framework"

copy_frameworks "$SOURCE_DIR" "$DEST_DIR" "$EXCLUDE"

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
