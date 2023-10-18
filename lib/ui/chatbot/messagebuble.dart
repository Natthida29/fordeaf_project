
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class Message {
  final String sender;
  final String message;
  final String time;

  Message({required this.sender, required this.message, required this.time});
}

class MessageBubble extends StatefulWidget {
  final String sender;
  final String message;
  final String time;

  const MessageBubble({
    Key? key,
    required this.sender,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool isZoomed = false;

  void toggleZoom() {
    setState(() {
      isZoomed = !isZoomed;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (widget.sender == 'Bot')
            const CircleAvatar(
              radius: 22.0,
              backgroundImage: AssetImage('assets/images/chatbot.png'),
            ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: widget.sender == 'User'
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sender,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600],
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  color: widget.sender == 'User' ? Colors.blue : Colors.grey[300],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.message,
                          style: TextStyle(
                            fontSize: 15.0,
                            color:
                                widget.sender == 'User' ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.message == 'ทำแท้ง' ||widget.message == 'เอดส์' ||widget.message == 'เกิดอาการแพ้' ||widget.message == 'ภูมิแพ้' ||widget.message == 'ตามัว' ||widget.message == 'เบื่ออาหาร' ||
                    widget.message == 'ทวารหนัก' ||widget.message == 'ปวดที่แขน' ||widget.message == 'สายตาเอียง' ||widget.message == 'ท้อง' ||widget.message == 'กระเพาะปัสสาวะ' ||widget.message == 'แผลพุพอง' ||
                    widget.message == 'ตาพร่า' ||widget.message == 'แสบตา' ||widget.message == 'แสบจมูก' ||widget.message == 'ปวดแสบท้อง' ||widget.message == 'นอนไม่หลับ' ||widget.message == 'กลืนไม่ลง' ||
                    widget.message == 'แน่นหน้าอก' ||widget.message == 'เป็นหวัด' ||widget.message == 'ตาแดง' ||widget.message == 'ท้องผูก' ||widget.message == 'ไอ' ||widget.message == 'ตะคริว' ||
                    widget.message == 'ท้องเสีย' || widget.message == 'มึนหัว' ||widget.message == 'เวียนหัว' ||widget.message == 'แพ้ยา' ||widget.message == 'เหนื่อยง่าย' ||widget.message == 'กินอาหารเหล่านั้นไม่ได้' ||
                    widget.message == 'ลมบ้าหมู' ||widget.message == 'การอุดฟัน' ||widget.message == 'ท้องอืด' ||widget.message == 'แพ้อาหาร' ||widget.message == 'หอบ' ||widget.message == 'เป็นไข้' ||widget.message == 'ปวดหัว' ||
                    widget.message == 'หัวใจเต้นแรง' ||widget.message == 'ความดันโลหิตสูง' ||widget.message == 'ไข้สูง' ||widget.message == 'หนาว ๆ ร้อน ๆ' ||widget.message == 'เจ็บ' ||widget.message == 'ปวดขากรรไกร' ||
                    widget.message == 'มองไม่เห็นทีละน้อย' ||widget.message == 'งดรับประทานอาหาร' ||widget.message == 'เหน็บชา' ||widget.message == 'ป่วย' ||widget.message == 'จาม' ||widget.message == 'น้ำมูก' ||
                    widget.message == 'คลื่นไส้' ||widget.message == 'กระเพาะอาหาร' ||widget.message == 'ปวดท้อง' ||widget.message == 'เครียด' ||widget.message == 'บวม' ||widget.message == 'เมื่อย' ||
                    widget.message == 'ตัวสั่น' ||widget.message == 'คัน' ||widget.message == 'อาเจียน' ||widget.message == 'แพ้อากาศ' ||widget.message == 'ตาแฉะ')
                  GestureDetector(
                    onDoubleTap: toggleZoom,
                     child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: isZoomed ? 300.0 : 150.0,
                      height: isZoomed ? 300.0 : 150.0,
                      child: Hero(
                        tag: 'image_${widget.message.hashCode}',
                        child: GestureDetector(
                          onTap:() {
                            Navigator.push(
                              context, MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: Text(""),
                                    backgroundColor: Colors.black,
                                  ),
                                  bottomNavigationBar: BottomAppBar(
                                    color: Colors.black,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete),
                                          color: Colors.white,
                                          onPressed: (){
                                            
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.save_alt),
                                          color: Colors.white,
                                          onPressed: (){

                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  body: Center(
                              child: PhotoView(
                                  imageProvider: AssetImage(widget.message == 'ทำแท้ง'
                    ? 'assets/symptom/abortion.gif' //1
                    : widget.message == 'เอดส์'
                    ? 'assets/symptom/AIDS.gif' //2
                    : widget.message == 'เกิดอาการแพ้'
                    ? 'assets/symptom/allergy.gif' //3
                    : widget.message == 'ภูมิแพ้'
                    ? 'assets/symptom/allergy1.gif' //4
                    : widget.message == 'ตามัว'
                    ? 'assets/symptom/amblyopia.gif' //5
                    : widget.message == 'เบื่ออาหาร'
                    ? 'assets/symptom/anorexia.gif' //6
                    : widget.message == 'ทวารหนัก'
                    ? 'assets/symptom/anus.gif' //7
                    : widget.message == 'ปวดที่แขน'
                    ? 'assets/symptom/arm-pain.gif' //8
                    : widget.message =='สายตาเอียง'
                    ? 'assets/symptom/astigmatism.gif' //9
                    : widget.message == 'ท้อง'
                    ? 'assets/symptom/belly.gif' //10
                    : widget.message =='กระเพาะปัสสาวะ'
                    ? 'assets/symptom/bladder.gif' //11
                    : widget.message =='แผลพุพอง'
                    ? 'assets/symptom/blisters.gif' //12
                    : widget.message =='ตาพร่า'
                    ? 'assets/symptom/blurry.gif' //13
                    : widget.message == 'แสบตา'
                    ? 'assets/symptom/burning-eyes.gif' //14
                    : widget.message == 'แสบจมูก'
                    ? 'assets/symptom/burning-nose.gif' //15
                    : widget.message == 'ปวดแสบท้อง'
                    ? 'assets/symptom/burning-pain.gif' //16
                    : widget.message == 'นอนไม่หลับ'
                    ? 'assets/symptom/cannotsleep.gif' //17
                    : widget.message == 'กลืนไม่ลง'
                    ? 'assets/symptom/cant-swallow.gif' //18
                    : widget.message == 'แน่นหน้าอก'
                    ? 'assets/symptom/chest-tightness.gif' //19
                    : widget.message == 'เป็นหวัด'
                    ? 'assets/symptom/cold.gif' //20
                    : widget.message == 'ตาแดง'
                    ? 'assets/symptom/conjunctivitis.gif' //21
                    : widget.message == 'ท้องผูก'
                    ? 'assets/symptom/constipation.gif' //22
                    : widget.message == 'ไอ'
                    ? 'assets/symptom/cough.gif' //23
                    : widget.message == 'ตะคริว'
                    ? 'assets/symptom/cramp.gif' //24
                    : widget.message == 'ท้องเสีย'
                    ? 'assets/symptom/diarrhea.gif' //25
                    : widget.message == 'มึนหัว'
                    ? 'assets/symptom/dizzy.gif' //26
                    : widget.message == 'เวียนหัว'
                    ? 'assets/symptom/dizzy1.gif' //27
                    : widget.message == 'แพ้ยา'
                    ? 'assets/symptom/drug-allergy.gif' //28
                    : widget.message == 'เหนื่อยง่าย'
                    ? 'assets/symptom/easily-tired.gif' //29
                    : widget.message == 'กินอาหารเหล่านั้นไม่ได้'
                    ? 'assets/symptom/eat.gif' //30
                    : widget.message == 'ลมบ้าหมู'
                    ? 'assets/symptom/epilepsy.gif' //31
                    : widget.message == 'การอุดฟัน'
                    ? 'assets/symptom/Filling.gif' //32
                    : widget.message == 'ท้องอืด'
                    ? 'assets/symptom/flatulence.gif' //33
                    : widget.message == 'แพ้อาหาร'
                    ? 'assets/symptom/food.gif' //34
                    : widget.message == 'หอบ'
                    ? 'assets/symptom/gasp.gif' //35
                    : widget.message == 'เป็นไข้'
                    ? 'assets/symptom/have-a-fever.gif' //36
                    : widget.message == 'ปวดหัว'
                    ? 'assets/symptom/headache.gif' //37
                    : widget.message == 'หัวใจเต้นแรง'
                    ? 'assets/symptom/heart.gif' //38
                    : widget.message == 'ความดันโลหิตสูง'
                    ? 'assets/symptom/high-blood-pressure.gif' //39
                    : widget.message == 'ไข้สูง'
                    ? 'assets/symptom/highfever.gif' //40
                    : widget.message == 'หนาว ๆ ร้อน ๆ'
                    ? 'assets/symptom/hot-cold.gif' //41
                    : widget.message == 'เจ็บ'
                    ? 'assets/symptom/hurt.gif' //42
                    : widget.message == 'ปวดขากรรไกร'
                    ? 'assets/symptom/jaw-pain.gif' //43
                    : widget.message == 'มองไม่เห็นทีละน้อย'
                    ? 'assets/symptom/look.gif' //44
                    : widget.message == 'งดรับประทานอาหาร'
                    ? 'assets/symptom/not-eating.gif' //45
                    : widget.message == 'เหน็บชา'
                    ? 'assets/symptom/Numbness.gif' //46
                    : widget.message == 'ป่วย'
                    ? 'assets/symptom/sick.gif' //47
                    : widget.message == 'จาม'
                    ? 'assets/symptom/sneeze.gif' //48
                    : widget.message == 'น้ำมูก'
                    ? 'assets/symptom/snot.gif' //49
                    : widget.message == 'คลื่นไส้'
                    ? 'assets/symptom/squeamish.gif' //50
                    : widget.message == 'กระเพาะอาหาร'
                    ? 'assets/symptom/stomach.gif' //51
                    : widget.message == 'ปวดท้อง'
                    ? 'assets/symptom/stomach-ache.gif' //52
                    : widget.message == 'เครียด'
                    ? 'assets/symptom/stressed.gif' //53
                    : widget.message == 'บวม'
                    ? 'assets/symptom/swell.gif' //54
                    : widget.message == 'เมื่อย'
                    ? 'assets/symptom/tired.gif' //55
                    : widget.message == 'ตัวสั่น'
                    ? 'assets/symptom/Trembling.gif' //56
                    : widget.message == 'คัน'
                    ? 'assets/symptom/vehicle.gif' //57
                    : widget.message == 'อาเจียน'
                    ? 'assets/symptom/vomit.gif' //58
                    : widget.message == 'แพ้อากาศ'
                    ? 'assets/symptom/weather.gif' //59
                    : 'assets/symptom/wet-eyes.gif' //60
                    ),
                              )
                            )
                          )
                        )
                       );
                      },
                      child: Image.asset(widget.message == 'ทำแท้ง'
                      ? 'assets/symptom/abortion.gif' //1
                    : widget.message == 'เอดส์'
                    ? 'assets/symptom/AIDS.gif' //2
                    : widget.message == 'เกิดอาการแพ้'
                    ? 'assets/symptom/allergy.gif' //3
                    : widget.message == 'ภูมิแพ้'
                    ? 'assets/symptom/allergy1.gif' //4
                    : widget.message == 'ตามัว'
                    ? 'assets/symptom/amblyopia.gif' //5
                    : widget.message == 'เบื่ออาหาร'
                    ? 'assets/symptom/anorexia.gif' //6
                    : widget.message == 'ทวารหนัก'
                    ? 'assets/symptom/anus.gif' //7
                    : widget.message == 'ปวดที่แขน'
                    ? 'assets/symptom/arm-pain.gif' //8
                    : widget.message =='สายตาเอียง'
                    ? 'assets/symptom/astigmatism.gif' //9
                    : widget.message == 'ท้อง'
                    ? 'assets/symptom/belly.gif' //10
                    : widget.message =='กระเพาะปัสสาวะ'
                    ? 'assets/symptom/bladder.gif' //11
                    : widget.message =='แผลพุพอง'
                    ? 'assets/symptom/blisters.gif' //12
                    : widget.message =='ตาพร่า'
                    ? 'assets/symptom/blurry.gif' //13
                    : widget.message == 'แสบตา'
                    ? 'assets/symptom/burning-eyes.gif' //14
                    : widget.message == 'แสบจมูก'
                    ? 'assets/symptom/burning-nose.gif' //15
                    : widget.message == 'ปวดแสบท้อง'
                    ? 'assets/symptom/burning-pain.gif' //16
                    : widget.message == 'นอนไม่หลับ'
                    ? 'assets/symptom/cannotsleep.gif' //17
                    : widget.message == 'กลืนไม่ลง'
                    ? 'assets/symptom/cant-swallow.gif' //18
                    : widget.message == 'แน่นหน้าอก'
                    ? 'assets/symptom/chest-tightness.gif' //19
                    : widget.message == 'เป็นหวัด'
                    ? 'assets/symptom/cold.gif' //20
                    : widget.message == 'ตาแดง'
                    ? 'assets/symptom/conjunctivitis.gif' //21
                    : widget.message == 'ท้องผูก'
                    ? 'assets/symptom/constipation.gif' //22
                    : widget.message == 'ไอ'
                    ? 'assets/symptom/cough.gif' //23
                    : widget.message == 'ตะคริว'
                    ? 'assets/symptom/cramp.gif' //24
                    : widget.message == 'ท้องเสีย'
                    ? 'assets/symptom/diarrhea.gif' //25
                    : widget.message == 'มึนหัว'
                    ? 'assets/symptom/dizzy.gif' //26
                    : widget.message == 'เวียนหัว'
                    ? 'assets/symptom/dizzy1.gif' //27
                    : widget.message == 'แพ้ยา'
                    ? 'assets/symptom/drug-allergy.gif' //28
                    : widget.message == 'เหนื่อยง่าย'
                    ? 'assets/symptom/easily-tired.gif' //29
                    : widget.message == 'กินอาหารเหล่านั้นไม่ได้'
                    ? 'assets/symptom/eat.gif' //30
                    : widget.message == 'ลมบ้าหมู'
                    ? 'assets/symptom/epilepsy.gif' //31
                    : widget.message == 'การอุดฟัน'
                    ? 'assets/symptom/Filling.gif' //32
                    : widget.message == 'ท้องอืด'
                    ? 'assets/symptom/flatulence.gif' //33
                    : widget.message == 'แพ้อาหาร'
                    ? 'assets/symptom/food.gif' //34
                    : widget.message == 'หอบ'
                    ? 'assets/symptom/gasp.gif' //35
                    : widget.message == 'เป็นไข้'
                    ? 'assets/symptom/have-a-fever.gif' //36
                    : widget.message == 'ปวดหัว'
                    ? 'assets/symptom/headache.gif' //37
                    : widget.message == 'หัวใจเต้นแรง'
                    ? 'assets/symptom/heart.gif' //38
                    : widget.message == 'ความดันโลหิตสูง'
                    ? 'assets/symptom/high-blood-pressure.gif' //39
                    : widget.message == 'ไข้สูง'
                    ? 'assets/symptom/highfever.gif' //40
                    : widget.message == 'หนาว ๆ ร้อน ๆ'
                    ? 'assets/symptom/hot-cold.gif' //41
                    : widget.message == 'เจ็บ'
                    ? 'assets/symptom/hurt.gif' //42
                    : widget.message == 'ปวดขากรรไกร'
                    ? 'assets/symptom/jaw-pain.gif' //43
                    : widget.message == 'มองไม่เห็นทีละน้อย'
                    ? 'assets/symptom/look.gif' //44
                    : widget.message == 'งดรับประทานอาหาร'
                    ? 'assets/symptom/not-eating.gif' //45
                    : widget.message == 'เหน็บชา'
                    ? 'assets/symptom/Numbness.gif' //46
                    : widget.message == 'ป่วย'
                    ? 'assets/symptom/sick.gif' //47
                    : widget.message == 'จาม'
                    ? 'assets/symptom/sneeze.gif' //48
                    : widget.message == 'น้ำมูก'
                    ? 'assets/symptom/snot.gif' //49
                    : widget.message == 'คลื่นไส้'
                    ? 'assets/symptom/squeamish.gif' //50
                    : widget.message == 'กระเพาะอาหาร'
                    ? 'assets/symptom/stomach.gif' //51
                    : widget.message == 'ปวดท้อง'
                    ? 'assets/symptom/stomach-ache.gif' //52
                    : widget.message == 'เครียด'
                    ? 'assets/symptom/stressed.gif' //53
                    : widget.message == 'บวม'
                    ? 'assets/symptom/swell.gif' //54
                    : widget.message == 'เมื่อย'
                    ? 'assets/symptom/tired.gif' //55
                    : widget.message == 'ตัวสั่น'
                    ? 'assets/symptom/Trembling.gif' //56
                    : widget.message == 'คัน'
                    ? 'assets/symptom/vehicle.gif' //57
                    : widget.message == 'อาเจียน'
                    ? 'assets/symptom/vomit.gif' //58
                    : widget.message == 'แพ้อากาศ'
                    ? 'assets/symptom/weather.gif' //59
                    : 'assets/symptom/wet-eyes.gif' //60
                        ),
                      )
                    ),
                  ) 
                ),
              ],
            ),
          ),
          Text(
            widget.time,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}