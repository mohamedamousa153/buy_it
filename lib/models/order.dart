import 'package:flutter/cupertino.dart';

class Order {
  int? totalPrice;
  String? address;
  Order({
    @required this.totalPrice,
    @required this.address,
  });
}
