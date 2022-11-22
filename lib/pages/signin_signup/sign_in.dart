import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/textfield_widget.dart';

class SignIn extends StatelessWidget {
  const SignIn({key}) : super(key: key);

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
            width: 60,
            height: 60,
            color: Colors.blueAccent,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'ورود به سامانه',
              ),
            ),
          ),
          IETextField(
            label: 'نام کاربری',
            isPass: false,
          ),
          IETextField(
            label: 'رمز عبور',
            isPass: true,
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                child: Text('فراموشی رمز عبور'),
              )),
          IEButton(
            onPressed: () {},
            child: Text('ورود'),
          ),
          GestureDetector(
              onTap: () {},
              child: Container(
                child: Text('حساب کاربری ندارید؟ ثبت نام'),
              )),
        ],
      ),
    );
  }
}
