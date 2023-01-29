import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/Donor/Donor_controller.dart';

import '../../animation/FadeAnimation.dart';
import '../../widget/custome_button.dart';
import '../../widget/doctor_text.dart';
import '../../widget/validatetextview.dart';

class DonorProfile extends GetView<DonorController> {
  const DonorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DonorController>(builder: (controller) {
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
                                image:
                                    AssetImage('assets/images/background.png'),
                                fit: BoxFit.fill)),
                      ),
                      controller.profile.isNotEmpty
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // ignore: prefer_interpolation_to_compose_strings
                                      profileText('الاسم : ' +
                                          controller.profile[0]['FirstName']!
                                              .toString() +
                                          '  ' +
                                          controller.profile[0]['LastName']!
                                              .toString()),
                                      profileText('الهاتف : ' +
                                          controller.profile[0]['Mobile']!
                                              .toString()),
                                      profileText(
                                        'تاريخ الميلاد : ' +
                                            controller.profile[0]['DOB']!
                                                .toString(),
                                      ),
                                      profileText(
                                        'العنوان : ' +
                                            controller.profile[0]['Address']!,
                                      ),
                                      profileText('البريد : ' +
                                          controller.profile[0]['Email']!
                                              .toString()),
                                    ],
                                  ))
                              : Row()
                          : Row(),
                      controller.add
                          ? SingleChildScrollView(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 28),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  FadeAnimation(
                                    1.8,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                                textInputType:
                                                    TextInputType.text,
                                                controller:
                                                    controller.usernameCtr,
                                                hintText: 'اسم المستخدم',
                                                msgRequired:
                                                    'يجب إدخال اسم المستخدم',
                                                filedSize: r'^.{1,30}$',
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: ValidateTextView(
                                                showPass: false,
                                                enabled: true,
                                                textInputType: TextInputType
                                                    .visiblePassword,
                                                controller:
                                                    controller.passwordCtr,
                                                hintText: 'كلمة المرور',
                                                msgRequired:
                                                    'يجب إدخال كلمة المرور',
                                                // msgInvalid: 'msgffalidname',
                                                filedSize: r'^.{1,30}$',
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
                                        ),
                                        ValidateTextView(
                                          showPass: false,
                                          enabled: true,
                                          textInputType: TextInputType.text,
                                          controller: controller.lastnameCtr,
                                          hintText: 'الاسم الاخير',
                                        ),
                                        ValidateTextView(
                                          showPass: false,
                                          enabled: true,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          controller: controller.emailCtr,
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
                                                textInputType:
                                                    TextInputType.phone,
                                                controller:
                                                    controller.mobileCtr,
                                                hintText: 'الهاتف',
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
                                                        MainAxisAlignment
                                                            .center,
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
                                                                  .theme
                                                                  .hintColor,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.date_range,
                                                      color: Colors.green,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () {
                                                      controller
                                                          .selectBrithDate();
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
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomeButton(
                                        text: 'حفظ',
                                        function: () {
                                          controller.updateUser();
                                          controller
                                              .changeState(!controller.add);
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
                                          controller
                                              .changeState(!controller.add);
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
                                // controller.getDonorData();
                                controller.setUpdate(controller.profile[0]);
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
              }));
    });
  }
}
