import UIKit
import Flutter
import GoogleMaps
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  if #available(iOS 10.0, *) {
    UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
  }
    FirebaseApp.configure()
    //GMSServices.provideAPIKey("AIzaSyBCZtH8k1SqBpcV-7gsV4MNr6gvcSjsDQY")
    GMSServices.provideAPIKey("AIzaSyCxhNje85NaUiBJjy2VPU5iHgwh1snxWyE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
