import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts_arabic/fonts.dart';

import '../../animation/FadeAnimation.dart';
import '../../controller/Patinet/patient_request.dart';
import '../../widget/request_card.dart';

class PatientRequestList extends StatelessWidget {
  final patientRequestCtr = Get.put(PatientController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<PatientController>(
      builder: (patientRequestCtr) => patientRequestCtr.myRequest.length > 0
          ? Column(
              children: [
                SizedBox(height: 15),
                Container(
                  height: size.height * .07,
                  width: size.width * .5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, .6),
                      ])),
                  child: Center(
                    child: Text(
                      "طلباتي",
                      style: TextStyle(
                          color: context.theme.hintColor,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: patientRequestCtr.myRequest.length,
                    itemBuilder: (context, index) {
                      var item = patientRequestCtr.myRequest[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: RequestCard(size, item, context, false)),
                      );
                    }),
              ],
            )
          : FadeAnimation(
              2,
              Center(
                child: Container(
                  height: size.height * .07,
                  width: size.width * .5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(255, 50, 50, 1),
                        Color.fromRGBO(255, 50, 50, .5),
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
    ));
  }
}
