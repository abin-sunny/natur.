import 'package:flutter/material.dart';


const animationDuration = Duration(milliseconds: 200);

const appBarColor = Color(0xFFFFFFFF);
const titlecolor =Color.fromRGBO(99, 56, 32, 1.0);
const submitcolor =Color.fromRGBO(106, 147, 71, 1);
const presscolor =Color.fromRGBO(225, 160, 103, 1);
const bordercolor = Color.fromRGBO(247, 241, 234, 1,);
double objectsize(double value, BuildContext context,
        {bool fromHeight = false}) =>
    fromHeight
        ? value / 812 * MediaQuery.of(context).size.height
        : value / 375 * MediaQuery.of(context).size.width;

SizedBox spacer(BuildContext context, double value,
    {bool horizontal = false, bool fromHeight = true}) {
  return horizontal
      ? SizedBox(
          width: objectsize(value, context, fromHeight: fromHeight),
        )
      : SizedBox(
          height: objectsize(value, context, fromHeight: fromHeight),
        );
}



