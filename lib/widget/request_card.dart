import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'doctor_text.dart';

RequestCard(Size size, dynamic data, BuildContext context, bool isAdmin) {
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
        height: size.height * .2,
        child: Column(
          children: [
            ListTile(
              // leading: Icon(Icons.check),
              title: Center(
                  child: Text('المريض : ' +
                      data['FirstName'] +
                      " " +
                      data['LastName'])),
              subtitle: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('العضو  : ' + data['Organ']!.toString()),
                    Text('الحالة : ' + data['Estate']!.toString())
                  ],
                ),
              ),
              // trailing: FlutterLogo(size: 50),
            ),
            // Padding(
            // padding: EdgeInsets.only(left: 10.0, right: 10),
            // child:
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('التفاصيل : ' + data['Details']),
                  ],
                ),
                Text('تاريخ الطلب : ' + data['DOB']),
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
