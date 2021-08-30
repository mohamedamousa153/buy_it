import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop/constans.dart';
import 'package:shop/models/product.dart';

class Store {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  addProduct(Product product) {
    _fireStore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductCategory: product.pCategory,
      kProductLocation: product.pLocation,
      kProductPrice: product.pPrice,
    });
  }

  Stream<QuerySnapshot> loadProduct() {
    return _fireStore.collection(kProductsCollection).snapshots();
  }

  deleteProduct(documentId) {
    _fireStore.collection(kProductsCollection).doc(documentId).delete();
  }

  editProbuct(data, documentId) {
    _fireStore.collection(kProductsCollection).doc(documentId).update(data);
  }

  Stream<QuerySnapshot> loadProducts() {
    return _fireStore.collection(kProductsCollection).snapshots();
  }

  Stream<QuerySnapshot> loadOrders() {
    return _fireStore.collection(kOrders).snapshots();
  }

  storeOrders(data, List<Product> products) {
    var documentRef = _fireStore.collection(kOrders).doc();
    documentRef.set(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).doc().set({
        kProductName: product.pName,
        kProductPrice: product.pPrice,
        kProductQuantity: product.pQuantity,
        kProductLocation: product.pLocation
      });
    }
  }
}
