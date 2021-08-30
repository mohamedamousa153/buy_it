import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop/constans.dart';
import 'package:shop/models/order.dart';
import 'package:shop/services/store.dart';

class OrdersScreen extends StatelessWidget {
  static String id = 'ordersScreen';
  final Store _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadOrders(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("There is no orders"));
          } else {
            ///
            //           try {
            //               if (doc[kProductCategory] == kJackets) {}
            ///
            List<Order> orders = [];
            for (var doc in snapshot.data!.docs) {
              var data = doc.data() as Map;

              orders.add(Order(
                  totalPrice: data[kProductPrice],
                  address: data[kProductLocation]));
            }
            return ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  return Text(orders[index].totalPrice.toString());
                });
          }
        },
      ),
    );
  }
}
