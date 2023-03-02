import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/screens/sign_up/signUpScreen.dart';
import 'package:grad_proj/screens/verification/cubit/cubit.dart';

import '../../const/const.dart';
import 'cubit/states.dart';

class varification extends StatelessWidget {
  var phoneController = TextEditingController();

  var numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => VerificatioCubit(),
        child: BlocConsumer<VerificatioCubit, VerificationStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xfff7f6fb),
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            navigateToReplacement(context, SignUpScreen());
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
                          'assets/images/img_3.png',
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
                        "Add your phone number. we'll send you a verification code so we know you're real",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Container(
                        padding: EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: numController,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(10)),
                                prefix: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    '(+20)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  VerificatioCubit.get(context)
                                      .userVerification(
                                          phoneNum: '+201022714175',
                                          context: context);
                                },
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueGrey),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(14.0),
                                  child: Text(
                                    'Send',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
