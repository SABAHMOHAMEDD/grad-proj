import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/home/homeScreen.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';
import 'package:grad_proj/screens/sign_in/cubit/cubit.dart';
import 'package:grad_proj/shared/bloc_observer.dart';
import 'package:grad_proj/shared/network/remote/dio_helper.dart';

import 'const/const.dart';
import 'firebase_options.dart';

bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DioHelper.init();
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    uId = user.uid;
    isLogin = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SignInCubit()),
        BlocProvider(create: (BuildContext context) => HospitalCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'j',
          ),
          home: Home()

          //isLogin!? Home():  SignInScreen() //HomeScreen(),

          ),
    );
  }
}
