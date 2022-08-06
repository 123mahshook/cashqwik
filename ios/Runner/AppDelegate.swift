import UIKit
import Flutter
import GoogleMaps
import Firebase
import FirebaseCore


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     //FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyDi3dZ2Q5aHWQosftzvvKlpsJJVuA5ivUA")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
