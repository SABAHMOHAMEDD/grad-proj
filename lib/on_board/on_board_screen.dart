import 'package:flutter/material.dart';

import '../const/const.dart';
import '../home/homeScreen.dart';
import '../shared/network/local/cache_helper.dart';
import 'on_board_widget.dart';

class OnBoardScreen extends StatefulWidget {
  static const String RouteName = 'onBoarding';

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var boardingController = PageController();

  bool isLast = false;

  List itemsList = OnboardModel.getAllOnBoardItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: BouncingScrollPhysics(),
          controller: boardingController,
          itemCount: itemsList.length,
          onPageChanged: (int index) {
            if (index == itemsList.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
            ;
          },
          itemBuilder: (context, index) {
            return OnboardWidget(itemsList[index], onSubmit, boardingController,
                itemsList, isLast, index);
          }),
    );
  }

  void onSubmit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value == true) {
        navigateToReplacement(context, Home());
      }
    });
  }
}

class OnboardModel {
  String imagePath;
  String title;
  String body;

  OnboardModel(this.imagePath, this.title, this.body);

  static List<OnboardModel> getAllOnBoardItems = [
    OnboardModel('assets/images/hospital.png', 'title 1',
        'Welcome to our clinic app! We are excited to have you on board'),
    OnboardModel('assets/images/report.png', 'title 2',
        'Our app allows you to book appointments with your healthcare provider, view your medical records, and receive reminders for upcoming appointments'),
    OnboardModel('assets/images/medicine.png', 'title 3',
        'To book an appointment, simply select your preferred healthcare provider, choose a date and time that works for you, and confirm your booking'),
  ];
}
