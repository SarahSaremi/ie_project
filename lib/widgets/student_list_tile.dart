import 'package:flutter/material.dart';

class IEStudentListTile extends StatelessWidget {
  final String title;

  const IEStudentListTile({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
        title: Text(title));
  }
}
