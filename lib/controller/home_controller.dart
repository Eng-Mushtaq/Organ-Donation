import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final pageController = PageController(initialPage: 2);
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
