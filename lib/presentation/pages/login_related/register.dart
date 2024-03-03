import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:form_login/presentation/pages/login_related/widgets/register_widgets/form_register.dart';

class RegisterUI extends StatelessWidget {
  static const String name = 'register_page';
  const RegisterUI({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrate en nuestra gran app'),
        leading: IconButton(onPressed: () => context.go('/login'), icon: const Icon(Icons.navigate_before))
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: RegisterForm(),
      ),
    );
  }
}