import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts_arabic/fonts.dart';

import '../../animation/FadeAnimation.dart';
import '../../controller/usercontroller.dart';
import '../../widget/validatetextview.dart';

class AddNewUser extends StatelessWidget {
  final userCtr = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 1,
            itemBuilder: (context, i) {
              return GetBuilder<UserController>(
                  builder: (userCtr) => Column(
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
                                    'نوع الحساب',
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
                                items: userCtr.userItems
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Center(
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: ArabicFonts.Cairo,
                                                  package:
                                                      'google_fonts_arabic',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return 'الرجاء تحديد نوع الحساب';
                                  }
                                },
                                onChanged: (value) {
                                  userCtr.changeType(value!);
                                },
                              ),
                            ),
                          ),
                          FadeAnimation(
                            1.8,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                                        controller: userCtr.usernameCtr,
                                        hintText: 'اسم المستخدم',
                                        msgRequired: 'يجب إدخال اسم المستخدم',
                                        filedSize: r'^.{1,30}$',
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: ValidateTextView(
                                        enabled: true,
                                        showPass: true,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        controller: userCtr.passwordCtr,
                                        hintText: 'كلمة المرور',
                                        msgRequired: 'يجب إدخال كلمة المرور',
                                        filedSize: r'^.{1,30}$',
                                      ),
                                    ),
                                  ],
                                ),
                                ValidateTextView(
                                  enabled: true,
                                  textInputType: TextInputType.text,
                                  controller: userCtr.firstnameCtr,
                                  showPass: false,
                                  hintText: 'الاسم الاول',
                                ),
                                ValidateTextView(
                                  enabled: true,
                                  textInputType: TextInputType.text,
                                  controller: userCtr.lastnameCtr,
                                  showPass: false,
                                  hintText: 'الاسم الاخير',
                                ),
                                ValidateTextView(
                                  enabled: true,
                                  textInputType: TextInputType.emailAddress,
                                  controller: userCtr.emailCtr,
                                  showPass: false,
                                  hintText: 'البريد الإلكتروني',
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
                                        controller: userCtr.mobileCtr,
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
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'تاريخ الميلاد',
                                                style: TextStyle(
                                                  color:
                                                      context.theme.hintColor,
                                                  fontFamily: ArabicFonts.Cairo,
                                                  package:
                                                      'google_fonts_arabic',
                                                ),
                                              ),
                                              Text('${userCtr.selectDate}',
                                                  style: TextStyle(
                                                      color: context
                                                          .theme.hintColor,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          IconButton(
                                            icon: Icon(
                                              Icons.date_range,
                                              color: Colors.green,
                                              size: 30.0,
                                            ),
                                            onPressed: () {
                                              userCtr.selectDates();
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ValidateTextView(
                                  enabled: true,
                                  textInputType: TextInputType.text,
                                  controller: userCtr.addressCtr,
                                  showPass: false,
                                  hintText: 'العنوان',
                                ),
                                userCtr.isDoc ? isDoctor(context) : Row(),
                                SizedBox(
                                  height: 10,
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
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: MaterialButton(
                                onPressed: () {
                                  userCtr.signin(true);
                                },
                                child: Center(
                                  child: Text(
                                    "تسجيل",
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
                          // FadeAnimation(
                          //     3,
                          //     MaterialButton(
                          //       // textColor: Theme.of(context).primaryColor,
                          //       child: Text(
                          //         'تسجيل الدخول',
                          //         style: TextStyle(
                          //             color: context.theme.hintColor,
                          //             fontFamily: ArabicFonts.Cairo,
                          //             package: 'google_fonts_arabic',
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       onPressed: () {
                          //         Get.back();
                          //       },
                          //     ))
                        ],
                      ));
            }));
  }

  Widget isDoctor(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ValidateTextView(
      enabled: true,
      textInputType: TextInputType.text,
      showPass: false,
      controller: userCtr.specialistCtr,
      hintText: 'التخصص',
      onChanged: (value) {
        // userCtr.barcode = value;
      },
    );
  }
}
