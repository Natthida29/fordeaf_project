import 'package:flutter/material.dart';

import '../chatbot/chatbot.dart';

class VideoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 5),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 365,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 133, 213, 250),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3)
                    )
                  ]
                ),

                child: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/chatbot.png",
                          height: 110,
                        )
                      ),  
                    ),
                    Text("พูดคุยกับแชทบอท", 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.bold),)
                  ]),
                ),
              ),
            )
          ],
        )  
      ),
    );
  }
}