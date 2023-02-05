import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/Doctor/doctor_controller.dart';
import '../model/DonorRequest.dart';

donorRequestCardAdmin(
    Size size, dynamic item, BuildContext context, bool isDoc) {
  return Center(
      child: Container(
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
                title: Center(child: Text('اسم المتبرع :${item['DonFirstName']+' '+item['DonLastName']}')),
                subtitle: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('العضو  : ${item['Organ']}'),
                      item['Estate']=='1'?

                      const Text('الحالة : قيد البحث' ): Text('الحالة : جاري التنفيذ' ),
                    ],
                  ),
                ),
                // trailing: FlutterLogo(size: 50),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('تاريخ الطلب : ${item['DonorRequestDate']}'),
                    ],
                  ),
                  // Text('عدد المرضى : ${item.patient.length}',
                  // ),
                  // Container(
                  //   height: item.patient.length*65,
                  //   padding: const EdgeInsets.all(8),
                  //   width: double.infinity,
                  //   child: ListView.builder(itemCount: item.patient.length,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       itemBuilder: (context, index) {
                  //         return Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Expanded(child: Text('اسم المريض :${item.patient[index].FirstName}',overflow: TextOverflow.ellipsis,)),
                  //             Expanded(child: Text('تاريخ الطلب :${item.patient[index].RequestDate}')),
                  //             ElevatedButton(onPressed: (){
                  //               Get.find<DoctorController>().updateRequestDonor(item.donorId,item.patient[index].Id);
                  //             }, child: const Text('حجز')),
                  //           ],
                  //         );
                  //       }),
                  // )
                ],
              ),
              // ),
            ],
          ),
        ),
      ));
}
