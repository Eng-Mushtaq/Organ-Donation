import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/Doctor/doctor_controller.dart';

import '../../animation/FadeAnimation.dart';
import '../../widget/custome_button.dart';
import '../../widget/doctor_text.dart';
import '../../widget/validatetextview.dart';

class DoctorProfile extends GetView<DoctorController> {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DoctorController>(builder: (controller) {
      return Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * .2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                  ),
                  controller.doctors.isNotEmpty
                      ? !controller.add
                          ? Container(
                              width: size.width * .95,
                              decoration: BoxDecoration(
                                color: context.theme.dividerColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // ignore: prefer_interpolation_to_compose_strings
                                  profileText('الاسم : ' +
                                      controller.doctors[0]['FirstName']!
                                          .toString() +
                                      '  ' +
                                      controller.doctors[0]['LastName']!
                                          .toString()),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  profileText('الهاتف : ' +
                                      controller.doctors[0]['Mobile']!
                                          .toString()),
                                  controller.doctors[0]['Specialist']
                                          .toString()
                                          .isNotEmpty
                                      ? profileText(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          'التخصص : ' +
                                              controller.doctors[0]
                                                  ['Specialist']!,
                                        )
                                      : Row(),
                                  // controller.doctors[0]['Salary']
                                  //             .toString()
                                  //             .length >
                                  //         0
                                  //     ? profileText(
                                  //         'الراتب : ' +
                                  //             controller.doctors[0]
                                  //                     ['Salary']!
                                  //                 .toString() +
                                  //             ' SR',
                                  //       )
                                  //     : Row(),
                                  profileText(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    'تاريخ الميلاد : ' +
                                        controller.doctors[0]['DOB']!
                                            .toString(),
                                  ),
                                  profileText(
                                    // ignore: prefer_interpolation_to_compose_strings
                                    'العنوان : ' +
                                        controller.doctors[0]['Address']!,
                                  ),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  profileText('البريد : ' +
                                      controller.doctors[0]['Email']!
                                          .toString()),
                                ],
                              ))
                          : Row()
                      : Row(),
                  controller.add
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              FadeAnimation(
                                1.8,
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: ValidateTextView(
                                            showPass: false,
                                            enabled: true,
                                            textInputType: TextInputType.text,
                                            controller: controller.usernameCtr,
                                            hintText: 'اسم المستخدم',
                                            msgRequired:
                                                'يجب إدخال اسم المستخدم',
                                            // msgInvalid: 'msgffalidname',
                                            filedSize: r'^.{1,30}$',
                                            onChanged: (val) {
                                              // controller.name = val;
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ValidateTextView(
                                            showPass: false,
                                            enabled: true,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            controller: controller.passwordCtr,
                                            hintText: 'كلمة المرور',
                                            msgRequired:
                                                'يجب إدخال كلمة المرور',
                                            // msgInvalid: 'msgffalidname',
                                            filedSize: r'^.{1,30}$',
                                            onChanged: (val) {
                                              // controller.name = val;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    ValidateTextView(
                                      showPass: false,
                                      enabled: true,
                                      textInputType: TextInputType.text,
                                      controller: controller.firstnameCtr,
                                      hintText: 'الاسم الاول',
                                      onChanged: (val) {
                                        // controller.firstnameCtr.text = val;
                                      },
                                    ),
                                    ValidateTextView(
                                      showPass: false,
                                      enabled: true,
                                      textInputType: TextInputType.text,
                                      controller: controller.lastnameCtr,
                                      hintText: 'الاسم الاخير',
                                      onChanged: (val) {
                                        // controller.lastnameCtr.text = val;
                                      },
                                    ),
                                    ValidateTextView(
                                      showPass: false,
                                      enabled: true,
                                      textInputType: TextInputType.emailAddress,
                                      controller: controller.emailCtr,
                                      hintText: 'البريد الإلكتروني',
                                      onChanged: (value) {
                                        // controller.emailCtr.text = value;
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ValidateTextView(
                                            showPass: false,
                                            enabled: true,
                                            textInputType: TextInputType.phone,
                                            controller: controller.mobileCtr,
                                            hintText: 'الهاتف',
                                            onChanged: (value) {
                                              // controller.mobileCtr.text = value;
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'تاريخ الميلاد',
                                                    style: TextStyle(
                                                      color: context
                                                          .theme.hintColor,
                                                      fontFamily:
                                                          ArabicFonts.Cairo,
                                                      package:
                                                          'google_fonts_arabic',
                                                    ),
                                                  ),
                                                  Text(
                                                      '${controller.selectDate}',
                                                      style: TextStyle(
                                                          color: context
                                                              .theme.hintColor,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.date_range,
                                                  color: Colors.green,
                                                  size: 30.0,
                                                ),
                                                onPressed: () {
                                                  controller.selectBrithDate();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    ValidateTextView(
                                      showPass: false,
                                      enabled: true,
                                      textInputType: TextInputType.text,
                                      controller: controller.addressCtr,
                                      hintText: 'العنوان',
                                      onChanged: (value) {
                                        // controller.addressCtr.text = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    // Expanded(
                                    //   flex: 3,
                                    //   child: ValidateTextView(showPass: false,
                                    //     enabled: true,
                                    //     textInputType: TextInputType.text,
                                    //     controller:
                                    //         controller.specialistCtr,
                                    //     hintText: 'التخصص',
                                    //     onChanged: (value) {
                                    //       // controller.barcode = value;
                                    //     },
                                    //   ),
                                    // ),
                                    // Expanded(
                                    //   flex: 2,
                                    //   child: ValidateTextView(showPass: false,
                                    //     enabled: true,
                                    //     textInputType: TextInputType.number,
                                    //     controller:
                                    //         controller.salaryCtr,
                                    //     hintText: 'الراتب',
                                    //     onChanged: (value) {
                                    //       // controller.barcode = value;
                                    //     },
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomeButton(
                                    text: 'حفظ',
                                    function: () {
                                      controller.updateUser();
                                      controller.changeState(!controller.add);
                                    },
                                    size: size * .7,
                                    textStyle: const TextStyle(
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomeButton(
                                    text: 'الغاء',
                                    function: () {
                                      controller.changeState(!controller.add);
                                      controller.update();
                                    },
                                    size: size * .7,
                                    textStyle: const TextStyle(
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const Divider(),
                  controller.add == false
                      ? CustomeButton(
                          text: 'تعديل',
                          function: () {
                            controller.setUpdate(controller.doctors[0]);
                            controller.update();
                          },
                          size: size,
                          textStyle: const TextStyle(
                              fontFamily: ArabicFonts.Cairo,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold),
                        )
                      : Row(),
                ]);
          },
        ),
      );
    });
  }
}
