///
//  Generated code. Do not modify.
//  source: protos/flutter_locker.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'flutter_locker.pbenum.dart';

class ProtoAndroidPrompt extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProtoAndroidPrompt', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'titleText', protoName: 'titleText')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cancelText', protoName: 'cancelText')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  ProtoAndroidPrompt._() : super();
  factory ProtoAndroidPrompt({
    $core.String? titleText,
    $core.String? cancelText,
    $core.String? description,
  }) {
    final _result = create();
    if (titleText != null) {
      _result.titleText = titleText;
    }
    if (cancelText != null) {
      _result.cancelText = cancelText;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory ProtoAndroidPrompt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoAndroidPrompt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoAndroidPrompt clone() => ProtoAndroidPrompt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoAndroidPrompt copyWith(void Function(ProtoAndroidPrompt) updates) => super.copyWith((message) => updates(message as ProtoAndroidPrompt)) as ProtoAndroidPrompt; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoAndroidPrompt create() => ProtoAndroidPrompt._();
  ProtoAndroidPrompt createEmptyInstance() => create();
  static $pb.PbList<ProtoAndroidPrompt> createRepeated() => $pb.PbList<ProtoAndroidPrompt>();
  @$core.pragma('dart2js:noInline')
  static ProtoAndroidPrompt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoAndroidPrompt>(create);
  static ProtoAndroidPrompt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get titleText => $_getSZ(0);
  @$pb.TagNumber(1)
  set titleText($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitleText() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitleText() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get cancelText => $_getSZ(1);
  @$pb.TagNumber(2)
  set cancelText($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCancelText() => $_has(1);
  @$pb.TagNumber(2)
  void clearCancelText() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class ProtoIOsPrompt extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProtoIOsPrompt', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'touchIdText', protoName: 'touchIdText')
    ..hasRequiredFields = false
  ;

  ProtoIOsPrompt._() : super();
  factory ProtoIOsPrompt({
    $core.String? touchIdText,
  }) {
    final _result = create();
    if (touchIdText != null) {
      _result.touchIdText = touchIdText;
    }
    return _result;
  }
  factory ProtoIOsPrompt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoIOsPrompt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoIOsPrompt clone() => ProtoIOsPrompt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoIOsPrompt copyWith(void Function(ProtoIOsPrompt) updates) => super.copyWith((message) => updates(message as ProtoIOsPrompt)) as ProtoIOsPrompt; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoIOsPrompt create() => ProtoIOsPrompt._();
  ProtoIOsPrompt createEmptyInstance() => create();
  static $pb.PbList<ProtoIOsPrompt> createRepeated() => $pb.PbList<ProtoIOsPrompt>();
  @$core.pragma('dart2js:noInline')
  static ProtoIOsPrompt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoIOsPrompt>(create);
  static ProtoIOsPrompt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get touchIdText => $_getSZ(0);
  @$pb.TagNumber(1)
  set touchIdText($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTouchIdText() => $_has(0);
  @$pb.TagNumber(1)
  void clearTouchIdText() => clearField(1);
}

class ProtoSaveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProtoSaveRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'secret')
    ..aOM<ProtoAndroidPrompt>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'androidPrompt', protoName: 'androidPrompt', subBuilder: ProtoAndroidPrompt.create)
    ..hasRequiredFields = false
  ;

  ProtoSaveRequest._() : super();
  factory ProtoSaveRequest({
    $core.String? key,
    $core.String? secret,
    ProtoAndroidPrompt? androidPrompt,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (secret != null) {
      _result.secret = secret;
    }
    if (androidPrompt != null) {
      _result.androidPrompt = androidPrompt;
    }
    return _result;
  }
  factory ProtoSaveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoSaveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoSaveRequest clone() => ProtoSaveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoSaveRequest copyWith(void Function(ProtoSaveRequest) updates) => super.copyWith((message) => updates(message as ProtoSaveRequest)) as ProtoSaveRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoSaveRequest create() => ProtoSaveRequest._();
  ProtoSaveRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoSaveRequest> createRepeated() => $pb.PbList<ProtoSaveRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoSaveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoSaveRequest>(create);
  static ProtoSaveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get secret => $_getSZ(1);
  @$pb.TagNumber(2)
  set secret($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSecret() => $_has(1);
  @$pb.TagNumber(2)
  void clearSecret() => clearField(2);

  @$pb.TagNumber(3)
  ProtoAndroidPrompt get androidPrompt => $_getN(2);
  @$pb.TagNumber(3)
  set androidPrompt(ProtoAndroidPrompt v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAndroidPrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearAndroidPrompt() => clearField(3);
  @$pb.TagNumber(3)
  ProtoAndroidPrompt ensureAndroidPrompt() => $_ensure(2);
}

class ProtoRetrieveRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProtoRetrieveRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOM<ProtoAndroidPrompt>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'androidPrompt', protoName: 'androidPrompt', subBuilder: ProtoAndroidPrompt.create)
    ..aOM<ProtoIOsPrompt>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'iOsPrompt', protoName: 'iOsPrompt', subBuilder: ProtoIOsPrompt.create)
    ..hasRequiredFields = false
  ;

  ProtoRetrieveRequest._() : super();
  factory ProtoRetrieveRequest({
    $core.String? key,
    ProtoAndroidPrompt? androidPrompt,
    ProtoIOsPrompt? iOsPrompt,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (androidPrompt != null) {
      _result.androidPrompt = androidPrompt;
    }
    if (iOsPrompt != null) {
      _result.iOsPrompt = iOsPrompt;
    }
    return _result;
  }
  factory ProtoRetrieveRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoRetrieveRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoRetrieveRequest clone() => ProtoRetrieveRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoRetrieveRequest copyWith(void Function(ProtoRetrieveRequest) updates) => super.copyWith((message) => updates(message as ProtoRetrieveRequest)) as ProtoRetrieveRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoRetrieveRequest create() => ProtoRetrieveRequest._();
  ProtoRetrieveRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoRetrieveRequest> createRepeated() => $pb.PbList<ProtoRetrieveRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoRetrieveRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoRetrieveRequest>(create);
  static ProtoRetrieveRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  ProtoAndroidPrompt get androidPrompt => $_getN(1);
  @$pb.TagNumber(2)
  set androidPrompt(ProtoAndroidPrompt v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAndroidPrompt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAndroidPrompt() => clearField(2);
  @$pb.TagNumber(2)
  ProtoAndroidPrompt ensureAndroidPrompt() => $_ensure(1);

  @$pb.TagNumber(3)
  ProtoIOsPrompt get iOsPrompt => $_getN(2);
  @$pb.TagNumber(3)
  set iOsPrompt(ProtoIOsPrompt v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasIOsPrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearIOsPrompt() => clearField(3);
  @$pb.TagNumber(3)
  ProtoIOsPrompt ensureIOsPrompt() => $_ensure(2);
}

class ProtoDeleteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ProtoDeleteRequest', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..hasRequiredFields = false
  ;

  ProtoDeleteRequest._() : super();
  factory ProtoDeleteRequest({
    $core.String? key,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    return _result;
  }
  factory ProtoDeleteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtoDeleteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtoDeleteRequest clone() => ProtoDeleteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtoDeleteRequest copyWith(void Function(ProtoDeleteRequest) updates) => super.copyWith((message) => updates(message as ProtoDeleteRequest)) as ProtoDeleteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ProtoDeleteRequest create() => ProtoDeleteRequest._();
  ProtoDeleteRequest createEmptyInstance() => create();
  static $pb.PbList<ProtoDeleteRequest> createRepeated() => $pb.PbList<ProtoDeleteRequest>();
  @$core.pragma('dart2js:noInline')
  static ProtoDeleteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtoDeleteRequest>(create);
  static ProtoDeleteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);
}

