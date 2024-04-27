import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/Widget/auth/castum_body.dart';
import 'package:untitled1/controller/Auth/verfiycode_controlleer.dart';
import 'package:untitled1/core/constant/Color.dart';
import 'package:untitled1/Veiw/Widget/auth/castm_tital.dart';

class verfiycode extends StatelessWidget {
  const verfiycode({Key? key});

  @override
  Widget build(BuildContext context) {
    verfiycodecontrollerImp controller = Get.put(verfiycodecontrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Verification Code',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body: AnimationLimiter(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
          child: ListView(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                curve: Curves.easeInOutBack,
                // easeInOutBack
                horizontalOffset: 1000,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                const custam_tital(
                  text: 'Chek your code',
                ),
                const SizedBox(
                  height: 10,
                ),
                const custm_body(
                  text: 'Enter the code sent via email',
                ),
                const SizedBox(
                  height: 40,
                ),
                OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(10),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      controller.Gotoresetpassword();
                    }),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
