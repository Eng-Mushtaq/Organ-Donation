import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';

import '../../animation/FadeAnimation.dart';
import '../../controller/Donor/Donor_controller.dart';
import '../../widget/validatetextview.dart';

class DonorAddRequest extends StatelessWidget {
  final donorRequestCtr = Get.put(DonorController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<DonorController>(
            builder: (donorRequestCtr) =>
                // donorRequestCtr.myRequest.length > 0
                //     ?
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: size.height * .3,
                            alignment: Alignment.bottomCenter,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/background.png'),
                                    fit: BoxFit.fill)),
                            child: Container(
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                                      'اختار فصيلة الدم',
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: donorRequestCtr.bloods
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item ,
                                            child: Center(
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        ArabicFonts.Cairo,
                                                    package:
                                                        'google_fonts_arabic',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'الرجاء إختيار العضو';
                                    }
                                  },
                                  onChanged: (value) {
                                    donorRequestCtr.changeBlood(value!);
                                  },
                                  onSaved: (value) {
                                    // selectedValue = value.toString();
                                  },
                                ),
                                // child: DropdownButtonFormField2(
                                //   decoration: InputDecoration(
                                //     isDense: true,
                                //     contentPadding: EdgeInsets.zero,
                                //     border: OutlineInputBorder(
                                //       borderRadius: BorderRadius.circular(15),
                                //     ),
                                //   ),
                                //   isExpanded: true,
                                //   hint: const Center(
                                //     child: Text(
                                //       'اختار الطبيب',
                                //       style: TextStyle(
                                //           fontSize: 14,
                                //           fontFamily: ArabicFonts.Cairo,
                                //           package: 'google_fonts_arabic',
                                //           fontWeight: FontWeight.bold),
                                //     ),
                                //   ),
                                //   icon: const Icon(
                                //     Icons.arrow_drop_down,
                                //     color: Colors.black45,
                                //   ),
                                //   iconSize: 30,
                                //   buttonHeight: 60,
                                //   buttonPadding: const EdgeInsets.only(
                                //       left: 20, right: 10),
                                //   dropdownDecoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(15),
                                //   ),
                                //   items: donorRequestCtr.doctors
                                //       .map((item) => DropdownMenuItem<String>(
                                //             value: item['FirstName'] +
                                //                 ' ' +
                                //                 item['LastName'],
                                //             child: Center(
                                //               child: Text(
                                //                 item['FirstName'] +
                                //                     ' ' +
                                //                     item['LastName'],
                                //                 style: const TextStyle(
                                //                     fontSize: 14,
                                //                     fontFamily:
                                //                         ArabicFonts.Cairo,
                                //                     package:
                                //                         'google_fonts_arabic',
                                //                     fontWeight:
                                //                         FontWeight.bold),
                                //               ),
                                //             ),
                                //           ))
                                //       .toList(),
                                //   validator: (value) {
                                //     if (value == null) {
                                //       return 'الرجاء إختيار العضو';
                                //     }
                                //   },
                                //   onChanged: (value) {
                                //     donorRequestCtr.changeDoctor(value!);
                                //   },
                                //   onSaved: (value) {
                                //     // selectedValue = value.toString();
                                //   },
                                // ),


                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.8,
                            Container(
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                                      'اختار الجنس',
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: donorRequestCtr.sex
                                      .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                            ArabicFonts.Cairo,
                                            package:
                                            'google_fonts_arabic',
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ),
                                  ))
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'الرجاء إختيار الجنس';
                                    }
                                  },
                                  onChanged: (value) {
                                    donorRequestCtr.changeSex(value!);
                                  },
                                  onSaved: (value) {
                                    // selectedValue = value.toString();
                                  },
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.8,
                            Container(
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                                      'الامراض المزمنة',
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: donorRequestCtr.chronic
                                      .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Center(
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                            ArabicFonts.Cairo,
                                            package:
                                            'google_fonts_arabic',
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ),
                                  ))
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'الرجاء إختيار الامراض المزمنة';
                                    }
                                  },
                                  onChanged: (value) {
                                    donorRequestCtr.changeChronic(value!);
                                  },
                                  onSaved: (value) {
                                    // selectedValue = value.toString();
                                  },
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.8,
                            Container(
                              color: Colors.white.withOpacity(0.8),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
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
                                      'اختار العضو',
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
                                  buttonPadding: const EdgeInsets.only(
                                      left: 20, right: 10),
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  items: donorRequestCtr.organs
                                      .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Center(
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        ArabicFonts.Cairo,
                                                    package:
                                                        'google_fonts_arabic',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  validator: (value) {
                                    if (value == null) {
                                      return 'الرجاء إختيار العضو';
                                    }
                                  },
                                  onChanged: (value) {
                                    donorRequestCtr.changeOrgan(value!);
                                  },
                                  onSaved: (value) {
                                    // selectedValue = value.toString();
                                  },
                                ),
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.8,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FadeAnimation(
                                  1.8,
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ValidateTextView(
                                          enabled: true,
                                          textInputType: TextInputType.text,
                                          showPass: false,
                                          controller:
                                              donorRequestCtr.detailsCtr,
                                          hintText: 'التفاصيل',
                                          msgRequired: 'يجب إدخال  التفاصيل',
                                          fontSize: 20,
                                          // msgInvalid: 'msgffalidname',
                                          filedSize: r'^.{1,30}$',
                                          onChanged: (val) {
                                            // userCtr.name = val;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                          FadeAnimation(
                            2,
                            Container(
                              height: size.height * .07,
                              width: size.width * .5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: MaterialButton(
                                onPressed: () {
                                  donorRequestCtr.insertRequest();
                                },
                                child: Center(
                                  child: Text(
                                    "حفظ",
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
                        ],
                      );
                    })

            ));
  }
}
