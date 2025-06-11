using System;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace Net.YandexMobileAds.iOS
{
	// @interface InlineBannerWrapper : NSObject
	[BaseType (typeof(NSObject))]
	[DisableDefaultCtor]
	interface InlineBannerWrapper
	{
		// @property (readonly, nonatomic, strong) UIView * _Nullable view;
		[NullAllowed, Export ("view", ArgumentSemantic.Strong)]
		UIView View { get; }

		// -(instancetype _Nonnull)initWithAdUnitID:(NSString * _Nonnull)adUnitID width:(CGFloat)width maxHeight:(CGFloat)maxHeight __attribute__((objc_designated_initializer));
		[Export ("initWithAdUnitID:width:maxHeight:")]
		[DesignatedInitializer]
		NativeHandle Constructor (string adUnitID, nfloat width, nfloat maxHeight);

		// -(void)loadAdWithRequestWithParam:(NSMutableDictionary * _Nonnull)param;
		[Export ("loadAdWithRequestWithParam:")]
		void LoadAdWithRequestWithParam (NSMutableDictionary param);

		// -(void)loadAdWithRequestDicWithParam:(NSDictionary<NSString *,NSString *> * _Nonnull)param;
		[Export ("loadAdWithRequestDicWithParam:")]
		void LoadAdWithRequestDicWithParam (NSDictionary<NSString, NSString> param);
	}

	// @interface MobileAdsWrapper : NSObject
	[BaseType (typeof(NSObject))]
	interface MobileAdsWrapper
	{
		// +(void)initializeSDK;
		[Static]
		[Export ("initializeSDK")]
		void InitializeSDK ();
	}

	// @interface StickyBannerWrapper : NSObject
	[BaseType (typeof(NSObject))]
	[DisableDefaultCtor]
	interface StickyBannerWrapper
	{
		// @property (readonly, nonatomic, strong) UIView * _Nullable view;
		[NullAllowed, Export ("view", ArgumentSemantic.Strong)]
		UIView View { get; }

		// -(instancetype _Nonnull)initWithAdUnitID:(NSString * _Nonnull)adUnitID width:(CGFloat)width __attribute__((objc_designated_initializer));
		[Export ("initWithAdUnitID:width:")]
		[DesignatedInitializer]
		NativeHandle Constructor (string adUnitID, nfloat width);

		// -(void)loadAdWithRequestWithParam:(NSMutableDictionary * _Nonnull)param;
		[Export ("loadAdWithRequestWithParam:")]
		void LoadAdWithRequestWithParam (NSMutableDictionary param);

		// -(void)loadAdWithRequestDicWithParam:(NSDictionary<NSString *,NSString *> * _Nonnull)param;
		[Export ("loadAdWithRequestDicWithParam:")]
		void LoadAdWithRequestDicWithParam (NSDictionary<NSString, NSString> param);
	}
}
