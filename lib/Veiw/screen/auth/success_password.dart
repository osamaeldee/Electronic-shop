import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/Veiw/Widget/auth/custambotton.dart';
import 'package:untitled1/controller/Auth/sinup_controller.dart';
import 'package:untitled1/core/constant/Color.dart';

class success extends StatelessWidget {
  const success({super.key});

  @override
  Widget build(BuildContext context) {
    SinincontrollerImp controller = Get.put(SinincontrollerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'The password has been changed',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColors.green),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.check_circle_outline,
              size: 300,
              color: AppColors.orangeAccent,
            ),
          ),
          const Text(
            'The password has been changed successfully',
            style: TextStyle(
                color: AppColors.orangeAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: CustomAuthButton(
              onPressed: () {
                controller.Gotologin();
              },
              title: 'Logn in!',
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
