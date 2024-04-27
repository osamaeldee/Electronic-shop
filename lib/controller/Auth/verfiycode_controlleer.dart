// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import 'package:untitled1/core/constant/routs.dart';

abstract class verfiycodecontroller extends GetxController {
  chekcode();
  Gotoresetpassword();
}

// ignore: camel_case_types
class verfiycodecontrollerImp extends verfiycodecontroller {
  late String verfiyCode;
  @override
  Gotoresetpassword() {
    Get.offAllNamed(AppRot.resetPassword);
  }

  @override
  chekcode() {}
  @override
  void onInit() {
    super.onInit();
  }
}
