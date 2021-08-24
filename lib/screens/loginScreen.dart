import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/constans.dart';
import 'package:shop/screens/signup_screen.dart';
import 'package:shop/services/auth.dart';
import 'package:shop/widgets/customTextField.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: Container(
                height: MediaQuery.of(context).size.height * .20,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/icons/buyicon.png'),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Text(
                        'Buy it',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: heigth * .13),
            CustomTextField(
              hint: 'Enter your email',
              icon: Icons.email,
              onClick: (value) {
                _email = value;
              },
            ),
            SizedBox(height: heigth * .03),
            CustomTextField(
              hint: 'Enter your password',
              icon: Icons.lock,
              onClick: (value) {
                _password = value;
              },
            ),
            SizedBox(height: heigth * .08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Auth().signIn(_email!, _password!);

                    // print(_email);
                    // print(_password);
                  }
                },
                color: Colors.black,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(height: heigth * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account ? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
