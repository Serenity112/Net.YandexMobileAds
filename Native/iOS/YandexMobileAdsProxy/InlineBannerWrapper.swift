//
//  InlineBannerWrapper.swift
//  YandexMobileAdsProxy
//
//  Created by Aleksandr Skuratov on 10.06.2025.
//

import Foundation
import YandexMobileAds
    
@objc(InlineBannerWrapper)
public class InlineBannerWrapper : NSObject
{
    var adView: AdView? = nil
    
    @objc
    public var view: UIView? { get {return self.adView } }
    
    @objc
    public init(adUnitID: String, width: CGFloat, maxHeight: CGFloat)  {
        let adSize = BannerAdSize.inlineSize(withWidth: width, maxHeight: maxHeight)
        let adView = AdView(adUnitID: adUnitID, adSize: adSize)
        self.adView = adView;
    }
    
    @objc
    public func loadAdWithRequest(param : NSMutableDictionary) -> Void {
        let request = MutableAdRequest()
        request.parameters = param as? [String: String]
        self.adView?.loadAd(with: request)
    }
    
    
    @objc
    public func loadAdWithRequestDic(param : Dictionary<String,String>) -> Void {
        
        let request = MutableAdRequest()
        request.parameters = param
        self.adView?.loadAd(with: request)
    }

}
