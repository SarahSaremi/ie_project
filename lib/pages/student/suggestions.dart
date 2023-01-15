import 'package:flutter/material.dart';
import 'package:ieproject/widgets/student_list_tile.dart';

import '../manager/view_suggestion.dart';

class StudentSuggestions extends StatelessWidget {
  final titles = ["موضوع 1", "موضوع 2", "موضوع 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          alignment: Alignment.topRight,
          child: const Text('پیشنهادهای من'),
        ),
        backgroundColor: const Color(0xffffd43e),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffffd43e),
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: IEStudentListTile(
                  title: titles[index],
                  date: "23-10-1400",
                  state: 'بررسی نشده',
                ),
              ),
              onTap: () {
                print("request suggestion details");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewSuggestion(isManager: false,),
                  ),
                );
              },
            );
          }),
    );
  }
}
