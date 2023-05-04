import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/screens/sign_up/cubit/states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/const.dart';
import '../../../models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit()
      : super(RegisterInitialState()); // need intial state in the super

  static RegisterCubit get(context) => BlocProvider.of(context);

  File? profileImage;
  ImagePicker picker = ImagePicker();

  Future<void> getProfileImage() async {
    XFile? pickedFile = await picker.pickImage(
      imageQuality: 50,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(RegisterProfileImgPickedSuccessState());
    } else {
      print('No Image Selected');
      emit(RegisterProfileImgPickedErrorState());
    }
  }

  String? profileImgUrl;
  Future<void> uploadProfileImage() async {
    return await FirebaseStorage.instance
        .ref()
        .child(
        'users/profile/${Uri
            .file(profileImage!.path)
            .pathSegments
            .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        profileImgUrl = value;
      });
    }).catchError((onError) {
      emit(SocialProfileImgUploadErrorState());
      defToast(
        msg: onError.message,
        backgroundColor: Colors.red,
      );
    });
  }
  // Authentication
  Future<void> newRegistration({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String NId,
    required DateTime DOB,
  }) async {
    emit(RegisterLoadingState());
    if (profileImage != null) {
      await uploadProfileImage();
    }
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      createUser(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid,
          nId: NId,
          dOB: DOB,
          uImage: profileImgUrl == null
              ? 'https://firebasestorage.googleapis.com/v0/b/gradproj-37b92.appspot.com/o/users%2Fprofile%2Fuserprofile.png?alt=media&token=52799077-26d4-4e3f-85df-f1d6802c5858'
              : profileImgUrl!); // save data in firestore
    }).catchError((error) {
      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      print(error.toString());
      emit(RegisterErrorState(error.message));
      defToast(
        msg: error.message,
        backgroundColor: Colors.red,
      );
    });
  }

// save data in firestore
  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required String nId,
    required String uImage,
    required DateTime dOB,
  }) {
    UserModel userModel = UserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        uImage: uImage,
        NId: nId,
        DOB: dOB);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toJson())
        .then((value) {
      emit(CreateSuccessState(uId));
    }).catchError((error) {
      print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      print(error.toString());
      emit(CreateErrorState(error.message));
    });
  }


}
