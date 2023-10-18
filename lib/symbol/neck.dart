import 'package:flutter/material.dart';

class NeckPage extends StatelessWidget {
  const NeckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 119, 208, 249),
        title: Text("หมวดหมู่อาการ"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "ประเภท: คอ",style: TextStyle(
                        fontSize: 25,fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  //กลืนไม่ลง
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Container(
                      width: 380,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]
                      ),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "assets/symptom/cant-swallow.gif",
                              height: 80,
                              width: 150,
                            ),
                          ),
                          Container(
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "กลืนไม่ลง",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "มีความยากลำบากในการกลืนอาหารหรือของเหลว ซึ่งเกิดจากลำคอหรือหลอดอาหาร ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 119, 208, 249),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                //   //มึนหัว
                //   Padding(
                //     padding: EdgeInsets.symmetric(vertical: 9),
                //     child: Container(
                //       width: 380,
                //       height: 100,
                //       decoration: BoxDecoration(
                //         color: Color.fromARGB(255, 190, 229, 247),
                //         borderRadius: BorderRadius.circular(10),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 3,
                //             blurRadius: 10,
                //             offset: Offset(0, 3),
                //           )
                //         ]
                //       ),
                //       child: Row(
                //         children: [
                //           Container(
                //             alignment: Alignment.center,
                //             child: Image.asset(
                //               "assets/symptom/dizzy.gif",
                //               height: 80,
                //               width: 150,
                //             ),
                //           ),
                //           Container(
                //             width: 190,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Text(
                //                   "มึนหัว",
                //                   style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Text(
                //                   "รู้สึกไม่แจ่มใส มึนงง โคลงเคลง สมองตื้อ การทรงตัวไม่ค่อยดี ซึ่งสามารถเกิดได้กับทุกเพศทุกวัย",
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.normal,
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
                //             child: Container(
                //               padding: EdgeInsets.all(5),
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   //เวียนหัว
                //   Padding(
                //     padding: EdgeInsets.symmetric(vertical: 9),
                //     child: Container(
                //       width: 380,
                //       height: 100,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 3,
                //             blurRadius: 10,
                //             offset: Offset(0, 3),
                //           )
                //         ]
                //       ),
                //       child: Row(
                //         children: [
                //           Container(
                //             alignment: Alignment.center,
                //             child: Image.asset(
                //               "assets/symptom/dizzy1.gif",
                //               height: 80,
                //               width: 150,
                //             ),
                //           ),
                //           Container(
                //             width: 190,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Text(
                //                   "เวียนหัว",
                //                   style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Text(
                //                   "จะรู้สึกว่าสิ่งที่อยู่รอบตัวหมุนได้ ในขณะที่ตัวเองอยู่กับที่ ซึ่งการเคลื่อนไหวนั้นไม่เป็นความจริง ",
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.normal,
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
                //             child: Container(
                //               padding: EdgeInsets.all(5),
                //               decoration: BoxDecoration(
                //                 color: Color.fromARGB(255, 119, 208, 249),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // //มึนหัว
                //   Padding(
                //     padding: EdgeInsets.symmetric(vertical: 9),
                //     child: Container(
                //       width: 380,
                //       height: 100,
                //       decoration: BoxDecoration(
                //         color: Color.fromARGB(255, 190, 229, 247),
                //         borderRadius: BorderRadius.circular(10),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 3,
                //             blurRadius: 10,
                //             offset: Offset(0, 3),
                //           )
                //         ]
                //       ),
                //       child: Row(
                //         children: [
                //           Container(
                //             alignment: Alignment.center,
                //             child: Image.asset(
                //               "assets/symptom/dizzy.gif",
                //               height: 80,
                //               width: 150,
                //             ),
                //           ),
                //           Container(
                //             width: 190,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Text(
                //                   "มึนหัว",
                //                   style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Text(
                //                   "รู้สึกไม่แจ่มใส มึนงง โคลงเคลง สมองตื้อ การทรงตัวไม่ค่อยดี ซึ่งสามารถเกิดได้กับทุกเพศทุกวัย",
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.normal,
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
                //             child: Container(
                //               padding: EdgeInsets.all(5),
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   //ปวดหัว
                //   Padding(
                //     padding: EdgeInsets.symmetric(vertical: 9),
                //     child: Container(
                //       width: 380,
                //       height: 100,
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(10),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 3,
                //             blurRadius: 10,
                //             offset: Offset(0, 3),
                //           )
                //         ]
                //       ),
                //       child: Row(
                //         children: [
                //           Container(
                //             alignment: Alignment.center,
                //             child: Image.asset(
                //               "assets/symptom/headache.gif",
                //               height: 80,
                //               width: 150,
                //             ),
                //           ),
                //           Container(
                //             width: 190,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Text(
                //                   "ปวดหัว",
                //                   style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Text(
                //                   "อาการปวดศีรษะมีลักษณะเหมือนถูกกด บีบ หรือรัดที่ศีรษะทั้งสองข้าง",
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.normal,
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
                //             child: Container(
                //               padding: EdgeInsets.all(5),
                //               decoration: BoxDecoration(
                //                 color: Color.fromARGB(255, 119, 208, 249),
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   //มึนหัว
                //   Padding(
                //     padding: EdgeInsets.symmetric(vertical: 9),
                //     child: Container(
                //       width: 380,
                //       height: 100,
                //       decoration: BoxDecoration(
                //         color: Color.fromARGB(255, 190, 229, 247),
                //         borderRadius: BorderRadius.circular(10),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey.withOpacity(0.5),
                //             spreadRadius: 3,
                //             blurRadius: 10,
                //             offset: Offset(0, 3),
                //           )
                //         ]
                //       ),
                //       child: Row(
                //         children: [
                //           Container(
                //             alignment: Alignment.center,
                //             child: Image.asset(
                //               "assets/symptom/dizzy.gif",
                //               height: 80,
                //               width: 150,
                //             ),
                //           ),
                //           Container(
                //             width: 190,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Text(
                //                   "มึนหัว",
                //                   style: TextStyle(
                //                     fontSize: 18,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //                 ),
                //                 Text(
                //                   "รู้สึกไม่แจ่มใส มึนงง โคลงเคลง สมองตื้อ การทรงตัวไม่ค่อยดี ซึ่งสามารถเกิดได้กับทุกเพศทุกวัย",
                //                   style: TextStyle(
                //                     fontSize: 14,
                //                     fontWeight: FontWeight.normal,
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: EdgeInsets.symmetric(vertical: 10,horizontal: 11),
                //             child: Container(
                //               padding: EdgeInsets.all(5),
                //               decoration: BoxDecoration(
                //                 color: Colors.white,
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}