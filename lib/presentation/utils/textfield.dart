import 'package:flutter/material.dart';
const double size = 16;

class TextFormWrapper extends StatefulWidget {
  const TextFormWrapper({
    super.key,
    required this.controller,
    required this.tipoTeclado,
    this.password = false,
    required this.titulo,
    required this.hintTexto,
    required this.validador
  });

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
  String? value;

  String? getValue(){
    return value;
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
        hintText: widget.hintTexto,
        hintStyle: textTheme.displayMedium?.copyWith(fontSize: size), 
        filled: true, 
        fillColor: Colors.white, 
        isDense: false, 
        prefixIcon: widget.password
            ? const Icon(Icons.lock_outline_rounded, size: 24)
            : const Icon(Icons.person, size: 24),
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
      onSaved: (txt) {value = txt;}
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titulo,
          style: textTheme.displayMedium?.copyWith(fontSize: size),     
        ),
        const SizedBox(height: 4),
        _passwordCheck(textTheme)
      ],
    );
  }
}
