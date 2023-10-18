import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  final List<String> signLanguageWords = [
    'ทำแท้ง',
    'เอดส์',
    'เกิดอาการแพ้',
    'ตามัว',
    'ทวารหนัก',
    'ปวดที่แขน',
    'งดรับประทานอาหาร',
    'สายตาเอียง',
    'ท้อง',
    'กระเพาะปัสสาวะ',
    'แผลพุพอง',
    'ตาพร่า',
    'แสบตา',
    'แสบจมูก',
    'ปวดแสบท้อง',
    'กลืนไม่ลง',
    'นอนไม่หลับ',
    'เป็นหวัด',
    'ตาแดง',
    'ท้องผูก',
    'ไอ',
    'ท้องเสีย',
    'มึนหัว',
    'เวียนหัว',
    'จาม',
    'กินอาหารเหล่านั้นไม่ได้',
    'โรคลมบ้าหมู',
    'เจ็บ',
    'การอุดฟัน',
    'ท้องอืด',
    'เป็นไข้',
    'ตะคริว',
    'ปวดหัว',
    'หัวใจเต้นแรง',
    'ความดันโลหิตสูง',
    'ไข้สูง',
    'ปวดขากรรไกร',
    'มองไม่เห็นทีละน้อย',
    'ตัวสั่น',
    'แน่นหน้าอก',
    'ป่วย',
    'น้ำมูก',
    'คลื่นไส้',
    'ปวดท้อง',
    'กระเพาะอาหาร',
    'เครียด',
    'บวม',
    'เมื่อย',
    'คัน',
    'ตาแฉะ',
    'เบื่ออาหาร',
    'แพ้ยา',
    'แพ้อากาศ',
    'แพ้อาหาร',
    'ภูมิแพ้',
    'หนาวๆร้อนๆ',
    'หอบ',
    'เหน็บชา',
    'เหนื่อยง่าย',
    'อาเจียน',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in signLanguageWords) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              if (result == 'ทำแท้ง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/abortion.gif'),
                  ),
                );
              } else if (result == 'เอดส์') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/AIDS.gif'),
                  ),
                );
              } else if (result == 'เกิดอาการแพ้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/allergy.gif'),
                  ),
                );
              } else if (result == 'ภูมิแพ้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/allergy1.gif'),
                  ),
                );
              } else if (result == 'ตามัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/amblyopia.gif'),
                  ),
                );
              } else if (result == 'เบื่ออาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/anorexia.gif'),
                  ),
                );
              } else if (result == 'ทวารหนัก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/anus.gif'),
                  ),
                );
              } else if (result == 'ปวดที่แขน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/arm-pain.gif'),
                  ),
                );
              } else if (result == 'สายตาเอียง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/astigmatism.gif'),
                  ),
                );
              } else if (result == 'ท้อง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/belly.gif'),
                  ),
                );
              } else if (result == 'กระเพาะปัสสาวะ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/bladder.gif'),
                  ),
                );
              } else if (result == 'แผลพุพอง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/blisters.gif'),
                  ),
                );
              } else if (result == 'ตาพร่า') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/blurry.gif'),
                  ),
                );
              } else if (result == 'แสบตา') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/burning-eyes.gif'),
                  ),
                );
              } else if (result == 'แสบจมูก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/burning-nose.gif'),
                  ),
                );
              } else if (result == 'ปวดแสบท้อง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/burning-pain.gif'),
                  ),
                );
              } else if (result == 'นอนไม่หลับ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cannotsleep.gif'),
                  ),
                );
              } else if (result == 'กลืนไม่ลง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cant-swallow.gif'),
                  ),
                );
              } else if (result == 'แน่นหน้าอก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/chest-tightness.gif'),
                  ),
                );
              } else if (result == 'เป็นหวัด') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cold.gif'),
                  ),
                );
              } else if (result == 'ตาแดง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/conjunctivitis.gif'),
                  ),
                );
              } else if (result == 'ท้องผูก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/constipation.gif'),
                  ),
                );
              } else if (result == 'ไอ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cough.gif'),
                  ),
                );
              } else if (result == 'ตะคริว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cramp.gif'),
                  ),
                );
              } else if (result == 'ท้องเสีย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/diarrhea.gif'),
                  ),
                );
              } else if (result == 'มึนหัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/dizzy.gif'),
                  ),
                );
              } else if (result == 'เวียนหัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/dizzy1.gif'),
                  ),
                );
              } else if (result == 'แพ้ยา') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/drug-allergy.gif'),
                  ),
                );
              } else if (result == 'เหนื่อยง่าย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/easily-tired.gif'),
                  ),
                );
              } else if (result == 'กินอาหารเหล่านั้นไม่ได้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/eat.gif'),
                  ),
                );
              } else if (result == 'โรคลมบ้าหมู') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/epilepsy.gif'),
                  ),
                );
              } else if (result == 'การอุดฟัน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/Filling.gif'),
                  ),
                );
              } else if (result == 'ท้องอืด') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/flatulence.gif'),
                  ),
                );
              } else if (result == 'แพ้อาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/food.gif'),
                  ),
                );
              } else if (result == 'หอบ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/gasp.gif'),
                  ),
                );
              } else if (result == 'เป็นไข้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/have-a-fever.gif'),
                  ),
                );
              } else if (result == 'ปวดหัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/headache.gif'),
                  ),
                );
              } else if (result == 'หัวใจเต้นแรง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/heart.gif'),
                  ),
                );
              } else if (result == 'ความดันโลหิตสูง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content:
                        Image.asset('assets/symptom/high-blood-pressure.gif'),
                  ),
                );
              } else if (result == 'ไข้สูง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/highfever.gif'),
                  ),
                );
              } else if (result == 'หนาวๆร้อนๆ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/hot-cold.gif'),
                  ),
                );
              } else if (result == 'เจ็บ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/hurt.gif'),
                  ),
                );
              } else if (result == 'ปวดขากรรไกร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/jaw-pain.gif'),
                  ),
                );
              } else if (result == 'มองไม่เห็นทีละน้อย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/look.gif'),
                  ),
                );
              } else if (result == 'งดรับประทานอาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/not-eating.gif'),
                  ),
                );
              } else if (result == 'เหน็บชา') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/Numbness.gif'),
                  ),
                );
              } else if (result == 'ป่วย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/sick.gif'),
                  ),
                );
              } else if (result == 'จาม') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/sneeze.gif'),
                  ),
                );
              } else if (result == 'น้ำมูก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/snot.gif'),
                  ),
                );
              } else if (result == 'คลื่นไส้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/squeamish.gif'),
                  ),
                );
              } else if (result == 'กระเพาะอาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/stomach.gif'),
                  ),
                );
              } else if (result == 'ปวดท้อง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/stomach-ache.gif'),
                  ),
                );
              } else if (result == 'เครียด') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/stressed.gif'),
                  ),
                );
              } else if (result == 'บวม') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/swell.gif'),
                  ),
                );
              } else if (result == 'เมื่อย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/tired.gif'),
                  ),
                );
              } else if (result == 'ตัวสั่น') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/Trembling.gif'),
                  ),
                );
              } else if (result == 'คัน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/vehicle.gif'),
                  ),
                );
              } else if (result == 'อาเจียน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/vomit.gif'),
                  ),
                );
              } else if (result == 'แพ้อากาศ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/weather.gif'),
                  ),
                );
              } else if (result == 'ตาแฉะ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/wet-eyes.gif'),
                  ),
                );
              } else {
                // Handle other word selections
                // You can navigate to a detail page or perform any other action
              }
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in signLanguageWords) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              if (result == 'ทำแท้ง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/abortion.gif'),
                  ),
                );
              } else if (result == 'เอดส์') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/AIDS.gif'),
                  ),
                );
              } else if (result == 'เกิดอาการแพ้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/allergy.gif'),
                  ),
                );
              } else if (result == 'ภูมิแพ้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/allergy1.gif'),
                  ),
                );
              } else if (result == 'ตามัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/amblyopia.gif'),
                  ),
                );
              } else if (result == 'เบื่ออาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/anorexia.gif'),
                  ),
                );
              } else if (result == 'ทวารหนัก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/anus.gif'),
                  ),
                );
              } else if (result == 'ปวดที่แขน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/arm-pain.gif'),
                  ),
                );
              } else if (result == 'สายตาเอียง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/astigmatism.gif'),
                  ),
                );
              } else if (result == 'ท้อง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/belly.gif'),
                  ),
                );
              } else if (result == 'กระเพาะปัสสาวะ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/bladder.gif'),
                  ),
                );
              } else if (result == 'แผลพุพอง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/blisters.gif'),
                  ),
                );
              } else if (result == 'ตาพร่า') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/blurry.gif'),
                  ),
                );
              } else if (result == 'แสบตา') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/burning-eyes.gif'),
                  ),
                );
              } else if (result == 'แสบจมูก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/burning-nose.gif'),
                  ),
                );
              } else if (result == 'ปวดแสบท้อง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/burning-pain.gif'),
                  ),
                );
              } else if (result == 'นอนไม่หลับ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cannotsleep.gif'),
                  ),
                );
              } else if (result == 'กลืนไม่ลง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cant-swallow.gif'),
                  ),
                );
              } else if (result == 'แน่นหน้าอก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/chest-tightness.gif'),
                  ),
                );
              } else if (result == 'เป็นหวัด') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cold.gif'),
                  ),
                );
              } else if (result == 'ตาแดง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/conjunctivitis.gif'),
                  ),
                );
              } else if (result == 'ท้องผูก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/constipation.gif'),
                  ),
                );
              } else if (result == 'ไอ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cough.gif'),
                  ),
                );
              } else if (result == 'ตะคริว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/cramp.gif'),
                  ),
                );
              } else if (result == 'ท้องเสีย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/diarrhea.gif'),
                  ),
                );
              } else if (result == 'มึนหัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/dizzy.gif'),
                  ),
                );
              } else if (result == 'เวียนหัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/dizzy1.gif'),
                  ),
                );
              } else if (result == 'แพ้ยา') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/drug-allergy.gif'),
                  ),
                );
              } else if (result == 'เหนื่อยง่าย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/easily-tired.gif'),
                  ),
                );
              } else if (result == 'กินอาหารเหล่านั้นไม่ได้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/eat.gif'),
                  ),
                );
              } else if (result == 'โรคลมบ้าหมู') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/epilepsy.gif'),
                  ),
                );
              } else if (result == 'การอุดฟัน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/Filling.gif'),
                  ),
                );
              } else if (result == 'ท้องอืด') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/flatulence.gif'),
                  ),
                );
              } else if (result == 'แพ้อาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/food.gif'),
                  ),
                );
              } else if (result == 'หอบ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/gasp.gif'),
                  ),
                );
              } else if (result == 'เป็นไข้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/have-a-fever.gif'),
                  ),
                );
              } else if (result == 'ปวดหัว') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/headache.gif'),
                  ),
                );
              } else if (result == 'หัวใจเต้นแรง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/heart.gif'),
                  ),
                );
              } else if (result == 'ความดันโลหิตสูง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content:
                        Image.asset('assets/symptom/high-blood-pressure.gif'),
                  ),
                );
              } else if (result == 'ไข้สูง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/highfever.gif'),
                  ),
                );
              } else if (result == 'หนาวๆร้อนๆ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/hot-cold.gif'),
                  ),
                );
              } else if (result == 'เจ็บ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/hurt.gif'),
                  ),
                );
              } else if (result == 'ปวดขากรรไกร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/jaw-pain.gif'),
                  ),
                );
              } else if (result == 'มองไม่เห็นทีละน้อย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/look.gif'),
                  ),
                );
              } else if (result == 'งดรับประทานอาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/not-eating.gif'),
                  ),
                );
              } else if (result == 'เหน็บชา') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/Numbness.gif'),
                  ),
                );
              } else if (result == 'ป่วย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/sick.gif'),
                  ),
                );
              } else if (result == 'จาม') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/sneeze.gif'),
                  ),
                );
              } else if (result == 'น้ำมูก') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/snot.gif'),
                  ),
                );
              } else if (result == 'คลื่นไส้') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/squeamish.gif'),
                  ),
                );
              } else if (result == 'กระเพาะอาหาร') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/stomach.gif'),
                  ),
                );
              } else if (result == 'ปวดท้อง') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/stomach-ache.gif'),
                  ),
                );
              } else if (result == 'เครียด') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/stressed.gif'),
                  ),
                );
              } else if (result == 'บวม') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/swell.gif'),
                  ),
                );
              } else if (result == 'เมื่อย') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/tired.gif'),
                  ),
                );
              } else if (result == 'ตัวสั่น') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/Trembling.gif'),
                  ),
                );
              } else if (result == 'คัน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/vehicle.gif'),
                  ),
                );
              } else if (result == 'อาเจียน') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/vomit.gif'),
                  ),
                );
              } else if (result == 'แพ้อากาศ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/weather.gif'),
                  ),
                );
              } else if (result == 'ตาแฉะ') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Image.asset('assets/symptom/wet-eyes.gif'),
                  ),
                );
              } else {}
            },
          );
        });
  }
}
