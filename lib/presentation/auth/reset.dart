import 'package:flutter/material.dart';
import '../../constants.dart';
import 'package:newecommerce/services/services.dart';
import '../mwidgets.dart';
import 'widgets.dart';
import 'package:provider/provider.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('', null),
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
                      spacer(context, 112),
                      title('Reset Password'),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 50),
                        child: Text(
                          'checkout the email containing password reset link',
                          style: TextStyle(
                            color: Color.fromRGBO(99, 56, 32, 1.0),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      formtext('Email'),
              
                      Form(
                          key: _formKey,
                          child: TextForme(
                            false,
                            controller: emailController,
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Enter a valid email address";
                            },
                            hinttext: "Email",
                            prefixicon: Icons.email,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: submitbutton(
                          Text('Sent request'),
                          objectsize(50, context),
                          () async {
                            if (_formKey.currentState.validate()) {
                              context
                                  .read<FlutterFireAuthService>()
                                  .resetPassword(emailController.text.trim()).then((value){showSnack(context, Text('Please check your email'), 2);});
                            }
                          },
                        ),
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
