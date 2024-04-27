import 'package:flutter/material.dart';

class Text_form_failed extends StatelessWidget {
  final String hintText;
  final String text;
  final IconData icon;
  final IconData? icon2;
  final TextEditingController mycontroller;
  final String? Function(String?) vild;
  final bool isNumber;
  final bool? obscure;
  final void Function()? ontapicon;
  const Text_form_failed(
      {super.key,
      required this.hintText,
      required this.text,
      required this.icon,
      required this.mycontroller,
      required this.vild,
      required this.isNumber,
      this.obscure,
      this.ontapicon,
      this.icon2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: vild,
        style: const TextStyle(fontFamily: 'Romanesco Font'),
        controller: mycontroller,
        obscureText: obscure == null || obscure == false ? false : true,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 13, fontFamily: 'Eleven'),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          label: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(text),
          ),
          suffixIcon: InkWell(
            onTap: ontapicon,
            child: Icon(icon),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
      ),
    );
  }
}
