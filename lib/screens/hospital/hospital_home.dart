import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_states.dart';
import 'package:grad_proj/widgets/def_floating.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'clinic_visit/diseases_cate.dart';
List catPath = [
  'assets/images/mask.png',
  'assets/images/rash.png',
  'assets/images/gastroenterology.png',
  'assets/images/brain.png'
];

List catTitle = ['Infectious', 'Skin', 'Digestive', 'Neurological'];
class HospitalHome extends StatelessWidget {
  final String uId;

  HospitalHome({required this.uId});


  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      HospitalCubit.get(context).getHospital(uId: uId);
      return BlocConsumer<HospitalCubit, HospitalStates>(
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
                floatingActionButton: DefFloatActionButton(serviceId: uId),

                bottomNavigationBar: BottomNavigationBar(
                  fixedColor: const Color(0xFF56a89c),
                    currentIndex: cubit.currentIndex,
                  type: BottomNavigationBarType.fixed,
                  items: cubit.BottomNavItems,
                  onTap: (index) {
                    cubit.changeBottomNav(index);
                    // setState(() {
                    // _currentIndex = index;
                    // });
                  },
                ),

                body: cubit.screensList[cubit.currentIndex],
              ),
              fallback: (context) => Scaffold(
                  body: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Color(0xFFf08986),
                  size: 40,
                ),
                // CircularProgressIndicator(color: Color(0xFFf08986),)
              )),
            );
          });
    });
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5],
                colors: [
                  const Color(0xFF56a89c).withOpacity(0.9),
                  const Color(0xFF56a89c).withOpacity(0.8),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
            ),
            width: double.infinity,
            height: 215,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Colors.purple.shade50.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
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
                              decoration: const InputDecoration(
                                  hintText: 'Doctors,Diseases....',
                                  hintStyle: TextStyle(
                                      color: Colors.black54),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              'assets/icons/search.svg',
                              color: Color(0xFF56a89c),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Image.network(cubit.hospital!.logo!,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      MyTitles(title: 'Quick access'),
                      Container(
                        height: 235,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 1 / 0.6,
                            crossAxisCount: 2,
                            children: [
                              InkWell(
                                onTap: () {
                                  navigateTo(context,
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
                const SizedBox(
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
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Ask about anything...',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    const Color(0xFF56a89c)),
                                child: const Text(
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
                const SizedBox(
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
                          const SizedBox(
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
                const SizedBox(
                  height: 0,
                ),
              ],
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
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 4,
              color: Colors.grey.shade300)
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
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87.withOpacity(0.7),
                  fontSize: 14),
              //style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  List catPath;
  List catTitle;
  late int index;

  CategoriesWidget({required this.catPath, required this.index, required this.catTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 4,
              color: Colors.grey.withOpacity(0.15))
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 40,
                height: 40,
                child: Image(image: AssetImage(catPath[index]))),
            const SizedBox(
              height: 10,
            ),
            Text(
              catTitle[index],
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87.withOpacity(0.7),
                  fontSize: 15),
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
