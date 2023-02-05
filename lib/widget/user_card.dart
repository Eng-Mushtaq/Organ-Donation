import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../page/Admin/show_profile.dart';
import 'doctor_text.dart';

UserCard(Size size, dynamic data, BuildContext context) {
  return InkWell(
    onTap: (){
      Get.to(ShowProfile(name: data['FirstName']+data['LastName'],phone:data['Mobile'],dob: data['DOB'],address: data['Address'],email: data['Email'],));
    },
    child: Center(
      child: Card(
          child: Container(
              width: size.width * .95,
              decoration: BoxDecoration(
                color: context.theme.dividerColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customeText('الاسم : ' +
                          data['FirstName']! +
                          '  ' +
                          data['LastName']!),
                      CircleAvatar(
                        child: Icon(Icons.person),
                        radius: 20,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          customeText('الهاتف : ' + data['Mobile']!),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          customeText(
                            'تاريخ الميلاد : ' + data['DOB']!.toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  customeText(
                    'العنوان : ' + data['Address']!,
                  ),
                  customeText('البريد : ' + data['Email']!),
                ],
              ))),
    ),
  );
}
