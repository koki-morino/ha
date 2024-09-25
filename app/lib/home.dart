import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memkept/bloc/theme_mode_cubit.dart';
import 'package:memkept/bloc/todo_bloc.dart';
import 'package:memkept/bloc/websocket_bloc.dart';
import 'package:memkept/protos/todo.pb.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final themeMode = context.watch<ThemeModeCubit>().state;
      final todoState = context.watch<TodoBloc>().state;
      final websocketState = context.watch<WebsocketBloc>().state;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Memkept"),
          actions: [
            IconButton(
              icon: Icon(
                // IconButtonTheme didn't work. Manually applying.
                size: Theme.of(context).iconTheme.size,
                themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
              onPressed: () => context.read<ThemeModeCubit>().toggle(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              var titleController = TextEditingController();
              var descriptionController = TextEditingController();

              return SimpleDialog(
                titlePadding: const EdgeInsets.all(20).copyWith(bottom: 0),
                title: const Text("Add Todo"),
                contentPadding: const EdgeInsets.all(20),
                children: [
                  TextField(
                    controller: titleController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: "Title",
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: descriptionController,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: "Description",
                    ),
                  ),
                  const SizedBox(height: 20),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: FilledButton(
                      child: const Text("Add"),
                      onPressed: () {
                        context.read<TodoBloc>().add(
                              CreateTodo(Todo(
                                id: uuid.v4(),
                                title: titleController.text,
                                description: descriptionController.text,
                                isCompleted: false,
                              )),
                            );

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        body: Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: 768),
              padding: const EdgeInsets.all(10),
              child: switch (todoState.runtimeType) {
                const (TodoSuccess) => ListView(
                    children: todoState.todos.keys
                        .map(
                          (key) => Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                      value: todoState.todos[key]!.isCompleted,
                                      onChanged: (_) =>
                                          context.read<TodoBloc>().add(
                                                UpdateTodo(Todo(
                                                  id: todoState.todos[key]!.id,
                                                  title: todoState
                                                      .todos[key]!.title,
                                                  description: todoState
                                                      .todos[key]!.description,
                                                  isCompleted: !todoState
                                                      .todos[key]!.isCompleted,
                                                )),
                                              )),
                                  Text(
                                    todoState.todos[key]!.title,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline),
                                    onPressed: () =>
                                        context.read<TodoBloc>().add(
                                              DeleteTodo(Todo(
                                                id: todoState.todos[key]!.id,
                                                title: "",
                                                description: "",
                                                isCompleted: false,
                                              )),
                                            ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                _ => const CircularProgressIndicator()
              }),
        ),
      );
    });
  }
}
