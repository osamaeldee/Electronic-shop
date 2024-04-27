import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled1/controller/onbording_controller.dart';
import 'package:untitled1/core/constant/Color.dart';

class Custombutton extends GetView<onBordingcontrollerImp> {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          controller.next();
        },
        style: ElevatedButton.styleFrom(
          shadowColor: AppColors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
