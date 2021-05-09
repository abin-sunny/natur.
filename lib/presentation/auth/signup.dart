import 'package:flutter/material.dart';
import 'package:newecommerce/presentation/auth/widgets.dart';
import 'package:newecommerce/services/services.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../mwidgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  var _i;
  @override
  void initState() {
    _i = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        
        'Sign Up', [Icon(Icons.ac_unit)]),
      body: SafeArea(
          child: Container(
        child: CustomScrollView(reverse: true, slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(children: [
                spacer(context, 80),
                title('Create an account'),
                spacer(context, 15),
                welcometext(),
                spacer(context, 45),
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextForme(
                          false,
                          validator: (val) {
                            return val.length > 0 ? null : "Please enter name";
                          },
                          hinttext: "Name",
                          prefixicon: Icons.person,
                        ),
                        spacer(context, 20),
                        TextForme(
                          false,
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                ? null
                                : "Enter a valid email address";
                          },
                          controller: emailcontroller,
                          hinttext: "Email",
                          prefixicon: Icons.email,
                        ),
                        spacer(context, 20),
                        TextForme(
                          _i,
                          validator: (val) {
                            return val.length > 6
                                ? RegExp("\\s+").hasMatch(val)
                                    ? "Illigal character"
                                    : null
                                : "Password too weak";
                          },
                          controller: passwordcontroller,
                          hinttext: "Password",
                          suffixicon: IconButton(
                            onPressed: () {
                              setState(() {
                                _i = !_i;
                              });
                            },
                            icon: new Icon(
                                _i ? Icons.visibility : Icons.visibility_off),
                          ),
                          prefixicon: Icons.lock,
                        ),
                        spacer(context, 20),
                      ],
                    )),
                spacer(context, 20),
                submitbutton(Text('Sign Up'), spacer(context, 50), () async {
                  if (_formkey.currentState.validate()) {
                    showSnack(context, Text('Please Wait'), 3);
                    context.read<FlutterFireAuthService>().signUp(
                          email: emailcontroller.text.trim(),
                          password: passwordcontroller.text.trim(),
                          name: namecontroller.text.trim(),
                          context: context,
                        ).then((value) {showSnack(context, Text('Welcome'), 2);});
                  }
                }),
                spacer(context, 70),
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Or Login with',
                      style: TextStyle(fontSize: 15),
                    )),
                spacer(context, 40),
                googlebutton(
                  Text('Sign in with Google'),
                  11,
                  () async {
                    showSnack(context, Text('Please wait'),4);
                    context
                        .read<FlutterFireAuthService>()
                        .signInWithGoogle(context).then((value) {showSnack(context, Text('SignIn success'),3);});
                  },
                ),
                spacer(context, 5),
                richbutton('Already have an account? ', 'sign in', () {
                  Navigator.pop(context);
                })
                ,spacer(context, 5)
              ]),
            ),
          )
        ]),
      )),
    );
  }
}
