import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/Widget/auth/Text_Form_feild.dart';
import 'package:untitled1/Veiw/Widget/auth/castum_body.dart';
import 'package:untitled1/Veiw/Widget/auth/custambotton.dart';
import 'package:untitled1/controller/Auth/forgetcontroller.dart';

import 'package:untitled1/core/constant/Color.dart';

import 'package:untitled1/Veiw/Widget/auth/castm_tital.dart';
import 'package:untitled1/core/functions/vaildinput.dart';

class forGetpassWord extends StatelessWidget {
  const forGetpassWord({Key? key});

  @override
  Widget build(BuildContext context) {
    forGetpasswordcontrollerImp controller =
        Get.put(forGetpasswordcontrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'For Get password',
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
                  text: 'Chek your email',
                ),
                const SizedBox(
                  height: 10,
                ),
                custm_body(
                  text:
                      'An email will be sent to you. You must enter the correct email address and verify it!',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text_form_failed(
                  isNumber: false,
                  vild: (val) {
                    return vaildinput(val!, 8, 50, 'Email');
                  },
                  hintText: 'Enter Your Enail',
                  icon: Icons.email_outlined,
                  text: 'Email',
                  mycontroller: controller.email,
                ),
                SizedBox(
                  height: 23,
                ),
                CustomAuthButton(
                  onPressed: () {
                    controller.Gotoveryfilcode();
                  },
                  title: 'save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
