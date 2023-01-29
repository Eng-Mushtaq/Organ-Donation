import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';

import '../../animation/FadeAnimation.dart';
import '../../controller/Donor/Donor_controller.dart';
import '../../widget/donor_request_card.dart';

class DonorRequestList extends StatelessWidget {
  final DonorController donorRequestCtr = Get.find();

   DonorRequestList({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<DonorController>(
      builder: (donorRequestCtr) => RefreshIndicator(
          onRefresh: donorRequestCtr.getDonorRequest,
          child: donorRequestCtr.myRequest.length > 0
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: donorRequestCtr.myRequest.length,
                  itemBuilder: (context, index) {
                    var item = donorRequestCtr.myRequest[index];

                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                          child: DonorRequestCard(size, item, context, false)),
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
                )),
    ));
  }
}
