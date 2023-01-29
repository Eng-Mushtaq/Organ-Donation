import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnakbar(String head, String body, IconData icon, Color color) {
  return Get.snackbar(
    head,
    body,
    snackStyle: SnackStyle.FLOATING,
    icon: Icon(icon, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    borderRadius: 20,
    margin: EdgeInsets.all(15),
    colorText: Colors.white,
    duration: Duration(seconds: 4),

    isDismissible: true,
    //  dismissDirection: SnackDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
