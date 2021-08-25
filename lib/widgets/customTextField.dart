import 'package:flutter/material.dart';

import '../constans.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final IconData icon;

  final Function(String?)?  onClick ;
  CustomTextField({
     this.onClick,
    required this.hint,
    required this.icon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorMessage(String str) {
    switch (str) {
      case 'Enter your email':
        return 'Email is empty!';
      case 'Enter your name':
        return 'Name is empty!';
      case 'Enter your password':
        return 'Password is empty!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _errorMessage(widget.hint);
          }
          return null;
        },
        onSaved: widget.onClick,
        obscureText: widget.hint == 'Enter your password' ? true : false,
        cursorColor: KMainColor,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: Icon(
            widget.icon,
            color: KMainColor,
          ),
          fillColor: KSecondaryColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
