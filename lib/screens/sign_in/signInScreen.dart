import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../const/const.dart';
import '../../home/homeScreen.dart';
import '../../shared/components/components.dart';
import '../../theme/mytheme.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../sign_up/signUpScreen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignInn extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (BuildContext context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: state.error, state: ToastState.ERROR);
          }
          if (state is LoginSuccessState) {
            // CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            //   Navigator.pushReplacementNamed(context, Layout.RouteName);
            // });
            // navigateToReplacement(context, HomePage());
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(children: [
              Stack(children: [
                Container(
                  height: size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      'assets/images/this.jpg',
                    ),
                    fit: BoxFit.fitHeight,
                  )),
                ),
                Positioned(
                  top: 200,
                  left: 11,
                  right: 11,
                  child: Container(
                    height: 650,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 35, bottom: 10),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                color: Colors.black.withOpacity(.7),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              EditTextField(
                                  ontab: () {},
                                  context: context,
                                  icon: Icons.email_outlined,
                                  hintText: 'Email',
                                  isPassword: false,
                                  isEmail: true,
                                  controller: emailController),
                              SizedBox(
                                height: 10,
                              ),
                              EditTextField(
                                  ontab: () {},
                                  context: context,
                                  icon: Icons.lock_outline,
                                  hintText: 'Password',
                                  isPassword: true,
                                  isEmail: false,
                                  controller: passwordController),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Button(
                                    context: context,
                                    string: 'SIGN IN',
                                    width: 2.58,
                                    voidCallback: () {
                                      SignInCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                      navigateToReplacement(context, Home());
                                    },
                                  ),
                                  SizedBox(width: size.width / 20),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('You don\'t have account?',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                      )),
                                  TextButton(
                                    onPressed: () {
                                      navigateToReplacement(context, SignUpp());
                                    },
                                    child: Text(
                                      'SignUp Now',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: MyTheme.primaryH),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ]),
          ));
        },
      ),
    );




  }
}
