import 'package:flutter/material.dart';
import 'package:form_login/presentation/pages/login_related/widgets/login_widgets/form_login.dart';

class LoginUI extends StatelessWidget {
  static const String name = 'login_page';
  const LoginUI({super.key});
  
  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: LoginForm(),
      ),
    );
  }
}