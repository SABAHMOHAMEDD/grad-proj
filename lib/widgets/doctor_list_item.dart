import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/models/doctor_model.dart';
import 'package:grad_proj/screens/hospital/clinic_visit/booking_doctor_screen.dart';
import 'package:grad_proj/screens/hospital/clinic_visit/doctor_profile.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({Key? key, required this.doctor}) : super(key: key);
  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    HospitalCubit cubit = HospitalCubit.get(context);
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
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width - 150,
                      child: Text(
                        doctor.bio!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      )),
                  Row(
                    children: const [
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
          _Feature(text: doctor.bio!, icon: FontAwesomeIcons.stethoscope),
          _Feature(text: doctor.location!, icon: FontAwesomeIcons.locationDot),
          _Feature(
              text: 'سعر الكشف : ${doctor.price!} جنية',
              icon: FontAwesomeIcons.moneyBill1Wave),
          _Feature(
              text: 'مدة الانتظار : ${doctor.waitingTime} دقيقة',
              icon: FontAwesomeIcons.clock),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      BookingDoctorScreen(
                        cubit: cubit,
                        doctor: doctor,
                      ));
                },
                child: Container(
                  height: 45,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF56a89c)),
                  child: const Center(
                      child: Text(
                    'احجز الان',
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
