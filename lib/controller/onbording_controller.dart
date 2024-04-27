import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:untitled1/Data/datasource/static/static.dart';
import 'package:untitled1/core/constant/routs.dart';
import 'package:untitled1/core/services/services.dart';

abstract class OnboredingController extends GetxController {
  next();
  onPageChaned(
    int i,
  );
}

class onBordingcontrollerImp extends OnboredingController {
  int currendPage = 0;
  late PageController pageController;
  MyServices myaservices = Get.find();
  @override
  next() {
    currendPage++;
    if (currendPage > OnBordingList.length - 1) {
      myaservices.sharedPreferences.setString('OnBording', "1");

      Get.offAllNamed(AppRot.Logen);
    } else {
      pageController.animateToPage(
        currendPage,
        duration: Duration(
          milliseconds: 100,
        ),
        curve: Curves.bounceInOut,
      );
    }
  }

  @override
  onPageChaned(
    int i,
  ) {
    currendPage = i;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
