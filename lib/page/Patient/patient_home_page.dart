import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organdonation/page/Patient/patient_profile.dart';
import 'package:organdonation/page/Patient/patient_request_list.dart';
import 'package:organdonation/page/Patient/patient_request_state.dart';
import 'package:organdonation/page/Patient/request_page.dart';
import 'package:organdonation/page/Patient/search_about_request_donor.dart';
import 'package:organdonation/page/login_page.dart';

import '../../controller/home_controller.dart';

class PatientHomePage extends StatelessWidget {
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
          title: const Text('شاشة المريض'),
          backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
          actions: [
            IconButton(
              icon: const Icon(Icons.forward),
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
              PatientRequest(),
              PatientRequestList(),
              SearchAboutRequestDonor(),
              PatientRequestState(),
              PatinetProfile(),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: const Color.fromRGBO(143, 148, 251, 1),
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          items: [
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.plus,
              label: 'طلب',
            ),
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.listCheck,
              label: 'طلباتي',
            ),
            _bottomNavigationBarItem(
              icon: Icons.search,
              label: 'البحث عن متبرع',
            ),
            _bottomNavigationBarItem(
              icon: Icons.spatial_tracking_outlined,
              label: 'حالة الطلب',
            ),
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.user,
              label: 'تتبع الطلب',
            ),
          ],
        ),
      );
    });
  }
}
