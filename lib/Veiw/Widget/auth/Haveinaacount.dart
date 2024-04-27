import 'package:flutter/material.dart';
import 'package:untitled1/core/constant/Color.dart';

class Have_in_acount extends StatelessWidget {
  final String text;
  final String text2;
  final void Function()? ontap;

  const Have_in_acount({
    Key? key,
    required this.text,
    required this.text2,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          SizedBox(
            width: 3,
          ),
          InkWell(
            onTap: ontap,
            child: Text(
              text2,
              style: TextStyle(
                color: AppColors.orangeAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
