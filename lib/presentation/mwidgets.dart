import 'package:flutter/material.dart';

import '../constants.dart';

class TextForme extends StatelessWidget {
  final prefixicon, suffixicon, obscuretext, hinttext, controller, validator;

  const TextForme(
    this.obscuretext, {
    this.validator,
    this.controller,
    this.prefixicon,
    this.suffixicon,
    this.hinttext,
  });

  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      controller: controller,
      validator: validator,
      maxLines: 1,
      onTap: () {},
      decoration: InputDecoration(
        hintText: hinttext,
        prefixIcon: Icon(
          prefixicon,
        ),
        suffixIcon: suffixicon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.grey[350])),
      ),
    );
  }
}

showSnack(BuildContext context, final message,final seconds) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: seconds),
    backgroundColor: presscolor,
    content: message,
  ));
}

Widget cart(
  final text,
  height,
  onpressed,
) {
  return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton.icon(
          icon: Icon(
            Icons.email_outlined,
            color: Colors.transparent,
            size: .1,
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ))),
          onPressed: onpressed,
          label: text));
}
