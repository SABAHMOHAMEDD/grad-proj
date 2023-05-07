import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/screens/hospital/hospital_home.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.purple.withOpacity(0.23))
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        hintText: 'search',
                        hintStyle:
                            TextStyle(color: Colors.purple.withOpacity(0.5)),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: Colors.purple.shade300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  InkWell(
                      onTap: () {},
                      child: MyBox(
                        imagePath: 'assets/images/hotel.png',
                        title: 'Hotels',
                      )),
                  MyBox(
                    imagePath: 'assets/images/shopping-cart.png',
                    title: 'Shopping',
                  ),
                  MyBox(
                    imagePath: 'assets/images/bank.png',
                    title: 'Banks',
                  ),
                  InkWell(
                      onTap: () {
                        navigateTo(context, HospitalHome(uId: 'er3slW6BLMb0ZSS6oM9s',));
                      },
                      child: MyBox(
                        imagePath: 'assets/images/hospital.png',
                        title: 'Hospitals',
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyBox extends StatelessWidget {
  String imagePath;
  String title;

  MyBox({
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 4,
              color: Colors.purple.withOpacity(0.23))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
            child: Image(image: AssetImage(imagePath)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              //style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
