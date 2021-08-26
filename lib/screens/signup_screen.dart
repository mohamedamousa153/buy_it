import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/Provider/modelHud.dart';
import 'package:shop/constans.dart';
import 'package:shop/screens/loginScreen.dart';
import 'package:shop/services/auth.dart';
import 'package:shop/widgets/customTextField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'user/homePage.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = Auth();
  String? _email, _password, _name;

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
                  height: MediaQuery.of(context).size.height * .15,
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
              SizedBox(height: heigth * .12),
              CustomTextField(
                hint: 'Enter your name',
                icon: Icons.perm_identity,
                onClick: (value) {
                  _name = value;
                },
                // onClick: (value) {},
              ),
              SizedBox(height: heigth * .03),
              CustomTextField(
                hint: 'Enter your email',
                icon: Icons.email,
                onClick: (value) {
                  _email = value;
                },
                // onClick: (value) {

                // },
              ),
              SizedBox(height: heigth * .03),
              CustomTextField(
                hint: 'Enter your password',
                icon: Icons.lock,
                onClick: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: heigth * .06),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120.0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () async {
                    final modelhud =
                        Provider.of<ModelHUd>(context, listen: false);
                    modelhud.changeisLoading(true);
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      //
                      // print(_name);
                      // print(_email);
                      // print(_password);
                      try {
                        
                        await _auth.signUp(_email!, _password!);
                        modelhud.changeisLoading(false);
                        Navigator.pushNamed(context, HomePage.id);
                      } on PlatformException catch (e) {
                        modelhud.changeisLoading(false);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.message!),
                        ));
                      }
                    }
                    modelhud.changeisLoading(false);
                  },
                  color: Colors.black,
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              SizedBox(height: heigth * .05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do have an account ? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Login',
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
      ),
    );
  }
}
