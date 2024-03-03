import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeUI extends StatelessWidget {
  static const String name = 'home_page';
  const HomeUI({super.key, this.dni});

  final String? dni;
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.delete), onPressed: () => context.go('/login')), title: Text('Bienvenido $dni'),),
      body: Center(child: Text('Hola, DNI: $dni'),),
    );
  }
}