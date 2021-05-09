import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newecommerce/constants.dart';
import 'package:newecommerce/presentation/homepage/widgsets.dart';
import 'package:newecommerce/presentation/mwidgets.dart';
import 'package:path/path.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _imag;
  Future getImage() async {
    // ignore: invalid_use_of_visible_for_testing_member
    await ImagePicker.platform
        .pickImage(
            maxHeight: 400,
            maxWidth: double.infinity,
            source: ImageSource.gallery)
        .then((image) async {
      if (image != null) {
        setState(() {
          _imag = File(image.path);
          print('Image Path ${_imag.path}');
        });
        String filename = basename(_imag.path);
        var user = FirebaseAuth.instance.currentUser.uid;
        final storage = FirebaseStorage.instance.ref(user).child(
              filename,
            );
        UploadTask uploadTask = storage.putFile(_imag);

        var url = await (await uploadTask).ref.getDownloadURL();
        var dowurl = url.toString();
        FirebaseAuth.instance.currentUser.updateProfile(photoURL: dowurl);
      }
    });
  }



  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController citycontroller = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  tests() async {
    final userdocs = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    print(userdocs.data());
    setState(() {
 namecontroller.text=userdocs.data()["text"];
 addresscontroller.text=userdocs.data()["Address"];
  codeController.text=userdocs.data()["Postel Code"];
  citycontroller.text=userdocs.data()["State"];

    });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appbarr(
        'Profile',
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        [Icon(Icons.email_outlined, color: Colors.transparent)],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacer(context, 30),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: "hero",
                  child: StreamBuilder(
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return circleAvatar(objectsize(75, context),
                          child: Container(
                            height: 160,
                            width: 160,
                            alignment: Alignment.bottomRight,
                            child: Theme(
                              data: ThemeData(accentColor: presscolor),
                              child: FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  
                                  getImage().then((value) {showSnack(context, Text('Profile picture updated'),.5);});
                                },
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ),
              spacer(context, 37),
              formttext('Full Name'),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser.uid)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: new CircularProgressIndicator());
                        }
                             return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextForme(
                        false,
                        controller: namecontroller,
                        validator: (val) {
                          return val.length > 0 ? null : "Please enter name";
                        },
                       
                        prefixicon: Icons.person,
                      ),
                      spacer(context, 15),
                      formttext('Street Address'),
                      spacer(context, 15),
                      TextForme(
                        false,
                        controller: addresscontroller,
                        validator: (val) {
                          return val.length > 0 ? null : "Enter Address";
                        },
                       
                        prefixicon: Icons.house_sharp,
                      ),
                      spacer(context, 15),
                      formttext('State/City'),
                      spacer(context, 15),
                      TextForme(
                        false,
                        controller: citycontroller,
                        validator: (val) {
                          return val.length > 0 ? null : "Enter City";
                        },
                       
                        prefixicon: Icons.location_city,
                      ),
                      spacer(context, 15),
                      formttext('Postel Code'),
                      spacer(context, 15),
                      TextForme(
                        false,
                        controller: codeController,
                        validator: (val) {
                          return val.length > 0 ? null : "Enter Postel Code";
                        },
                        
                        prefixicon: Icons.local_post_office,
                      ),
                    ],
                  ),
                            );}
              ),
              spacer(context, 20),
        
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: cart(Text('Save'), 22, () async {
                  if (_formKey.currentState.validate()) {
                    Navigator.pop(context);
                    showSnack(context, Text('Address updated successfully'),2);
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .set({
                      'text': namecontroller.text,
                      'Address': addresscontroller.text,
                      'State': citycontroller.text,
                      'Postel Code': codeController.text
                    }, SetOptions(merge: true));
                  }
                }),
              ),
              
            ],
          ),
        ),
      )),
    );
  }
}
