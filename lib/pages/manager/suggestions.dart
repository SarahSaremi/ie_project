import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/pages/manager/view_suggestion.dart';
import 'package:ieproject/widgets/manager_list_tile.dart';
import 'package:intl/intl.dart';

import '../../enums.dart';

class ManagerSuggestions extends StatefulWidget {
  const ManagerSuggestions({Key? key}) : super(key: key);

  @override
  State<ManagerSuggestions> createState() => _ManagerSuggestionsState();
}

class _ManagerSuggestionsState extends State<ManagerSuggestions> {
  var suggestionList = [];

  void getSuggestions() async {
    try {
      Uri url = Uri.parse(BASE_API + 'cands/suggestion/');
      Response response = await get(url, headers: {"Content-Type": "text/html; charset=utf-8"});

      if (response.statusCode~/ 100 == 2) {
        var data = jsonDecode(response.body);
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
                    builder: (context) => ViewSuggestion(
                      isManager: true,
                      suggestionId: suggestionList[index]['id'].toString(),
                    ),
                  ),
                );
              },
              child: Card(
                  child: IEManagerListTile(
                title: suggestionList[index]['subject'],
                date: DateFormat.yMMMEd()
                    .format(DateTime.parse(
                        suggestionList[index]['submission_date']))
                    .toString(),
                state: STATES[suggestionList[index]['state']].toString(),
                name: suggestionList[index]['student_name'],
              )),
            );
          }),
    );
  }
}
