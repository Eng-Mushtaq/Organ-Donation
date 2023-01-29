import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:organdonation/page/Doctor/doctor_home_page.dart';
import 'package:organdonation/page/Donor/donor_home_page.dart';
import 'package:organdonation/page/Admin/admin_home_page.dart';
import 'package:organdonation/page/login_page.dart';
import 'package:organdonation/page/Patient/patient_home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../model/boarding.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  void submit() {
    bool isLogin = false;
    isLogin = GetStorage().read("login") != null ? true : false;

    Widget screen = LoginPage();

    if (isLogin != false) {
      var token = GetStorage().read('token');

      int userType = int.parse(GetStorage().read('usertype').toString());

      if (userType == 1) //Admin
      {
        screen = AdminHomePage();
      } else if (userType == 2) //Doctor
      {
        screen = DoctorHomePage();
      } else if (userType == 3) //Patient
      {
        screen = PatientHomePage();
      } else if (userType == 4) //Donor
      {
        screen = DonorHomePage();
      }
    } else {
      isLogin = false;
      screen = LoginPage();
    }
    // GetStorage().write('isFirst', false);
    Get.to(screen);
  }

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
        image: 'assets/logo.png',
        title: 'مرحباً',
        body: 'تطبيق التبرع ب الاعضاء',
      ),
      BoardingModel(
        image: 'assets/onboard2.jpg',
        title: 'التبرع أجر وعمل إنساني',
        body: 'التبرع بالأعضاء يعيد الأمل لاصحاب الفشل العضوي ',
      ),
      BoardingModel(
        image: 'assets/onboard1.jpg',
        title: 'شعور لا يقدر',
        body:
            'لا شيء يوازي إنقاذ حياة إنسان، ولا فرحة تستطيع تخفيف المعاناة والألم عن شخص يشتكي مرضا مزمنا، وذلك عندما تنقذ روحا بشرية من الموت',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              'تخطي'.toUpperCase(),
              style: TextStyle(
                fontFamily: ArabicFonts.Cairo,
                package: 'google_fonts_arabic',
                color: context.theme.cardColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemCount: boarding.length,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                onPageChanged: (int value) {
                  if (value == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color.fromRGBO(143, 148, 251, 1),
                    dotWidth: 10,
                    dotHeight: 10,
                    spacing: 5,
                    expansionFactor: 4,
                  ),
                  controller: boardController,
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontFamily: ArabicFonts.Baloo_Bhaijaan,
              package: 'google_fonts_arabic',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(143, 148, 251, 1),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      );
}
