import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:organdonation/page/Admin/user_list_page.dart';

import '../../controller/home_controller.dart';
import '../Donor/donor_request.dart';
import '../login_page.dart';
import 'add_new_user.dart';
import 'admin_profile.dart';
import 'donor_list.dart';
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
          onPressed: () {

          Get.to(()=>AddNewUser());
        },child: const Icon(Icons.add, ),),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
          title: const Text('شاشة مدير النظام'),
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
              // AddNewUser(),
              DonorRequestListAdmni(),
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
