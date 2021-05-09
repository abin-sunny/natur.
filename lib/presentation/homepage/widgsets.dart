import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newecommerce/constants.dart';

Widget tile(title, ontap) {
  return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          ),
          onTap: ontap,
          tileColor: Color.fromRGBO(247, 241, 225, 1)));
}

Widget search() {
  return TextField(
    maxLines: 1,
    onTap: () {},
    decoration: InputDecoration(
      hintText: 'Search for products',
      prefixIcon:
          // Icon(Icons.ac_unit),
          Image.asset('assets/icons/Ellipse.png'),
      suffixIcon:
          // Icon(Icons.ac_unit),
          Image.asset('assets/icons/micon.png'),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(
              color: Color.fromRGBO(
            247,
            241,
            234,
            1,
          ))),
    ),
  );
}

Widget appbarr(title, leading, action) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 21, color: titlecolor),
    ),
    centerTitle: true,
    leading: leading,
    actions: action,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

Widget circleAvatar(radius, {child}) {
  User user = FirebaseAuth.instance.currentUser;
  return CircleAvatar(
      backgroundImage: user.photoURL != null
          ? NetworkImage(user.photoURL)
          : AssetImage("assets/icons/avatar.png"),
      backgroundColor: Colors.grey[200],
      radius: radius,
      child: child);
}

Widget formttext(String text) {
  return Text(
    text,
    style: TextStyle(
      color: titlecolor,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget feilds(hinttext,) {
  return TextField(
    maxLines: 1,
    onTap: () {},
    decoration: InputDecoration(
      hintText: hinttext,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(
              color: Color.fromRGBO(
            247,
            241,
            234,
            1,
          ))),
    ),
  );
}
Widget profileimag(radius,{child}) {
  User user = FirebaseAuth.instance.currentUser;
  return CircleAvatar(
          
      backgroundImage: user.photoURL != null
          ? NetworkImage(user.photoURL)
          : AssetImage("assets/icons/avatar.png"),
      backgroundColor: Colors.grey[200],
      radius: radius,
      child: child
    );
     
}