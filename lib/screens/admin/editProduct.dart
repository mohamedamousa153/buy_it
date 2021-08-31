import 'package:flutter/material.dart';
import 'package:shop/constans.dart';
import 'package:shop/models/product.dart';
import 'package:shop/services/store.dart';
import 'package:shop/widgets/customTextField.dart';

class EditProduct extends StatefulWidget {
  static String id = 'EditProduct';
  

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
    final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();
  late String _name, _price, _description, _category, _imageLocation;
  @override
  Widget build(BuildContext context) {
  

    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    
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
                  initialvalue: product.pName,
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
                  initialvalue: product.pPrice,
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
                  initialvalue: product.pCategory,
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
                  initialvalue: product.pDescription,
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
                  initialvalue: product.pLocation,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      _store.editProbuct((
                        {kProductName:_name,
                         kProductDescription:_description,
                         kProductPrice:_price,
                         kProductCategory:_category,
                         kProductLocation:_imageLocation,
                         }

                          
                      ), product.pID);
                    }
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('Successfully Updated'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                  },
                  child: Text('Update Product'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
