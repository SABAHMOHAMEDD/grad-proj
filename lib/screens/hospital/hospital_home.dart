import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../test.dart';

class HospitalHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.purple.shade300,
        //   currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // setState(() {
          // _currentIndex = index;
          // });
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(
          //     'Welcome TO Hospital..',
          //     style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: Colors.purple.shade200,
          //
          //         fontSize: 18),
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          MyCarousel(),
          SizedBox(
            height: 8,
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
                SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: Colors.purple.shade300,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                childAspectRatio: 1 / 0.6,
                crossAxisCount: 2,
                children: [
                  MyBox2(
                    imagePath: 'assets/images/clinic.png',
                    title: 'Clinic Visit',
                  ),
                  MyBox2(
                    imagePath: 'assets/images/video-call.png',
                    title: 'Doctor Call',
                  ),
                  MyBox2(
                    imagePath: 'assets/images/pharmacy.png',
                    title: 'Pharmacy',
                  ),
                  MyBox2(
                    imagePath: 'assets/images/doctor (2).png',
                    title: 'Home Visit',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyBox2 extends StatelessWidget {
  String imagePath;
  String title;

  MyBox2({
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
          Container(
              width: 50,
              height: 50,
              child: Image(image: AssetImage(imagePath))),
          Padding(
            padding: const EdgeInsets.all(0),
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
