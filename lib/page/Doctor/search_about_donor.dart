import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/Doctor/doctor_controller.dart';
import 'package:organdonation/widget/user_card.dart';

import '../../widget/donor_card.dart';
import '../../widget/validatetextview.dart';

class SearchAboutDonor extends StatelessWidget {
  final DoctorController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<DoctorController>(
            builder: (controller) => Column(
                  children: [
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
                                  'البحث عبر',
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
                              items: controller.searchtype
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
                                controller.changeSearchType(value!);
                              },
                              onSaved: (value) {},
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ValidateTextView(
                              enabled: true,
                              hintText: 'بحث',
                              showPass: false,
                              textInputType: TextInputType.text,
                              controller: controller.searchValue,
                              onChanged: (val) {
                                if (val.length > 0) {
                                  controller.searchAboutDonor();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller.donors.length > 0
                        ? Expanded(
                            flex: 1,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: controller.donors.length,
                                itemBuilder: (context, index) {
                                  var item = controller.donors[index];

                                  return Center(
                                      child: DonorRequestCard(
                                          size, item, context));
                                }),
                          )
                        : Center(
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
