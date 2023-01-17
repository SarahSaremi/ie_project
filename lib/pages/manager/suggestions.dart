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
    try {
      Uri url = Uri.parse(BASE_API + 'cands/suggestion/');
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
                      suggestionId: suggestionList[index]['id'],
                    ),
                  ),
                );
              },
              child: Card(
                  child: IEManagerListTile(
                    title: suggestionList[index]['subject'],
                    date: suggestionList[index]['date'],
                    state: suggestionList[index]['state'],
                    name: suggestionList[index]['name'],
                  )),
            );
          }),
    );
  }
}
