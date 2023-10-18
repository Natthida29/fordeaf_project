import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messagebuble.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference messagesCollection =
      FirebaseFirestore.instance.collection('messages_bot');
  @override
  void initState() {
    super.initState();
    _addInitialMessage();
  }

  void _addInitialMessage() async {
    // เช็คว่ามีข้อมูลในคอลเลกชัน 'messages' หรือยัง
    var messages = await _firestore.collection('messages_bot').get();
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    // หากยังไม่มีข้อมูลในคอลเลกชัน 'messages'
    if (messages.docs.isEmpty) {
      await _firestore.collection('messages_bot').add({
        'message': 'สวัสดีครับ ให้อาโปช่วยเรื่องอะไรดีครับ?',
        'sender': 'Bot',
        'time': '$formattedTime\n $formattedDate\n',
      });
    }
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
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('ลบบทสนาทั้งหมด'),
                    content:
                        const Text('คุณแน่ใจว่าต้องการที่จะลบบทสนทนาทั้งหมด?'),
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
            child: MessageList(),
          ),
          MessageInput(), // Add the message input field and send button
        ],
      ),
    );
  }
}

class MessageInput extends StatefulWidget {
  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  List<Message> messages = [];
  final TextEditingController _textController = TextEditingController();

  void sendMessage(String text) async {
    final CollectionReference messagesRef =
        FirebaseFirestore.instance.collection('messages_bot');

    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);

    try {
      // Add the user's message to Firestore
      await messagesRef.add({
        'sender': 'User',
        'message': text,
        'time': formattedTime,
      });

      setState(() {
        messages.add(Message(
          sender: 'User',
          message: text,
          time: formattedTime,
        ));
      });

      // Simulate bot response
      String botResponse = generateBotResponse(text);
      await messagesRef.add({
        'sender': 'Bot',
        'message': botResponse,
        'time': formattedTime,
      });

      setState(() {
        messages.add(Message(
          sender: 'Bot',
          message: botResponse,
          time: formattedTime,
        ));
      });
    } catch (e) {
      // Handle any errors that may occur when adding data to Firestore
      print('Error sending message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'พิมพ์ข้อความ...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: Colors.blue,
            onPressed: () {
              if (_textController.text.trim().isNotEmpty) {
                // Ensure that the text is not just whitespace
                sendMessage(_textController.text.trim());
                _textController
                    .clear(); // Clear the text field after sending the message
              }
            },
          )
        ],
      ),
    );
  }
}

class MessageList extends StatefulWidget {
  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('messages_bot')
          .orderBy('time')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final messages = snapshot.data!.docs;
        List<Widget> messageWidgets = [];

        for (var messageDoc in messages) {
          final messageText = messageDoc['message'];
          final messageSender = messageDoc['sender'];
          final messageTime = messageDoc['time'];

          messageWidgets.add(MessageBubble(
            sender: messageSender,
            message: messageText,
            time: messageTime,
          ));
        }

        return ListView(
          reverse: true,
          children: messageWidgets,
        );
      },
    );
  }
}



//อาการต่างๆในแชทบอท
String generateBotResponse(String userMessage) {
  // Implement your bot's response logic here for Thai language
  if (userMessage.contains('สวัสดี')) {
    return 'มีอาการอะไรมาครับ?';
  } else if (userMessage.contains('ปวดหัวมา 2-3 วัน')) {
    return 'ปวดตรงส่วนไหนของหัวครับ';
  } else if (userMessage.contains('ปวดทั้งหัว') ||
      userMessage.contains('ท้ายทอย') ||
      userMessage.contains('ปวดขมับ') ||
      userMessage.contains('กระหม่อม') ||
      userMessage.contains('ต้นคอ')) {
    return 'มันปวดยังไงครับ ปวดตุ๊บ ปวดจี๊ดๆ ปวดหนึบๆ ปวดตื้อๆ ปวดเหมือนสมองถูกบีบรัดหรือปวดอย่างไรครับ';
  } else if (userMessage.contains('ปวดตื้อๆ') ||
      userMessage.contains('ปวดตุ๊บ') ||
      userMessage.contains('ปวดจี๊ดๆ') ||
      userMessage.contains('ปวดหนึบๆ')) {
    return 'บริเวณที่คุณปวดหัวมันปวดขึ้นมามากๆ ทันที หรือค่อยๆ ปวดมากขึ้นๆ ทีละน้อยๆ';
  } else if (userMessage.contains(
          'เริ่มมึนๆ ก่อนแล้วก็ตื้อมากขึ้นๆ ต่อมาก็ปวดตื้อๆ อยู่ตลอดเวลา') ||
      userMessage.contains('ค่อยๆปวด') ||
      userMessage.contains('ปวดขึ้นมามากๆ') ||
      userMessage.contains('ปวดทีละน้อยแล้วค่อยมากขึ้น') ||
      userMessage.contains('ปวดทันที')) {
    return 'ตอนที่คุณกำลังปวดหัวนี่คุณมีไข้ตัวร้อน คลื่นไส้ อาเจียน หรืออาการไม่สบายอื่นๆ ร่วมด้วยหรือไม่ ';
  } else if (userMessage.contains('ไม่มีไข้') ||
      userMessage.contains('ปวดหัวมากๆ') ||
      userMessage.contains('เบื่ออาหารและคลื่นไส้') ||
      userMessage.contains('นอนไม่หลับ') ||
      userMessage.contains('รู้สึกอ่อนเพลียไม่มีแรง') ||
      userMessage.contains('คลื่นไส้') ||
      userMessage.contains('อาเจียน') ||
      userMessage.contains('คลื่นไส้ อาเจียน') ||
      userMessage.contains('มีไข้') ||
      userMessage.contains('ตัวร้อน') ||
      userMessage.contains('มีไข้ตัวร้อน')) {
    return 'และปวดครั้งหนึ่งนานเท่าใด';
  } else if (userMessage.contains('เพียงชั่วโมงสองชั่วโมง') ||
      userMessage.contains('เป็นวันๆ') ||
      userMessage.contains('ชั่วโมงหรือสองชั่วโมง') ||
      userMessage.contains('ครึ่งชั่วโมง') ||
      userMessage.contains('เป็นวัน') ||
      userMessage.contains('ชั่วโมงนึง') ||
      userMessage.contains('ประมาณชั่วโมง')) {
    return 'อะไรทำให้อาการปวดหัวของคุณเป็นมากขึ้นครับ';
  } else if (userMessage.contains('เสียงดัง') ||
      userMessage.contains('เครียด') ||
      userMessage.contains('พักผ่อนไม่เพียงพอ') ||
      userMessage.contains('ทำงานหน้าคอมพิวเตอร์')) {
    return 'เวลาที่คุณปวดหัว คุณทำอย่างไรถึงจะดีขึ้นครับ เช่น นั่ง นอน ยืน หรือเดิน ท่าไหนที่คุณสบายที่สุด \n หรือคุณทำอย่างไรเพื่อที่จะทุเลาอาการปวดหัวของคุณ ';
  } else if (userMessage.contains('นอนหลับ') ||
      userMessage.contains('นั่ง') ||
      userMessage.contains('ยืน') ||
      userMessage.contains('ทานยาแก้ปวด') ||
      userMessage.contains('นอนพัก')) {
    return 'ตอนนี้คุณทำงานอะไรครับ และงานหนักมากไหม”';
  } else if (userMessage.contains('ตกงานไม่มีงานทำ') ||
      userMessage.contains('ตกงาน') ||
      userMessage.contains('ไม่มีงานทำ')) {
    return 'สรุปได้ว่า อาการปวดหัวของคนไข้คุณเกิดจากการใช้สมองมาก (ใช้สมองคิดเรื่องการหางาน การไม่มีงานทำ การมีเรื่องกับเพื่อนร่วมงานและอื่นๆ) ถ้าตรวจร่างกายแล้วไม่พบว่าร่างกายผิดปกติ ก็จะทำแน่ใจได้ว่า อาการปวดหัวนี้ เกิดจากการคิดมาก เครียดมากนั่นเอง การรักษา (เช่น ให้ไปคุยกับเพื่อนฝูงช่วยหางานให้ ไปพักผ่อนตามสวนสาธารณะเพื่อให้ผ่อนคลาย) ถ้าคุณมีอาการมาก จะแนะนำให้ทานยากล่อมประสาท และยาแก้ปวดไปช่วยทุเลาอาการ';
  } else if (userMessage.contains('ปวดแสบท้อง')) {
    //#2
    return 'ขอทราบระยะเวลาที่มีอาการครับ';
  } else if (userMessage.contains('3วัน') ||
      userMessage.contains('5วัน') ||
      userMessage.contains('หนึ่งอาทิตย์')) {
    return 'อาการมีลักษณะอย่างไรครับ?';
  } else if (userMessage.contains('กลืนลำบาก') ||
      userMessage.contains('จุกเสียด')) {
    return 'เป็นมากเวลาใด? เช้า กลางวัน เย็น ก่อนนอน';
  } else if (userMessage.contains('เช้า') ||
      userMessage.contains('กลางวัน') ||
      userMessage.contains('เย็น') ||
      userMessage.contains('ก่อนนอน')) {
    return 'อะไรที่ทำให้เป็นมากขึ้นครับ';
  } else if (userMessage.contains('กินอาหารรสเผ็ด') ||
      userMessage.contains('กินข้าวไม่ตรงเวลา') ||
      userMessage.contains('ความเครียด') ||
      userMessage.contains('ความวิตกกังวล')) {
    return 'มีอาการอื่น ๆร่วมด้วยไหมครับ';
  } else if (userMessage.contains('ไม่มี') ||
      userMessage.contains('ปากมีรสขม') ||
      userMessage.contains('ปวดแสบร้อน') ||
      userMessage.contains('เจ็บหน้าอก')) {
    return 'ได้มีการทานยามาก่อนไหมครับ';
  } else if (userMessage.contains('ไม่มี') ||
      userMessage.contains('ทานยาลดกรด') ||
      userMessage.contains('ทานยาแก้ปวด')) {
    return 'อาโป คนไข้ควรหลีกเลี่ยงอาหารเผ็ด อาหารมัน \n รับประทานอาหารให้เป็นเวลาเพื่อป้องกันไม่ให้เกิดอาการปวดแสบท้อง\n การรักษาอาการแสบท้อง คนไข้คสรจะกินยาลดกรดเพื่อบรรเทาอาการแสบท้องครับ ';
  } else if (userMessage.contains('ปวดท้อง')) {
    //#3
    return 'ขอทราบบริเวณที่มีอาการปวดครับ';
  } else if (userMessage.contains('ใต้ลิ้นปี่') ||
      userMessage.contains('กลางตัว')) {
    return 'ใต้ลิ้นปี่ หรือกลางตัว บริเวณตรงซี่โครงซี่ล่างสุด (กลางตัว) \n หมายถึง กระเพาะอาหาร ตับอ่อน ตับและกระดูกลิ้นปี่ \n1.หากปวดเป็นประจำเวลาหิวหรืออิ่ม อาจเกี่ยวกับโรคกระเพาะ\n2.หากปวดรุนแรงร่วมกับคลื่นไส้อาเจียน อาจเป็นอาการตับอ่อนอักเสบ\n3.หากคลำเจอก้อนเนื้อค่อนข้างแข็งและมีขนาดใหญ่ อาจเป็นอาการตับโต (ควรรีบปรึกษาแพทย์)\n4.คลำได้ก้อนสามเหลี่ยมแบนเล็กๆ อาจเป็นโรคเกี่ยวกับกระดูกลิ้นปี่ ควรปรึกษาแพทย์';
  } else if (userMessage.contains('ชายโครงขวา') ||
      userMessage.contains(
          'ปวดชายโครงขวา ซึ่งเป็นตำแหน่งของม้าม แนะนำปรึกษาแพทย์ทันที')) {
    return 'เป็นมากเวลาใด? เช้า กลางวัน เย็น ก่อนนอน';
  } else if (userMessage.contains('บั้นเอวขวา')) {
    return 'ปวดบั้นเอวขวา โดยมากจะพบกันบ่อยในผู้หญิง ตำแหน่งนี้คือ ท่อไต ไต ลำไส้ใหญ่ \n1.อาการปวดมาก หมายถึง ลำไส้ใหญ่อักเสบ\n2.อาการปวดร้าวถึงต้นขา อาการเริ่มต้นของนิ่วในท่อไต\n3.อาการปวดร่วมกับปวดหลัง มีไข้ หนาวสั่น ปัสสาวะขุ่น เป็นอาการของกรวยไตอักเสบ\n4.หากคลำเจอก้อนเนื้อ แนะนำปรึกษาแพทย์เพื่อตรวจอย่างละเอียด';
  } else if (userMessage.contains('รอบสะดือ')) {
    return 'ปวดรอบสะดือ เป็นตำแหน่งลำไส้เล็ก มักพบในคนที่มักท้องเดิน\n1.หากกดแล้วปวดมาก คือ อาการของโรคไส้ติ่งอักเสบ\n2.แต่ถ้าปวดแบบมีลมในท้องด้วย อาจแค่กระเพาะลำไส้ทำงานผิดปกติ';
  } else {
    return 'ขออภัยค่ะ ฉันไม่เข้าใจคำถามของคุณ';
  }
}

selectImage() {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: ChatScreen(),
  ));
}