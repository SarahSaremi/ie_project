import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/textfield_widget.dart';

class SuggestionForm extends StatelessWidget {
  const SuggestionForm({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'فرم ثبت پیشنهاد',
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
          ),
          IEButton(
            onPressed: () {},
            child: Text('ثبت'),
          ),
        ],
      ),
    );
  }
}
