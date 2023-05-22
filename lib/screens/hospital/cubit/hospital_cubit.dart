import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/models/service_provider_model.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_states.dart';
import 'package:grad_proj/screens/hospital/hospital_home.dart';
import 'package:grad_proj/screens/hospital/my_deals_screen.dart';

import '../../../models/doctor_model.dart';
import '../../../shared/styles/IconBroken.dart';

class HospitalCubit extends Cubit<HospitalStates>{

  HospitalCubit() : super(HospitalInitialState());

  static HospitalCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;
  List<BottomNavigationBarItem> BottomNavItems = [
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
  ];
  List<Widget> screensList = [
    HomeBody(),
    MyDealsScreen(),
    HomeBody(),
    HomeBody(),
    HomeBody(),
  ];

  void changeBottomNav(int i) {
      currentIndex = i;
      emit(SocialChangeBottomNavState());
  }

  String? serviceUid;
  ServiceProviderModel? hospital ;
  void getHospital({required String uId}){
    serviceUid = uId;
    emit(HospitalLoadingState());
    FirebaseFirestore.instance.collection('serviceProviders').doc(uId).get().then((value) {

        hospital = ServiceProviderModel.fromJson(value.data()!);
        emit(HospitalGetSuccessState());


    }).catchError((onError){
      defToast(msg: onError.toString());
      emit(HospitalErrorState());
    });
  }

  List<DoctorModel> doctorsList =[];

  void getDoctors({required String uId}) {
    emit(HospitalGetDoctorsLoadingState());
     FirebaseFirestore.instance.collection('serviceProviders').doc(uId).collection('doctors').get().then((value) {
       doctorsList =[];
      value.docs.forEach((doctor) {
        doctorsList.add(DoctorModel.fromJson(doctor.data()));
      });
      emit(HospitalGetDoctorsSuccessState());
    }).catchError((onError){
       defToast(msg: onError.toString());
       emit(HospitalGetDoctorsErrorState());
     });
  }

  List<DoctorModel>? searchedList;
  void searchDoctor({required String name}){
    searchedList = doctorsList.where((element) => element.name!.contains(name)).toList();
    emit(HospitalGetDoctorsSuccessState());

  }
}