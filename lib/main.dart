import 'package:flutter/material.dart';
import 'package:form_login/config/app_router.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router( 
      debugShowCheckedModeBanner: false,
      title: "Protecto",
      routerConfig: approuter,
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 28,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            color: Colors.black54
          ),
          labelSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w100,
            color: Colors.black38
          ),
          displaySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey
          ),
          bodySmall: TextStyle(
            fontSize: 18,
            //height: 7,
            fontWeight: FontWeight.w300,
            color: Colors.grey
          )
        )
      ),
    );
  }
}
