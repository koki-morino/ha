import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(MyTheme.light);

  void setTheme(ThemeData newTheme) => emit(newTheme);
}

class MyTheme {
  static ThemeData get light =>
      ThemeData.from(colorScheme: const ColorScheme.light());

  static ThemeData get dark =>
      ThemeData.from(colorScheme: const ColorScheme.dark());
}
