import 'package:flutter/material.dart';

class IEButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double btnHeight;

  const IEButton({
    required this.child,
    required this.onPressed,
    this.btnHeight = 100,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialButton(
      child: child,
        color: Colors.red,
        onPressed: onPressed);
  }
}
