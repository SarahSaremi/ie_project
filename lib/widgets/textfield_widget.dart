import 'package:flutter/material.dart';

class IETextField extends StatelessWidget {
  final String label;
  final bool isPass;
  final bool multiline;
  final TextEditingController controller;

  const IETextField({Key? key,
    required this.label,
    required this.isPass,
    required this.controller,
    this.multiline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      child: TextField(
        controller: controller,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        keyboardType: multiline? TextInputType.multiline: TextInputType.text,
        maxLines: multiline? 6: 1,
        obscureText: isPass,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff1f1f1),
          contentPadding: const EdgeInsets.only(top: 20, left: 20, right: 20,),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          label: Align(
            alignment: Alignment.topRight,
            child: Text(label),
          ),
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
      ),
    );
  }
}
