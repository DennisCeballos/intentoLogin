import 'package:flutter/material.dart';
const double size = 16;

class TextFormWrapper extends StatefulWidget {
  const TextFormWrapper({
    super.key,
    required this.controller,
    required this.tipoTeclado,
    this.password = false,
    this.icon = const Icon(Icons.person, size: 24),
    required this.titulo,
    required this.hintTexto,
    required this.validador
  });

  final Icon icon;
  final TextInputType tipoTeclado;
  final bool password;
  final String titulo;
  final String hintTexto;
  final String? Function(String?)? validador;
  final TextEditingController controller;

  @override
  State<TextFormWrapper> createState() => _TextFormWrapperState();
}

class _TextFormWrapperState extends State<TextFormWrapper> {
  
  final _textFieldFocusNode = FocusNode();
  late bool _obscured = true;
  String? _value;

  String? getValue(){
    return _value;
  }

  void _toggleObscured(){
    setState(() {
      _obscured = !_obscured;
      if (_textFieldFocusNode.hasPrimaryFocus) return; 
      _textFieldFocusNode.canRequestFocus = false;     
    });
  }

  void _handleTap() {
    _textFieldFocusNode.requestFocus();
  }

  void _handleTapOutside(PointerDownEvent event) {
    _textFieldFocusNode.unfocus();
  }

  TextFormField _passwordCheck(TextTheme textTheme) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.tipoTeclado,
      obscureText: widget.password ? _obscured : false,
      focusNode: _textFieldFocusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never, 
        hintText: widget.titulo,
        hintStyle: textTheme.labelSmall, 
        filled: true, 
        fillColor: Colors.white, 
        isDense: false,
        suffixIcon: widget.password
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                child: GestureDetector(
                  onTap: _toggleObscured,
                  child: Icon(
                    _obscured
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: 24,
                  ),
                ),
              )
            : null,
      ),
      validator: widget.validador,
      onTap: _handleTap,
      onTapOutside: _handleTapOutside,
      onSaved: (txt) {_value = txt;}
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _passwordCheck(textTheme)
      ],
    );
  }
}
