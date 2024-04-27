// ignore_for_file: unnecessary_const

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/Veiw/screen/onbording.dart';
import 'package:untitled1/core/constant/ImageAssets..dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _width = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBording()),
        );
      }
    });
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      if (mounted && _width < MediaQuery.of(context).size.width) {
        setState(() {
          _width += 10;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: _width,
              child: Image.asset(
                AppImageAssets.logo,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Our Store!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
