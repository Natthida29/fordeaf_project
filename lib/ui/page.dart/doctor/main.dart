import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'chatdoctor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Consultation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatDoctor(),
    );
  }
}
