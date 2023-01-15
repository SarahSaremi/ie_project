import 'package:flutter/material.dart';
import 'package:ieproject/pages/manager/view_suggestion.dart';
import 'package:ieproject/widgets/manager_list_tile.dart';
import 'package:ieproject/widgets/student_list_tile.dart';

class ManagerSuggestions extends StatelessWidget {
  final titles = ["موضوع 1", "موضوع 2", "موضوع 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text('پیشنهادهای دانشجویان'),
        ),
        backgroundColor: const Color(0xffffd43e),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("suggestion details api");
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewSuggestion(isManager: true,),
                  ),
                );
              },
              child: Card(
                  child: IEManagerListTile(
                    title: titles[index],
                    date: '10-10-1400',
                    state: 'در حال بررسی',
                  )),
            );
          }),
    );
  }
}
