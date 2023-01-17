import 'package:flutter/material.dart';
import 'package:ieproject/pages/manager/suggestions.dart';
import 'package:ieproject/pages/manager/view_suggestion.dart';
import 'package:ieproject/pages/signin_signup/sign_in.dart';
import 'package:ieproject/pages/signin_signup/sign_up.dart';
import 'package:ieproject/pages/student/suggestion_form.dart';
import 'package:ieproject/pages/student/suggestions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xfffed53e),
        fontFamily: 'Vazir'
      ),
      home: StudentSuggestions(),
    );
  }
}