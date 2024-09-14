//
//  Generated code. Do not modify.
//  source: todos.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'crud.pbenum.dart' as $1;
import 'todo.pb.dart' as $0;

/// Server sends this message right after establishing connection with client.
/// Client then sends read request for each Todo to get detail.
class Todos extends $pb.GeneratedMessage {
  factory Todos({
    $core.Iterable<$core.String>? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id.addAll(id);
    }
    return $result;
  }
  Todos._() : super();
  factory Todos.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Todos.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Todos', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Todos clone() => Todos()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Todos copyWith(void Function(Todos) updates) => super.copyWith((message) => updates(message as Todos)) as Todos;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Todos create() => Todos._();
  Todos createEmptyInstance() => create();
  static $pb.PbList<Todos> createRepeated() => $pb.PbList<Todos>();
  @$core.pragma('dart2js:noInline')
  static Todos getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Todos>(create);
  static Todos? _defaultInstance;

  /// List of UUIDs.
  @$pb.TagNumber(1)
  $core.List<$core.String> get id => $_getList(0);
}

/// Server and client command each other to do one of CRUD operations
/// through this message.
class TodoDo extends $pb.GeneratedMessage {
  factory TodoDo({
    $1.CRUD? crud,
    $0.Todo? todo,
  }) {
    final $result = create();
    if (crud != null) {
      $result.crud = crud;
    }
    if (todo != null) {
      $result.todo = todo;
    }
    return $result;
  }
  TodoDo._() : super();
  factory TodoDo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TodoDo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TodoDo', package: const $pb.PackageName(_omitMessageNames ? '' : 'todo'), createEmptyInstance: create)
    ..e<$1.CRUD>(1, _omitFieldNames ? '' : 'crud', $pb.PbFieldType.OE, defaultOrMaker: $1.CRUD.CREATE, valueOf: $1.CRUD.valueOf, enumValues: $1.CRUD.values)
    ..aOM<$0.Todo>(2, _omitFieldNames ? '' : 'todo', subBuilder: $0.Todo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TodoDo clone() => TodoDo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TodoDo copyWith(void Function(TodoDo) updates) => super.copyWith((message) => updates(message as TodoDo)) as TodoDo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TodoDo create() => TodoDo._();
  TodoDo createEmptyInstance() => create();
  static $pb.PbList<TodoDo> createRepeated() => $pb.PbList<TodoDo>();
  @$core.pragma('dart2js:noInline')
  static TodoDo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TodoDo>(create);
  static TodoDo? _defaultInstance;

  @$pb.TagNumber(1)
  $1.CRUD get crud => $_getN(0);
  @$pb.TagNumber(1)
  set crud($1.CRUD v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCrud() => $_has(0);
  @$pb.TagNumber(1)
  void clearCrud() => clearField(1);

  @$pb.TagNumber(2)
  $0.Todo get todo => $_getN(1);
  @$pb.TagNumber(2)
  set todo($0.Todo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTodo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTodo() => clearField(2);
  @$pb.TagNumber(2)
  $0.Todo ensureTodo() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
