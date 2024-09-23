import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memkept/bloc/todo_bloc.dart';
import 'package:memkept/bloc/theme_mode_cubit.dart';
import 'package:memkept/home.dart';
import 'package:memkept/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeModeCubit>(
            create: (_) => ThemeModeCubit(),
          ),
          BlocProvider<TodoBloc>(
            create: (_) => TodoBloc()..add(ListTodos({})),
          )
        ],
        child: Builder(builder: (context) {
          final themeMode = context.watch<ThemeModeCubit>().state;

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'memkept',
            themeMode: themeMode,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            home: const HomePage(),
          );
        }));
  }
}
