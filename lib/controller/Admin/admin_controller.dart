import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../model/report.dart';
import '../../model/user.dart';
import '../../pdf/pdf_api.dart';
import '../../pdf/pdf_invoice_api.dart';
import '../../widget/snack_bar.dart';

class AdminController extends GetxController {
  int userId = 0;
  bool save = false, add = false;
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final fullnameCtr = TextEditingController();
  bool isDoc = false, isPai = false, isDon = false;
  int userType = 0;
  String userListtype = "2";
  List doctors = [], userList = [];
  List admin = [], allRequest = [],allDonorRequest = [];
     List<Report> reportList = [];
  List<String> userListItems = ['الأطباء', 'المتبرعين', 'المرضى'];

  @override
  void onInit() {
    super.onInit();
    var data = GetStorage().read("token");
    if (data[0]['usertype'].toString() == "1")
      userId = int.parse(data[0]['id'].toString());
    else
      userId = int.parse(data[0]['userid'].toString());
    getUserListByType('2');
    getUserListByType('3');
    getUserListByType('4');
    getAdminData(userId);
    getAllPatientRequest();
    getAllDonorRequest();
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


  Future getDataToReport()async{
    int donorsReq= allDonorRequest.length;
    int doctor=GetStorage().read('doctor_count');
    int patient=GetStorage().read('patient_count');
    int patientRequest=GetStorage().read('patientRequest_count');
     int donor=GetStorage().read('donor_count');
    Report report1= Report('عدد المرضى','$patient');
    Report report2= Report('عدد الاطباء','$doctor');
    Report report3= Report('عدد  طلبات المتبرعين','$donorsReq');
    Report report5= Report('عدد   المتبرعين','$donor');
    Report report4= Report('عدد  طلبات المرضى','$patientRequest');
    if(reportList.isNotEmpty){
      reportList.clear();
    }
    reportList.add(report2);
    reportList.add(report1);
    reportList.add(report5);
    reportList.add(report3);
    reportList.add(report4);

    final pdfFile = await PdfInvoiceApi.generate(reportList);
    PdfApi.openFile(pdfFile);

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
      if(type=='2'){
        GetStorage().write("doctor_count", userList.length);
      }
      if(type=='3'){
        GetStorage().write("patient_count", userList.length);
      }
      if(type=='4'){
        GetStorage().write("donor_count", userList.length);
      }
    }
    update();
  }

  Future<void> getStatistics() async {
    var url = "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_patient_request.php";
    var url2 = "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_donors_request.php";
    var url3 = "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_donors_request.php";
    Uri uri = Uri.parse(url);
    Uri uri2 = Uri.parse(url2);
    List allpatient=[];
    List allpatient_req=[];
    List all_donor=[];
    List all_donor_req=[];

    var response = await http.post(uri);
    var data = [];
    data = jsonDecode(response.body);
    if (data != null) {
      allpatient = data;
    }
    var response2= await http.post(uri2);
    var data2 = [];
    data2 = jsonDecode(response2.body);
    if (data2 != null) {
      all_donor_req = data2;
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

  void getAdminData(int id) async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_user_by_id.php";
    Uri uri = Uri.parse(url);
    http.Response res =
        await http.post(uri, body: {'userid': '1', 'usertype': '1'});
    if (res.statusCode == 200) {
      if (res.body != 'No Data To show') {
        var decodedResponse = jsonDecode(res.body);
        var token = decodedResponse;
        admin = token;
      }
    }

    usernameCtr.text = admin[0]['UserName'];
    passwordCtr.text = admin[0]['Password'];
    fullnameCtr.text = admin[0]['FullName'];
  }

  void setUpdate(user) async {
    usernameCtr.text = user[0]['UserName'];
    passwordCtr.text = user[0]['Password'];
    fullnameCtr.text = user[0]['FullName'];
    save = false;
    add = true;
    update();
  }

  void clearTools() {
    usernameCtr.clear();
    passwordCtr.clear();
    fullnameCtr.clear();
    userId = 0;
    save = true;
  }

  void changeState(bool state) {
    add = state;
    update();
  }

  void getAllPatientRequest() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_patient_request.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri);
    if (res.statusCode == 200) {
      if (res.body.length != 18) {
        var decodedResponse = jsonDecode(res.body);
        var token = decodedResponse;
        allRequest = token;
        GetStorage().write("patientRequest_count", allRequest.length);
      }
    }
    update();
  }

  void getAllDonorRequest() async {
    var url = "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_donors_request.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    // print(res.body);
    if (res.statusCode == 200) {
      if (res.body.length != 18) {
        var decodedResponse = jsonDecode(res.body);
        var token = decodedResponse;
        allDonorRequest = token;
      }
    }
    update();
  }

  Future<void> updateUser() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/update_user.php";
    Uri uri = Uri.parse(url);
    String username = usernameCtr.text.trim();
    String password = passwordCtr.text.trim();
    // String firstname = na.text.trim();
    // String lastname = lastnameCtr.text.trim();
    // String mobile = mobileCtr.text.trim();
    // String email = emailCtr.text.trim();
    // String dob = dobCtr.text.trim();
    // String address = addressCtr.text.trim();
    // String specialist = "";

    // specialist = specialistCtr.text.trim();
    var getstotage = GetStorage().read("token");
    int id = int.parse(getstotage[0]['Id'].toString());
    int userid = int.parse(getstotage[0]['userid'].toString());
    int userType = int.parse(getstotage[0]['usertype'].toString());

    var response = await http.post(uri, body: {
      "id": id.toString(),
      "userid": userid.toString(),
      "usertype": userType.toString(),
      "username": username,
      "password": password,
    });
    var data = response.body;
    if (response.statusCode == 200) {
      showSnakbar(
          'نجاح', 'تمت عملية التعديل ب نجاح', Icons.login, Colors.green);
      usernameCtr.clear();
      passwordCtr.clear();

      // !isAdmin ? Get.off(LoginPage()) : null;
    }
  }
}
