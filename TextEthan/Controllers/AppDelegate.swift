import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
    
    let appTokenData = NSDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("AppToken", ofType: "plist")!)
    let appToken: AnyObject? = appTokenData?.objectForKey("AppToken")
    
    var settings = SKTSettings(appToken: appToken as String)
    settings.enableAppWideGesture = false
    settings.enableGestureHintOnFirstLaunch = false
    
    SupportKit.initWithSettings(settings)

    return true
  }
}
