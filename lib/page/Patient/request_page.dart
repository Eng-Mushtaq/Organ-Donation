import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';

import '../../animation/FadeAnimation.dart';
import '../../controller/Patinet/patient_request.dart';
import '../../widget/validatetextview.dart';

class PatientRequest extends StatelessWidget {
  final patientRequestCtr = Get.put(PatientController());

   PatientRequest({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: GetBuilder<PatientController>(
            builder: (patientRequestCtr) =>
                //  patientRequestCtr.myRequest.length > 0
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
                                  items: patientRequestCtr.organs
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
                                    patientRequestCtr.changeOrgan(value!);
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
                                          showPass: false,
                                          enabled: true,
                                          textInputType: TextInputType.text,
                                          controller:
                                              patientRequestCtr.detailsCtr,
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
                                  patientRequestCtr.insertRequest();
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
            // : FadeAnimation(
            //     2,
            //     Container(
            //       height: size.height * .07,
            //       width: size.width * .5,
            //       decoration: BoxDecoration(
            //           // borderRadius: BorderRadius.circular(20),
            //           gradient: LinearGradient(colors: [
            //         Color.fromRGBO(143, 148, 251, 1),
            //         Color.fromRGBO(143, 148, 251, .6),
            //       ])),
            //       child: Center(
            //         child: Text(
            //           "لا يوجد لديك أي طلبات",
            //           style: TextStyle(
            //               color: context.theme.hintColor,
            //               fontFamily: ArabicFonts.Cairo,
            //               package: 'google_fonts_arabic',
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ),
            //   ),
            ));
  }
}
