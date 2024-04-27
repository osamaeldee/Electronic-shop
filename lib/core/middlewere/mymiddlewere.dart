import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:untitled1/core/constant/routs.dart';
import 'package:untitled1/core/services/services.dart';

class Mymiddlewere extends GetMiddleware {
  int? get priority => 1;
  MyServices myServices = Get.find();
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('OnBording') == '1') {
      return const RouteSettings(name: AppRot.Logen);
    }
    return null;
  }
}
