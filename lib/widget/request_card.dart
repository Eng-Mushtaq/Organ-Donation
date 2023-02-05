import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/Doctor/doctor_controller.dart';
import 'doctor_text.dart';

RequestCard(Size size, dynamic data, BuildContext context, bool isAdmin,bool isDoctor) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: data['Estate'] == "1"
              ? Colors.green[200]
              : context.theme.dividerColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        width: size.width * .95,
        // height: size.height * .3,
        child: Column(
          children: [
            ListTile(
              // leading: Icon(Icons.check),
              title: Column(
                children: [
                  Center(
                      child: Text("${'المريض : ' +
                          data['FirstName']} " +
                          data['LastName'])),
                  Text('رقم الهاتف : ' + data['Mobile']),
                ],
              ),
              subtitle: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('العضو  : ${data['Organ']!}'),
                    Text('الحالة : ${data['Estate']=="3"?'تم الحصول على متبرع':'جاري البحث'}')
                  ],
                ),
              ),
              // trailing: FlutterLogo(size: 50),
            ),
            // Padding(
            // padding: EdgeInsets.only(left: 10.0, right: 10),
            // child:
            Row(
              children: [

                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('التفاصيل : ' + data['Details']),
                      Text('تاريخ الطلب : ' + data['RequestDate']),
                    ],
                  ),
                ),
             isDoctor==true? data['Estate'] == "2"?  Expanded(
                  flex:2 ,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Get.find<DoctorController>().updateRequestDonor(
                                '0', data['Id'],'3','2');
                          }, icon: const Icon(Icons.offline_pin_rounded,color: Colors.green,)),
                          const Text('متوافق'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Get.find<DoctorController>().updateRequestDonor(
                                '0', data['Id'],'1','2');
                          },  icon: const Icon(Icons.highlight_remove_sharp,color: Colors.red,)),
                          const Text('غير متوافق'),
                        ],
                      )
                    ],
                  )):Container():Container(),





              ],
            ),
            // ),
          ],
        ),
      ));

  // Container(
  //     width: size.width * .95,
  //     decoration: BoxDecoration(
  //       color: data['Estate'] == "1"
  //           ? Colors.green[200]
  //           : context.theme.dividerColor,
  //       borderRadius: const BorderRadius.all(
  //         Radius.circular(
  //           20,
  //         ),
  //       ),
  //     ),
  //     padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         isAdmin
  //             ? customeText(
  //                 'المريض : ' + data['FirstName'] + " " + data['LastName'])
  //             : Row(),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             customeText('العضو : ' + data['Organ']!),
  //             CircleAvatar(
  //               child: Icon(FontAwesomeIcons.objectGroup),
  //               radius: 20,
  //             )
  //           ],
  //         ),
  //         customeText('التفاصيل : ' + data['Details']),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             customeText('الحالة : ' + data['Estate']),
  //             isAdmin ? customeText('تاريخ الطلب : ' + data['DOB']) : Row(),
  //           ],
  //         ),
  //       ],
  //     )));
}
