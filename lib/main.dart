import 'package:flutter/material.dart';
import 'package:kilo_driver_app/routes/routes.dart';
import 'package:kilo_driver_app/theme/resource/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVVM with BLoC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: PRIMARY_COLOR,
          onPrimary: TEXT_COLOR,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: WHITE_COLOR,
          surfaceTintColor: WHITE_COLOR,
          elevation: 0.5, // Optional: remove shadow,
          shadowColor: GREY_COLOR,
          centerTitle: true, // Optional: center titles by default
          titleTextStyle: TextStyle(
            color: BLACK_COLOR,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const SplashView(),
      onGenerateRoute: RouteClass.generateRoute,
      // initialRoute: RouteClass.homepage,
    );
  }
}
