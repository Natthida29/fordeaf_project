import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final String messageId; // เพิ่มฟิลด์ messageId
  final String result;
  final String username;
  final bool isCurrentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  
  Bubble(
      this.messageId, this.result, this.username, this.isCurrentUser, );

  void _deleteMessage(String messageId) async {
    try {
      await _firestore.collection('messages').doc(messageId).delete();
      // ลบข้อความจาก Firestore โดยใช้ messageId เป็นไอดีของข้อความ
    } catch (e) {
      print('เกิดข้อผิดพลาดในการลบข้อความ: $e');
      // จัดการกับข้อผิดพลาดที่เกิดขึ้นในการลบข้อความ (เช่น การเชื่อมต่อออฟไลน์)
    }
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ลบข้อความนี้?'),
          content: Text('คุณต้องการลบข้อความนี้หรือไม่?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ยกเลิก'),
            ),
            TextButton(
              onPressed: () {
                // เรียกฟังก์ชัน _deleteMessage เพื่อลบข้อความ
                _deleteMessage(messageId);
                Navigator.of(context).pop(); // ปิดกล่องสนทนาหลังจากลบข้อความ
              },
              child: Text('ลบ'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMessageContent() {
  // ตรวจสอบว่าข้อความมีคำที่กำหนดหรือไม่
  if (result.contains("ทำแท้ง")) {
    return Image.asset('assets/symptom/abortion.gif');
  } else if (result.contains("เอดส์")) {
    return Image.asset('assets/symptom/AIDS.gif');
  } else if (result.contains("เกิดอาการแพ้")) {
    return Image.asset('assets/symptom/allergy.gif');
  } else if (result.contains("ภูมิแพ้")) {
    return Image.asset('assets/symptom/allergy1.gif');
  } else if (result.contains("ตามัว")) {
    return Image.asset('assets/symptom/amblyopia.gif');
  } else if (result.contains("เบื่ออาหาร")) {
    return Image.asset('assets/symptom/anorexia.gif');
  } else if (result.contains("ทวารหนัก")) {
    return Image.asset('assets/symptom/anus.gif');
  } else if (result.contains("ปวดที่แขน")) {
    return Image.asset('assets/symptom/arm-pain.gif');
  } else if (result.contains("สายตาเอียง")) {
    return Image.asset("assets/symptom/astigmatism.gif");
  } else if (result.contains("ท้อง")) {
    return Image.asset("assets/symptom/belly.gif");
  } else if (result.contains("กระเพาะปัสสาวะ")) {
    return Image.asset("assets/symptom/bladder.gif");
  } else if (result.contains("แผลพุพอง")) {
    return Image.asset("assets/symptom/blisters.gif");
  } else if (result.contains("ตาพร่า")) {
    return Image.asset("assets/symptom/blurry.gif");
  } else if (result.contains("แสบตา")) {
    return Image.asset("assets/symptom/burning-eyes.gif");
  } else if (result.contains("แสบจมูก")) {
    return Image.asset("assets/symptom/burning-nose.gif");
  } else if (result.contains("ปวดแสบท้อง")) {
    return Image.asset("assets/symptom/burning-pain.gif");
  } else if (result.contains("นอนไม่หลับ")) {
    return Image.asset("assets/symptom/cant-swallow.gif");
  } else if (result.contains("กลืนไม่ลง")) {
    return Image.asset("assets/symptom/cannotsleep.gif");
  } else if (result.contains("แน่นหน้าอก")) {
    return Image.asset("assets/symptom/chest-tightness.gif");
  } else if (result.contains("เป็นหวัด")) {
    return Image.asset("assets/symptom/cold.gif");
  } else if (result.contains("ตาแดง")) {
    return Image.asset("assets/symptom/conjunctivitis.gif");
  } else if (result.contains("ท้องผูก")) {
    return Image.asset("assets/symptom/constipation.gif");
  } else if (result.contains("ไอ")) {
    return Image.asset("assets/symptom/cough.gif");
  } else if (result.contains("ตะคริว")) {
    return Image.asset("assets/symptom/cramp.gif");
  } else if (result.contains("ท้องเสีย")) {
    return Image.asset("assets/symptom/diarrhea.gif");
  } else if (result.contains("มึนหัว")) {
    return Image.asset("assets/symptom/dizzy.gif");
  } else if (result.contains("เวียนหัว")) {
    return Image.asset("assets/symptom/dizzy1.gif");
  } else if (result.contains("แพ้ยา")) {
    return Image.asset("assets/symptom/drug-allergy.gif");
  } else if (result.contains("เหนื่อยง่าย")) {
    return Image.asset("assets/symptom/easily-tired.gif");
  } else if (result.contains("กินอาหารเหล่านั้นไม่ได้")) {
    return Image.asset("assets/symptom/eat.gif");
  } else if (result.contains("โรคลมบ้าหมู")) {
    return Image.asset("assets/symptom/epilepsy.gif");
  } else if (result.contains("การอุดฟัน")) {
    return Image.asset("assets/symptom/Filling.gif");
  } else if (result.contains("ท้องอืด")) {
    return Image.asset("assets/symptom/flatulence.gif");
  } else if (result.contains("แพ้อาหาร")) {
    return Image.asset("assets/symptom/food.gif");
  } else if (result.contains("หอบ")) {
    return Image.asset("assets/symptom/gasp.gif");
  } else if (result.contains("เป็นไข้")) {
    return Image.asset("assets/symptom/have-a-fever.gif");
  } else if (result.contains("ปวดหัว")) {
    return Image.asset("assets/symptom/headache.gif");
  } else if (result.contains("หัวใจเต้นแรง")) {
    return Image.asset("assets/symptom/heart.gif");
  } else if (result.contains("ความดันโลหิตสูง")) {
    return Image.asset("assets/symptom/high-blood-pressure.gif");
  } else if (result.contains("ไข้สูง")) {
    return Image.asset("assets/symptom/highfever.gif");
  } else if (result.contains("หนาว ๆ ร้อน ๆ")) {
    return Image.asset("assets/symptom/hot-cold.gif");
  } else if (result.contains("เจ็บ")) {
    return Image.asset("assets/symptom/hurt.gif");
  } else if (result.contains("ปวดขากรรไกร")) {
    return Image.asset("assets/symptom/jaw-pain.gif");
  } else if (result.contains("มองไม่เห็นทีละน้อย")) {
    return Image.asset("assets/symptom/look.gif");
  } else if (result.contains("งดรับประทานอาหาร")) {
    return Image.asset("assets/symptom/not-eating.gif");
  } else if (result.contains("เหน็บชา")) {
    return Image.asset("assets/symptom/Numbness.gif");
  } else if (result.contains("ป่วย")) {
    return Image.asset("assets/symptom/sick.gif");
  } else if (result.contains("จาม")) {
    return Image.asset("assets/symptom/sneeze.gif");
  } else if (result.contains("น้ำมูก")) {
    return Image.asset("assets/symptom/snot.gif");
  } else if (result.contains("คลื่นไส้")) {
    return Image.asset("assets/symptom/squeamish.gif");
  } else if (result.contains("กระเพาะอาหาร")) {
    return Image.asset("assets/symptom/stomach-ache.gif ");
  } else if (result.contains("ปวดท้อง")) {
    return Image.asset("assets/symptom/stomach.gif");
  } else if (result.contains("เครียด")) {
    return Image.asset("assets/symptom/stressed.gif");
  } else if (result.contains("บวม")) {
    return Image.asset("assets/symptom/swell.gif");
  } else if (result.contains(" เมื่อย")) {
    return Image.asset("assets/symptom/tired.gif");
  } else if (result.contains("ตัวสั่น")) {
    return Image.asset("assets/symptom/Trembling.gif");
  } else if (result.contains(" คัน")) {
    return Image.asset("assets/symptom/vehicle.gif");
  } else if (result.contains("อาเจียน")) {
    return Image.asset("assets/symptom/vomit.gif");
  } else if (result.contains("แพ้อากาศ")) {
    return Image.asset("assets/symptom/weather.gif");
  } else if (result.contains("ตาแฉะ")) {
    return Image.asset(" assets/symptom/wet-eyes.gif");
  } else {
    // ถ้าไม่มีคำเหล่านี้ ให้แสดงข้อความปกติ
    return Text(
      result,
      style: TextStyle(
        color: isCurrentUser ? Colors.white : Colors.black54,
      ),
    );
  }
}

Future<String> _fetchMessageContent() async {
    try {
      final messageDoc =
          await _firestore.collection('messages').doc(messageId).get();
      if (messageDoc.exists) {
        final messageData = messageDoc.data() as Map<String, dynamic>;
        final messageContent = messageData['text']; // Adjust the field name as needed
        return messageContent;
      }
    } catch (e) {
      print('Error fetching message content: $e');
    }
    return ''; // Return an empty string if there's an error
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _fetchMessageContent(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while fetching data
          return LinearProgressIndicator();
        } else if (snapshot.hasError || !snapshot.hasData) {
          // Handle errors or empty data
          return Text('Error fetching message content');
        } else {
          // Display the fetched message content
          final result = snapshot.data;
          return GestureDetector(
            onLongPress: () {
              _showDeleteConfirmation(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment:
                    isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: isCurrentUser
                        ? const BorderRadius.only( 
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          )
                        : const BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                    color: isCurrentUser ? Colors.lightBlueAccent : Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        result!,
                        style: TextStyle(
                          color: isCurrentUser ? Colors.white : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

