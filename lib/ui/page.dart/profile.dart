import 'package:flutter/material.dart';
import 'package:flutter2/ui/page.dart/Page1.dart';

import '../../services/auth.dart';
import 'edit_profile.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('ออกจากระบบ'),
          content: const Text('คุณต้องการออกจากระบบใช่หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await AuthBase().logout();
                Navigator.of(context).pushReplacementNamed('login');
              },
              child: const Text('ออกจากระบบ'),
            ),
          ],
        );
      },
    );
  }

  bool showPassword = false;
  late double screenWidth, screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('โปรไฟล์'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Page1(
                        username: '',
                      )));
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
                      Align(
                        alignment: Alignment.center,
                        // child: Text(
                        //   "โปรไฟล์",
                        //   style: TextStyle(
                        //       fontSize: 25,
                        //       fontWeight: FontWeight.w500,
                        //       color: Colors.white),
                        // ),
                      ),
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
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //       spreadRadius: 2,
                                  //       blurRadius: 10,
                                  //       color: Colors.black.withOpacity(0.1)),
                                  // ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "https://i.pinimg.com/550x/e3/f5/2b/e3f52b3ef8ddbd4e0a28f1a6da38bf5c.jpg"))),
                            ),
                            Positioned(
                                bottom: 1,
                                right: 1,
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
                                    child: Positioned(
                                        bottom: 5,
                                        right: 5,
                                        child: Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: 4,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                            color: Color(0xFF03A9F4),
                                          ),
                                          child: IconButton(
                                            // แทนที่ Icon ด้วย IconButton
                                            icon: Icon(Icons.edit,
                                                color: Colors.white),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SettingsUI()), // เปลี่ยนไปยังหน้า SettingsUI
                                              );
                                            },
                                          ),
                                        ))))
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      buildTextField(
                          "ชื่อ - นามสกุล", "Natthida Nuttaphum", false),
                      buildTextField("อีเมล์", "pprangnat@gmail.com", false),
                      buildTextField("รหัสผ่าน", "********", true),
                      SizedBox(height: 100),
                      ElevatedButton(
                        onPressed: _showLogoutConfirmationDialog,
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 246, 111, 101), // สี
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "ออกจากระบบ",
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
