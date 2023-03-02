import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/screens/sign_in/cubit/states.dart';

import '../../../const/const.dart';
import '../../../models/user_model.dart';

class SignInCubit extends Cubit<LoginStates> {
  SignInCubit() : super(LoginIntialState()); // need intial state in the super

  static SignInCubit get(context) => BlocProvider.of(context);

  UserModel? model;
  bool securedPassword = true;
  IconData Suffix = Icons.visibility;

  void ChangePasswordVisibility() {
    securedPassword = !securedPassword;

    Suffix = securedPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangePasswordVisibilityState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadinState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user?.email);
      uId = value.user!.uid;
      emit(LoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  static showLoading(context, String loadingMessage,
      {bool isCancelabele = true}) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 12,
                ),
                Text(loadingMessage),
              ],
            ),
          );
        },
        barrierDismissible: isCancelabele);
  }
}
