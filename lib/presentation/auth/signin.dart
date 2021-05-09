import 'package:flutter/material.dart';
import 'package:newecommerce/constants.dart';
import 'package:newecommerce/services/services.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../mwidgets.dart';
import 'widgets.dart';
import 'reset.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var _hide;

  @override
  void initState() {
    _hide = true;
    super.initState();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacer(context, 110),
                      title('Welcome Back'),
                      spacer(context, 13),
                      welcometext(),
                      spacer(context, 40.0),
                      formtext('Email Address'),
                      spacer(context, 15),
                      Form(
                          key: _formKey,
                          child: Column(children: [
                            TextForme(
                              false,
                              controller: emailController,
                              validator: (val) {
                                return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(val)
                                    ? null
                                    : "Enter valid email address";
                              },
                              hinttext: "Email",
                              prefixicon: Icons.email_outlined,
                            ),
                            spacer(context, 20),
                            TextForme(
                              _hide,
                              controller: passwordController,
                              validator: (val) {
                                return val.length > 6
                                    ? RegExp("\\s+").hasMatch(val)
                                        ? "Illigal characters"
                                        : null
                                    : "Password too weak";
                              },
                              hinttext: "Password",
                              suffixicon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _hide = !_hide;
                                  });
                                },
                                icon: new Icon(_hide
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              prefixicon: Icons.lock,
                            ),
                          ])),
                      spacer(context, 20),
                      submitbutton(Text('Login'), spacer(context, 50),
                          () async {
                        if (_formKey.currentState.validate()) {
                          showSnack(context, Text('Please wait'), 3);
                          context
                              .read<FlutterFireAuthService>()
                              .signIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                  context: context)
                              .then((value) {
                            showSnack(context, Text('Welcome back'), 6);
                          });
                        }
                      }),
                      spacer(context, 20),
                      richbutton('Forget password? ', 'Reset here', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Reset()),
                        );
                      }),
                      spacer(context, 72),
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
                          showSnack(context, Text('Please wait'), 4);
                          context
                              .read<FlutterFireAuthService>()
                              .signInWithGoogle(context)
                              .then((value) {
                            showSnack(context, Text('Login Success'), 6);
                          });
                        },
                      ),
                      spacer(context, 4),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: richbutton('No account? ', 'create one', () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        }),
                      ),
                     
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
