import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/const.dart';
import '../../widgets/button.dart';
import '../sign_in/signInScreen.dart';

class VarificationSuccessScreen extends StatelessWidget {
  const VarificationSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
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
              SizedBox(
                height: 24,
              ),

              SizedBox(height: 60,),
              Container(
                width: double.infinity,
                child: Column(children: [
                  Text(
                    ' Verification  ',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                      ' Completed  ',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87
                      ),
                    ),
                    Icon(Icons.verified,color: Colors.green,),


                  ],)
                ],),
              )
            ,


              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    navigateToReplacement(context, SignInScreen());


                  },
                  style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50,vertical: 14),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );

  }
}
