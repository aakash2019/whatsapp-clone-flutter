import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsapp_clone/new_screen/landing_screen.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';
import 'package:whatsapp_clone/screens/home_screen.dart';
import 'package:whatsapp_clone/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var textStyle = TextTheme(
    displayLarge: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    displayMedium: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    displaySmall: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    headlineLarge: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    headlineMedium: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    headlineSmall: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    titleLarge: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    titleMedium: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    titleSmall: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    labelLarge: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    labelMedium: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    labelSmall: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    bodyLarge: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
    bodyMedium: TextStyle(fontFamily: 'OpenSans', color: Colors.black),
  );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      tabBarTheme: TabBarTheme(
        labelColor: Colors.white,
        labelStyle: TextStyle(color: Colors.white),
      ),
      textTheme: textStyle,
    );
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Color(0xFF075E54),
            secondary: Color(0xFF128C7E),
          ),
          textTheme: textStyle),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
