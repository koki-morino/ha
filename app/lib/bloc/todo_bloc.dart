import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memkept/protos/todo.pb.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoLoading(todos: {})) {
    on<ListTodos>(_onListTodos);
    on<CreateTodo>(_onCreateTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
  }

  void _onListTodos(ListTodos event, Emitter<TodoState> emit) {
    emit(TodoSuccess(todos: event.todos));
  }

  void _onCreateTodo(CreateTodo event, Emitter<TodoState> emit) {
    var tmp = Map<String, Todo>.from(state.todos);
    tmp.addAll({event.todo.id: event.todo});

    emit(TodoSuccess(todos: tmp));
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    var tmp = Map<String, Todo>.from(state.todos);
    tmp.remove(event.todo.id);

    emit(TodoSuccess(todos: tmp));
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) {
    var tmp = Map<String, Todo>.from(state.todos);
    tmp.update(event.todo.id, (_) => event.todo);

    emit(TodoSuccess(todos: tmp));
  }
}
