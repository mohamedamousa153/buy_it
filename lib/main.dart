import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop/screens/loginScreen.dart';
import 'package:shop/screens/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id : (context)=>LoginScreen(),
        SignupScreen.id : (context)=>SignupScreen(),
      },
    );
  }
}


