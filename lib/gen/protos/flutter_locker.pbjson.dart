///
//  Generated code. Do not modify.
//  source: protos/flutter_locker.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ProtoMethodInterface$json = const {
  '1': 'ProtoMethodInterface',
  '2': const [
    const {'1': 'canAuthenticate', '2': 0},
    const {'1': 'saveSecret', '2': 1},
    const {'1': 'retrieveSecret', '2': 2},
    const {'1': 'deleteSecret', '2': 3},
  ],
};

const ProtoAndroidPrompt$json = const {
  '1': 'ProtoAndroidPrompt',
  '2': const [
    const {'1': 'titleText', '3': 1, '4': 1, '5': 9, '10': 'titleText'},
    const {'1': 'cancelText', '3': 2, '4': 1, '5': 9, '10': 'cancelText'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

const ProtoIOsPrompt$json = const {
  '1': 'ProtoIOsPrompt',
  '2': const [
    const {'1': 'touchIdText', '3': 1, '4': 1, '5': 9, '10': 'touchIdText'},
  ],
};

const ProtoSaveRequest$json = const {
  '1': 'ProtoSaveRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'secret', '3': 2, '4': 1, '5': 9, '10': 'secret'},
    const {'1': 'androidPrompt', '3': 3, '4': 1, '5': 11, '6': '.ProtoAndroidPrompt', '10': 'androidPrompt'},
  ],
};

const ProtoRetrieveRequest$json = const {
  '1': 'ProtoRetrieveRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'androidPrompt', '3': 2, '4': 1, '5': 11, '6': '.ProtoAndroidPrompt', '10': 'androidPrompt'},
    const {'1': 'iOsPrompt', '3': 3, '4': 1, '5': 11, '6': '.ProtoIOsPrompt', '10': 'iOsPrompt'},
  ],
};

const ProtoDeleteRequest$json = const {
  '1': 'ProtoDeleteRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
  ],
};

