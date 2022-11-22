import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/textfield_widget.dart';

class SignUp extends StatelessWidget {
  const SignUp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            color: Colors.red,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'سامانه رسیدگی به پیشنهادات دانشجویان',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'ثبت نام',
              ),
            ),
          ),
          IETextField(
            label: 'نام و نام خانوادگی',
            isPass: false,
          ),
          IETextField(
            label: 'شماره دانشجویی',
            isPass: false,
          ),
          IETextField(
            label: 'تلفن همراه',
            isPass: false,
          ),
          IETextField(
            label: 'نام کاربری',
            isPass: false,
          ),
          IETextField(
            label: 'رمز عبور',
            isPass: true,
          ),
          IEButton(
            onPressed: () {},
            child: Text('ثبت نام'),
          ),
        ],
      ),
    );
  }
}
