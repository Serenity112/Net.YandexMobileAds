//
//  MobileAdsWrapper.swift
//  YandexMobileAdsProxy
//
//  Created by Aleksandr Skuratov on 10.06.2025.
//

import Foundation
import YandexMobileAds

@objc(MobileAdsWrapper)
public class MobileAdsWrapper : NSObject {
    
    @objc static public func initializeSDK() -> Void {
        MobileAds.initializeSDK()
        MobileAds.enableLogging()
    }
}
