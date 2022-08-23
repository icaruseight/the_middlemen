import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCZlT3ggpM7Ij_LDztXPJ91QnFxd77zp_k")
    GeneratedPluginRegistrant.register(with: self)
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>This app needs access to location when open.</string>
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
