import 'package:flutter/material.dart';
import 'package:ieproject/pages/manager/suggestions.dart';

import '../../widgets/button.dart';
import '../../widgets/suggestion_data.dart';
import '../../widgets/textfield_widget.dart';
import '../student/suggestions.dart';

class ViewSuggestion extends StatelessWidget {
  final bool isManager;
  const ViewSuggestion({key, required this.isManager}) : super(key: key);

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
            data: 'قلی قلی زاده',
          ),
          IESuggestionData(
            label: 'شماره دانشجویی',
            data: '98243055',
          ),
          IESuggestionData(
            label: 'مسئول مربوطه',
            data: 'مدیریت دانشکده',
          ),
          IESuggestionData(
            label: 'تاریخ ثبت',
            data: '1400-10-10',
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: const BoxDecoration(
                color: Color(0xfffff4cc),
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          this.isManager?
          IESuggestionData(
            label: 'وضعیت',
            data: 'در حال بررسی',
          ): IESuggestionData(
            label: 'وضعیت',
            data: 'در حال بررسی',
          ),
          this.isManager?  IEButton(
            onPressed: () {
              print("update suggestion api");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ManagerSuggestions(),
                ),
              );
            },
            child: Text(
              'ثبت',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ): Container()
        ],
      ),
    );
  }
}
