import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/screens/chat_screen/chat_screen.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_states.dart';

import '../../test.dart';

class HospitalHome extends StatelessWidget {
  final String uId;

  HospitalHome({required this.uId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> HospitalCubit()..getHospital(uId: uId),
      child: BlocConsumer<HospitalCubit,HospitalStates>(
        listener: (context,state){},
        builder:(context,state) {
          HospitalCubit cubit = HospitalCubit.get(context);
          return ConditionalBuilder(
            condition: cubit.hospital != null,
            builder:(context)=> Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  actions: [
                    Container(
                        child: Image.network(cubit.hospital!.logo!)),
                  ]),
              floatingActionButton: FloatingActionButton(
                  child: const FaIcon(FontAwesomeIcons.robot), onPressed: () {
                    navigateTo(context, ChatScreen(serviceId: uId,ctx: context,));
              }),
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
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 20,
                  ),
                  MyCarousel(),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(2, 2),
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
                                hintStyle: TextStyle(
                                    color: Colors.purple.withOpacity(0.5)),
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
            ),
            fallback: (context)=> const Scaffold(body: Center(child:  CircularProgressIndicator())),
          );
        }
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
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(2, 2),
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
