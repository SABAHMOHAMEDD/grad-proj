import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/models/service_provider_model.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_states.dart';

import '../../../models/doctor_model.dart';

class HospitalCubit extends Cubit<HospitalStates>{

  HospitalCubit() : super(HospitalInitialState());

  static HospitalCubit get(context) => BlocProvider.of(context);

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