//
//  Generated code. Do not modify.
//  source: addressbook.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PhoneType extends $pb.ProtobufEnum {
  static const PhoneType PHONE_TYPE_UNSPECIFIED = PhoneType._(0, _omitEnumNames ? '' : 'PHONE_TYPE_UNSPECIFIED');
  static const PhoneType PHONE_TYPE_MOBILE = PhoneType._(1, _omitEnumNames ? '' : 'PHONE_TYPE_MOBILE');
  static const PhoneType PHONE_TYPE_HOME = PhoneType._(2, _omitEnumNames ? '' : 'PHONE_TYPE_HOME');
  static const PhoneType PHONE_TYPE_WORK = PhoneType._(3, _omitEnumNames ? '' : 'PHONE_TYPE_WORK');

  static const $core.List<PhoneType> values = <PhoneType> [
    PHONE_TYPE_UNSPECIFIED,
    PHONE_TYPE_MOBILE,
    PHONE_TYPE_HOME,
    PHONE_TYPE_WORK,
  ];

  static final $core.Map<$core.int, PhoneType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PhoneType? valueOf($core.int value) => _byValue[value];

  const PhoneType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
