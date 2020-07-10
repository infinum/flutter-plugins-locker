///
//  Generated code. Do not modify.
//  source: protos/flutter_locker.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'flutter_locker.pbenum.dart';

class ProtoAndroidPrompt extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('ProtoAndroidPrompt', createEmptyInstance: create)
        ..aOS(1, 'titleText', protoName: 'titleText')
        ..aOS(2, 'cancelText', protoName: 'cancelText')
        ..aOS(3, 'description')
        ..hasRequiredFields = false;

  ProtoAndroidPrompt._() : super();
  factory ProtoAndroidPrompt() => create();
  factory ProtoAndroidPrompt.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProtoAndroidPrompt.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ProtoAndroidPrompt clone() => ProtoAndroidPrompt()..mergeFromMessage(this);
  ProtoAndroidPrompt copyWith(void Function(ProtoAndroidPrompt) updates) =>
      super.copyWith((message) => updates(message as ProtoAndroidPrompt));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoAndroidPrompt create() => ProtoAndroidPrompt._();
  ProtoAndroidPrompt createEmptyInstance() => create();
  static $pb.PbList<ProtoAndroidPrompt> createRepeated() =>
      $pb.PbList<ProtoAndroidPrompt>();
  @$core.pragma('dart2js:noInline')
  static ProtoAndroidPrompt getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoAndroidPrompt>(create);
  static ProtoAndroidPrompt _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get titleText => $_getSZ(0);
  @$pb.TagNumber(1)
  set titleText($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTitleText() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitleText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cancelText => $_getSZ(1);
  @$pb.TagNumber(2)
  set cancelText($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasCancelText() => $_has(1);
  @$pb.TagNumber(2)
  void clearCancelText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class ProtoIOsPrompt extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('ProtoIOsPrompt', createEmptyInstance: create)
        ..aOS(1, 'touchIdText', protoName: 'touchIdText')
        ..hasRequiredFields = false;

  ProtoIOsPrompt._() : super();
  factory ProtoIOsPrompt() => create();
  factory ProtoIOsPrompt.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProtoIOsPrompt.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ProtoIOsPrompt clone() => ProtoIOsPrompt()..mergeFromMessage(this);
  ProtoIOsPrompt copyWith(void Function(ProtoIOsPrompt) updates) =>
      super.copyWith((message) => updates(message as ProtoIOsPrompt));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoIOsPrompt create() => ProtoIOsPrompt._();
  ProtoIOsPrompt createEmptyInstance() => create();
  static $pb.PbList<ProtoIOsPrompt> createRepeated() =>
      $pb.PbList<ProtoIOsPrompt>();
  @$core.pragma('dart2js:noInline')
  static ProtoIOsPrompt getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoIOsPrompt>(create);
  static ProtoIOsPrompt _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchIdText => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchIdText($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTouchIdText() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchIdText() => clearField(1);
}

class ProtoSaveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('ProtoSaveRequest', createEmptyInstance: create)
        ..aOS(1, 'key')
        ..aOS(2, 'secret')
        ..aOM<ProtoAndroidPrompt>(3, 'androidPrompt',
            protoName: 'androidPrompt', subBuilder: ProtoAndroidPrompt.create)
        ..hasRequiredFields = false;

  ProtoSaveRequest._() : super();
  factory ProtoSaveRequest() => create();
  factory ProtoSaveRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProtoSaveRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ProtoSaveRequest clone() => ProtoSaveRequest()..mergeFromMessage(this);
  ProtoSaveRequest copyWith(void Function(ProtoSaveRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoSaveRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoSaveRequest create() => ProtoSaveRequest._();
  ProtoSaveRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoSaveRequest> createRepeated() =>
      $pb.PbList<ProtoSaveRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoSaveRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoSaveRequest>(create);
  static ProtoSaveRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secret => $_getSZ(1);
  @$pb.TagNumber(2)
  set secret($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecret() => clearField(2);

  @$pb.TagNumber(3)
  ProtoAndroidPrompt get androidPrompt => $_getN(2);
  @$pb.TagNumber(3)
  set androidPrompt(ProtoAndroidPrompt v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAndroidPrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearAndroidPrompt() => clearField(3);
  @$pb.TagNumber(3)
  ProtoAndroidPrompt ensureAndroidPrompt() => $_ensure(2);
}

class ProtoRetrieveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('ProtoRetrieveRequest', createEmptyInstance: create)
        ..aOS(1, 'key')
        ..aOM<ProtoAndroidPrompt>(2, 'androidPrompt',
            protoName: 'androidPrompt', subBuilder: ProtoAndroidPrompt.create)
        ..aOM<ProtoIOsPrompt>(3, 'iOsPrompt',
            protoName: 'iOsPrompt', subBuilder: ProtoIOsPrompt.create)
        ..hasRequiredFields = false;

  ProtoRetrieveRequest._() : super();
  factory ProtoRetrieveRequest() => create();
  factory ProtoRetrieveRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProtoRetrieveRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ProtoRetrieveRequest clone() =>
      ProtoRetrieveRequest()..mergeFromMessage(this);
  ProtoRetrieveRequest copyWith(void Function(ProtoRetrieveRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoRetrieveRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoRetrieveRequest create() => ProtoRetrieveRequest._();
  ProtoRetrieveRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoRetrieveRequest> createRepeated() =>
      $pb.PbList<ProtoRetrieveRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoRetrieveRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoRetrieveRequest>(create);
  static ProtoRetrieveRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  ProtoAndroidPrompt get androidPrompt => $_getN(1);
  @$pb.TagNumber(2)
  set androidPrompt(ProtoAndroidPrompt v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAndroidPrompt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAndroidPrompt() => clearField(2);
  @$pb.TagNumber(2)
  ProtoAndroidPrompt ensureAndroidPrompt() => $_ensure(1);

  @$pb.TagNumber(3)
  ProtoIOsPrompt get iOsPrompt => $_getN(2);
  @$pb.TagNumber(3)
  set iOsPrompt(ProtoIOsPrompt v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasIOsPrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearIOsPrompt() => clearField(3);
  @$pb.TagNumber(3)
  ProtoIOsPrompt ensureIOsPrompt() => $_ensure(2);
}

class ProtoDeleteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i =
      $pb.BuilderInfo('ProtoDeleteRequest', createEmptyInstance: create)
        ..aOS(1, 'key')
        ..hasRequiredFields = false;

  ProtoDeleteRequest._() : super();
  factory ProtoDeleteRequest() => create();
  factory ProtoDeleteRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ProtoDeleteRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  ProtoDeleteRequest clone() => ProtoDeleteRequest()..mergeFromMessage(this);
  ProtoDeleteRequest copyWith(void Function(ProtoDeleteRequest) updates) =>
      super.copyWith((message) => updates(message as ProtoDeleteRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoDeleteRequest create() => ProtoDeleteRequest._();
  ProtoDeleteRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoDeleteRequest> createRepeated() =>
      $pb.PbList<ProtoDeleteRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoDeleteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProtoDeleteRequest>(create);
  static ProtoDeleteRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);
}
