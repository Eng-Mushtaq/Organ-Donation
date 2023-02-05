import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/Doctor/doctor_controller.dart';
import 'package:organdonation/widget/donor_request_card.dart';

import '../../animation/FadeAnimation.dart';
import '../../widget/request_card.dart';

class PatientRequestList extends StatelessWidget {
  final DoctorController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<DoctorController>(
            builder: (controller) => RefreshIndicator(
                  onRefresh: controller.getDonorRequest,
                  child: controller.patientRequest.isNotEmpty
                      ?
                      // customeCard()
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: controller.patientRequest.length,
                          itemBuilder: (context, index) {
                            var item = controller.patientRequest[index];

                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                  child:
                                      RequestCard(size, item, context,false,true)),
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
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
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
                )));
  }
}
