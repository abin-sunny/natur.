import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newecommerce/presentation/auth/signin.dart';
import 'package:newecommerce/presentation/homepage/home.dart';
import 'package:provider/provider.dart';
import 'services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
   
    return MultiProvider(
      providers: [
        Provider<FlutterFireAuthService>(
          create: (_) => FlutterFireAuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<FlutterFireAuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
      
        theme: ThemeData(textTheme:GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        )),
        home: OpeningView(),
      ),
    );
  }
}

// WillPopScope

/////////////////////////
class OpeningView extends StatefulWidget {
  OpeningView({Key key}) : super(key: key);

  @override
  _OpeningViewState createState() => _OpeningViewState();
}

class _OpeningViewState extends State<OpeningView> {
  @override
  Widget build(BuildContext context) {
    
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print("Home View");
      return Home();
    }
    print("Not Authenticated");
    return SignIn();
  }
}
