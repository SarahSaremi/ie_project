import 'package:flutter/material.dart';

class IESuggestionData extends StatelessWidget {
  final String label;
  final String data;

  const IESuggestionData({
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label
        ),
        Container(
          color: Colors.orange,
          child: Text(
            data
          ),
        )
      ],
    );
  }
}
