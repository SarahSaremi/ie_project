import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/pages/student/suggestion_form.dart';
import 'package:ieproject/widgets/student_list_tile.dart';
import 'package:intl/intl.dart';

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
      Response response =
          await get(url, headers: {"Content-Type": "text/html; charset=utf-8"});
      print(json.decode(response.body));

      if (response.statusCode ~/ 100 == 2) {
        var data = jsonDecode(response.body);
        print(data.length);
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
    Future.delayed(Duration(minutes: 1), () async {});
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
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SuggestionForm()),
          );
        },
      ),
      body: ListView.builder(
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Card(
                child: IEStudentListTile(
                  title: suggestionList[index]['subject'],
                  state: STATES[suggestionList[index]['state']].toString(),
                  date: DateFormat.yMMMEd()
                      .format(DateTime.parse(
                          suggestionList[index]['submission_date']))
                      .toString(),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ViewSuggestion(
                      isManager: false,
                      suggestionId: suggestionList[index]['id'].toString(),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
