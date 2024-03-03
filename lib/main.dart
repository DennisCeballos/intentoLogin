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
      title: "Ejemplo de forms",
      routerConfig: approuter,
    );
  }
}
