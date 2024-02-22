import Flutter
import UIKit
import Locker

extension FlutterError: Error {}

public class FlutterLockerPlugin: NSObject, PigeonApi, FlutterPlugin {
    func canAuthenticate(completion: @escaping (Result<Bool, Error>) -> Void) {
        let supportedBiometrics = Locker.configuredBiometricsAuthentication
        completion(.success(supportedBiometrics != BiometricsType.none ? true : false))
    }
    
    func save(request: SaveSecretRequest, completion: @escaping (Result<Void, Error>) -> Void) {
        Locker.setSecret(request.secret, for: request.key)
        // This can never fail
        Locker.setShouldUseAuthenticationWithBiometrics(true, for: request.key)
        completion(.success(Void()))
    }
    
    func retrieve(request: RetrieveSecretRequest, completion: @escaping (Result<String, Error>) -> Void) {
        Locker.retrieveCurrentSecret(
            for: request.key,
            operationPrompt: request.iOsPrompt.touchIdText,
            success: { (secret) in
                completion(.success(secret))
            },
            failure: { (failureStatus) in
                var code: String;
                
                switch failureStatus {
                case errSecItemNotFound:
                    code = "secretNotFound"
                case errSecUserCanceled:
                    code = "authenticationCanceled"
                case errSecAuthFailed:
                    code = "authenticationFailed"
                default:
                    code = "other"
                }
                
                completion(.failure(FlutterError(code: code, message: failureStatus.description, details: nil)))
            })
    }
    
    func delete(key: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Locker.deleteSecret(for: key)
        completion(.success(Void()))
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      let instance = FlutterLockerPlugin()
      PigeonApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
