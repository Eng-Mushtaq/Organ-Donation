import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/widget/admin_card.dart';

import '../../controller/Admin/admin_controller.dart';
import '../../widget/validatetextview.dart';

class AdminProfile extends StatelessWidget {
  final AdminController adminController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<AdminController>(
          builder: (adminController) => Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: size.height * .2,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill)),
                    ),
                    adminController.admin.isNotEmpty
                        ? Column(children: [
                            adminController.add == false
                                ? AdminCard(
                                    size, adminController.admin[0], context)
                                : Row()
                          ])
                        : Row(),
                    adminController.add
                        ? SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: ValidateTextView(
                                        enabled: true,
                                        showPass: false,
                                        textInputType: TextInputType.text,
                                        controller: adminController.usernameCtr,
                                        hintText: 'اسم المستخدم',
                                        msgRequired: 'يجب إدخال اسم المستخدم',
                                        fontSize: 20,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: ValidateTextView(
                                        enabled: true,
                                        showPass: true,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        controller: adminController.passwordCtr,
                                        hintText: 'كلمة المرور',
                                        fontSize: 20,
                                        msgRequired: 'يجب إدخال كلمة المرور',
                                      ),
                                    ),
                                  ],
                                ),
                                ValidateTextView(
                                  enabled: true,
                                  showPass: false,
                                  textInputType: TextInputType.text,
                                  controller: adminController.fullnameCtr,
                                  hintText: 'الاسم الكامل',
                                  fontSize: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      color: Colors.blue,
                                      child: Text(
                                        'حفظ',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0),
                                      ),
                                      onPressed: () async {
                                        adminController.updateUser();
                                        adminController
                                            .changeState(!adminController.add);
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    MaterialButton(
                                        color: Colors.red,
                                        child: Text(
                                          'إلغاء',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0),
                                        ),
                                        onPressed: () {
                                          adminController.changeState(
                                              !adminController.add);
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Divider(),
                    // adminController.add == false
                    //     ? Container(
                    //         height: size.height * .07,
                    //         width: size.width * .5,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             gradient: LinearGradient(colors: [
                    //               Color.fromRGBO(143, 148, 251, 1),
                    //               Color.fromRGBO(143, 148, 251, .6),
                    //             ])),
                    //         child: MaterialButton(
                    //           onPressed: () {
                    //             adminController
                    //                 .setUpdate(adminController.admin);
                    //           },
                    //           child: Center(
                    //             child: Text(
                    //               "تعديل",
                    //               style: TextStyle(
                    //                   fontFamily: ArabicFonts.Cairo,
                    //                   package: 'google_fonts_arabic',
                    //                   fontWeight: FontWeight.bold),
                    //             ),
                    //           ),
                    //         ))
                    //     : Row(),
                  ])),
    );
  }
}
