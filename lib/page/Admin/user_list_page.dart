import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/controller/usercontroller.dart';

import '../../animation/FadeAnimation.dart';
import '../../controller/Admin/admin_controller.dart';
import '../../widget/doctors_card.dart';
import '../../widget/dissmiss.dart';
import '../../widget/user_card.dart';

class UserListPage extends StatelessWidget {
  final AdminController adminController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * .0),
        child: GetBuilder<AdminController>(
          builder: (adminController) => Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * .03,
                    left: size.width * .15,
                    right: size.width * .15,
                    bottom: size.width * .03),
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
                      'حدد مجموعة المستخدمين',
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
                  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  items: adminController.userListItems
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
                    adminController.changeUserLsitType(value!);
                  },
                  onSaved: (value) {},
                ),
              ),
              adminController.userList.isNotEmpty
                  ? Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: adminController.userList.length,
                        itemBuilder: (context, i) {
                          final item = adminController.userList[i];
                          return DismissibleWidget(
                            item: item,
                            child: adminController.userListtype != "2"
                                ? UserCard(size, item, context)
                                : DoctorCard(size, item, context),
                          );
                        },
                      ),
                  )
                  : Center(
                      child: FadeAnimation(
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
                          child: Center(
                            child: Text(
                              "لا يوجد أي مستخدمين",
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
          ),
        ),
      ),
    );
  }
}
