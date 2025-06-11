using Net.YandexMobileAds.iOS;

namespace Playground.iOS;

[Register("AppDelegate")]
public class AppDelegate : UIApplicationDelegate
{
    public override UIWindow? Window { get; set; }

    public override bool FinishedLaunching(UIApplication application, NSDictionary launchOptions)
    {
        Window = new UIWindow(UIScreen.MainScreen.Bounds);

        MobileAdsWrapper.InitializeSDK();

        var inlineBannerWrapper = new InlineBannerWrapper(adUnitID: "demo-banner-yandex", 300f, 100f);

        var vc = new UIViewController();

        var button = new UIButton(new CGRect(0, UIScreen.MainScreen.Bounds.Height / 2, 200, 100));
        button.SetTitle("Загрузить рекламу", UIControlState.Normal);
        button.TouchUpInside += (sender, e) =>
        {
            var parameters = new NSMutableDictionary<NSString, NSString>();
            inlineBannerWrapper.LoadAdWithRequestWithParam(parameters);
            inlineBannerWrapper.View.Frame = new CGRect(0, UIScreen.MainScreen.Bounds.Height / 2 - 200,  UIScreen.MainScreen.Bounds.Width, 100);
        };

        vc.View!.AddSubview(button);
        vc.View.AddSubview(inlineBannerWrapper.View);
        Window.RootViewController = vc;
        Window.MakeKeyAndVisible();

        return true;
    }
}
