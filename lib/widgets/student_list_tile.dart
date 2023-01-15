import 'package:flutter/material.dart';

class IEStudentListTile extends StatelessWidget {
  final String title;
  final String state;
  final String date;

  const IEStudentListTile({
    Key? key,
    required this.title,
    required this.state,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      tileColor: const Color(0xfffdffe6),
      title: Container(
        alignment: Alignment.topRight,
        child: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
      ),
      subtitle: Container(
        alignment: Alignment.topRight,
        child: Text(
          "وضعیت: " + this.state,
          style: const TextStyle(fontSize: 12),
        ),
      ),
      leading: Text(
        "تاریخ: " + this.date,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
