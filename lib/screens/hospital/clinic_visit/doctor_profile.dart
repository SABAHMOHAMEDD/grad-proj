import 'package:flutter/material.dart';


class DoctorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios,color: Colors.black87,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 300,
            child: Stack(
              children: const [
                CircleAvatar(
                  radius: 200,
                  backgroundColor: Colors.transparent,
                  child: Image(
                image: AssetImage("assets/images/doctor (2).png"),
                fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent, width: 1),
                      color: Colors.orange.shade50),
                  child: Center(child: Text('مدة الانتظار:15دقيقة')),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: Text('M')),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 45,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green.shade50),
                  child: Center(child: Text('L')),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About Doctor',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87,
                          height: 1.4),
                    )),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 340,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF56a89c)),
                    child: const Center(
                        child: Text(
                      'Book Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    )),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
