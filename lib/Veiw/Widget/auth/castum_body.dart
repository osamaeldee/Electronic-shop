import 'package:flutter/material.dart';
import 'package:untitled1/core/constant/Color.dart';

class custm_body extends StatelessWidget {
  final String text;
  const custm_body({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Romanesco Font',
          color: AppColors.grey,
        ),
      ),
    );
  }
}
