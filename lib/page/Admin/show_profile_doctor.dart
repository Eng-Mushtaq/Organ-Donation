import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/Doctor/doctor_controller.dart';

import '../../animation/FadeAnimation.dart';
import '../../widget/custome_button.dart';
import '../../widget/doctor_text.dart';
import '../../widget/validatetextview.dart';

// ignore: prefer_interpolation_to_compose_strings
class ShowProfileDoctor extends GetView<DoctorController> {
  String name;
  String phone;
  String dob;
  String address;
  String email;
  String specialist;

  ShowProfileDoctor(
      {super.key, this.name = '', this.phone = "", this.address = "", this.email = "", this.dob = "",required this.specialist});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    // return GetBuilder<DoctorController>(builder: (controller)
    // {
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
                                image: AssetImage(
                                    'assets/images/background.png'),
                                fit: BoxFit.fill)),
                      ),
                      Container(
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
                              profileText('الاسم : ' + name),
                              // ignore: prefer_interpolation_to_compose_strings
                              profileText('الهاتف : ' + phone),
                              profileText('تاريخ الميلاد : ' + dob,),
                              profileText('التخصص : ' + specialist,),
                              profileText(
                                // ignore: prefer_interpolation_to_compose_strings
                                'العنوان : ' + address,),
                              // ignore: prefer_interpolation_to_compose_strings
                              profileText('البريد : ' + email),
                            ]
                        )
                        ,
                      )

                    ]
                );
              }
          ));
    // });
  }
}

