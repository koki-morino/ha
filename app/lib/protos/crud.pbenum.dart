//
//  Generated code. Do not modify.
//  source: crud.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CRUD extends $pb.ProtobufEnum {
  static const CRUD CREATE = CRUD._(0, _omitEnumNames ? '' : 'CREATE');
  static const CRUD READ = CRUD._(1, _omitEnumNames ? '' : 'READ');
  static const CRUD UPDATE = CRUD._(2, _omitEnumNames ? '' : 'UPDATE');
  static const CRUD DELETE = CRUD._(3, _omitEnumNames ? '' : 'DELETE');

  static const $core.List<CRUD> values = <CRUD> [
    CREATE,
    READ,
    UPDATE,
    DELETE,
  ];

  static final $core.Map<$core.int, CRUD> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CRUD? valueOf($core.int value) => _byValue[value];

  const CRUD._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
