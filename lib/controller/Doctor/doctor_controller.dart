import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart' as intl;
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

import '../../model/DonorRequest.dart';

class DoctorController extends GetxController {
  List doctors = [],
      patients = [],
   donorsWithPatient=<DonorRequest>[],
      patientRequest = [],
      donorList = [],
  donorWithPatientList=[],
      donors = [];
  List<String> searchtype = [
    'الاسم الاول',
    'الاسم الاخير',
    'العنوان',
    'الهاتف'
  ];
  final searchValue = TextEditingController();
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final firstnameCtr = TextEditingController();
  final lastnameCtr = TextEditingController();
  final mobileCtr = TextEditingController();
  final emailCtr = TextEditingController();
  final dobCtr = TextEditingController();
  final addressCtr = TextEditingController();
  final specialistCtr = TextEditingController();

  static intl.DateFormat format = intl.DateFormat("yyyy-MM-dd");
  String selectDate =
      format.format(DateTime(1990, DateTime.now().month, DateTime.now().day));

  String testDate = format.format(DateTime.now());
  String? dob, col;
  bool save = false, add = false;

  Future<Null> selectTestDate() async {
    final DateTime? pickted = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(1986, 1, 1),
      firstDate: DateTime(1986, 1, 1),
      lastDate: DateTime(2005, 1, 1),
    );

    if (pickted != null) {
      testDate = format.format(pickted);
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
    getDoctorData();
    getUserListByType();
    getPatientRequestList();
    getDonorRequest();
    getDonorRequestWithPatient();

    update();
  }

  void changeState(bool state) {
    add = state;
    update();
  }

  void changeSearchType(String val) {
    if (val == 'الاسم الاول') {
      col = 'FirstName';
    } else if (val == 'الاسم الاخير') {
      col = "LastName";
    } else if (val == 'العنوان') {
      col = "Address";
    } else if (val == 'الهاتف') {
      col = "Mobile";
    }
    update();
  }

  void getDoctorData() async {
    var data = GetStorage().read("token");
    // var decodedResponse = jsonDecode(data);

    int userType = int.parse(GetStorage().read('usertype').toString());
    int userId = int.parse(GetStorage().read('userid').toString());

    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_user_by_id.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri,
        body: {"userid": userId.toString(), "usertype": userType.toString()});
    if (res.statusCode == 200) {
      if (res.body != 'No Data To show') {
        var decodedResponse = jsonDecode(res.body);

        doctors = decodedResponse;
        usernameCtr.text = decodedResponse[0]['UserName'].toString();
        passwordCtr.text = decodedResponse[0]['Password'].toString();
        firstnameCtr.text = decodedResponse[0]['FirstName'].toString();
        lastnameCtr.text = decodedResponse[0]['LastName'].toString();
        mobileCtr.text = decodedResponse[0]['Mobile'].toString();
        emailCtr.text = decodedResponse[0]['Email'].toString();
        dobCtr.text = decodedResponse[0]['DOB'].toString();
        addressCtr.text = decodedResponse[0]['Address'].toString();
        specialistCtr.text = decodedResponse[0]['Specialist'].toString();
      }
    }
    update();
  }

  Future<void> getUserListByType() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_users_by_type.php";
    Uri uri = Uri.parse(url);
    patients = [];
    var response = await http.post(uri, body: {'usertype': '3'});
    var data = [];
    if (response.body != "No Data To show") {
      data = jsonDecode(response.body);
      if (data != null) {
        patients = data;
      }
    }
    update();
  }

  Future<void> getDonorRequest() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_donors_request.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      if (res.body.length != 17) {
        var decodedResponse = jsonDecode(res.body);
        // print(decodedResponse);
        var token = decodedResponse;
        donorList = token;
      }
    }
    update();
  }
  Future<void> getDonorRequestWithPatient() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_donor_with_patient.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.get(uri);
    if (res.statusCode == 200) {
      if (res.body.length != 17) {
        // var decodedResponse = jsonDecode(res.body);
        // print(decodedResponse);
        // var decodedResponse = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
        // var currency = decodedResponse["currency"];
        var decodedResponse = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
        // var token = decodedResponse["data"]["token"];
        // print("token:" + token);
        donorsWithPatient.clear();
        decodedResponse["data"].forEach((cat) =>donorsWithPatient.add(DonorRequest.fromJson(cat)));
        // decodedResponse.forEach((cat) => donorsWithPatient.add(DonorRequest.fromJson(cat)));
        // decodedResponse["wallets"].forEach((cat) =>
        //     wallets.add(Wallet.fromJson(cat)));
        // decodedResponse["balance"].forEach((cat) =>
        //     balances.add(BalanceUser.fromJson(cat)));
        // var token = decodedResponse;
        // donorWithPatientList = token;
        donorsWithPatient.length;
      // for(int i=0;i<donorWithPatientList.length;i++){
      //   donorWithPatientList[i]['count']=donorWithPatientList[i]['patient'].len
      //
      // }
        print("donorWithPatientList.lengthdonorWithPatientList.length");
        print(donorsWithPatient.length);
        // print();
      }
    }
    update();
  }

  Future<void> getPatientRequestList() async {
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/get_all_patient_request.php";
    Uri uri = Uri.parse(url);
    patientRequest = [];
    var response = await http.post(uri);
    var data = [];
    if (response.body.length != 18) {
      data = jsonDecode(response.body);
      if (data != null) {
        patientRequest = data;
      }
    }
    update();
  }

  Future<List<dynamic>> searchAboutDonor() async {
    String value = searchValue.text.trim();
    var url =
        "https://organdonationsa.000webhostapp.com/OrganDonation/search_about.php";
    Uri uri = Uri.parse(url);
    http.Response res = await http.post(uri, body: {
      "table": "DonorTbl",
      "column": col,
      "value": value,
    });
    if (res.statusCode == 200) {
      donors = [];
      if (res.body != 'No Data To show') {
        var decodedResponse = jsonDecode(res.body);
        var token = decodedResponse;
        donors = token;
      }
    }

    update();

    return donors;
  }

  void setUpdate(user) async {
    usernameCtr.text = user['UserName'].toString();
    passwordCtr.text = user['Password'].toString();
    firstnameCtr.text = user['FirstName'].toString();
    lastnameCtr.text = user['LastName'].toString();
    mobileCtr.text = user['Mobile'].toString();
    emailCtr.text = user['Email'].toString();
    dobCtr.text = user['DOB'].toString();
    selectDate = user['DOB'].toString();
    addressCtr.text = user['Address'].toString();
    specialistCtr.text = user['Specialist'].toString();

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
    String specialist = "";

    specialist = specialistCtr.text.trim();
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
      "specialist": specialist,
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
          getDoctorData();
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
      specialistCtr.clear();
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
      margin: const EdgeInsets.all(16),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),

      isDismissible: true,
      //  dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  List<Widget>? fileListThumb;
  List<PlatformFile> fileList = [];
  final Map params = Map();

  Future pickFiles() async {
    List<Widget> thumbs = [];

    if (fileListThumb != null) {
      fileListThumb!.forEach((element) {
        thumbs.add(element);
      });
    }
    await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'bmp', 'pdf', 'doc', 'docx'],
    ).then((files) {
      if (files != null && files.count > 0) {
        files.files.forEach((element) {
          List<String> picExt = ['.jpg', '.jpeg', '.bmp'];

          if (picExt.contains(extension(element.path!))) {
            thumbs.add(Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: Image.file(File(element.path!))),
                ),
                // Expanded(
                //     flex: 1,
                //     child: IconButton(
                //         onPressed: () {
                //           fileList.remove(element);
                //           fileListThumb!.remove(element.path!);
                //           update();
                //         },
                //         icon: Icon(
                //           Icons.delete,
                //           color: Colors.red,
                //         )))
              ],
            ));
          } else {
            thumbs.add(Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  const Icon(Icons.insert_drive_file),
                  Text(extension(element.path!))
                ])));
          }
          fileList.add(element);
        });
        fileListThumb = thumbs;
      }
    });
    update();
  }

  List<Map> toBase64(List<File> fileList) {
    List<Map> s = [];
    if (fileList.length > 0) {
      fileList.forEach((element) {
        Map a = {
          'fileName': basename(element.path),
          'encoded': base64Encode(element.readAsBytesSync())
        };
        s.add(a);
      });
    }
    return s;
  }

  void httpSend(int doc, int don, String desc) async {
    var path = '';
    var filename = '';
    String date = testDate;
    String dr = doc.toString();
    String donor = don.toString();
    var response = await http.post(
        Uri.parse(
            'https://organdonationsa.000webhostapp.com/OrganDonation/new_test_request.php'),
        body: {
          'doctorid': dr,
          'donorid': donor,
          'description': desc,
          'date': DateTime.now().toString()
        }).then((value) {
      if (value.body != 'Can not add') {
        var id = int.parse(value.body.toString());
        fileList.forEach((element) async {
          if (element != null) {
            PlatformFile file = element;
            var path = file.path!.toString();
            var filename = file.name;
            print(file.bytes);
            print(file.size);
            print(file.extension);
            print(file.path);
            var formData = dio.FormData.fromMap({
              'testid': id,
              'fileToUpload': await dio.MultipartFile.fromFile(path,
                  filename: filename,
                  contentType: MediaType("image", file.extension!)),
            });
            var response = await dio.Dio()
                .post(
                    'https://organdonationsa.000webhostapp.com/OrganDonation/upload_files.php',
                    data: formData)
                .then((value) async {
              if (value.data != null) {
                print('File name: ' + filename);
                String name = basename(file.path!);
                var response = await http.post(
                    Uri.parse(
                        'https://organdonationsa.000webhostapp.com/OrganDonation/new_test.php'),
                    body: {
                      'name': name,
                      'extention': file.extension,
                      'testid': id.toString(),
                    }).then((value) {
                  print(value.body);
                  fileList.clear();
                  fileListThumb = [];
                  update();
                  Get.back();
                });
              }
            });
          } else {}
        });

        update();
      }
    });
  }

  void updateRequestDonor(String requestDonor,String requestPatient) async{

    var response = await http.post(
        Uri.parse(
            'https://organdonationsa.000webhostapp.com/OrganDonation/update_request.php'),
        body: {
          'patientRequest': requestPatient,
          'donorRequest': requestDonor,
          // 'description': desc,
          // 'date': DateTime.now().toString()
        });

  }

}
