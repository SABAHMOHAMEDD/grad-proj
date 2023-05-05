import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_states.dart';
import 'package:grad_proj/shared/components/components.dart';
import 'package:grad_proj/widgets/doctor_list_item.dart';
import 'package:sizer/sizer.dart';

class DoctorsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        HospitalCubit cubit = HospitalCubit.get(context);
        cubit.getDoctors(uId: cubit.serviceUid!);
        return BlocConsumer<HospitalCubit,HospitalStates>(
          listener: (context,state){

          },
          builder:(context,state) {
            HospitalCubit cubit = HospitalCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Doctors List',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF56a89c)),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      ConditionalBuilder(
                        condition: cubit.doctorsList != null,
                        builder:(context)=> ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              return DoctorListItem(doctor: cubit.doctorsList[i],);
                            },
                            separatorBuilder: (context, i) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: cubit.doctorsList.length),
                        fallback: (context)=>Center(child: CircularProgressIndicator()),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    );
  }
}

class MyCard extends StatelessWidget {
  List imageUrl;
  List title;
  List subtitle;
  int index;

  MyCard(
      {required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Do something when the card is tapped
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                imageUrl[index],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title[index],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle[index],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
