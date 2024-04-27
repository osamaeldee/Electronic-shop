import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled1/core/constant/routs.dart';

abstract class forGetpasswordcontroller extends GetxController {
  chekemail();
  Gotoveryfilcode();
}

class forGetpasswordcontrollerImp extends forGetpasswordcontroller {
  late TextEditingController email;

  @override
  Gotoveryfilcode() {
    Get.offAllNamed(AppRot.verfiyCode);
  }

  @override
  chekemail() {}
  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
