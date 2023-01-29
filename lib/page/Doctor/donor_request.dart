import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/Doctor/doctor_controller.dart';
import 'package:organdonation/widget/donor_request_card.dart';

import '../../animation/FadeAnimation.dart';
import '../../model/DonorRequest.dart';
import '../../widget/donor_request_card2.dart';
import 'add_test.dart';

class DonorsRequestList extends StatelessWidget {
  final DoctorController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<DoctorController>(
            builder: (controller) => RefreshIndicator(
                  onRefresh: controller.getDonorRequest,
                  child: controller.donorsWithPatient.isNotEmpty
                      ? ListView.builder(
                          // shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.donorsWithPatient.length,
                          itemBuilder: (context, index) {
                            // var item = controller.donorWithPatientList[index];
                            DonorRequest item = controller.donorsWithPatient[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: InkWell(
                                onTap: () {
                                  print(item.patient.where((element) => element.RequestDate.isNotEmpty).toString());
                                  var getstotage = GetStorage().read("token");
                                  int id = int.parse(getstotage[0]['id'].toString());
                                  Get.to(()=>
                                      TestDonorRequest(
                                          donor: item.FirstName,
                                          docId:id,
                                              // int.parse(item['docId'].toString()),
                                          donId:
                                              int.parse(item.donorId),
                                          organ: item.organ.toString(),
                                          date:
                                              item.DonorRequestDate.toString(),
                                          // phone: item..toString(),
                                          state: item.Estate == "1"
                                              ? 'جاري البحث'
                                              : 'تم الحصول على متبرع'),
                                    // );
                                  //   TestDonorRequest(
                                  //       donor: item['DonFirstName'].toString() +
                                  //           '  ' +
                                  //           item['DonLastName'].toString(),
                                  //       docId:
                                  //           int.parse(item['docId'].toString()),
                                  //       donId:
                                  //           int.parse(item['donId'].toString()),
                                  //       organ: item['Organ'].toString(),
                                  //       date:
                                  //           item['DonorRequestDate'].toString(),
                                  //       phone: item['DonMobile'].toString(),
                                  //       state: item['Estate'] == "1"
                                  //           ? 'جاري البحث'
                                  //           : 'تم الحصول على متبرع'),

                                  );
                                },
                                // child: Center(
                                    child: donorRequestCard2(
                                        size, item, context, true)
                              // ),
                              ),
                            );
                          })
                      : FadeAnimation(
                          2,
                          Center(
                            child: Container(
                              height: size.height * .07,
                              width: size.width * .5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: MaterialButton(
                                  onPressed: () {
                                    controller.getDonorRequest();
                                    controller.update();
                                  },
                                  child: Text(
                                    "لا يوجد لديك أي طلبات",
                                    style: TextStyle(
                                        color: context.theme.hintColor,
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                )));
  }
}
