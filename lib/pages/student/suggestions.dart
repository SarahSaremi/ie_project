import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/widgets/student_list_tile.dart';

import '../../enums.dart';
import '../manager/view_suggestion.dart';


class StudentSuggestions extends StatefulWidget {
  const StudentSuggestions({Key? key}) : super(key: key);

  @override
  State<StudentSuggestions> createState() => _StudentSuggestionsState();
}

class _StudentSuggestionsState extends State<StudentSuggestions> {

  var suggestionList = [];

  void getSuggestions() async {
    try {
      Uri url = Uri.parse(BASE_API + 'cands/suggestion/?student_id=' + user_id);
      Response response = await get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        suggestionList = data;
      } else {
        print('failed');
      }
    } catch (e) {
      print(e);
      print(e.toString());
    }
  }

  @override
  void initState() {
    getSuggestions();
    super.initState();
  }

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
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: IEStudentListTile(
                  title: suggestionList[index]['subject'],
                  date: suggestionList[index]['date'],
                  // state: STATES[suggestionList[index]['state']],
                  state: suggestionList[index]['state'],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewSuggestion(
                      isManager: false,
                      suggestionId: suggestionList[index]['id'],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
