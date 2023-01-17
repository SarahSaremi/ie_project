import 'package:flutter/material.dart';

class IEManagerListTile extends StatelessWidget {
  final String title;
  final String name;
  final String state;
  final String date;

  const IEManagerListTile({Key? key,
    required this.title,
    required this.state,
    required this.date,
    required this.name,
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
        alignment: Alignment.centerRight,
        child: Column(
          children: [
            Text(
              "نام دانشجو: " + name,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              "وضعیت: " + state,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        )
      ),
      leading: Text(
        "تاریخ: " + date,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
