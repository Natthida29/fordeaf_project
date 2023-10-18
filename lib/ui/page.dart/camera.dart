import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'chatapp.dart';

void main() {
  runApp(CameraPage());
}

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HandDetectionScreen(),
    );
  }
}

class HandDetectionScreen extends StatefulWidget {
  @override
  _HandDetectionScreenState createState() => _HandDetectionScreenState();
}

class _HandDetectionScreenState extends State<HandDetectionScreen> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  bool _isModelReady = false;
  List<dynamic>? _recognitions;
  int _currentCameraIndex = 0; // 0 for back camera, 1 for front camera
  String result = "สวัสดี นี่คือผลลัพธ์จากการตรวจจับมือ";

  @override
  void initState() {
    super.initState();
    _initializeCamera(_currentCameraIndex);
    _loadModel();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  _initializeCamera(int cameraIndex) async {
    _cameras = await availableCameras();
    _cameraController = CameraController(
      _cameras[cameraIndex],
      ResolutionPreset.medium,
    );
    await _cameraController.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
    _cameraController.startImageStream(_processCameraImage);
  }

  _loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
    setState(() {
      _isModelReady = true;
    });
  }

  _processCameraImage(CameraImage cameraImage) async {
    if (_isModelReady) {
      final List? recognitions = await Tflite.runModelOnFrame(
        bytesList: cameraImage.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        imageHeight: cameraImage.height,
        imageWidth: cameraImage.width,
        imageMean: 127.5,
        imageStd: 127.5,
        rotation: 90,
        numResults: 2,
        threshold: 0.3,
        asynch: true,
      );

      setState(() {
        _recognitions = recognitions;
      });
    }
  }

  _toggleCamera() {
    // Toggle between front and back cameras
    _currentCameraIndex = (_currentCameraIndex + 1) % 2;
    _initializeCamera(_currentCameraIndex);
  }

  _sendResultsToChat() {
    List<Map<String, dynamic>> detectionResults = [];

    // Convert the List<dynamic> to a List<Map<String, dynamic>>
    if (_recognitions != null) {
      for (var recognition in _recognitions!) {
        detectionResults.add({
          'label': recognition['label'],
          'confidence': recognition['confidence'],
        });
      }
    }

    // Navigate to the chat page and pass the detection results as a parameter
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatApp(
          results: detectionResults, // Pass the list of detection results
          resultText: result, pickedImage: null,
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      // Process the picked image
      var recognitions = await _processPickedImage(image);
      // Navigate to the chat page with the results
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatApp(
            pickedImage: image,
            resultText: result,
            results: recognitions,
          ),
        ),
      );
    }
}

Future<List<Map<String, dynamic>>> _processPickedImage(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      // other parameters you might need
    );

    return recognitions!.map((recog) {
      return {
        'label': recog['label'],
        'confidence': recog['confidence'],
      };
    }).toList();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hand Detection'),
      ),
      body: _isCameraInitialized
          ? Stack(
        children: [
          CameraPreview(_cameraController),
          _buildResultsWidget(),
        ],
      )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0), // Add left padding
            child: FloatingActionButton(
              onPressed: _pickImageFromGallery,
              //backgroundColor: Colors.green,
              child: Icon(Icons.photo_library),
            ),
          ),
          FloatingActionButton(
            onPressed: _toggleCamera,
            child: Icon(Icons.switch_camera),
          ),
        ],
      ),
    );
  }



  Widget _buildResultsWidget() {
    if (_recognitions == null) return Container();

    return Positioned(
      top: 16,
      left: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hand Detection Results:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          for (var recognition in _recognitions!)
            Text(
              'Label: ${recognition['label']} | Confidence: ${(recognition['confidence'] * 100).toStringAsFixed(2)}%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          SizedBox(height: 16),
          SizedBox(
            width: 30, // Set the width to adjust the size
            height: 30, // Set the height to adjust the size
            child: FloatingActionButton(
              backgroundColor: Colors.blue, // Set the background color
              onPressed: _sendResultsToChat,
              child: Icon(Icons.send),
            ),
          ),
        ],
      ),
    );
  }
}
