import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ieproject/pages/signin_signup/sign_in.dart';

import '../../enums.dart';
import '../../widgets/button.dart';
import '../../widgets/textfield_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController studentNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    studentNumberController.dispose();
    nameController.dispose();
    super.dispose();
  }

  void register(
      String name, username, phoneNumber, studentNumber, password) async {
    try {
      Response response = await post(Uri.parse(BASE_API + "cands/student/"),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'name': name,
            'password': password,
            'phone_number': phoneNumber,
            'student_number': studentNumber,
            'username': username,
          }));

      if (response.statusCode~/100 == 2) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SignIn(),
        ));
        print('Registered successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              margin: const EdgeInsets.only(top: 40, bottom: 20),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'ثبت نام',
                ),
              ),
            ),
            IETextField(
              label: 'نام و نام خانوادگی',
              isPass: false,
              controller: nameController,
            ),
            IETextField(
              label: 'شماره دانشجویی',
              isPass: false,
              controller: studentNumberController,
            ),
            IETextField(
              label: 'تلفن همراه',
              isPass: false,
              controller: phoneController,
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
                register(
                  nameController.text.toString(),
                  usernameController.text.toString(),
                  phoneController.text.toString(),
                  studentNumberController.text.toString(),
                  passwordController.text.toString(),
                );
              },
              child: const Text('ثبت نام'),
            ),
          ],
        ),
      ),
    );
  }
}
