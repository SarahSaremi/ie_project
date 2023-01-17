import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/pages/signin_signup/sign_up.dart';
import 'package:ieproject/pages/student/suggestions.dart';

import '../../enums.dart';
import '../../widgets/button.dart';
import '../../widgets/textfield_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login(String username, password) async {
    try {
      Uri url = Uri.parse(BASE_API + 'api-token-auth/');
      Response response = await post(Uri.parse(BASE_API + 'api-token-auth/'),
          headers: {"Content-Type": "application/json"},
          body: json.encode({'username': username, 'password': password}));
      if (response.statusCode ~/ 100 == 2) {
        var data = jsonDecode(response.body.toString());
        print('Login successfully');
        TOKEN = data['token'];
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const StudentSuggestions(),
          ),
        );
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(top: 60, bottom: 20),
              child: const Image(image: AssetImage('assets/Sbu-logo.png')),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'سامانه رسیدگی به پیشنهادات دانشجویان',
                  style: TextStyle(fontSize: 19, color: Color(0xff547dbb)),
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(top: 20, bottom: 60),
              child: const Image(image: AssetImage('assets/study-photo.jpg')),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'ورود به سامانه',
                ),
              ),
            ),
            IETextField(
              label: 'نام کاربری',
              isPass: false,
              controller: usernameController,
            ),
            IETextField(
              label: 'رمز عبور',
              isPass: true,
              controller: passwordController,
            ),
            IEButton(
              onPressed: () {
                login(usernameController.text.toString(),
                    passwordController.text.toString());
              },
              child: const Text('ورود'),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: const Text('حساب کاربری ندارید؟ ثبت نام')),
          ],
        ),
      ),
    );
  }
}
