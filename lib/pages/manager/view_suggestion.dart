import 'package:flutter/material.dart';

import '../../widgets/button.dart';
import '../../widgets/suggestion_data.dart';
import '../../widgets/textfield_widget.dart';

class ViewSuggestion extends StatelessWidget {
  const ViewSuggestion({key}) : super(key: key);

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
                'موضوع پیشنهاد',
              ),
            ),
          ),
          IESuggestionData(
            label: 'موضوع',
            data: 'نتبینتب',
          ),
          IESuggestionData(
            label: 'موضوع',
            data: 'نتبینتب',
          ),
          IESuggestionData(
            label: 'موضوع',
            data: 'نتبینتب',
          ),
          IESuggestionData(
            label: 'موضوع',
            data: 'نتبینتب',
          ),
        ],
      ),
    );
  }
}
