import 'package:flutter/material.dart';
import 'package:grad_proj/screens/sign_up/signUpScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../const/const.dart';
import 'on_board_screen.dart';

class OnboardWidget extends StatelessWidget {
  Function onSubmit;
  var controller;
  List itemsList;
  bool isLast;
  int index;
  OnboardModel onboardModel;

  OnboardWidget(this.onboardModel, this.onSubmit, this.controller,
      this.itemsList, this.isLast, this.index);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5],
                colors: [
                  Colors.purple.withOpacity(0.7),
                  Colors.purple.withOpacity(0.5),
                ],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(180),
                  bottomRight: Radius.circular(180)),
            ),
            width: double.infinity,
            height: 500,
            child: Image(
              image: AssetImage(onboardModel.imagePath),
              //fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                    height: 150,
                    child: Text(onboardModel.body,
                        style: const TextStyle(fontSize: 20))),
              ),
              SizedBox(
                height: 110,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        navigateToReplacement(context, SignUpScreen());
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(
                            color: Colors.purple.shade300,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Spacer(),
                    SmoothPageIndicator(
                        controller: controller,
                        effect: ExpandingDotsEffect(
                            paintStyle: PaintingStyle.fill,
                            dotColor: Colors.grey,
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 5,
                            expansionFactor: 4,
                            activeDotColor: Colors.purple.shade300),
                        count: itemsList.length),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        if (isLast) {
                          onSubmit();
                        } else {
                          controller.nextPage(
                              duration: const Duration(microseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 30,
                        color: Colors.purple.shade300,
                      ),
                    ),

                    //  Text('FINISH',style: TextStyle(color: Colors.purple.shade300,fontWeight: FontWeight.bold)),

                    // Container(
                    //   height: 50,
                    //   child: FloatingActionButton(
                    //     backgroundColor: Colors.purple.shade300,
                    //     onPressed: () {
                    //       if (isLast) {
                    //         onSubmit();
                    //       } else {
                    //         controller.nextPage(
                    //             duration: const Duration(microseconds: 750),
                    //             curve: Curves.fastLinearToSlowEaseIn);
                    //       }
                    //     },
                    //     child: const Icon(
                    //       Icons.keyboard_arrow_right,
                    //       size: 25,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
