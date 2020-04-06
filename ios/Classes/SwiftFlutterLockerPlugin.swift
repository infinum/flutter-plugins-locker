import Flutter
import UIKit
import Locker


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
        Locker.setSecret(secret, for: key)
        Locker.setShouldUseAuthenticationWithBiometrics(true, for: key)
        // will there ever be fail?
        result(true)
    }
    
    
    private func retrieve(key: String, title: String, result: @escaping FlutterResult) {
        Locker.retrieveCurrentSecret(
            for: key,
            operationPrompt: title,
            success: { (secret) in
                result(secret)
        }, failure: { (failureStatus) in
            result(FlutterError(code: "ERROR", message: "Locker.retrieve error " + failureStatus.description, details: nil))}
        )
        
        result(true)
    }
    
}



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
