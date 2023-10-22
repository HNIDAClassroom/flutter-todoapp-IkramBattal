import 'package:flutter/material.dart';
import 'package:todolist_app/tasks.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(), //ColorScheme.dark(brightness: Brightness.dark),
        appBarTheme: const AppBarTheme(elevation: 0),
        useMaterial3: true,
      ),
      home: Tasks(),
    ),
  );
}