import 'package:flutter/material.dart';
import 'package:ieproject/pages/student/suggestions.dart';

import '../../widgets/button.dart';
import '../../widgets/textfield_widget.dart';

class SuggestionForm extends StatelessWidget {
  const SuggestionForm({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffd43e),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                'فرم ثبت پیشنهاد',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          IETextField(
            label: 'موضوع',
            isPass: false,
          ),
          IETextField(
            label: 'مسئول مربوطه',
            isPass: false,
          ),
          IETextField(
            label: 'متن پیشنهاد',
            isPass: false,
            multiline: true,
          ),
          IEButton(
            onPressed: () {
              print("submit form api");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StudentSuggestions(),
                ),
              );
            },
            child: Text(
              'ثبت',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
