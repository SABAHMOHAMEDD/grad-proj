import 'package:flutter/material.dart';

import '../../../const/const.dart';
import 'doctors_list.dart';

class DiseasesCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: Text(
              'Select Category',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                color: Color(0xFF56a89c),

              ),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      color: Colors.blueGrey.withOpacity(0.23))
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none),
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Color(0xFF56a89c),
                  size: 32,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  InkWell(
                      onTap: () {
                        // navigateToReplacement(context, DoctorsList());
                      },
                      child: CategoriesWidget(
                        catPath: 'assets/images/mask.png',
                        catTitle: 'Infectious',
                      )),
                  InkWell(
                    onTap: () {
                      navigateTo(context, DoctorsList());
                    },
                    child: CategoriesWidget(
                      catPath: 'assets/images/rash.png',
                      catTitle: 'Skin',
                    ),
                  ),
                  CategoriesWidget(
                    catPath: 'assets/images/gastroenterology.png',
                    catTitle: 'Digestive',
                  ),
                  CategoriesWidget(
                    catPath: 'assets/images/brain.png',
                    catTitle: 'Neurological',
                  ),
                  CategoriesWidget(
                    catPath: 'assets/images/rash.png',
                    catTitle: 'Skin',
                  ),
                  InkWell(
                      onTap: () {},
                      child: CategoriesWidget(
                        catPath: 'assets/images/gastroenterology.png',
                        catTitle: 'Digestive',
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  String catPath;
  String catTitle;

  CategoriesWidget({required this.catPath, required this.catTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(2, 2),
              blurRadius: 4,
              color: Colors.blueGrey.withOpacity(0.23))
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
            child: Image(image: AssetImage(catPath)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              catTitle,

              style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black87.withOpacity(0.7),fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
