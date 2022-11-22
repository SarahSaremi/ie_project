import 'package:flutter/material.dart';

class IEManagerListTile extends StatelessWidget {
  final String title;

  const IEManagerListTile({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
        title: Text(title));
  }
}
