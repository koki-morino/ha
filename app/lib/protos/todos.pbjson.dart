//
//  Generated code. Do not modify.
//  source: todos.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use todosDescriptor instead')
const Todos$json = {
  '1': 'Todos',
  '2': [
    {'1': 'id', '3': 1, '4': 3, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `Todos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todosDescriptor = $convert.base64Decode(
    'CgVUb2RvcxIOCgJpZBgBIAMoCVICaWQ=');

@$core.Deprecated('Use todoDoDescriptor instead')
const TodoDo$json = {
  '1': 'TodoDo',
  '2': [
    {'1': 'crud', '3': 1, '4': 1, '5': 14, '6': '.todo.CRUD', '10': 'crud'},
    {'1': 'todo', '3': 2, '4': 1, '5': 11, '6': '.todo.Todo', '10': 'todo'},
  ],
};

/// Descriptor for `TodoDo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoDoDescriptor = $convert.base64Decode(
    'CgZUb2RvRG8SHgoEY3J1ZBgBIAEoDjIKLnRvZG8uQ1JVRFIEY3J1ZBIeCgR0b2RvGAIgASgLMg'
    'oudG9kby5Ub2RvUgR0b2Rv');

