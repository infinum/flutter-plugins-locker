///
//  Generated code. Do not modify.
//  source: protos/flutter_locker.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use protoMethodInterfaceDescriptor instead')
const ProtoMethodInterface$json = const {
  '1': 'ProtoMethodInterface',
  '2': const [
    const {'1': 'canAuthenticate', '2': 0},
    const {'1': 'saveSecret', '2': 1},
    const {'1': 'retrieveSecret', '2': 2},
    const {'1': 'deleteSecret', '2': 3},
  ],
};

/// Descriptor for `ProtoMethodInterface`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List protoMethodInterfaceDescriptor = $convert.base64Decode('ChRQcm90b01ldGhvZEludGVyZmFjZRITCg9jYW5BdXRoZW50aWNhdGUQABIOCgpzYXZlU2VjcmV0EAESEgoOcmV0cmlldmVTZWNyZXQQAhIQCgxkZWxldGVTZWNyZXQQAw==');
@$core.Deprecated('Use protoLockerErrorDescriptor instead')
const ProtoLockerError$json = const {
  '1': 'ProtoLockerError',
  '2': const [
    const {'1': 'secretNotFound', '2': 0},
    const {'1': 'authenticationCanceled', '2': 1},
    const {'1': 'authenticationFailed', '2': 2},
    const {'1': 'unknown', '2': 3},
  ],
};

/// Descriptor for `ProtoLockerError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List protoLockerErrorDescriptor = $convert.base64Decode('ChBQcm90b0xvY2tlckVycm9yEhIKDnNlY3JldE5vdEZvdW5kEAASGgoWYXV0aGVudGljYXRpb25DYW5jZWxlZBABEhgKFGF1dGhlbnRpY2F0aW9uRmFpbGVkEAISCwoHdW5rbm93bhAD');
@$core.Deprecated('Use protoAndroidPromptDescriptor instead')
const ProtoAndroidPrompt$json = const {
  '1': 'ProtoAndroidPrompt',
  '2': const [
    const {'1': 'titleText', '3': 1, '4': 1, '5': 9, '10': 'titleText'},
    const {'1': 'cancelText', '3': 2, '4': 1, '5': 9, '10': 'cancelText'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `ProtoAndroidPrompt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoAndroidPromptDescriptor = $convert.base64Decode('ChJQcm90b0FuZHJvaWRQcm9tcHQSHAoJdGl0bGVUZXh0GAEgASgJUgl0aXRsZVRleHQSHgoKY2FuY2VsVGV4dBgCIAEoCVIKY2FuY2VsVGV4dBIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24=');
@$core.Deprecated('Use protoIOsPromptDescriptor instead')
const ProtoIOsPrompt$json = const {
  '1': 'ProtoIOsPrompt',
  '2': const [
    const {'1': 'touchIdText', '3': 1, '4': 1, '5': 9, '10': 'touchIdText'},
  ],
};

/// Descriptor for `ProtoIOsPrompt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoIOsPromptDescriptor = $convert.base64Decode('Cg5Qcm90b0lPc1Byb21wdBIgCgt0b3VjaElkVGV4dBgBIAEoCVILdG91Y2hJZFRleHQ=');
@$core.Deprecated('Use protoSaveRequestDescriptor instead')
const ProtoSaveRequest$json = const {
  '1': 'ProtoSaveRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'secret', '3': 2, '4': 1, '5': 9, '10': 'secret'},
    const {'1': 'androidPrompt', '3': 3, '4': 1, '5': 11, '6': '.ProtoAndroidPrompt', '10': 'androidPrompt'},
  ],
};

/// Descriptor for `ProtoSaveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoSaveRequestDescriptor = $convert.base64Decode('ChBQcm90b1NhdmVSZXF1ZXN0EhAKA2tleRgBIAEoCVIDa2V5EhYKBnNlY3JldBgCIAEoCVIGc2VjcmV0EjkKDWFuZHJvaWRQcm9tcHQYAyABKAsyEy5Qcm90b0FuZHJvaWRQcm9tcHRSDWFuZHJvaWRQcm9tcHQ=');
@$core.Deprecated('Use protoRetrieveRequestDescriptor instead')
const ProtoRetrieveRequest$json = const {
  '1': 'ProtoRetrieveRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'androidPrompt', '3': 2, '4': 1, '5': 11, '6': '.ProtoAndroidPrompt', '10': 'androidPrompt'},
    const {'1': 'iOsPrompt', '3': 3, '4': 1, '5': 11, '6': '.ProtoIOsPrompt', '10': 'iOsPrompt'},
  ],
};

/// Descriptor for `ProtoRetrieveRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoRetrieveRequestDescriptor = $convert.base64Decode('ChRQcm90b1JldHJpZXZlUmVxdWVzdBIQCgNrZXkYASABKAlSA2tleRI5Cg1hbmRyb2lkUHJvbXB0GAIgASgLMhMuUHJvdG9BbmRyb2lkUHJvbXB0Ug1hbmRyb2lkUHJvbXB0Ei0KCWlPc1Byb21wdBgDIAEoCzIPLlByb3RvSU9zUHJvbXB0UglpT3NQcm9tcHQ=');
@$core.Deprecated('Use protoDeleteRequestDescriptor instead')
const ProtoDeleteRequest$json = const {
  '1': 'ProtoDeleteRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `ProtoDeleteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protoDeleteRequestDescriptor = $convert.base64Decode('ChJQcm90b0RlbGV0ZVJlcXVlc3QSEAoDa2V5GAEgASgJUgNrZXk=');
