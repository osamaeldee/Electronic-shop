import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constant/routs.dart';
import 'package:untitled1/main.dart';

abstract class Sinincontroller extends GetxController {
  Future<bool> singup();
  void Gotologin();
}

class SinincontrollerImp extends Sinincontroller {
  GlobalKey<FormState> formstat = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  final iconData = Icons.lock_clock_outlined;
  bool isshowpassword = true;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  Gotologin() {
    Get.offAllNamed(AppRot.Logen);
  }

  IconData icons() {
    if (isshowpassword == false) {
      return Icons.lock_open_outlined;
    } else {
      return Icons.lock_clock_outlined;
    }
  }

  @override
  Future<bool> singup() async {
    var formdata = formstat.currentState;
    if (formdata!.validate()) {
      try {
        // التحقق من صحة البريد الإلكتروني
        if (!GetUtils.isEmail(email.text.trim())) {
          Get.snackbar('Invalid Email', 'Please enter a valid email address');
          return false;
        }

        // التحقق من قوة كلمة المرور
        if (password.text.trim().length < 8) {
          Get.snackbar(
              'Weak Password', 'Password must be at least 8 characters long');
          return false;
        }

        await supabase.auth.signUp(
          password: password.text.trim(),
          email: email.text.trim(),
          data: {'username': name.text.trim()},
        );
        Get.offAllNamed(AppRot.Success_signup);
        return true;
      } catch (e) {
        // التعامل مع الأخطاء
        Get.snackbar('Error', 'Error signing up: $e');
        return false;
      }
    } else {
      print('Not valid');
      return false;
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    name = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    super.dispose();
  }
}
