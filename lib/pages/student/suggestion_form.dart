import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/pages/student/suggestions.dart';

import '../../enums.dart';
import '../../widgets/button.dart';
import '../../widgets/textfield_widget.dart';

class SuggestionForm extends StatefulWidget {
  const SuggestionForm({Key? key}) : super(key: key);

  @override
  State<SuggestionForm> createState() => _SuggestionFormState();
}

class _SuggestionFormState extends State<SuggestionForm> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  void submitSuggestion(String subject, department, text) async {
    try {
      Response response = await post(Uri.parse(BASE_API), body: {
        'subject': subject,
        'related_department': department,
        'suggestion_text': text,
        'student': user_id,
      });

      if (response.statusCode == 200) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const StudentSuggestions(),
        ));
        print('Submitted successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void dispose() {
    subjectController.dispose();
    textController.dispose();
    departmentController.dispose();
    super.dispose();
  }

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
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: const Text(
                'فرم ثبت پیشنهاد',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ),
          IETextField(
            label: 'موضوع',
            isPass: false,
            controller: subjectController,
          ),
          IETextField(
            label: 'مسئول مربوطه',
            isPass: false,
            controller: departmentController,
          ),
          IETextField(
            label: 'متن پیشنهاد',
            isPass: false,
            multiline: true,
            controller: textController,
          ),
          IEButton(
            onPressed: () {
              submitSuggestion(
                  subjectController.text.toString(),
                  departmentController.text.toString(),
                  textController.text.toString());
            },
            child: const Text(
              'ثبت',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
