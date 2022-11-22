import 'package:flutter/material.dart';

class IETextField extends StatelessWidget {
  final String label;
  final bool isPass;

  const IETextField({
    required this.label,
    required this.isPass,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPass,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey)),
      style: const TextStyle(color: Colors.grey),
    );
  }
}
