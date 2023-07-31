import 'package:flutter/material.dart';
import 'package:flutter2/main.dart';
import 'package:flutter2/views/camera_view.dart';

void main(){
  runApp(MyApp());
}
class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const CameraView(),
    );
  }
}