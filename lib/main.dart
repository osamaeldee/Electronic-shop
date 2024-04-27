// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/Veiw/jason/Jason.dart';
import 'package:untitled1/Veiw/jason/URL.dart';
import 'package:untitled1/Veiw/screen/home/homepage.dart';
import 'package:untitled1/controller/onbording_controller.dart';
import 'package:untitled1/core/constant/Color.dart';
import 'package:untitled1/core/services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:untitled1/routes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: URL.url,
    anonKey: URL.anonKey,
  );
  Get.put(MyServices());
  await initialServices();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProviderProducts(),
      child: const MyApp(),
    ),
  );
}

Future<void> initialServices() async {
  Get.find<MyServices>().init();
}

final supabase = Supabase.instance.client;
bool isLoggedIn = supabase.auth.currentUser != null;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(onBordingcontrollerImp());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.2,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26.2,
          ),
          bodyText1: TextStyle(
            height: 2,
            color: AppColors.greyShade900,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
      getPages:
          isLoggedIn ? [GetPage(name: '/', page: () => Homepage())] : pages,
    );
  }
}
