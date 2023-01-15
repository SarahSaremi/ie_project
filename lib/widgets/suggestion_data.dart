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
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(left: 20, bottom: 12, top: 12),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xfffff4cc),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(data),
          ),
        ),
        Expanded(
            child: Center(
          child: Text(label),
        )),
      ],
    );
  }
}
