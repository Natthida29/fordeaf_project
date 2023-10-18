import 'package:flutter/material.dart';
import 'package:flutter2/symbol/neck.dart';

import '../../symbol/body.dart';
import '../../symbol/head.dart';
import '../../symbol/leg.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            //Single Item
            //for (int i = 0; i < 10; i++)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeadPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 119, 208, 249),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/head.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NeckPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 119, 208, 249),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/neck.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BodyPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 119, 208, 249),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/human-body.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LegPage()),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 119, 208, 249),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.lightBlueAccent.withOpacity(0.5),
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/leg.png",
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
