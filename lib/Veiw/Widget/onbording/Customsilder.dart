import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:untitled1/Data/datasource/static/static.dart';
import 'package:untitled1/controller/onbording_controller.dart';

class CustomeSilderonbording extends GetView<onBordingcontrollerImp> {
  const CustomeSilderonbording({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (
        val,
      ) {
        controller.onPageChaned(
          val,
        );
      },
      itemCount: OnBordingList.length,
      itemBuilder: (
        context,
        i,
      ) =>
          Column(
        children: [
          const SizedBox(),
          Image.asset(
            OnBordingList[i].Image!,
            width: double.infinity,
            height: 300,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(OnBordingList[i].tital!,
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(
            height: 60,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(OnBordingList[i].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      ),
    );
  }
}
