import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart' as intl;
import 'package:organdonation/page/login_page.dart';

import '../page/Admin/admin_home_page.dart';
import '../page/Doctor/doctor_home_page.dart';
import '../page/Donor/donor_home_page.dart';
import '../page/Patient/patient_home_page.dart';

class UserController extends GetxController {
  // final globalKey = GlobalKey<FormState>();

  List<String> userItems = ['طبيب', 'متبرع', 'مريض'];
  List<String> userListItems = ['الأطباء', 'المتبرعين', 'المرضى'];
  bool isDoc = false, isPai = false, isDon = false;
  int userType = 0;
  String userListtype = "2";
  List doctors = [], userList = [];
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final usernameCtrForget = TextEditingController();
  final passwordCtrForget = TextEditingController();
  final firstnameCtr = TextEditingController();
  final lastnameCtr = TextEditingController();
  final mobileCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final dobCtr = TextEditingController();
  final addressCtr = TextEditingController();
  final specialistCtr = TextEditingController();
  final fileNameCtr= TextEditingController();

  static intl.DateFormat format = intl.DateFormat("yyyy-MM-dd");
  String selectDate =
      format.format(DateTime(1990, DateTime.now().month, DateTime.now().day));
  String? dob;
  @override
  void onInit() {
    super.onInit();
    dobCtr.text = selectDate;
    // getUsersList();
  }

  void saveFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    var path = '';
    var filename = '';
    if (result != null) {
      PlatformFile file = result.files.first;
      var path = file.path.toString();
      var filename = file.name;
      print(file.name);
      fileNameCtr.text=file.name;
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
      var formData = dio.FormData.fromMap({
        'fileToUpload': await dio.MultipartFile.fromFile(path,
            filename: filename,
            contentType: MediaType("image", file.extension!)),
      });
      // var options = dio.BaseOptions(
      //   baseUrl: 'https://app.shopingsoft.com/',
      //   connectTimeout: 100000,
      //   receiveTimeout: 100000,
      // );
      try {
        var response = await dio.Dio()
            .post('https://organdonationsa.000webhostapp.com/OrganDonation/upload_files.php', data: formData);
        if (response.statusCode == 200) {

        }
      } catch (e) {

      }
    } else {}
  }
  Future<void> getUserListByType(String type) async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_users_by_type.php";
    Uri uri = Uri.parse(url);
    userList = [];
    var response = await http.post(uri, body: {'usertype': '$type'});
    var data = [];
    data = jsonDecode(response.body);
    if (data != null) {
      userList = data;
    }
    update();
  }

  Future<Null> selectDates() async {
    final DateTime? pickted = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1990, DateTime.now().month, DateTime.now().day),
      firstDate: DateTime(1950),
      lastDate: DateTime(1998),
    );

    if (pickted != null) {
      selectDate = format.format(pickted);
      dobCtr.text = selectDate;
    }

    update();
  }

  void changeType(String value) {
    if (value == 'متبرع') {
      isDon = true;
      isDoc = false;
      isPai = false;
      userType = 4;
    } else if (value == 'طبيب') {
      isDon = false;
      isDoc = true;
      isPai = false;
      userType = 2;
    } else if (value == 'مريض') {
      isDon = false;
      isDoc = false;
      isPai = true;
      userType = 3;
    }
    update();
  }

  void changeUserLsitType(String value) {
    if (value == 'الأطباء')
      userListtype = "2";
    else if (value == 'المرضى')
      userListtype = "3";
    else if (value == 'المتبرعين') userListtype = "4";

    getUserListByType(userListtype);
    update();
  }

  Future<void> userLogin() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/user_login.php";
    Uri uri = Uri.parse(url);
    String username = usernameCtr.text.trim();
    String password = passwordCtr.text.trim();
    http.Response res = await http.post(uri, body: {
      "username": username,
      "password": password,
    });
    Widget screen = LoginPage();

    if (res.statusCode == 200) {
      if (res.body != "Please try agine") {
        var decodedResponse = jsonDecode(res.body);
        var token = decodedResponse;

        GetStorage().write("token", token);
        GetStorage().write("login", true);
        GetStorage().write("usertype", token[0]['usertype']);
        GetStorage().write("userid", token[0]['userid']);
        GetStorage().write("id", token[0]['id']);

        int usertype = int.parse(token[0]['usertype'].toString());
        if (usertype == 1) //Admin
        {
          screen = AdminHomePage();
        } else if (usertype == 2) //Doctor
        {
          screen = DoctorHomePage();
        } else if (usertype == 3) //Patient
        {
          screen = PatientHomePage();
        } else if (usertype == 4) //Donor
        {
          screen = DonorHomePage();
        }
        usernameCtr.clear();
        passwordCtr.clear();
        Get.off(screen);
      } else {
        showSnakbar('خطأ', 'يجب التأكد من اسم المستخدم وكلمة المرور',
            Icons.error, Colors.red);
      }
    }
  }



  Future<void> forgetPassword() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/forget_password.php";
    Uri uri = Uri.parse(url);
    String username = usernameCtrForget.text.trim();
    String password = passwordCtrForget.text.trim();
    http.Response res = await http.post(uri, body: {
      "username": username,
      "password": password,
    });
    Widget screen = LoginPage();

    if (res.statusCode == 200) {
       print(res.body);
      if(res.body=='ok'){
        showSnakbar('تم', 'تم تغيير كلمة السر بنجاح',
            Icons.offline_pin_sharp, Colors.green);
      }
      // else{
      //   showSnakbar('خطاء', 'اسم المستخدم غير موجود',
      //       Icons.error, Colors.red);
      //
      // }

      //   var decodedResponse = jsonDecode(res.body);
      //   var token = decodedResponse;
      //   GetStorage().write("token", token);
      //   GetStorage().write("login", true);
      //   GetStorage().write("usertype", token[0]['usertype']);
      //   GetStorage().write("userid", token[0]['userid']);
      //   GetStorage().write("id", token[0]['id']);
      //
      //   int usertype = int.parse(token[0]['usertype'].toString());
      //   if (usertype == 1) //Admin
      //       {
      //     screen = AdminHomePage();
      //   } else if (usertype == 2) //Doctor
      //       {
      //     screen = DoctorHomePage();
      //   } else if (usertype == 3) //Patient
      //       {
      //     screen = PatientHomePage();
      //   } else if (usertype == 4) //Donor
      //       {
      //     screen = DonorHomePage();
      //   }
      //   usernameCtr.clear();
      //   passwordCtr.clear();
      //   Get.off(screen);
      // } else {

      // }
    }
  }
  Future<void> signin(bool isAdmin) async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/new_user.php";
    Uri uri = Uri.parse(url);
    String username = usernameCtr.text.trim();
    String password = passwordCtr.text.trim();
    String firstname = firstnameCtr.text.trim();
    String lastname = lastnameCtr.text.trim();
    String mobile = mobileCtr.text.trim();
    String email = emailCtr.text.trim();
    String dob = dobCtr.text.trim();
    String address = addressCtr.text.trim();
    String specialist = "";
    String fileName = "";
    if (userType == 2) {
      specialist = specialistCtr.text.trim();
      fileName=fileNameCtr.text.trim();
    }
    var response = await http.post(uri, body: {
      "username": username,
      "password": password,
      "usertype": userType.toString(),
      "firstname": firstname,
      "lastname": lastname,
      "mobile": mobile,
      "email": email,
      "dob": dob,
      "address": address,
      "specialist": specialist,
      "file": fileName,
    });
    var data = response.body;
    if (data != "Please try agine") {
      showSnakbar(
          'نجاح', 'تمت عملية التسجيل ب نجاح', Icons.login, Colors.green);
      usernameCtr.clear();
      passwordCtr.clear();
      firstnameCtr.clear();
      lastnameCtr.clear();
      mobileCtr.clear();
      emailCtr.clear();
      dobCtr.clear();
      addressCtr.clear();
      specialistCtr.clear();
      fileNameCtr.clear();
      !isAdmin ? Get.off(LoginPage()) : null;
    }
  }

  Future<void> updateUser(bool isAdmin) async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/new_user.php";
    Uri uri = Uri.parse(url);
    String username = usernameCtr.text.trim();
    String password = passwordCtr.text.trim();
    String firstname = firstnameCtr.text.trim();
    String lastname = lastnameCtr.text.trim();
    String mobile = mobileCtr.text.trim();
    String email = emailCtr.text.trim();
    String dob = dobCtr.text.trim();
    String address = addressCtr.text.trim();
    String specialist = "";
    if (userType == 2) {
      specialist = specialistCtr.text.trim();
    }
    var response = await http.post(uri, body: {
      "username": username,
      "password": password,
      "usertype": userType.toString(),
      "firstname": firstname,
      "lastname": lastname,
      "mobile": mobile,
      "email": email,
      "dob": dob,
      "address": address,
      "specialist": specialist,
    });
    var data = response.body;
    if (data != "Please try agine") {
      showSnakbar(
          'نجاح', 'تمت عملية التسجيل ب نجاح', Icons.login, Colors.green);
      usernameCtr.clear();
      passwordCtr.clear();
      firstnameCtr.clear();
      lastnameCtr.clear();
      mobileCtr.clear();
      emailCtr.clear();
      dobCtr.clear();
      addressCtr.clear();
      specialistCtr.clear();
      !isAdmin ? Get.off(LoginPage()) : null;
    }
  }

  void showSnakbar(String head, String body, IconData icon, Color color) {
    Get.snackbar(
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
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  void showDialog(String msg, Color color) async {
    await Future.delayed(Duration(seconds: 0));
    Get.defaultDialog(
        barrierDismissible: false,
        content: Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            Card(
              color: Colors.green.shade50,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(32, 56, 32, 33),
                  child: Text(
                    msg,
                    style: TextStyle(fontSize: 32),
                  )),
            ),
            Positioned(
                top: -40,
                child: Container(
                  child: Icon(
                    Icons.gpp_good,
                    color: color,
                    size: 84,
                  ),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green.shade50, width: 4),
                      shape: BoxShape.circle),
                ))
          ],
        ));
    await Future.delayed(Duration(seconds: 2));

    Navigator.of(Get.overlayContext!).pop();
  }
}
