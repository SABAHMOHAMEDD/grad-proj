import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:grad_proj/screens/verification/cubit/cubit.dart';
import 'package:grad_proj/screens/verification/varificationScreen.dart';
import 'package:grad_proj/screens/verification/varification_success_screen.dart';
import '../../const/const.dart';
import 'cubit/states.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({required this.verificationId});
   final String verificationId;
  var otpController;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => VerificatioCubit(),
      child: BlocConsumer<VerificatioCubit,VerificationStates>(
        listener:(context, state){} ,
        builder: (context, state){
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xfff7f6fb),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          navigateToReplacement(context, varification());
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 32,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/img_2.png',
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Enter your OTP code number",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 48,
                    ),

                    OtpTextField(
                      numberOfFields: 6,
                      focusedBorderColor: Colors.blueGrey,
                      filled: true,
                      borderColor: Colors.blueGrey,
                      fillColor: Colors.black.withOpacity(0.1),
                      onSubmit: (code) {
                        otpController = code;
                        print('code is $code');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: ()  {
                          VerificatioCubit.get(context).codeSent(verificationId: verificationId, otp: otpController);

                          navigateToReplacement(context, VarificationSuccessScreen());
                        },
                        style: ButtonStyle(
                          foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Didn't you receive any code?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      "Resend New Code",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )



      ,
    );
  }
}

