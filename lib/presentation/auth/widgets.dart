import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newecommerce/constants.dart';

// class Form extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Form(

//     );
//   }
// }



Widget richbutton(text, text2, resetpassword) {
  return Center(
    child: RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(color: Color.fromRGBO(99, 56, 32, 1.0)),
          children: [
            TextSpan(
                text: text2,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color.fromRGBO(105, 121, 248, 1)),
                recognizer: TapGestureRecognizer()..onTap = resetpassword)
          ]),
    ),
  );
}

Widget googlebutton(
  final text,
  height,
  onpressed,
) {
  return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton.icon(
          icon: Image.asset('assets/icons/Vector.png'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(presscolor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ))),
          onPressed: onpressed,
          label: text));
}

Widget welcometext() {
  return Text(
    "Signing up or register to see\nour top picks for you",
    style: TextStyle(
        color: Color.fromRGBO(99, 56, 32, 1.0),
        fontSize: 17,
        fontWeight: FontWeight.w300),
  );
}

Widget title(String title) {
  return Text(
    title,
    style: TextStyle(
      color: titlecolor,
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget formtext(String text) {
  return Text(
    text,
    style: TextStyle(
      color: titlecolor,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget submitbutton(
  final text,
  height,
  onpressed,
) {
  return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(submitcolor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ))),
        child: text,
      ));
}

class Forms extends StatefulWidget {
  final prefixicon,
      controller,
      isdense,
      suffixicon,
      obscuretext,
      onchanged,
      hinttext;

  const Forms(
    this.obscuretext,
    this.onchanged, {
    this.isdense,
    this.prefixicon,
    this.suffixicon,
    this.hinttext,
    this.controller,
  });

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,

      // obscureText: obscuretext,
      maxLines: 1,
      onTap: () {},
      decoration: InputDecoration(
        isDense: widget.isdense,
        hintText: widget.hinttext,
        prefixIcon: widget.prefixicon,
        suffixIcon: widget.suffixicon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.grey[400], width: 1)),
      ),
    );
  }
}

AppBar appbar(final title, icon) {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 17,
        color: titlecolor,
      ),
    ),
  );
}
