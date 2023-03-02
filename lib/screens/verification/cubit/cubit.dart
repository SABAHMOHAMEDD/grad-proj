import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/screens/verification/cubit/states.dart';
import 'package:grad_proj/screens/verification/otp_screen.dart';

import '../../../const/const.dart';

class VerificatioCubit extends Cubit<VerificationStates> {
  VerificatioCubit()
      : super(VerificationIntialState()); // need intial state in the super

  static VerificatioCubit get(context) => BlocProvider.of(context);

  void userVerification({required String phoneNum, required context}) {
    emit(VerificationLoadinState());
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNum,
      verificationCompleted: (PhoneAuthCredential credential) {
        emit(VerificationSuccessState());
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) =>
                OtpScreen(verificationId: verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void codeSent({required String verificationId, required String otp}) {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);

    // Sign the user in (or link) with the credential
    FirebaseAuth.instance.signInWithCredential(credential);
  }
}
