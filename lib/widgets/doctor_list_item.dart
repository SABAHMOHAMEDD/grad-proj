import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/models/doctor_model.dart';
import 'package:sizer/sizer.dart';

import '../shared/components/components.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({Key? key, required this.doctor}) : super(key: key);
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              CircleAvatar(
                backgroundImage: NetworkImage(doctor.image!),
                radius: 40,
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('دكتور ${doctor.name}'),
                  Container(width:MediaQuery.of(context).size.width-150,child: Text(doctor.bio!,overflow: TextOverflow.ellipsis,maxLines: 1,)),
                  Row(
                    children: [
                      const Icon(Icons.star,
                        color: Colors.amber,
                        size: 20,),
                      const Icon(Icons.star,
                        color: Colors.amber,
                        size: 20,),
                      const Icon(Icons.star,
                        color: Colors.amber,
                        size: 20,),
                      const Icon(Icons.star,
                        color: Colors.amber,
                        size: 20,),
                      const Icon(Icons.star,
                        color: Colors.amber,
                        size: 20,),
                    ],
                  ),
                ],
              ),


            ],
          ),
          const SizedBox(height: 10,) ,
          _Feature(text: doctor.bio!, icon: FontAwesomeIcons.stethoscope),
          _Feature(text: doctor.location!, icon: FontAwesomeIcons.locationDot),
          _Feature(text: 'سعر الكشف : ${doctor.price!} جنية', icon: FontAwesomeIcons.moneyBill1Wave),
          _Feature(text: 'مدة الانتظار : ${doctor.waitingTime} دقيقة', icon: FontAwesomeIcons.clock),
          defaultButton(background: Colors.red, function: (){}, text: 'احجز الان',colorText: Colors.white,radius: 5,width: MediaQuery.of(context).size.width/2)
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({Key? key, required this.text, required this.icon}) : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon,color: const Color(0xFF56a89c),),
          const SizedBox(width: 5,),
          Expanded(child: Text(text,overflow: TextOverflow.ellipsis,maxLines: 1)),

        ],
      ),
    );
  }
}

