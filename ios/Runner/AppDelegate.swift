import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
	// cancel old notifications that were scheduled to be periodically shown upon a reinstallation of the app
    if UserDefaults.standard.object(forKey: "Notification") == nil {
        UIApplication.shared.cancelAllLocalNotifications()
        UserDefaults.standard.set(true, forKey: "Notification")
    }
	// Override point for customization after application launch.
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
