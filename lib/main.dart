import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_proj/screens/sign_in/cubit/cubit.dart';
import 'package:grad_proj/screens/verification/varificationScreen.dart';
import 'package:grad_proj/shared/bloc_observer.dart';
import 'package:grad_proj/shared/network/remote/dio_helper.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => SignInCubit()),
      ],
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: varification() //HomeScreen(),
          ),
    );
  }
}
