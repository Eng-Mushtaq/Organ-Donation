import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organdonation/controller/home_controller.dart';

import '../login_page.dart';
import 'add_donor_request.dart';
import 'donor_profile.dart';
import 'donor_request.dart';

class DonorHomePage extends StatelessWidget {
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
          title: Text('شاشة المتبرع'),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
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
              DonorAddRequest(),
              DonorRequestList(),
              DonorProfile(),
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
              icon: FontAwesomeIcons.plus,
              label: 'تبرع',
            ),
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.listCheck,
              label: 'تبرعاتي',
            ),
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.user,
              label: 'حسابي',
            ),
          ],
        ),
      );
    });
  }
}
