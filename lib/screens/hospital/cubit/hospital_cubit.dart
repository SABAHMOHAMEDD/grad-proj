import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/models/service_provider_model.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_states.dart';

class HospitalCubit extends Cubit<HospitalStates>{

  HospitalCubit() : super(HospitalInitialState());

  static HospitalCubit get(context) => BlocProvider.of(context);

  ServiceProviderModel? hospital ;
  void getHospital({required String uId}){
    emit(HospitalLoadingState());
    FirebaseFirestore.instance.collection('serviceProviders').doc(uId).get().then((value) {
      hospital = ServiceProviderModel.fromJson(value.data()!);
      emit(HospitalGetSuccessState());
    }).catchError((onError){
      defToast(msg: onError.toString());
      emit(HospitalErrorState());
    });
  }
}