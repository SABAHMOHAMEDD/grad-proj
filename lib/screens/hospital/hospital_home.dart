import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/screens/chat_screen/chat_screen.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_states.dart';

import 'clinic_visit/diseases_cate.dart';

class HospitalHome extends StatelessWidget {
  final String uId;

  HospitalHome({required this.uId});

  List catPath = [
    'assets/images/mask.png',
    'assets/images/rash.png',
    'assets/images/gastroenterology.png',
    'assets/images/brain.png'
  ];
  List catTitle = ['Infectious', 'Skin', 'Digestive', 'Neurological'];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalCubit()..getHospital(uId: uId),
      child: BlocConsumer<HospitalCubit, HospitalStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HospitalCubit cubit = HospitalCubit.get(context);
            return ConditionalBuilder(
              condition: cubit.hospital != null,
              builder: (context) => Scaffold(
                backgroundColor: Colors.grey.shade100,
                // appBar: AppBar(
                //     backgroundColor: Colors.transparent,
                //     shadowColor: Colors.transparent,
                //     actions: [
                //       Container(child: Image.network(cubit.hospital!.logo!)),
                //     ]),
                floatingActionButton: FloatingActionButton(
                    backgroundColor: Color(0xFFf08986),
                    child: const FaIcon(FontAwesomeIcons.robot),
                    onPressed: () {
                      navigateTo(
                          context,
                          ChatScreen(
                            serviceId: uId,
                            ctx: context,
                          ));
                    }),

                bottomNavigationBar: BottomNavigationBar(
                  fixedColor: Color(0xFF56a89c),
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

                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.5],
                            colors: [
                              Color(0xFF56a89c).withOpacity(0.9),
                              Color(0xFF56a89c).withOpacity(0.8),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(0)),
                        ),
                        width: double.infinity,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  MyTitles(title: 'Quick access'),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    height: 220,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: GridView.count(
                                        childAspectRatio: 1 / 0.6,
                                        crossAxisCount: 2,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              navigateToReplacement(context,
                                                  DiseasesCategories());
                                            },
                                            child: MyBox2(
                                              imagePath:
                                                  'assets/images/clinic.png',
                                              title: 'Clinic Visit',
                                            ),
                                          ),
                                          MyBox2(
                                            imagePath:
                                                'assets/images/video-call.png',
                                            title: 'Doctor Call',
                                          ),
                                          MyBox2(
                                            imagePath:
                                                'assets/images/pharmacy.png',
                                            title: 'Pharmacy',
                                          ),
                                          MyBox2(
                                            imagePath:
                                                'assets/images/doctor (2).png',
                                            title: 'Home Visit',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTitles(title: 'Search'),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        height: 54,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            // color: Colors.purple.shade50.withOpacity(0.9),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(2, 2),
                                                  blurRadius: 4,
                                                  color: Colors.blueGrey
                                                      .withOpacity(0.23))
                                            ]),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: TextField(
                                                onChanged: (value) {},
                                                decoration: InputDecoration(
                                                    hintText:
                                                        'Doctors,Diseases....',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black54),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none),
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/search.svg',
                                              color: Color(0xFF56a89c),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTitles(title: 'ChatBOT'),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Ask For\nANYTHING...',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xFF56a89c)),
                                            child: Text(
                                              'Start Chatting',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyTitles(title: 'Categories'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                          height: 120,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: catPath.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return CategoriesWidget(
                                                  catPath: catPath,
                                                  index: index,
                                                  catTitle: catTitle,
                                                );
                                              })),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              fallback: (context) => const Scaffold(
                  body: Center(child: CircularProgressIndicator())),
            );
          }),
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
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 4,
              color: Color(0xFF56a89c).withOpacity(0.23))
        ],
        color: Colors.white,
        // color: Colors.purple.shade50.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 50,
              height: 50,
              child: Image(image: AssetImage(imagePath))),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              title,
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
              //style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  final List<String> images = [
    'https://img.freepik.com/free-vector/people-walking-sitting-hospital-building-city-clinic-glass-exterior-flat-vector-illustration-medical-help-emergency-architecture-healthcare-concept_74855-10130.jpg?w=1060&t=st=1683156704~exp=1683157304~hmac=fc24c59132050890477b36063ee82d87b2c1da7f9c84830d9796516eab618098',
    'https://img.freepik.com/free-vector/healthcare-background-with-medical-symbols-hexagonal-frame_1017-26363.jpg?w=1060&t=st=1683156757~exp=1683157357~hmac=36700c952e27f97becaa9927fe5fedd9509cd08bfe2b283bf3e4235218917b51',
    'https://img.freepik.com/free-vector/flat-hand-drawn-hospital-reception-scene_52683-54613.jpg?w=996&t=st=1683156795~exp=1683157395~hmac=81354c782e3b1b77b2542261a93bdac1e86cb955e35b34369ea1826dba8ddbbf',
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: double.infinity,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
            padEnds: true,
            height: 200,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            reverse: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  List catPath;
  List catTitle;
  late int index;

  CategoriesWidget(
      {required this.catPath, required this.index, required this.catTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 40,
                height: 40,
                child: Image(image: AssetImage(catPath[index]))),
            SizedBox(
              height: 10,
            ),
            Text(
              catTitle[index],
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTitles extends StatelessWidget {
  String title;

  MyTitles({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              //   decoration: TextDecoration.underline,
              fontSize: 16),
        ),
      ),
    );
  }
}