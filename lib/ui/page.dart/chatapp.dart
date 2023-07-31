import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ChatApp extends StatefulWidget {
  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages');
  List<String> messages = [];

  TextEditingController textEditingController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  late User currentUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    currentUser = auth.currentUser!;
  }

  void sendMessage(String message) {
    messagesCollection.add({
      'message': message,
      'senderId': currentUser.uid,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    });
    textEditingController.clear();
  }

  void deleteAllConversations() {
    messagesCollection.get().then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('ลบบทสนาทั้งหมด'),
                    content: const Text('คุณแน่ใจว่าต้องการที่จะลบบทสนทนาทั้งหมด?'),
                    actions: [
                      TextButton(
                        child: const Text('ยกเลิก'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('ลบ'),
                        onPressed: () {
                          deleteAllConversations();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: messagesCollection.orderBy('timestamp').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final document = snapshot.data!.docs[index];
                    final message = document['message'];
                    final senderId = document['senderId'];
                    final isMe = senderId == currentUser.uid;

                    return MessageBubble(
                      message: message,
                      senderId: senderId,
                      isMe: isMe,
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
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    sendMessage(textEditingController.text);
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

class MessageBubble extends StatelessWidget {
  final String message;
  final String senderId;
  final bool isMe;

  const MessageBubble({
    required this.message,
    required this.senderId,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe)
          CircleAvatar(
            // Display sender's profile image here
            backgroundImage: senderId == "UL3qBUwbK3dfo5Iwk2uopkHAbD32"
                ? const AssetImage('assets/images/doctor.png')
                : const AssetImage('assets/images/user.png'),
          ),
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.blue : Colors.grey.shade300,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft: !isMe ? const Radius.circular(0) : const Radius.circular(12),
              bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
            ),
          ),
          width: 140,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
              if (!isMe && message.toLowerCase() == 'เครียด') // เพิ่มเงื่อนไขเช็คว่าเป็นข้อความ 'เครียด'
                TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 500),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (BuildContext context, double value, Widget? child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, -20 * (1 - value)),
                        child: Image.asset(
                          'assets/images/stressed.gif',
                          height: 80,
                          width: 80,
                        ),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
        if (isMe)
          CircleAvatar(
            // Display receiver's profile image here
            backgroundImage: senderId == "OzOBiuLGWZa5K4UJ5Wz91h8KfUA2"
                ? const AssetImage('assets/images/user.png')
                : const AssetImage('assets/images/doctor.png'),
          ),
      ],
    );
  }
}
