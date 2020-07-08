import Flutter
import UIKit
import Locker
import Security.SecBase

// TODO:
// - better error handling

public class SwiftFlutterLockerPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_locker", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterLockerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let rawMethod = Int(call.method), let method = ProtoMethodInterface(rawValue: rawMethod) else {
            return result(FlutterMethodNotImplemented)
        }
        
        switch method {
        case .canAuthenticate: canAuthenticate(result: result)
        case .saveSecret: save(call: call, result: result)
        case .retrieveSecret: retrieve(call: call, result: result)
        case .deleteSecret: delete(call: call, result: result)
        case .UNRECOGNIZED(_): result(FlutterMethodNotImplemented)
        }
    }
}

private extension SwiftFlutterLockerPlugin {
    
    private func canAuthenticate(result: @escaping FlutterResult) {
        let supportedBiometrics = Locker.configuredBiometricsAuthentication
        result(supportedBiometrics != BiometricsType.none)
    }
    
    private func save(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? FlutterStandardTypedData, let saveRequest = try? ProtoSaveRequest(serializedData: data.data) else {
             result(FlutterMethodNotImplemented)
             return
         }
        
        Locker.setSecret(saveRequest.secret, for: saveRequest.key)
        
        // This can never fail
        Locker.setShouldUseAuthenticationWithBiometrics(true, for: saveRequest.key)
        result(nil)
    }

    private func retrieve(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? FlutterStandardTypedData, let retrieveRequest = try? ProtoRetrieveRequest(serializedData: data.data) else {
             result(FlutterMethodNotImplemented)
             return
         }
        
        Locker.retrieveCurrentSecret(
            for: retrieveRequest.key,
            operationPrompt: retrieveRequest.iOsPrompt.touchIDText,
            success: { (secret) in
                guard let secret = secret else {
                    result(FlutterError(code: "ERROR", message: "Locker.retrieve error, unable to parse keychain data to string.", details: nil))
                    return
                }
                result(secret)
            },
            failure: { (failureStatus) in
                var code = ProtoLockerError.unknown
                
                switch failureStatus {
                case errSecItemNotFound:
                    code = ProtoLockerError.secretNotFound
                case errSecAuthFailed:
                    code = ProtoLockerError.authenticationFailed
                case errSecUserCanceled:
                    code = ProtoLockerError.authenticationCanceled
                default:
                    code = ProtoLockerError.unknown
                }
                
                result(FlutterError(code: String(code.rawValue), message: "Security error: " + failureStatus.description, details: nil))
            })
    }
    
    private func delete(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? FlutterStandardTypedData, let deleteRequest = try? ProtoDeleteRequest(serializedData: data.data) else {
             result(FlutterMethodNotImplemented)
             return
         }
        
        Locker.deleteSecret(for: deleteRequest.key)
        result(nil);
    }
}
