import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import "package:flutter/services.dart";
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop/Provider/adminMode.dart';
import 'package:shop/Provider/modelHud.dart';
import 'package:shop/constans.dart';
import 'package:shop/screens/signup_screen.dart';
import 'package:shop/services/auth.dart';
import 'package:shop/widgets/customTextField.dart';

import 'admin/adminhome.dart';
import 'user/homePage.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isAdmin = false;
  final _auth = Auth();
  final adminpassword = "admin1234";
  bool? isRememberMe = false;
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    double heigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHUd>(context).isLoading,
        child: Form(
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
              SizedBox(height: heigth * .1),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Theme(
                      data: ThemeData(unselectedWidgetColor: Colors.white),
                      child: Checkbox(
                          checkColor: KSecondaryColor,
                          activeColor: KMainColor,
                          value: isRememberMe,
                          onChanged: (value) {
                            setState(() {
                              isRememberMe = value;
                            });
                          }),
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(height: heigth * .05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    if (isRememberMe == true) {
                      keepUserLoginIn();
                    }
                    _validate(context);
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Provider.of<AdminMode>(context, listen: false)
                            .changeIsAdmin(true);
                      },
                      child: Text(
                        'I’m an admin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Provider.of<AdminMode>(context).isAdmin
                                ? KMainColor
                                : Colors.white),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Provider.of<AdminMode>(context, listen: false)
                            .changeIsAdmin(false);
                      },
                      child: Text(
                        'I’m an user',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Provider.of<AdminMode>(context).isAdmin
                                ? Colors.white
                                : KMainColor),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelhud = Provider.of<ModelHUd>(context, listen: false);
    modelhud.changeisLoading(true);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        if (_password == adminpassword) {
          print(adminpassword);
          try {
            await _auth.signIn(_email!, _password!);
            Navigator.pushNamed(context, AdminHome.id);
          } on FirebaseException catch (e) {
            modelhud.changeisLoading(false);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(e.message!),
            ));
          }
        } else {
          modelhud.changeisLoading(false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Something went wrong"),
          ));
        }
      } else {
        try {
          await _auth.signIn(_email!, _password!);
          Navigator.pushNamed(context, HomePage.id);
        } on FirebaseException catch (e) {
          modelhud.changeisLoading(false);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message!),
          ));
        }
      }
    }
    modelhud.changeisLoading(false);
  }

  void keepUserLoginIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setBool(kIsRememberMe, true);
  }
}
