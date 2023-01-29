import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organdonation/page/Admin/user_list_page.dart';

import '../../controller/home_controller.dart';
import '../login_page.dart';
import 'add_new_user.dart';
import 'admin_profile.dart';
import 'organ_details_list.dart.dart';

class AdminHomePage extends StatelessWidget {
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
          title: Text('شاشة مدير النظام'),
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
              AddNewUser(),
              UserListPage(),
              // Doctor(),
              OrganDetailsList(),
              AdminProfile(),
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
              label: 'جديد',
            ),
            _bottomNavigationBarItem(
              icon: FontAwesomeIcons.users,
              label: 'المستخدمين',
            ),
            _bottomNavigationBarItem(
              icon: Icons.spatial_tracking_rounded,
              label: 'الطلبات',
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
