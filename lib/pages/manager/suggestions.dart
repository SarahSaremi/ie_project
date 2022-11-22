import 'package:flutter/material.dart';
import 'package:ieproject/widgets/manager_list_tile.dart';
import 'package:ieproject/widgets/student_list_tile.dart';

class ManagerSuggestions extends StatelessWidget {
  final titles = ["موضوع 1", "موضوع 2", "موضوع 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('پیشنهادهای دانشجویان'),),
      floatingActionButton: FloatingActionButton(onPressed: () {  },),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(child: IEManagerListTile(title: titles[index]));
          }),
    );
  }
}
