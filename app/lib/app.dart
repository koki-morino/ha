import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memkept/pages/home.dart';
import 'package:memkept/states/counter.dart';
import 'package:memkept/states/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider<CounterCubit>(
            create: (_) => CounterCubit(),
          )
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(builder: (context, state) {
          return MaterialApp(
            title: 'memkept',
            theme: state,
            home: const HomePage(),
          );
        }));
  }
}
