// Autogenerated from Pigeon (v3.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "flutter_locker_api.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ?: [NSNull null]),
        @"message": (error.message ?: [NSNull null]),
        @"details": (error.details ?: [NSNull null]),
        };
  }
  return @{
      @"result": (result ?: [NSNull null]),
      @"error": errorDict,
      };
}
static id GetNullableObject(NSDictionary* dict, id key) {
  id result = dict[key];
  return (result == [NSNull null]) ? nil : result;
}
static id GetNullableObjectAtIndex(NSArray* array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}


@interface RetrieveSecretRequest ()
+ (RetrieveSecretRequest *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface SaveSecretRequest ()
+ (SaveSecretRequest *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface AndroidPrompt ()
+ (AndroidPrompt *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface IOsPrompt ()
+ (IOsPrompt *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation RetrieveSecretRequest
+ (instancetype)makeWithKey:(NSString *)key
    androidPrompt:(AndroidPrompt *)androidPrompt
    iOsPrompt:(IOsPrompt *)iOsPrompt {
  RetrieveSecretRequest* pigeonResult = [[RetrieveSecretRequest alloc] init];
  pigeonResult.key = key;
  pigeonResult.androidPrompt = androidPrompt;
  pigeonResult.iOsPrompt = iOsPrompt;
  return pigeonResult;
}
+ (RetrieveSecretRequest *)fromMap:(NSDictionary *)dict {
  RetrieveSecretRequest *pigeonResult = [[RetrieveSecretRequest alloc] init];
  pigeonResult.key = GetNullableObject(dict, @"key");
  NSAssert(pigeonResult.key != nil, @"");
  pigeonResult.androidPrompt = [AndroidPrompt fromMap:GetNullableObject(dict, @"androidPrompt")];
  NSAssert(pigeonResult.androidPrompt != nil, @"");
  pigeonResult.iOsPrompt = [IOsPrompt fromMap:GetNullableObject(dict, @"iOsPrompt")];
  NSAssert(pigeonResult.iOsPrompt != nil, @"");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"key" : (self.key ?: [NSNull null]),
    @"androidPrompt" : (self.androidPrompt ? [self.androidPrompt toMap] : [NSNull null]),
    @"iOsPrompt" : (self.iOsPrompt ? [self.iOsPrompt toMap] : [NSNull null]),
  };
}
@end

@implementation SaveSecretRequest
+ (instancetype)makeWithKey:(NSString *)key
    secret:(NSString *)secret
    androidPrompt:(AndroidPrompt *)androidPrompt {
  SaveSecretRequest* pigeonResult = [[SaveSecretRequest alloc] init];
  pigeonResult.key = key;
  pigeonResult.secret = secret;
  pigeonResult.androidPrompt = androidPrompt;
  return pigeonResult;
}
+ (SaveSecretRequest *)fromMap:(NSDictionary *)dict {
  SaveSecretRequest *pigeonResult = [[SaveSecretRequest alloc] init];
  pigeonResult.key = GetNullableObject(dict, @"key");
  NSAssert(pigeonResult.key != nil, @"");
  pigeonResult.secret = GetNullableObject(dict, @"secret");
  NSAssert(pigeonResult.secret != nil, @"");
  pigeonResult.androidPrompt = [AndroidPrompt fromMap:GetNullableObject(dict, @"androidPrompt")];
  NSAssert(pigeonResult.androidPrompt != nil, @"");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"key" : (self.key ?: [NSNull null]),
    @"secret" : (self.secret ?: [NSNull null]),
    @"androidPrompt" : (self.androidPrompt ? [self.androidPrompt toMap] : [NSNull null]),
  };
}
@end

@implementation AndroidPrompt
+ (instancetype)makeWithTitle:(NSString *)title
    cancelLabel:(NSString *)cancelLabel
    description:(nullable NSString *)description {
  AndroidPrompt* pigeonResult = [[AndroidPrompt alloc] init];
  pigeonResult.title = title;
  pigeonResult.cancelLabel = cancelLabel;
  pigeonResult.description = description;
  return pigeonResult;
}
+ (AndroidPrompt *)fromMap:(NSDictionary *)dict {
  AndroidPrompt *pigeonResult = [[AndroidPrompt alloc] init];
  pigeonResult.title = GetNullableObject(dict, @"title");
  NSAssert(pigeonResult.title != nil, @"");
  pigeonResult.cancelLabel = GetNullableObject(dict, @"cancelLabel");
  NSAssert(pigeonResult.cancelLabel != nil, @"");
  pigeonResult.description = GetNullableObject(dict, @"description");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"title" : (self.title ?: [NSNull null]),
    @"cancelLabel" : (self.cancelLabel ?: [NSNull null]),
    @"description" : (self.description ?: [NSNull null]),
  };
}
@end

@implementation IOsPrompt
+ (instancetype)makeWithTouchIdText:(NSString *)touchIdText {
  IOsPrompt* pigeonResult = [[IOsPrompt alloc] init];
  pigeonResult.touchIdText = touchIdText;
  return pigeonResult;
}
+ (IOsPrompt *)fromMap:(NSDictionary *)dict {
  IOsPrompt *pigeonResult = [[IOsPrompt alloc] init];
  pigeonResult.touchIdText = GetNullableObject(dict, @"touchIdText");
  NSAssert(pigeonResult.touchIdText != nil, @"");
  return pigeonResult;
}
- (NSDictionary *)toMap {
  return @{
    @"touchIdText" : (self.touchIdText ?: [NSNull null]),
  };
}
@end

@interface PigeonApiCodecReader : FlutterStandardReader
@end
@implementation PigeonApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [AndroidPrompt fromMap:[self readValue]];
    
    case 129:     
      return [IOsPrompt fromMap:[self readValue]];
    
    case 130:     
      return [RetrieveSecretRequest fromMap:[self readValue]];
    
    case 131:     
      return [SaveSecretRequest fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface PigeonApiCodecWriter : FlutterStandardWriter
@end
@implementation PigeonApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[AndroidPrompt class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[IOsPrompt class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[RetrieveSecretRequest class]]) {
    [self writeByte:130];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[SaveSecretRequest class]]) {
    [self writeByte:131];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface PigeonApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation PigeonApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[PigeonApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[PigeonApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *PigeonApiGetCodec() {
  static dispatch_once_t sPred = 0;
  static FlutterStandardMessageCodec *sSharedObject = nil;
  dispatch_once(&sPred, ^{
    PigeonApiCodecReaderWriter *readerWriter = [[PigeonApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}


void PigeonApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PigeonApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PigeonApi.canAuthenticate"
        binaryMessenger:binaryMessenger
        codec:PigeonApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(canAuthenticateWithCompletion:)], @"PigeonApi api (%@) doesn't respond to @selector(canAuthenticateWithCompletion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        [api canAuthenticateWithCompletion:^(NSNumber *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PigeonApi.save"
        binaryMessenger:binaryMessenger
        codec:PigeonApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(saveRequest:completion:)], @"PigeonApi api (%@) doesn't respond to @selector(saveRequest:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        SaveSecretRequest *arg_request = GetNullableObjectAtIndex(args, 0);
        [api saveRequest:arg_request completion:^(NSNumber *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PigeonApi.retrieve"
        binaryMessenger:binaryMessenger
        codec:PigeonApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(retrieveRequest:completion:)], @"PigeonApi api (%@) doesn't respond to @selector(retrieveRequest:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        RetrieveSecretRequest *arg_request = GetNullableObjectAtIndex(args, 0);
        [api retrieveRequest:arg_request completion:^(NSString *_Nullable output, FlutterError *_Nullable error) {
          callback(wrapResult(output, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.PigeonApi.delete"
        binaryMessenger:binaryMessenger
        codec:PigeonApiGetCodec()        ];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(deleteKey:completion:)], @"PigeonApi api (%@) doesn't respond to @selector(deleteKey:completion:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        NSString *arg_key = GetNullableObjectAtIndex(args, 0);
        [api deleteKey:arg_key completion:^(FlutterError *_Nullable error) {
          callback(wrapResult(nil, error));
        }];
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}