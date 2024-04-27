// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled1/core/constant/routs.dart';
import 'package:untitled1/main.dart';

abstract class Logninconteroller extends GetxController {
  lognin();
  Gotosingup();
  Gotoforgetpasswo();
}

// ignore: camel_case_types
class lognincontrollerImp extends Logninconteroller {
  static bool is_logged_in = false;

  GlobalKey<FormState> formstat = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController email;
  final iconData = Icons.lock_clock_outlined;
  bool isshowpassword = true;
  showpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  lognin() async {
    var formdata = formstat.currentState;
    if (formdata!.validate()) {
      try {
        await supabase.auth.signInWithPassword(
          password: password.text.trim(),
          email: email.text.trim(),
        );
        Get.offAllNamed(AppRot.Homepage);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('is_logged_in', true);
        return true;
      } on AuthException catch (error) {
        print(error);
        showDialog(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('The password or email is incorrect'),
              content: Text('can you go register'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
        return false;
      }
    } else {
      print('Not valid');
      return false;
    }
  }

  IconData icons() {
    if (isshowpassword == false) {
      return Icons.lock_open_outlined;
    } else {
      return Icons.lock_clock_outlined;
    }
  }

  @override
  Gotosingup() {
    Get.offAllNamed(AppRot.singUp);
  }

  @override
  onInit() {
    password = TextEditingController();
    email = TextEditingController();
    super.onInit();
  }

  @override
  dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void Gotoforgetpasswo() {
    Get.offAllNamed(AppRot.forgetPassword);
  }
}
