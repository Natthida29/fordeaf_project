import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/ui/page.dart/Page1.dart';
import 'package:flutter2/ui/page.dart/camera.dart';
import 'package:flutter2/ui/page.dart/profile.dart';
import 'package:uuid/uuid.dart';

import 'ui/page.dart/doctor/chatdoctor.dart';
import 'ui/screens/auth_screen.dart';
import 'ui/screens/intro_screen.dart';

var uuid = Uuid();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras =await availableCameras();
  await Firebase.initializeApp();
  runApp(MyApp());
}
late List <CameraDescription> cameras;
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xfff2f9fe),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      home: IntroScreen(),
      routes: {
        'intro': (context) => IntroScreen(),
        'page1': (context) => Page1(username: '',),
        'camera': (context) => CameraPage(),
        //'home': (context) => HomeScreen(),
        'setting':(context) => Settings(),
        'login': (context) => const AuthScreen(authType: AuthType.login),
        'register': (context) => const AuthScreen(authType: AuthType.register),
        'doctor':(context) =>  ChatDoctor(),
      },
    );
  }
}