import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/pages/manager/view_suggestion.dart';
import 'package:ieproject/widgets/manager_list_tile.dart';

import '../../enums.dart';


class ManagerSuggestions extends StatefulWidget {
  const ManagerSuggestions({Key? key}) : super(key: key);

  @override
  State<ManagerSuggestions> createState() => _ManagerSuggestionsState();
}

class _ManagerSuggestionsState extends State<ManagerSuggestions> {

  var suggestionList = [];

  void getSuggestions() async {
    // try {
    //   Uri url = Uri.parse(BASE_API + 'cands/suggestion/');
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
          itemCount: suggestionList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ViewSuggestion(
                          isManager: true,
                          suggestionId: suggestionList[index]['id'].toString(),
                        ),
                  ),
                );
              },
              child: Card(
                  child: IEManagerListTile(
                    title: suggestionList[index]['subject'],
                    date: suggestionList[index]['submission_date'],
                    state: suggestionList[index]['state'],
                    name: suggestionList[index]['student_name'],
                  )),
            );
          }),
    );
  }
}
