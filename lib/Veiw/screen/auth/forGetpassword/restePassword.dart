import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/Widget/auth/castum_body.dart';
import 'package:untitled1/Veiw/Widget/auth/custambotton.dart';

import 'package:untitled1/controller/Auth/resetpassword_controller.dart';

import 'package:untitled1/core/constant/Color.dart';

import 'package:untitled1/Veiw/Widget/auth/castm_tital.dart';
import 'package:untitled1/core/functions/vaildinput.dart';

import '../../../Widget/auth/Text_Form_feild.dart';

class restepassword extends StatelessWidget {
  const restepassword({Key? key});

  @override
  Widget build(BuildContext context) {
    resetpasswordcontrollerImp controller =
        Get.put(resetpasswordcontrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'ResetPassword',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body: AnimationLimiter(
        child: Form(
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
                    text: 'New password',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const custm_body(
                    text: 'Please Enter New Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text_form_failed(
                    isNumber: false,
                    vild: (val) {
                      return vaildinput(val!, 5, 20, 'password');
                    },
                    hintText: 'Enter Your password',
                    icon: Icons.lock_clock_outlined,
                    text: 'New password',
                    mycontroller: controller.password,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text_form_failed(
                    isNumber: false,
                    vild: (val) {
                      return vaildinput(val!, 5, 20, 'password');
                    },
                    hintText: 'Enter Your Re password',
                    icon: Icons.lock_clock_outlined,
                    text: 'Re password',
                    mycontroller: controller.Repassword,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  CustomAuthButton(
                    onPressed: () {
                      controller.GotosuccessResetPassword();
                    },
                    title: 'save',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
