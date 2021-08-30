import 'package:flutter/cupertino.dart';

class Order {
  String? documentId;
  int? totalPrice;
  String? address;
  Order({
    @required this.documentId,
    @required this.totalPrice,
    @required this.address,
  });
}
