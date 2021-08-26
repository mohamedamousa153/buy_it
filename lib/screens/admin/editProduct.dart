import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/services/store.dart';

class EditProduct extends StatefulWidget {
  static String id = 'EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
        future: _store.loadProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  Text(snapshot.data![index].pName),
              itemCount: snapshot.data!.length,
            );
          } else {
            return Center(
              child: Text("Loading....."),
            );
          }
        },
      ),
    );
  }
}
