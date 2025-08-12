import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomPasswordField({super.key, this.controller, this.onChanged});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Enter your password',
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _obscureText = !_obscureText),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}
