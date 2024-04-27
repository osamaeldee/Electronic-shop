import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled1/core/constant/routs.dart';

abstract class resetpasswordcontroller extends GetxController {
  resetpassword();
  GotosuccessResetPassword();
}

class resetpasswordcontrollerImp extends resetpasswordcontroller {
  late TextEditingController password;
  late TextEditingController Repassword;
  GlobalKey<FormState> formstat = GlobalKey<FormState>();

  @override
  GotosuccessResetPassword() {
    Get.offAllNamed(AppRot.success);
  }

  @override
  resetpassword() {
    var formdata = formstat.currentState;
    if (formdata!.validate()) {
      Get.delete<resetpasswordcontrollerImp>();
    } else {
      print('Not vaild');
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    Repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    Repassword.dispose();

    super.dispose();
  }
}
