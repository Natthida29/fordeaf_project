import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/ui/page.dart/chat1.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ChatApp extends StatefulWidget {
  final File? pickedImage;
  final File? pickedVideo;
  final List<Map<String, dynamic>> results;
  final String resultText;

  ChatApp(
      {required this.resultText,
      required this.results,
      required this.pickedImage,
      this.pickedVideo});
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _currentUser;
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  String result = "สวัสดี นี่คือผลลัพธ์จากการตรวจจับมือ";

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
    _addInitialMessage();

    // If we have results, let's send them to the chat right away:
    if (widget.results.isNotEmpty) {
      for (var result in widget.results) {
        String messageText =
            'Label: ${result['label']} | Confidence: ${(result['confidence'] * 100).toStringAsFixed(2)}%';
        _sendMessage(messageText);
      }
    }
  }
  // Future<void> _pickImage() async {
  //   final PickedFile? pickedFile =
  //       await _imagePicker.getImage(source: ImageSource.camera);

  //   if (pickedFile != null) {
  //     // อัพโหลดรูปภาพ
  //     // นี่คือที่คุณสามารถเพิ่มโค้ดอัพโหลดรูปภาพได้
  //   }
  // }

  void _addInitialMessage() async {
    // เช็คว่ามีข้อมูลในคอลเลกชัน 'messages' หรือยัง
    var messages = await _firestore.collection('messages').get();

    // หากยังไม่มีข้อมูลในคอลเลกชัน 'messages'
    if (messages.docs.isEmpty) {
      await _firestore.collection('messages').add({
        'text':
            'สวัสดีค่ะ! เรายินดีให้คำปรึกษาผู้บกพร่องทางการได้ยินเกี่ยวกับเรื่องสุขภาพของคุณค่ะ',
        'senderId': 'R4Dtj5huYBQOpwITf1ExYPd3yph1',
        'timestamp': FieldValue.serverTimestamp(),
      });
    }
  }

  _getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      _currentUser = user;
      print('Logged in as: ${_currentUser.uid}');
    }
  }

  _sendMessage([String? message]) async {
    String textToSend = message ?? _messageController.text;
    if (textToSend.isNotEmpty) {
      await _firestore.collection('messages').add({
        'text': textToSend,
        'senderId': _currentUser.uid,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    }
  }

  Future<String> _getUsernameFromFirestore(String userId) async {
    DocumentSnapshot userSnapshot =
        await _firestore.collection('users').doc(userId).get();
    var username =
        (userSnapshot.data() as Map<String, dynamic>?)?['username'] ?? '';
    return username;
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
        title: const Text('ปรึกษาแพทย์'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> messageSnapshot) {
                if (!messageSnapshot.hasData) {
                  return const Center();
                }
                var messages = messageSnapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var message = messages[index];
                    var messageId =
                        message.id; // Get the document ID as the messageId
                    var result = message['text'];
                    var senderId = message['senderId'];
                    var currentUserMessage = senderId == _currentUser.uid;

                    return FutureBuilder<String>(
                      future: _getUsernameFromFirestore(senderId),
                      builder:
                          (context, AsyncSnapshot<String> usernameSnapshot) {
                        if (!usernameSnapshot.hasData) {
                          return LinearProgressIndicator();
                        }
                        var username = usernameSnapshot.data!;
                        return Bubble(
                            messageId, result, username, currentUserMessage);
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: _pickImageFromGallery,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
