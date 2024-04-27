import 'package:get/get.dart';
import 'package:untitled1/Veiw/screen/auth/Login.dart';
import 'package:untitled1/Veiw/screen/auth/SingIn.dart';
import 'package:untitled1/Veiw/screen/auth/forGetpassword/forgetpassword.dart';
import 'package:untitled1/Veiw/screen/auth/forGetpassword/restePassword.dart';
import 'package:untitled1/Veiw/screen/auth/success_password.dart';
import 'package:untitled1/Veiw/screen/auth/success_sinup.dart';
import 'package:untitled1/Veiw/screen/auth/forGetpassword/verfiycode.dart';
import 'package:untitled1/Veiw/screen/home/homepage.dart';

import 'package:untitled1/Veiw/screen/onbording.dart';
import 'package:untitled1/Veiw/screen/splash_screen.dart';
import 'package:untitled1/core/constant/routs.dart';
import 'package:untitled1/core/middlewere/mymiddlewere.dart';

List<GetPage> pages = [
  GetPage(name: AppRot.SplashScreen, page: () => SplashScreen()),
  GetPage(
    name: '/',
    page: () => OnBording(),
    middlewares: [
      Mymiddlewere(),
    ],
  ),
  GetPage(
    name: AppRot.sigup,
    page: () => const OnBording(),
  ),
  GetPage(
    name: AppRot.Logen,
    page: () => Logen(),
  ),
  GetPage(
    name: AppRot.singUp,
    page: () => const singUp(),
  ),
  GetPage(
    name: AppRot.forgetPassword,
    page: () => const forGetpassWord(),
  ),
  GetPage(
    name: AppRot.verfiyCode,
    page: () => const verfiycode(),
  ),
  GetPage(
    name: AppRot.resetPassword,
    page: () => const restepassword(),
  ),
  GetPage(
    name: AppRot.success,
    page: () => const success(),
  ),
  GetPage(
    name: AppRot.Success_signup,
    page: () => const Success_signup(),
  ),
  GetPage(
    name: AppRot.Homepage,
    page: () => Homepage(),
  ),
];
