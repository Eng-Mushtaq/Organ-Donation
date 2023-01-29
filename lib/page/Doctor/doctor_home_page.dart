import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organdonation/controller/home_controller.dart';
import 'package:organdonation/page/Doctor/patient_list_page.dart';
import 'package:organdonation/page/Doctor/search_about_donor.dart';
import 'package:organdonation/page/login_page.dart';

import 'doctor_profile.dart';
import 'donor_request.dart';

class DoctorHomePage extends StatelessWidget {
  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          title: Text('شاشة الطبيب'),
          actions: [
            IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {
                GetStorage().remove('login');
                GetStorage().remove('token');
                GetStorage().remove('id');
                GetStorage().remove('usertype');
                GetStorage().remove('userid');
                Get.off(LoginPage());
              },
            )
          ],
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              DonorsRequestList(),
              SearchAboutDonor(),
              PatientRequestList(),
              DoctorProfile(),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Color.fromRGBO(143, 148, 251, 1),
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.spatial_tracking_rounded,
              label: 'الطلبات',
            ),
            _bottomNavigationBarItem(
              icon: Icons.search,
              label: 'جديد',
            ),
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.users,
              label: 'المستخدمين',
            ),
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.user,
              label: 'profile',
            ),
          ],
        ),
      );
    });
  }
}
