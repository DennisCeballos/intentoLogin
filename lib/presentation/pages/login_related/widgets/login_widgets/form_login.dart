import 'package:flutter/material.dart';
import 'package:form_login/presentation/utils/textfield.dart';
import 'package:go_router/go_router.dart';

const double separacion = 32;
const String regexUsuario = r'^(?!test$).*';
const String regexPass = r'^[^\@]+$';

const String pass = r'^abcde123$';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final controllerText = TextEditingController();
  final controllerText2 = TextEditingController();

  String? _validador(String? value, RegExp exp, String error, TextEditingController controller) {
    if(exp.hasMatch(value!)){
      return null;
    }
    controller.clear();
    return error;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Center(
        child: SizedBox(
          width: 310,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Inicia sesión", style: textTheme.headlineLarge,),
            const SizedBox(height: separacion),
            Text("Usa una contraseña segura", style: textTheme.titleMedium),
            TextFormWrapper(
              controller: controllerText,
              titulo: 'Usuario',
              hintTexto: 'Ingrese su nombre de usuario', 
              tipoTeclado: TextInputType.number,
              validador: (value) => _validador(value, RegExp(regexUsuario), "Ingrese un usuario válido", controllerText),
            ),
            const SizedBox(height: separacion),
            TextFormWrapper(
              controller: controllerText2,
              titulo: 'Password',
              hintTexto: 'Ingrese abcde123', 
              tipoTeclado: TextInputType.text,
              password: true,
              validador: (value) => _validador(value, RegExp(regexPass), "La contraseña no debe contener @", controllerText2),
            ),
            const SizedBox(height: separacion),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(280, 50),
                  backgroundColor: const Color.fromARGB(255, 65, 135, 44), //"#41872C"),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sesion Iniciada correctamente')),
                    );
                    _formKey.currentState?.save();
                    context.go('/home/${controllerText.value.text}');
                  }
                },
                child: Text('Iniciar Sesión', style: textTheme.bodyMedium?.copyWith(color: Colors.white)),
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}