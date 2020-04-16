///
//  Generated code. Do not modify.
//  source: protos/flutter_locker.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ProtoMethodInterface extends $pb.ProtobufEnum {
  static const ProtoMethodInterface canAuthenticate = ProtoMethodInterface._(0, 'canAuthenticate');
  static const ProtoMethodInterface saveSecret = ProtoMethodInterface._(1, 'saveSecret');
  static const ProtoMethodInterface retrieveSecret = ProtoMethodInterface._(2, 'retrieveSecret');
  static const ProtoMethodInterface deleteSecret = ProtoMethodInterface._(3, 'deleteSecret');

  static const $core.List<ProtoMethodInterface> values = <ProtoMethodInterface> [
    canAuthenticate,
    saveSecret,
    retrieveSecret,
    deleteSecret,
  ];

  static final $core.Map<$core.int, ProtoMethodInterface> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProtoMethodInterface valueOf($core.int value) => _byValue[value];

  const ProtoMethodInterface._($core.int v, $core.String n) : super(v, n);
}

