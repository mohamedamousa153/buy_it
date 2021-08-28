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

  Stream<QuerySnapshot> loadProduct() {
    return _firestore.collection(kProductsCollection).snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection(kProductsCollection).doc(documentId).delete();
  }

  editProbuct(data,documentId) {
    _firestore.collection(kProductsCollection).doc(documentId).update(data);
  }
}
