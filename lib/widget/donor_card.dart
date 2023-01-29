import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

DonorRequestCard(Size size, dynamic data, BuildContext context) {
  return Center(
      child: Container(
    width: size.width * .95,
    height: size.height * .2,
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color.fromRGBO(143, 148, 251, .6),
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ListTile(
            // leading: Icon(Icons.check),
            title: Center(
                child: Text('المتبرع : ' +
                    data['FirstName']!.toString() +
                    '  ' +
                    data['LastName']!.toString())),
            subtitle: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('الهاتف: ' + data['Mobile']),
                  Text(
                    'تاريخ الميلاد : ' + data['DOB']!.toString(),
                  ),
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
                  MaterialButton(
                    onPressed: () {
                      // if (!isDoc) {
                      //   launch('tel:/' + data['Mobile']);
                      // }
                    },
                    child: Text('هاتف المتبرع : ' + data['Mobile']),
                  ),
                ],
              ),
              Text('عنوان المتبرع : ' + data['Address']),
            ],
          ),
          // ),
        ],
      ),
    ),
  ));
}
