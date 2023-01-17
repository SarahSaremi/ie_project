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
    // try {
    //   Uri url = Uri.parse(BASE_API + 'cands/suggestion/?student_id=' + user_id);
    //   Response response = await get(url);
    //
    //   if (response.statusCode == 200) {
    //     var data = jsonDecode(response.body.toString());
    //     suggestionList = data;
    //   } else {
    //     print('failed');
    //   }
    // } catch (e) {
    //   print(e);
    //   print(e.toString());
    // }
    suggestionList = [
      {
        "id": 1,
        "student_name": "Gholi Gholizadeh",
        "student_number": "97243030",
        "subject": "بهبود آموزش",
        "suggestion_text": "یه نظری دارم درباره بهبود آموزش",
        "submission_date": "2023-01-17T12:32:02.588064Z",
        "related_department": "آموزش دانشکده",
        "state": "NOT CHECKED",
        "student": 2
      },
      {
        "id": 3,
        "student_name": "Gholi Gholizadeh",
        "student_number": "97243030",
        "subject": " 3بهبود آموزش",
        "suggestion_text": "یه نظری دارم درباره بهبود آموزش",
        "submission_date": "2023-01-17T12:35:23.877967Z",
        "related_department": "آموزش دانشکده",
        "state": "NOT CHECKED",
        "student": 2
      },
      {
        "id": 4,
        "student_name": "Taghi Taghizadeh",
        "student_number": "97243031",
        "subject": "4بهبود آموزش",
        "suggestion_text": "یه نظری دارم درباره بهبود آموزش",
        "submission_date": "2023-01-17T12:37:21.178679Z",
        "related_department": "آموزش دانشکده",
        "state": "NOT CHECKED",
        "student": 3
      },
      {
        "id": 2,
        "student_name": "Gholi Gholizadeh",
        "student_number": "97243030",
        "subject": " 2بهبود آموزش",
        "suggestion_text": "یه نظری دارم درباره بهبود آموزش",
        "submission_date": "2023-01-17T13:00:05.954016Z",
        "related_department": "آموزش دانشکده",
        "state": "CHECKED",
        "student": 2
      }
    ];
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
                  // state: STATES[suggestionLisionList[index]['state']],
                  state: suggestionList[index]['state'],
                  date: suggestionList[index]['submission_date'],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ViewSuggestion(
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
