import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled1/Data/datasource/static/static.dart';
import 'package:untitled1/controller/onbording_controller.dart';
import '../../../core/constant/Color.dart';

class customController extends StatelessWidget {
  const customController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<onBordingcontrollerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  OnBordingList.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 900),
                    margin: const EdgeInsets.only(right: 5),
                    width: controller.currendPage == index ? 20 : 5,
                    height: 6,
                    decoration: BoxDecoration(
                        color: AppColors.blueAccent,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ));
  }
}
