import Flutter
import UIKit
import Locker

enum Method {
    case canAuthenticate
    case save
    case retrieve
    case unrecognized
    
    init?(name: String) {
        switch name {
        case "canAuthenticate": self = .canAuthenticate
        case "saveSecret": self = .save
        case "retrieveSecret": self = .retrieve
        default: self = .unrecognized
        }
    }
}

// TODO:
// - better error handling
// - Method enum can be improved
// - Flutter calls and deconstructing can be improved with Proto Buffers
// - force unwrapping can be improved as well

public class SwiftFlutterLockerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_locker", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterLockerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = Method(name: call.method)
        let args = (call.arguments as? [String]);
        
        switch method {
        case .canAuthenticate: canAuthenticate(result: result)
        case .save: save(key: args![0], secret: args![1], result: result)
        case .retrieve: retrieve(key: args![0], title: args![1], result: result)
        default: result(FlutterMethodNotImplemented)
        }
    }
    
    private func canAuthenticate(result: @escaping FlutterResult) {
        let supportedBiometrics = Locker.configuredBiometricsAuthentication
        result(supportedBiometrics != BiometricsType.none)
    }
    
    private func save(key: String, secret: String, result: @escaping FlutterResult) {
        // This could theoretically fail but we never managed to break it ... If somehow set secret fails, it will be logged to console.
        Locker.setSecret(secret, for: key)
        // This can never fail.
        Locker.setShouldUseAuthenticationWithBiometrics(true, for: key)
        // Considering all of the above, we are always returning true.
        result(true)
    }

    private func retrieve(key: String, title: String, result: @escaping FlutterResult) {
        Locker.retrieveCurrentSecret(
            for: key,
            operationPrompt: title,
            success: { (secret) in
                guard let secret = secret else {
                    result(FlutterError(code: "ERROR", message: "Locker.retrieve error, unable to parse keychain data to string.", details: nil))
                    return
                }
                result(secret)
            },
            failure: { (failureStatus) in
                result(FlutterError(code: "ERROR", message: "Locker.retrieve error " + failureStatus.description, details: nil))
            })
    }

}
