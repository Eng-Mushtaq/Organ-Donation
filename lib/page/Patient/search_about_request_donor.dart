import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/Patinet/patient_request.dart';

import '../../widget/donor_request_card.dart';
import '../../widget/validatetextview.dart';

class SearchAboutRequestDonor extends StatelessWidget {
  final PatientController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<PatientController>(
            builder: (controller) => Column(
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
                          "البحث عن متبرعين",
                          style: TextStyle(
                              color: context.theme.hintColor,
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              isExpanded: true,
                              hint: const Center(
                                child: Text(
                                  'العضو',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              buttonPadding:
                                  const EdgeInsets.only(left: 20, right: 10),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              items: controller.organs
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Center(
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: ArabicFonts.Cairo,
                                                package: 'google_fonts_arabic',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.changeOrgan(value!);
                                controller.getDonorRequest();
                              },
                              onSaved: (value) {},
                            ),
                          ),
                          // Expanded(
                          //   flex: 2,
                          //   child: ValidateTextView(
                          //     enabled: true,
                          //     hintText: 'بحث',
                          //     textInputType: TextInputType.text,
                          //     controller: controller.searchValue,
                          //     onChanged: (val) {
                          //       if (val.length > 0) {
                          //         controller.searchAboutDonor();
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    controller.searchOrgan.isNotEmpty
                        ? Expanded(
                            flex: 1,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.searchOrgan.length,
                                itemBuilder: (context, index) {
                                  var item = controller.searchOrgan[index];

                                  return Center(
                                      child: DonorRequestCard(
                                          size, item, context, true));
                                }),
                          )
                        : Center(
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
                                  "لا يوجد أي متبرعين ",
                                  style: TextStyle(
                                      color: context.theme.hintColor,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                  ],
                )));
  }
}
