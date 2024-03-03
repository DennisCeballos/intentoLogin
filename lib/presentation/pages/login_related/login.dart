import 'package:flutter/material.dart';
import 'package:form_login/presentation/pages/login_related/widgets/login_widgets/form_login.dart';
import 'package:go_router/go_router.dart';

class LoginUI extends StatelessWidget {
  static const String name = 'login_page';
  const LoginUI({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicia sesión en nuestra gran app'),
        actions: <Widget> [
          IconButton(onPressed: () => context.go('/register'), icon: const Icon(Icons.add))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: LoginForm(),
      ),
    );
  }
}