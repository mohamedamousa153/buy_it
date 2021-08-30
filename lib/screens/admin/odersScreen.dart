import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop/constans.dart';
import 'package:shop/models/order.dart';
import 'package:shop/screens/admin/orderDetails.dart';
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
            List<Order> orders = [];
            for (var doc in snapshot.data!.docs) {
              var data = doc.data() as Map;

              orders.add(
                Order(
                    totalPrice: data[kProductPrice],
                    address: data[kProductLocation],
                    documentId: doc.id),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, OrderDetails.id,
                                  arguments: orders[index].documentId);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .2,
                              color: KSecondaryColor,
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total Price = \$ ${orders[index].totalPrice}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Address is : ${orders[index].address}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          style:
                              TextButton.styleFrom(backgroundColor: KMainColor),
                          child: Text(
                            "delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          style:
                              TextButton.styleFrom(backgroundColor: KMainColor),
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
