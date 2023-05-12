import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../const/const.dart';
import '../../home/homeScreen.dart';
import '../../theme/mytheme.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../sign_in/signInScreen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignUpp extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var NIDcontroller = TextEditingController();
  late DateTime DOB;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (BuildContext context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {
          if (state is CreateSuccessState) {
            defToast(
              msg: 'Successfully Register',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
            );
            //uId = state.uId;
            navigateToReplacement(context, Home());
          }
        }, builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
              body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(children: [
              Container(
                height: size.height,
                // width: double.infinity,
                decoration: const BoxDecoration(
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
                  width: double.infinity,
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
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 4,
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            // CircleAvatar(
                            //     radius: 64,
                            //     backgroundColor:
                            //     Theme.of(context).scaffoldBackgroundColor,
                            //     child: CircleAvatar(
                            //       radius: 60,
                            //       backgroundImage: cubit.profileImage == null
                            //           ? AssetImage('assets/images/userprofile.png')
                            //           : FileImage(
                            //           cubit.profileImage!) as ImageProvider,)),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: CircleAvatar(
                            //     backgroundColor: Colors.blue,
                            //     radius: 15,
                            //     child: IconButton(
                            //         padding: EdgeInsets.zero,
                            //         iconSize: 18,
                            //         onPressed: () {
                            //           cubit.getProfileImage();
                            //         },
                            //         icon: Icon(
                            //           IconlyBroken.camera,
                            //           color: Colors.white,
                            //         )),
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        EditTextField(
                          context: context,
                          icon: Icons.person,
                          hintText: 'Name',
                          isPassword: false,
                          isEmail: true,
                          controller: nameController,
                          ontab: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 54,
                          width: size.width / 1.2,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.24),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DateTimeFormField(
                            decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.date_range,
                                color: Colors.black45,
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                              hintText: 'Date Of Birth ',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              labelStyle: TextStyle(
                                  color: Colors.black45, fontSize: 15),
                              errorStyle: TextStyle(color: Colors.redAccent),
                            ),
                            mode: DateTimeFieldPickerMode.date,
                            dateTextStyle:
                                const TextStyle(color: Colors.black45),
                            autovalidateMode: AutovalidateMode.always,
                            validator: (e) => (e?.day ?? 0) == 1
                                ? 'Please not the first day'
                                : null,
                            onDateSelected: (DateTime value) {
                              print(DateFormat.yMMMMd().format(value));
                              DOB = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextField(
                          context: context,
                          icon: Icons.phone,
                          hintText: 'Phone',
                          isPassword: false,
                          isEmail: true,
                          controller: phoneController,
                          ontab: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextField(
                          context: context,
                          icon: Icons.account_box,
                          hintText: 'National ID',
                          isPassword: false,
                          isEmail: true,
                          controller: NIDcontroller,
                          ontab: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextField(
                          context: context,
                          icon: Icons.email_outlined,
                          hintText: 'Email',
                          isPassword: false,
                          isEmail: true,
                          controller: emailController,
                          ontab: () {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        EditTextField(
                          context: context,
                          icon: Icons.lock_outline,
                          hintText: 'Password',
                          isPassword: true,
                          isEmail: false,
                          controller: passwordController,
                          ontab: () {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context) => Button(
                                context: context,
                                string: 'Sign Up',
                                width: 2.58,
                                voidCallback: () {
                                  RegisterCubit.get(context).newRegistration(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      NId: NIDcontroller.text,
                                      DOB: DOB,
                                      password: passwordController.text);
                                },
                              ),
                              fallback: (BuildContext context) => const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.blue,
                              )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have account?',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.7),
                                )),
                            TextButton(
                              onPressed: () {
                                navigateToReplacement(context, SignInn());
                              },
                              child: Text(
                                'Login Now',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyTheme.primaryH),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ));
        }));
  }
}
