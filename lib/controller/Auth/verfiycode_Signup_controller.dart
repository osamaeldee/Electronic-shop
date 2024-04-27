// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import 'package:untitled1/core/constant/routs.dart';

abstract class verfiycodesignupcontroller extends GetxController {
  chekcode();
  Gotosuccesssignup();
}

// ignore: camel_case_types
class verfiycodesignupcontrollerImp extends verfiycodesignupcontroller {
  late String verfiyCode;
  @override
  Gotosuccesssignup() {
    Get.offAllNamed(AppRot.Success_signup);
  }

  @override
  chekcode() {}
  @override
  void onInit() {
    super.onInit();
  }
}
