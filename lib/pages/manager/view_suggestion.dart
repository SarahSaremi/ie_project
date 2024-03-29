import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/pages/manager/suggestions.dart';
import 'package:intl/intl.dart';

import '../../enums.dart';
import '../../widgets/button.dart';
import '../../widgets/suggestion_data.dart';
import '../../widgets/textfield_widget.dart';
import '../student/suggestions.dart';

class ViewSuggestion extends StatefulWidget {
  final bool isManager;
  final String suggestionId;

  const ViewSuggestion(
      {Key? key, required this.isManager, required this.suggestionId})
      : super(key: key);

  @override
  State<ViewSuggestion> createState() =>
      _ViewSuggestionState(this.isManager, this.suggestionId);
}

class _ViewSuggestionState extends State<ViewSuggestion> {
  final bool isManager;
  final String suggestionId;
  late String dropDownValue;

  _ViewSuggestionState(this.isManager, this.suggestionId);

  var suggestionData = {};

  void getSuggestionDetail() async {
    try {
      Uri url =
          Uri.parse(BASE_API + 'cands/suggestion_details?id=' + suggestionId);
      Response response = await get(url);
      print(url);
      print(response.body);

      if (response.statusCode ~/ 100 == 2) {
        var data = jsonDecode(response.body);
        suggestionData = data;
        dropDownValue = suggestionData['state'];
      } else {
        print('failed');
      }
    } catch (e) {
      print(e);
      print(e.toString());
    }
  }

  void updateSuggestionState(String state) async {
    try {
      Uri url =
          Uri.parse(BASE_API + 'cands/update_suggestion_state/?state=' + state);
      Response response = await post(url);

      if (response.statusCode == 200) {
        print("state changed.");
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
    Future.delayed(Duration(milliseconds: 30), () async {
      getSuggestionDetail();
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffffd43e),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 5),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'موضوع پیشنهاد',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          IESuggestionData(
            label: 'نام و نام خانوادگی',
            data: suggestionData['student_name'],
          ),
          IESuggestionData(
            label: 'شماره دانشجویی',
            data: suggestionData['student_number'],
          ),
          IESuggestionData(
            label: 'مسئول مربوطه',
            data: suggestionData['related_department'],
          ),
          IESuggestionData(
            label: 'تاریخ ثبت',
            data: DateFormat.yMMMEd()
                .format(DateTime.parse(suggestionData['submission_date']))
                .toString(),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: const BoxDecoration(
                  color: Color(0xfffff4cc),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                alignment: Alignment.topRight,
                child: Text(
                  suggestionData['suggestion_text'],
                ),
              )),
          isManager
              ? Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 3),
                          decoration: const BoxDecoration(
                              color: Color(0xfffff4cc),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: DropdownButton(
                            value: dropDownValue,
                            items: const [
                              DropdownMenuItem(
                                  value: 'CHECKED', child: Text('بررسی شده')),
                              DropdownMenuItem(
                                  value: 'CHECKING',
                                  child: Text('در حال بررسی')),
                              DropdownMenuItem(
                                  value: 'NOT CHECKED',
                                  child: Text('بررسی نشده')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                dropDownValue = value.toString();
                              });
                            },
                          ),
                        )),
                    const Expanded(
                        child: Center(
                      child: Text('وضعیت'),
                    )),
                  ],
                )
              : IESuggestionData(
                  label: 'وضعیت',
                  data: STATES[suggestionData['state']].toString(),
                ),
          isManager
              ? IEButton(
                  onPressed: () {
                    updateSuggestionState(dropDownValue);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ManagerSuggestions(),
                      ),
                    );
                  },
                  child: const Text(
                    'ثبت',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
