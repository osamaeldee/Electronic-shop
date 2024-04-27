import 'package:flutter/material.dart';

class Sections extends StatelessWidget {
  final String text;
  final IconData iconData;

  const Sections({
    Key? key,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 100, 102, 101),
              borderRadius: BorderRadius.circular(50)),
          margin: const EdgeInsets.all(15),
          height: 50,
          width: 50,
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        )
      ],
    );
  }
}
