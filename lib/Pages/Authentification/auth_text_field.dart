import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField(
      {Key? key,
      this.controller,
      required this.width,
      required this.height,
      required this.icon,
      required this.iconColor,
      required this.labelText,
      required this.passwordText,
      required this.borderColor})
      : super(key: key);

  final TextEditingController? controller;
  final double width;
  final double height;
  final IconData icon;
  final Color iconColor;
  final String labelText;
  final bool passwordText;
  final Color borderColor;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.passwordText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          prefixIcon: Icon(
            widget.icon,
            color: widget.iconColor,
          ),
        ),
      ),
    );
  }
}
