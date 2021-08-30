import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/adminMode.dart';
import 'package:shop/Provider/modelHud.dart';
import 'package:shop/screens/admin/addProduct.dart';
import 'package:shop/screens/admin/adminhome.dart';
import 'package:shop/screens/admin/editProduct.dart';
import 'package:shop/screens/admin/manageProduct.dart';
import 'package:shop/screens/admin/odersScreen.dart';
import 'package:shop/screens/user/cartScreen.dart';
import 'package:shop/screens/user/homePage.dart';
import 'package:shop/screens/loginScreen.dart';
import 'package:shop/screens/signup_screen.dart';

import 'Provider/cardItem.dart';
import 'screens/user/productInfo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHUd>(
          create: (context) => ModelHUd(),
        ),
        ChangeNotifierProvider<CartItem>(
          create: (context) => CartItem(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Buy It',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginScreen.id,
        routes: {
          OrdersScreen.id: (context) => OrdersScreen(),
          CartScreen.id: (context) => CartScreen(),
          ProductInfo.id: (context) => ProductInfo(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomePage.id: (context) => HomePage(),
          AdminHome.id: (context) => AdminHome(),
          AddProduct.id: (context) => AddProduct(),
          ManageProduct.id: (context) => ManageProduct(),
          EditProduct.id: (context) => EditProduct(),
        },
      ),
    );
  }
}
