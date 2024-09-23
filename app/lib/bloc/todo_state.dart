part of 'todo_bloc.dart';

enum TodoStatus { loading, success, failure }

class TodoState extends Equatable {
  final TodoStatus status;
  final Map<String, Todo> todos;

  const TodoState({
    this.status = TodoStatus.loading,
    this.todos = const {},
  });

  TodoState copyWith({
    TodoStatus? status,
    Map<String, Todo>? todos,
  }) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [status, todos];
}
