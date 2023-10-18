import 'package:flutter/material.dart';

import 'profile.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  late double screenWidth, screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('แก้ไขโปรไฟล์'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Settings()));
            },
          ),
        ),
        body: SafeArea(
            child: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image(
                  image: AssetImage("assets/images/1.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      // Text(
                      //   "แก้ไขโปรไฟล์",
                      //   style: TextStyle(
                      //       fontSize: 25,
                      //       fontWeight: FontWeight.w500,
                      //       color: Colors.white),
                      // ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.1)),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://i.pinimg.com/550x/e3/f5/2b/e3f52b3ef8ddbd4e0a28f1a6da38bf5c.jpg"))),
                            ),
                            Positioned(
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 4,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    color: Color(0xFF03A9F4),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      buildTextField(
                          "ชื่อ - นามสกุล", "Natthida Nuttaphum", false),
                      buildTextField("อีเมล์", "pprangnat@gmail.com", false),
                      buildTextField("รหัสผ่าน", "********", true),
                      SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("ยืนยัน"),
                                    content: Text(
                                        "คุณต้องการที่จะไม่บันทึกใช่หรือไม่?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("ใช่"),
                                        onPressed: () {
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (BuildContext context) => Settings()));
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder:
                                          //             (BuildContext context) =>
                                          //                 Settings()));
                                        },
                                      ),
                                      TextButton(
                                        child: Text("ไม่"),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // ปิดกล่องโต้ตอบ
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                "ยกเลิก",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("บันทึก"),
                                    content: Text(
                                        "คุณต้องการที่จะบันทึกข้อมูลหรือไม่?"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("ใช่"),
                                        onPressed: () {
                                          final snackBar = SnackBar(
                                            content: Text('บันทึกสำเร็จ'),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          Navigator.of(context)
                                              .pop(Text("บันทึกสำเร็จ"));
                                          // Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder:
                                          //             (BuildContext context) =>
                                          //                 Settings()));
                                        },
                                      ),
                                      TextButton(
                                        child: Text("ไม่"),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // ปิดกล่องโต้ตอบ
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.lightBlue, // สี
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "บันทึก",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextFeild) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextFeild ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextFeild
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ))
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
