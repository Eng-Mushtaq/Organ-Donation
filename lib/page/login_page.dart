import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/widget/custome_button.dart';

import '../animation/FadeAnimation.dart';
import '../controller/usercontroller.dart';
import '../widget/validatetextview.dart';
import 'sign_in.dart';

class LoginPage extends StatelessWidget {
  final UserController userCtr = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GetBuilder<UserController>(
                builder: (userCtr) => FadeAnimation(
                    1.8,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: size.height * .4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/background.png'),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * .01,
                              left: size.height * .03,
                              right: size.height * .03,
                              bottom: size.height * .01),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ValidateTextView(
                                enabled: true,
                                hintText: "اسم المستخدم",
                                showPass: false,
                                textInputType: TextInputType.text,
                                controller: userCtr.usernameCtr,
                              ),
                              ValidateTextView(
                                enabled: true,
                                hintText: "كلمة المرور",
                                showPass: true,
                                textInputType: TextInputType.visiblePassword,
                                controller: userCtr.passwordCtr,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * .02,
                                    bottom: size.height * .01),
                                child: CustomeButton(
                                  text: "دخول",
                                  size: size,
                                  textStyle: const TextStyle(
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontWeight: FontWeight.bold),
                                  function: () {
                                    if (userCtr.usernameCtr.text.isNotEmpty &&
                                        userCtr.passwordCtr.text.isNotEmpty) {
                                      userCtr.userLogin();
                                    } else {
                                      userCtr.showSnakbar(
                                          'تحذير',
                                          'تأكد من إدخال الحقول المطلوبة بشكل صحيح',
                                          Icons.warning_rounded,
                                          Colors.red);
                                    }
                                  },
                                ),
                              ),
                              MaterialButton(
                                textColor: Theme.of(context).primaryColor,
                                child: Text(
                                  'إنشاء حساب جديد',
                                  style: TextStyle(
                                      color: context.theme.hintColor,
                                      fontFamily: ArabicFonts.Cairo,
                                      package: 'google_fonts_arabic',
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Get.to(SignInPage());
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    )))));
  }
}
