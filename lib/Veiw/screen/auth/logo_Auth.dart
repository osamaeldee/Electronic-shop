import 'package:flutter/material.dart';
import 'package:untitled1/core/constant/ImageAssets..dart';

class logo_Auth extends StatelessWidget {
  final double height;
  const logo_Auth({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAssets.logo,
      height: height,
    );
  }
}
