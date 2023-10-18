import 'package:flutter/material.dart';

import 'CategoriesWidget.dart';
import 'VideoItem.dart';
import 'custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 10),
              decoration: const BoxDecoration(
                color: Color(0xFF03A9F4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 15),
                    child: Text(
                      "ค้นหาคำภาษามือ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ค้นหาที่นี่....",
                        suffixIcon: Icon(Icons.search),
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      onChanged: (value) {
                        showSearch(
                          context: context,
                          delegate: CustomSearch(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "หมวดหมู่อาการ",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            CategoriesWidget(),//รายการฟังก์ชัน
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "เพิ่มเติม",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            VideoItem(),
          ],
        ),
    );
        
  }
}
