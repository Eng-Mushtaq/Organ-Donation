import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

class DonorController extends GetxController {
  List<String> organs = [
    'القلب',
    'الرئة',
    'الكبد',
    'الكليتين',
    'الأمعاء',
    'البنكرياس',
    'صمامات القلب',
    'القرنية',
    'العظام',
    'نخاع العظم',
    ' فص من الكبد',
    'كلية',

  ];

  List<String> bloods = [
    'A+',
    'B+',
    'AB−',
    'AB+',
    'A−',
    'O+',
    'O−',
  ];

  List<String> sex = [
    'ذكر',
    'أنثى',

  ];
 List<String> chronic = [
    'لايوجد',
    'أمراض القلب',
    'السرطان ',
    'أمراض الجهاز التنفسي ',
    'السكر  ',
    'التهاب السل الوبائي  ',
    'السل الرئوي',
    'امراض المخ والاعصاب ',
    'ضغط الدم',
  ];

  List doctors = [], myRequest = [], profile = [], allRequest = [];
  final organCtr = TextEditingController();
  final detailsCtr = TextEditingController();
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final firstnameCtr = TextEditingController();
  final lastnameCtr = TextEditingController();
  final mobileCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final dobCtr = TextEditingController();
  final addressCtr = TextEditingController();
  final bloodCtr = TextEditingController();
  final ageCtr = TextEditingController();
  final sexCtr = TextEditingController();
  final chronicCtr = TextEditingController();
  bool save = false, add = false;

  static intl.DateFormat format = intl.DateFormat("yyyy-MM-dd");
  String selectDate =
      format.format(DateTime(1990, DateTime.now().month, DateTime.now().day));
  String? dob, doctorId;
  Future<Null> selectTestDate() async {
    final DateTime? pickted = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1986, 1, 1),
      firstDate: DateTime(1986, 1, 1),
      lastDate: DateTime(2005, 1, 1),
    );

    if (pickted != null) {
      selectDate = format.format(pickted);
    }

    update();
  }
  Future<Null> selectDates() async {
    final DateTime? pickted = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1990, DateTime.now().month, DateTime.now().day),
      firstDate: DateTime(1950),
      lastDate: DateTime(2005),
    );
    if (pickted != null) {
      selectDate = format.format(pickted);
    }
    update();
  }

  Future<Null> selectBrithDate() async {
    final DateTime? pickted = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1986, 1, 1),
      firstDate: DateTime(1986, 1, 1),
      lastDate: DateTime(2005, 1, 1),
    );

    if (pickted != null) {
      selectDate = format.format(pickted);
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
    getDonorRequest();
    getDonorData();
    getAllDoctors();
    // getAllPatientRequest();
  }

  void changeOrgan(String value) {
    organCtr.text = value;
    update();
  }
  void changeBlood(String value) {
    bloodCtr.text = value;
    update();
  }
  void changeSex(String value) {
    sexCtr.text = value;
    update();
  } void changeChronic(String value) {
    chronicCtr.text = value;
    update();
  }


  void changeDoctor(String value) {
    var x = doctors.firstWhere((element) =>
        element['FirstName'].toString() + ' ' + element['LastName'] == value);
    doctorId = x['Id'];
    update();
  }

  void changeState(bool state) {
    add = state;
    update();
  }

  void getAllDoctors() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_users_by_type.php";
    Uri uri = Uri.parse(url);
    doctors = [];
    var response = await http.post(uri, body: {'usertype': '2'});
    var data = [];
    data = jsonDecode(response.body);
    if (data != 'No Data to show') {
      doctors = data;
    }
    update();
  }

  void getDonorData() async {
    int userType = int.parse(GetStorage().read('usertype').toString());
    int userId = int.parse(GetStorage().read('userid').toString());

    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_user_by_id.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri,
        body: {"userid": userId.toString(), "usertype": userType.toString()});
    if (res.statusCode == 200) {
      if (res.body != "No Data To show") {
        var decodedResponse = jsonDecode(res.body);

        profile = decodedResponse;
        usernameCtr.text = decodedResponse[0]['UserName'].toString();
        passwordCtr.text = decodedResponse[0]['Password'].toString();
        firstnameCtr.text = decodedResponse[0]['FirstName'].toString();
        lastnameCtr.text = decodedResponse[0]['LastName'].toString();
        mobileCtr.text = decodedResponse[0]['Mobile'].toString();
        emailCtr.text = decodedResponse[0]['Email'].toString();
        dobCtr.text = decodedResponse[0]['DOB'].toString();
        addressCtr.text = decodedResponse[0]['Address'].toString();
      }
    }
    update();
  }

  Future<void> getDonorRequest() async {
    int userId = int.parse(GetStorage().read('userid').toString());
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_donor_request_by_id.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri, body: {
      "donorid": userId.toString(),
    });
    if (res.statusCode == 200) {
      if (res.body.length != 17) {
        var decodedResponse = jsonDecode(res.body);
        var token = decodedResponse;
        myRequest = token;
      }
    }
    update();
  }

  void insertRequest() async {
    var data = GetStorage().read('token');
    String userid = data[0]['id'];
    DateTime date = DateTime.now();
    String details = detailsCtr.text.trim();
    String organ = organCtr.text;
    String blood = bloodCtr.text;
    String gender = sexCtr.text;
    String chronic = chronicCtr.text;
    var url = "https://organdonationsa.000webhostapp.com/OrganDonation/new_donor_request.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri, body: {
      "organ": organ,
      // "doctorid": doctorId,
      "donorid": userid,
      "blood":blood,
      "gender":gender,
      "chronic":chronic,
      "details": details,
      "estate": "1",
      "donorrequestdate": date.toString().substring(0, 10),
    });
    if (res.statusCode == 200) {
      if (res.body != 'No Data to Show') {
        showSnakbar('نجاح', 'تمت اضافة طلب تبرع', Icons.gpp_good, Colors.green);
        clearTools();
      } else {
        showSnakbar('فشل', 'لم تتم عملية الاضافة', Icons.error, Colors.red);
      }
    }
  }

  void clearTools() {
    organCtr.clear();
    detailsCtr.clear();
    doctorId = null;
    getDonorRequest();
    update();
  }

  void setUpdate(user) async {
    usernameCtr.text = user['UserName'].toString();
    passwordCtr.text = user['Password'].toString();
    firstnameCtr.text = user['FirstName'].toString();
    lastnameCtr.text = user['LastName'].toString();
    mobileCtr.text = user['Mobile'].toString();
    emailCtr.text = user['Email'].toString();
    dobCtr.text = user['DOB'].toString();
    addressCtr.text = user['Address'].toString();
    selectDate = user['DOB'].toString();
    dob = user['DOB'].toString();
    save = false;
    add = !add;
    update();
  }

  Future<void> updateUser() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/update_user.php";
    Uri uri = Uri.parse(url);
    String username = usernameCtr.text.trim();
    String password = passwordCtr.text.trim();
    String firstname = firstnameCtr.text.trim();
    String lastname = lastnameCtr.text.trim();
    String mobile = mobileCtr.text.trim();
    String email = emailCtr.text.trim();
    String dob = selectDate;
    String address = addressCtr.text.trim();

    var getstotage = GetStorage().read("token");

    int id = int.parse(getstotage[0]['id'].toString());
    int userType = int.parse(GetStorage().read('usertype').toString());
    int userId = int.parse(GetStorage().read('userid').toString());

    var response = await http.post(uri, body: {
      "id": id.toString(),
      "userid": userId.toString(),
      "usertype": userType.toString(),
      "username": username,
      "password": password,
      "firstname": firstname,
      "lastname": lastname,
      "mobile": mobile,
      "email": email,
      "dob": dob,
      "address": address,
    });
    var data = response.body;
    if (response.statusCode == 200) {
      var url =
          "https://organdonationsa.000webhostapp.com/OrganDonation/user_login.php";
      Uri uri = Uri.parse(url);
      String username = usernameCtr.text.trim();
      String password = passwordCtr.text.trim();
      http.Response res = await http.post(uri, body: {
        "username": username,
        "password": password,
      });
      if (res.statusCode == 200) {
        if (res.body != 'No Data To show') {
          GetStorage().remove("token");
          var decodedResponse = jsonDecode(res.body);
          var token = decodedResponse;
          GetStorage().write("token", token);
          GetStorage().write("login", true);
          GetStorage().write("usertype", token[0]['usertype']);
          GetStorage().write("userid", token[0]['userid']);
          GetStorage().write("id", token[0]['id']);
          getDonorData();
        }
      }
      showSnakbar(
          'نجاح', 'تمت عملية التعديل ب نجاح', Icons.login, Colors.green);
      usernameCtr.clear();
      passwordCtr.clear();
      firstnameCtr.clear();
      lastnameCtr.clear();
      mobileCtr.clear();
      emailCtr.clear();
      dobCtr.clear();
      addressCtr.clear();
      // !isAdmin ? Get.off(LoginPage()) : null;
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
      colorText: Colors.black,
      duration: Duration(seconds: 4),

      isDismissible: true,
      //  dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
