import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop/constans.dart';
import 'package:shop/models/product.dart';
import 'package:shop/services/store.dart';

class OrderDetails extends StatelessWidget {
  static String id = 'orderDetails';
  final Store _store = Store();
  @override
  Widget build(BuildContext context) {
    final documentId = ModalRoute.of(context)!.settings.arguments;
    print("document Id : $documentId");
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadOrderDetails(documentId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("snapshot.data!.docs : ${snapshot.data!.docs}");
              List<Product> products = [];
              for (var doc in snapshot.data!.docs) {
                var data = doc.data() as Map;
                print("data : $data");
                products.add(Product(
                  pName: data[kProductName],
                  pQuantity: data[kProductQuantity],
                  pCategory: data[kProductCategory],
                  pLocation: data[kProductLocation],
                  pPrice: data[kProductPrice],
                ));
              }
              print(products);
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .2,
                        color: KSecondaryColor,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Product Name : ${products[index].pName} ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Text("Quantity : ${products[index].pQuantity} ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Text("Price  : ${products[index].pPrice} ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              Text("Category: ${products[index].pCategory} ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("Loading Order Details"),
              );
            }
          }),
    );
  }
}
