import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/screen/auth/logo_Auth.dart';
import 'package:untitled1/controller/Auth/sinup_controller.dart';
import 'package:untitled1/core/constant/Color.dart';
import 'package:untitled1/Veiw/Widget/auth/Haveinaacount.dart';
import 'package:untitled1/Veiw/Widget/auth/castm_tital.dart';
import 'package:untitled1/Veiw/Widget/auth/castum_body.dart';

import 'package:untitled1/core/functions/alertexitapp.dart';
import 'package:untitled1/core/functions/vaildinput.dart';
import '../../Widget/auth/Text_Form_feild.dart';
import '../../Widget/auth/custambotton.dart';

class singUp extends StatelessWidget {
  const singUp({Key? key});

  @override
  Widget build(BuildContext context) {
    SinincontrollerImp controller = Get.put(SinincontrollerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Sign up',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColors.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertexitapp,
        child: AnimationLimiter(
          child: Form(
            key: controller.formstat,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
              child: ListView(
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    curve: Curves.easeInOutBack,
                    // easeInOutBack
                    verticalOffset: 1100.0,

                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    const logo_Auth(
                      height: 210,
                    ),
                    const custam_tital(
                      text: 'Welcome to our store',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const custm_body(
                      text:
                          "Create an account in our store to get the best offers",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text_form_failed(
                      isNumber: false,
                      vild: (val) {
                        return vaildinput(val!, 3, 10, 'name');
                      },
                      hintText: 'Enter Your name',
                      icon: Icons.person_outline,
                      text: 'name',
                      mycontroller: controller.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text_form_failed(
                      isNumber: false,
                      vild: (val) {
                        return vaildinput(val!, 8, 50, 'email');
                      },
                      hintText: 'Enter Your Email',
                      icon: Icons.email_outlined,
                      mycontroller: controller.email,
                      text: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<SinincontrollerImp>(
                      builder: (context) => Text_form_failed(
                        ontapicon: () {
                          controller.showpassword();
                        },
                        obscure: controller.isshowpassword,
                        isNumber: false,
                        vild: (val) {
                          return vaildinput(val!, 5, 20, 'password');
                        },
                        hintText: 'Enter your password',
                        icon: controller.icons(),
                        text: 'Enter your password',
                        mycontroller: controller.password,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomAuthButton(
                      onPressed: () {
                        controller.singup();
                      },
                      title: 'Sing In',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Have_in_acount(
                      text: "You already have an account",
                      text2: 'Long In?',
                      ontap: () {
                        controller.Gotologin();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
