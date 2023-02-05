import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;

class PatientController extends GetxController {
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
  ];
  List myRequest = [], profile = [], allRequest = [], searchOrgan = [];
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
  bool save = false, add = false;

  static intl.DateFormat format = intl.DateFormat("yyyy-MM-dd");
  String selectDate =
      format.format(DateTime(1990, DateTime.now().month, DateTime.now().day));
  String? dob, organ;
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
    getPatientRequest();
    getPatientData();
    // getAllPatientRequest();
  }

  void changeOrgan(String value) {
    organCtr.text = value;
    organ = value;
    update();
  }

  void changeState(bool state) {
    add = state;
    update();
  }

  Future<void> getDonorRequest() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_donor_request_by_organ.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri, body: {'organ': organ});
    if (res.statusCode == 200) {
      searchOrgan = [];
      if (res.body.toString().length != 17) {
        // var decodedResponse = await json.decode(json.encode(res.body));

        var decodedResponse = jsonDecode(res.body);
        var token = decodedResponse;
        searchOrgan = token;
      }
    }
    update();
  }

  void getPatientData() async {
    int userType = int.parse(GetStorage().read('usertype').toString());
    int userId = int.parse(GetStorage().read('userid').toString());

    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_user_by_id.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri,
        body: {"userid": userId.toString(), "usertype": userType.toString()});
    if (res.statusCode == 200) {
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
    update();
  }

  void getPatientRequest() async {
    var data = GetStorage().read('token');
    String userid = data[0]['id'];
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_patients_request_by_id.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri, body: {
      "patientid": userid,
    });
    if (res.statusCode == 200) {
      if (res.body != 'No Data To show') {
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
    String organ = organCtr.text.trim();
    String details = detailsCtr.text.trim();

    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/new_request.php";
    Uri uri = Uri.parse(url);
    print(date.toString().substring(0, 10));
    http.Response res = await http.post(uri, body: {
      "organ": organ,
      "details": details,
      "estate": "1",
      "requestdate": date.toString().substring(0, 10),
      "patientid": userid,
    });
    if (res.statusCode == 200) {
      // var decodedResponse = jsonDecode(res.body);
      // var token = decodedResponse;
      showSnakbar('نجاح', 'تم طلب العضو بنجاح', Icons.gpp_good, Colors.green);
      clearTools();
    }
  }

  void clearTools() {
    organCtr.clear();
    detailsCtr.clear();

    getPatientRequest();
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

    int id = int.parse(GetStorage().read('id').toString());
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
          getPatientData();
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
      margin: const EdgeInsets.all(15),
      colorText: Colors.black,
      duration: const Duration(seconds: 4),

      isDismissible: true,
      //  dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
