import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../page/Admin/show_profile_doctor.dart';
import 'doctor_text.dart';

DoctorCard(Size size, dynamic data, BuildContext context) {
  return InkWell(
    onTap: (){
      Get.to(ShowProfileDoctor(name: data['FirstName']+data['LastName'],phone:data['Mobile'],dob: data['DOB'],address: data['Address'],email: data['Email'],specialist: data['Specialist'],));
    },
    child: Center(
        child: SizedBox(
      width: size.width * .95,
      height: size.height * .2,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color.fromRGBO(143, 148, 251, .6),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            ListTile(
              // leading: Icon(Icons.check),
              title: Center(
                child: Text('الاسم : ${data['FirstName']!}  ${data['LastName']!}'),
              ),
              subtitle: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['Specialist'].toString().isNotEmpty
                          ? 'التخصص : ' + data['Specialist']
                          : '',
                    ),
                    // data['Salary'].toString().length > 0
                    //     ? Text(
                    //         'الراتب : ' + data['Salary']!.toString() + ' SR',
                    //       )
                    //     : Row(),
                  ],
                ),
              ),
              // trailing: FlutterLogo(size: 50),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('الهاتف : ' + data['Mobile']!),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          'تاريخ الميلاد : ${data['DOB']!}',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text('العنوان : ' + data['Address']!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        // Card(
        //       child: Container(
        //           width: size.width * .95,
        //           decoration: BoxDecoration(
        //             color: context.theme.dividerColor,
        //             borderRadius: const BorderRadius.all(
        //               Radius.circular(
        //                 20,
        //               ),
        //             ),
        //           ),
        //           padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   customeText('الاسم : ' +
        //                       data['FirstName']!.toString() +
        //                       '  ' +
        //                       data['LastName']!.toString()),
        //                   CircleAvatar(
        //                     child: Icon(Icons.person),
        //                     radius: 20,
        //                   )
        //                 ],
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: [
        //                       customeText('الهاتف : ' + data['Mobile']!.toString()),
        //                       data['Specialist'].toString().length > 0
        //                           ? customeText(
        //                               'التخصص : ' + data['Specialist']!,
        //                             )
        //                           : Row(),
        //                     ],
        //                   ),
        //                   Column(
        //                     mainAxisSize: MainAxisSize.min,
        //                     children: [
        //                       data['Salary'].toString().length > 0
        //                           ? customeText(
        //                               'الراتب : ' +
        //                                   data['Salary']!.toString() +
        //                                   ' SR',
        //                             )
        //                           : Row(),
        //                       customeText(
        //                         'تاريخ الميلاد : ' + data['DOB']!.toString(),
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //               customeText(
        //                 'العنوان : ' + data['Address']!,
        //               ),
        //               customeText('البريد : ' + data['Email']!.toString()),
        //             ],
        //           ))),
        ),
  );
}
