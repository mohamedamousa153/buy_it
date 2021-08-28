import 'package:flutter/material.dart';
import 'package:shop/constans.dart';
import 'package:shop/screens/admin/addProduct.dart';
import 'package:shop/screens/admin/manageProduct.dart';

class AdminHome extends StatefulWidget {
  static String id = 'AdminHome';

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KMainColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AddProduct.id);
              },
              child: Text('Add Product'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, ManageProduct.id);
              },
              child: Text('Edit Product'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('View Orders'),
            ),
          ],
        ));
  }
}
