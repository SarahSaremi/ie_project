import 'package:flutter/material.dart';
import 'package:ieproject/widgets/student_list_tile.dart';

class StudentSuggestions extends StatelessWidget {
  final titles = ["موضوع 1", "موضوع 2", "موضوع 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('پیشنهادهای من'),),
      floatingActionButton: FloatingActionButton(onPressed: () {  },),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(child: IEStudentListTile(title: titles[index]));
          }),
    );
  }
}
