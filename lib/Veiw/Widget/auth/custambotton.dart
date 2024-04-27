import 'package:flutter/material.dart';
import 'package:untitled1/core/constant/Color.dart';

class CustomAuthButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const CustomAuthButton(
      {Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orangeAccent,
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
