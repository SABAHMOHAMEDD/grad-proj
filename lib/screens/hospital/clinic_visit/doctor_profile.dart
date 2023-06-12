import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/models/doctor_model.dart';
import 'package:grad_proj/theme/mytheme.dart';

import '../../../const/const.dart';
import '../cubit/hospital_cubit.dart';
import 'booking_doctor_screen.dart';

class DoctorProfile extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorProfile({super.key, required this.doctor});


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    HospitalCubit cubit = HospitalCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.secondaryH.withOpacity(0.0),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Card(
          // shape:  RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //       topRight: Radius.circular(50),
          //       topLeft: Radius.circular(50),
          //   bottomRight: Radius.circular(50),
          //     bottomLeft: Radius.circular(50)
          //   ),
          // ),
          child: Container(
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.grey.shade100,
                  backgroundImage: NetworkImage(doctor.image!),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  doctor.specialty!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
                Text(
                  doctor.name!,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.grey.shade50)
                    ]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'About Doctor',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                              )),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: ExpandableText(
                              doctor.bio!,
                              expandText: 'show more',
                              collapseText: 'show less',
                              linkColor: Color(0xFF56a89c),
                              maxLines: 3,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.grey.shade50)
                    ]),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on_outlined,
                                      size: 42,
                                      color: Color(0xFF56a89c),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '300LE',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text('Price',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                )),
                                Expanded(
                                    child: Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse,
                                      size: 42,
                                      color: Color(0xFF56a89c),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '30 minutes',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text('Waiting Time',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(2, 2),
                          blurRadius: 4,
                          color: Colors.grey.shade50)
                    ]),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 70,
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 42,
                                      color: Color(0xFF56a89c),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Masr El Gdedea',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        Text('Location',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        navigateTo(
                            context,
                            BookingDoctorScreen(
                              doctor: doctor,
                              cubit: cubit,
                            ));
                      },
                      child: Container(
                        height: 45,
                        width: 340,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF56a89c)),
                        child: const Center(
                            child: Text(
                          'Book Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
