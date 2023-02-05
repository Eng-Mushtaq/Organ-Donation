import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

DonorRequestCard(Size size, dynamic data, BuildContext context, bool isDoc) {
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
            //     child: Text(
            //   isDoc
            //       ? 'المتبرع : ${data['DonFirstName']!}  ${data['DonLastName']!}'
            //       : 'الطبيب : ${data['DocFirstName']}'??"" +
            //           '  ' +
            //           data['DocLastName']!.toString(),
            // )
    ),
            subtitle: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('العضو  : ${data['Organ']!}'),
                  data['Estate']=='1'?
                  const Text('الحالة : قيد البحث' ): Text('الحالة : جاري التنفيذ' ),
                  // Text('الحالة : ${data['Estate']!}')
                ],
              ),
            ),
            // trailing: FlutterLogo(size: 50),
          ),
          // Padding(
          // padding: EdgeInsets.only(left: 10.0, right: 10),
          // child:
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //
          //     Row(
          //       // mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         MaterialButton(
          //           onPressed: () {
          //             if (!isDoc) {
          //               launch('tel:/' + data['DonMobile']);
          //             }
          //           },
          //           // child: Text(isDoc
          //           //     ? 'هاتف المتبرع : ' + data['DonMobile']
          //           //     : 'هاتف الطبيب : ' + data['DocMobile'].toString()),
          //         ),
          //         Text(
          //           'تاريخ الطلب : ${data['DonorRequestDate']!}',
          //         ),
          //       ],
          //     ),
          //     // Text(
          //     //   isDoc
          //     //       ? 'عنوان المتبرع : ' + data['DonAddress']
          //     //       // : 'عنوان الطبيب : ' + data['DocAddress'].toString()??"",
          //     // ),
          //   ],
          // ),
          // ),
          Text(
            'تاريخ الطلب : ${data['DonorRequestDate']!}',
          ),
        ],
      ),
    ),
  ));
}
