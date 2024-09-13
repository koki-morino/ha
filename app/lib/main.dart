import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:memkept/app.dart';
import 'package:memkept/states/observer.dart';

void main() {
  Bloc.observer = const Observer();
  runApp(const MyApp());
}
