import 'package:flutter/material.dart';
import 'package:kilo_driver_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM with BLoC',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          primary: Colors.yellow,
        ),
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            shadowColor: Colors.white,
            elevation: 4,
            foregroundColor: Colors.black),
        hoverColor: Colors.yellow.shade200,
      ),
      home: const HomeView(),
    );
  }
}
