// To parse this JSON data, do
//
//     final ordersEmpty = ordersEmptyFromJson(jsonString);

import 'dart:convert';

OrdersEmpty ordersEmptyFromJson(String str) => OrdersEmpty.fromJson(json.decode(str));

String ordersEmptyToJson(OrdersEmpty data) => json.encode(data.toJson());

class OrdersEmpty {
  List<Order> orders;

  OrdersEmpty({
    required this.orders,
  });

  factory OrdersEmpty.fromJson(Map<String, dynamic> json) => OrdersEmpty(
    orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
  };
}

class Order {
  double total;
  String paymentDate;
  String productImage;
  String prodTitel;
  int oId;
  String prodDesc1;

  Order({
    required this.total,
    required this.paymentDate,
    required this.productImage,
    required this.prodTitel,
    required this.oId,
    required this.prodDesc1,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    total: json["total"],
    paymentDate: json["payment_date"],
    productImage: json["product_image"],
    prodTitel: json["prod_titel"],
    oId: json["o_id"],
    prodDesc1: json["prod_desc1"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "payment_date": paymentDate,
    "product_image": productImage,
    "prod_titel": prodTitel,
    "o_id": oId,
    "prod_desc1": prodDesc1,
  };
}
