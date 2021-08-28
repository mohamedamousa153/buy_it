import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/services/store.dart';
import 'package:shop/widgets/customTextField.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  late String _name, _price, _description, _category, _imageLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomTextField(
                  hint: 'Product name',
                  icon: Icons.shopping_bag,
                  onClick: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Product price',
                  icon: Icons.shopping_bag,
                  onClick: (value) {
                    _price = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Product category',
                  icon: Icons.shopping_bag,
                  onClick: (value) {
                    _category = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Product description',
                  icon: Icons.shopping_bag,
                  onClick: (value) {
                    _description = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Product Location',
                  icon: Icons.shopping_bag,
                  onClick: (value) {
                    _imageLocation = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      _store.addProduct(Product(
                          pName: _name,
                          pCategory: _category,
                          pDescription: _description,
                          pLocation: _imageLocation,
                          pPrice: _price));
                    }
                  },
                  child: Text('Add Product'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
