import 'package:flutter/material.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';
import 'package:kilo_driver_app/views/splash_view.dart';

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
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: PRIMARY_COLOR,
          onPrimary: TEXT_COLOR,
        ),
      ),
      home: const SplashView(),
    );
  }
}
