import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:untitled1/Veiw/Widget/auth/Haveinaacount.dart';
import 'package:untitled1/Veiw/Widget/auth/castm_tital.dart';
import 'package:untitled1/Veiw/Widget/auth/castum_body.dart';

import 'package:untitled1/Veiw/screen/auth/logo_Auth.dart';
import 'package:untitled1/controller/Auth/logen_controller.dart';
import 'package:untitled1/core/functions/vaildinput.dart';
import 'package:untitled1/main.dart';

import '../../../core/constant/Color.dart';

import '../../../core/functions/alertexitapp.dart';
import '../../Widget/auth/Text_Form_feild.dart';
import '../../Widget/auth/custambotton.dart';

class Logen extends StatelessWidget {
  const Logen({Key? key});

  Future<void> sinup() async {
    lognincontrollerImp controller = Get.put(lognincontrollerImp());

    try {
      await supabase.auth.signInWithPassword(
        password: controller.password.text.trim(),
        email: controller.email.text.trim(),
      );
    } on AuthApiException catch (_) {
      print(_);
    }
  }

  @override
  Widget build(BuildContext context) {
    lognincontrollerImp controller = Get.put(lognincontrollerImp());
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
                child: ListView(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 500),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      curve: Curves.easeInOutBack,
                      horizontalOffset: 1000.0,
                      verticalOffset: 1000.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      const logo_Auth(
                        height: 160,
                      ),
                      const custam_tital(
                        text: 'Welcome Bake',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const custm_body(
                        text:
                            "Sign In With Your Email, And Password OR Continue With Soecial Media.",
                      ),
                      const SizedBox(
                        height: 20,
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
                        text: 'Email',
                        mycontroller: controller.email,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<lognincontrollerImp>(
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
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomAuthButton(
                        onPressed: () async {
                          controller.lognin();
                          print(lognincontrollerImp.is_logged_in);
                          try {
                            await sinup();
                          } on AuthException catch (error) {
                            print(error);
                          }
                        },
                        title: 'Sing In',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Have_in_acount(
                        text: "You don't have an account",
                        text2: 'registering?',
                        ontap: () {
                          controller.Gotosingup();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
