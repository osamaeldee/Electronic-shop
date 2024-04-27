import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:untitled1/Veiw/Widget/onbording/Customsilder.dart';
import 'package:untitled1/Veiw/Widget/onbording/custombutton.dart';
import 'package:untitled1/Veiw/Widget/onbording/dotcontroller.dart';
import 'package:untitled1/controller/onbording_controller.dart';

class OnBording extends GetView<onBordingcontrollerImp> {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    controller.pageController;
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: CustomeSilderonbording(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  customController(),
                  Spacer(
                    flex: 2,
                  ),
                  Custombutton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
