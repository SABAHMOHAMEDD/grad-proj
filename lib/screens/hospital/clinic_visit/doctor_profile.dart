import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 75,
              backgroundColor: Color(0xFF56a89c),
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              'Doctor specialty',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87),
            ),
            Text(
              'Doctor Name',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 25,
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
                    child: Center(child: Text('S')),
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
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Card(
                child: Column(
                  children: const [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'About Doctor',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87),
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      child: ExpandableText(
                        'The Flutter engine has been replaced with Flutter web engine which '
                        'is a lower level implementation of Flutter widgets and rewritten them khdjdisfnkldnsfkmfkmsfklvmsldkfmcsdlvm',
                        expandText: 'show more',
                        collapseText: 'show less',
                        linkColor: Color(0xFF56a89c),
                        maxLines: 3,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Icon(
                            Icons.monetization_on_outlined,
                            size: 42,
                            color: Color(0xFF56a89c),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '300LE',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text('Price',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Icon(
                            Icons.timelapse,
                            size: 42,
                            color: Color(0xFF56a89c),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '30 minutes',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text('Waiting Time',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      )),
                    ],
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 42,
                            color: Color(0xFF56a89c),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Masr El Gdedea',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text('Location',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ),
            const SizedBox(
              height: 20,
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
      ),
    );
  }
}
