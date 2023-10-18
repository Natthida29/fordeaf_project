import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatDoctor extends StatelessWidget {
  ChatDoctor({super.key});

  final List<String> users = ['Natthida Nuttaphum', 'User2', 'User3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทั้งหมด'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserChatScreen(username: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UserChatScreen extends StatefulWidget {
  final String username;

  UserChatScreen({required this.username});

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ImagePicker _imagePicker = ImagePicker();

  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: text, isMe: true));
        _messageController.clear();
      });
    }
  }

  Future<void> _pickImage() async {
    final PickedFile? pickedFile =
        await _imagePicker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // อัพโหลดรูปภาพ
      // นี่คือที่คุณสามารถเพิ่มโค้ดอัพโหลดรูปภาพได้
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: message.isMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: message.isMe ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        message.text,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    _pickImage();
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'ข้อความ...'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isMe;

  ChatMessage({required this.text, required this.isMe});
}

void main() {
  runApp(MaterialApp(
    home: ChatDoctor(),
  ));
}
