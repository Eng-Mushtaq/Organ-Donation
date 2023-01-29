import 'package:get/get.dart';
import 'package:organdonation/controller/Donor/Donor_controller.dart';

import '../controller/Admin/admin_controller.dart';
import '../controller/Doctor/doctor_controller.dart';
import '../controller/Patinet/patient_request.dart';
import '../controller/home_controller.dart';
import '../controller/usercontroller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
    Get.lazyPut(() => AdminController(), fenix: true);
    Get.lazyPut(() => DoctorController(), fenix: true);
    Get.lazyPut(() => DonorController(), fenix: true);
    Get.lazyPut(() => PatientController(), fenix: true);
  }
}
