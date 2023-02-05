import 'package:flutter/material.dart';

import 'doctor_text.dart';

RequestStateCard(Size size, dynamic data) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: data['Estate'] == "3" ? Colors.green[200]  : Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        width: size.width * .95,
        // height: size.height * .2,
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                data['Estate'] == "1" ? Icons.check  :Icons.error ,
                color: data['Estate'] == "3" ?  Colors.grey : Colors.black,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('العضو  : ' + data['Organ']!.toString()),
                  Text(data['Estate'] == "3"
                      ?'تم الحصول على متبرع'
                      : 'جاري البحث' )
                ],
              ),
            ),
          ],
        ),
      ));
}
