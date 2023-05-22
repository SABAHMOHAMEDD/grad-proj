import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/models/doctor_model.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';
import 'package:intl/intl.dart';

import '../../const/const.dart';
import '../../models/reservation_model.dart';
import '../../shared/components/components.dart';
import 'clinic_visit/booking_doctor_screen.dart';
import 'clinic_visit/doctor_profile.dart';

class MyDealsScreen extends StatefulWidget {
  const MyDealsScreen({Key? key}) : super(key: key);

  @override
  State<MyDealsScreen> createState() => _MyDealsScreenState();
}

class _MyDealsScreenState extends State<MyDealsScreen> {
  List<ReservationModel> reservationList = [];
  @override
  void initState()  {
    print('starttttttt');
     FirebaseFirestore.instance.collection('users').doc(uId).collection('deals').get().then((value) {
       print(value.docs.reversed);
      value.docs.forEach((element) {
        print(element.data());
        reservationList.add(ReservationModel.fromJson(element.data()));

        setState(() {

        });
        print(reservationList[0].pName);
      });
      setState(() {

      });
    }).catchError((onError){
      defToast(msg: onError.toString());
      setState(() {

      });
     });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HospitalCubit.get(context).getDoctors(uId: 'er3slW6BLMb0ZSS6oM9s');

    DoctorModel doctor = HospitalCubit.get(context).doctorsList[0];

    return ConditionalBuilder(
      condition: reservationList != null,
      builder:(context)=> SingleChildScrollView(
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

              // Image.network(cubit.hospital!.logo!,),
            ),
           ListView.separated(
             shrinkWrap: true,
               padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
               physics: NeverScrollableScrollPhysics(),
               itemBuilder: (context,i)=> Container(
                 padding: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(8),
                     boxShadow: [
                       BoxShadow(
                           offset: const Offset(2, 2),
                           blurRadius: 4,
                           color: Colors.blueGrey.withOpacity(0.23))
                     ]),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         InkWell(
                           onTap: (){
                             navigateTo(context, DoctorProfile(doctor: doctor,));
                           },
                           child: CircleAvatar(
                             backgroundColor: Colors.grey.shade100,
                             backgroundImage: NetworkImage(doctor.image!),
                             radius: 40,
                           ),
                         ),
                         const SizedBox(
                           width: 10,
                         ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             InkWell(
                                 onTap: () {
                                   navigateTo(context, DoctorProfile(doctor: doctor,));
                                 },
                                 child: Text(
                                   'دكتور ${doctor.name}',
                                   style: const TextStyle(
                                       fontWeight: FontWeight.w700, fontSize: 16),
                                 )),
                             Container(
                                 width: MediaQuery.of(context).size.width - 150,
                                 child: Text(
                                   doctor.bio!,
                                   overflow: TextOverflow.ellipsis,
                                   maxLines: 1,
                                 )),
                             const Row(
                               children: [
                                 Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                   size: 20,
                                 ),
                                 Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                   size: 20,
                                 ),
                                 Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                   size: 20,
                                 ),
                                 Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                   size: 20,
                                 ),
                                 Icon(
                                   Icons.star,
                                   color: Colors.amber,
                                   size: 20,
                                 ),
                               ],
                             ),
                           ],
                         ),
                       ],
                     ),
                     const SizedBox(
                       height: 10,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text('تاريخ الكشف : ${DateFormat.yMd().format(DateTime.parse(reservationList[i].bookingStart.toDate().toString()))}')
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text('ميعاد الكشف : ${DateFormat.Hm().format(DateTime.parse(reservationList[i].bookingStart.toDate().toString()))}')
                       ],
                     )

                   ],
                 ),
               ),
               separatorBuilder: (context,i)=>SizedBox(height: 20,),
               itemCount: reservationList.length
           )
          ],
        ),
      ),
      fallback: (context)=>Center(child: CircularProgressIndicator()),
    );
  }
}
class _Feature extends StatelessWidget {
  const _Feature({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF56a89c),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(text, overflow: TextOverflow.ellipsis, maxLines: 1)),
        ],
      ),
    );
  }
}
