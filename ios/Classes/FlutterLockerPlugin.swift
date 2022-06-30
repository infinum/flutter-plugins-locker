import Flutter
import UIKit
import Locker

public class FlutterLockerPlugin: NSObject, PigeonApi, FlutterPlugin {
    public func canAuthenticate(completion: @escaping (NSNumber?, FlutterError?) -> Void) {
        let supportedBiometrics = Locker.configuredBiometricsAuthentication
        completion(supportedBiometrics != BiometricsType.none ? true : false, nil)
    }


    public func save(_ request: SaveSecretRequest, completion: @escaping (NSNumber?, FlutterError?) -> Void) {
        Locker.setSecret(request.secret, for: request.key)
        // This can never fail
        Locker.setShouldUseAuthenticationWithBiometrics(true, for: request.key)
        completion(true, nil)
    }

    public func retrieveRequest(_ request: RetrieveSecretRequest, completion: @escaping (String?, FlutterError?) -> Void) {
       Locker.retrieveCurrentSecret(
           for: request.key,
           operationPrompt: request.iOsPrompt.touchIdText,
           success: { (secret) in
               completion(secret, nil)
           },
           failure: { (failureStatus) in
               var code: Int = -1;
               
               switch failureStatus {
               case errSecItemNotFound:
                   code = 0
               case errSecAuthFailed:
                   code = 1
               case errSecUserCanceled:
                   code = 2
               default:
                   code = Int(failureStatus)
               }
               
               completion(nil, FlutterError(code: String(code), message: "Security error: " + failureStatus.description, details: nil))
           })
    }


    public func deleteKey(_ key: String, completion: @escaping (FlutterError?) -> Void) {
        Locker.deleteSecret(for: key)
        completion(nil);
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      let instance = FlutterLockerPlugin()
      PigeonApiSetup(registrar.messenger(), instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
