import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/constans.dart';
import 'package:shop/models/product.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addProduct(Product product) {
    _firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductCategory: product.pCategory,
      kProductLocation: product.pLocation,
      kProductPrice: product.pPrice,
    });
  }
    Future<List<Product>> loadProduct() async
  { 
   var snapshot = await _firestore.collection(kProductsCollection).get();
   List<Product> products = [];
   for (var doc in snapshot.docs)
   {
     var data = doc.data;
     products.add(Product(pName: data()[kProductName],
      pCategory: data()[kProductCategory],
      pDescription: data()[kProductDescription], 
     pLocation: data()[kProductLocation],
      pPrice: data()[kProductPrice]));
     
   }
   return products;
  }
}


