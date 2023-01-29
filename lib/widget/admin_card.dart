import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:flutter/material.dart';

AdminCard(Size size, data, BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    child: Center(
        child: Container(
      // decoration: BoxDecoration(
      //   color: context.theme.dividerColor,
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(
      //       20,
      //     ),
      //   ),
      // ),
      child: Column(children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الاسم الكامل : ' + data['FullName'].toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Card(
            elevation: 4,
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.dividerColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: const Icon(FontAwesomeIcons.user),
                    title:
                        Text("اسم المستخدم : " + data['UserName'].toString()),
                  ),
                  const Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: const Icon(Icons.password),
                    title: Text('كلمة المرور : ' + data['Password'].toString()),
                  ),
                  const Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: Text(' نوع المستخدم : ' + 'مدير النظام'),
                  ),
                  const Divider(
                    height: 0.6,
                    color: Colors.black87,
                  ),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: Text('  الحالة : ' + 'نشط'),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    )),
  );
}
