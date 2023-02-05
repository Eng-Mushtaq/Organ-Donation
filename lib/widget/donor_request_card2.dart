import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/Doctor/doctor_controller.dart';
import '../model/DonorRequest.dart';

donorRequestCard2(
    Size size, DonorRequest item, BuildContext context, bool isDoc) {
  return Center(
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
              title: Column(
                children: [
                  Center(child: Text('اسم المتبرع :${item.FirstName}')),
                  Center(child: Text('رقم الهاتف :${item.Mobile}')),
                ],
              ),
              subtitle: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('العضو  : ${item.organ}'),
                    item.Estate == '1'
                        ? const Text('الحالة : قيد البحث')
                        : const Text('الحالة : جاري التنفيذ'),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('تاريخ الطلب : ${item.DonorRequestDate}'),
                  ],
                ),
                Text(
                  'عدد المرضى : ${item.patient.length}',
                ),
                Container(
                  height: item.patient.length * 65,
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: item.patient.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              'اسم المريض :${item.patient[index].FirstName}',
                              overflow: TextOverflow.ellipsis,
                            )),
                            Expanded(
                                child: Text(
                                    'تاريخ الطلب :${item.patient[index].RequestDate}')),
                            ElevatedButton(
                                onPressed: () {
                                  Get.find<DoctorController>().updateRequestDonor(
                                      item.donorId, item.patient[index].Id,'2','2');
                                },
                                child: const Text('حجز')),
                          ],
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ));
}
