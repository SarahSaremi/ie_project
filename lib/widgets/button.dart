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
    return Container(
      width: size.width,
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xffffd43e)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    )),
          ),
          child: child,
          onPressed: onPressed),
    );
  }
}
