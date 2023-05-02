// To parse this JSON data, do
//
//     final productEmpty = productEmptyFromJson(jsonString);

import 'dart:convert';

ProductEmpty productEmptyFromJson(String str) => ProductEmpty.fromJson(json.decode(str));

String productEmptyToJson(ProductEmpty data) => json.encode(data.toJson());

class ProductEmpty {
  List<Products> product;

  ProductEmpty({
    required this.product,
  });

  factory ProductEmpty.fromJson(Map<String, dynamic> json) => ProductEmpty(
    product: List<Products>.from(json["product"].map((x) => Products.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "product": List<dynamic>.from(product.map((x) => x.toJson())),
  };
}

class Products {
  String productDescription;
  String productColor;
  String productImage;
  String productPrice;
  String productDiscount;
  String prodDesc1;
  String productName;
  String productBarcode;
  String prodDesc4;
  String prodDesc2;
  String prodTitel;
  String productType;
  String productId;
  String prodDesc3;
  String productQuantity;
  String productStarratting;

  Products({
    required this.productDescription,
    required this.productColor,
    required this.productImage,
    required this.productPrice,
    required this.productDiscount,
    required this.prodDesc1,
    required this.productName,
    required this.productBarcode,
    required this.prodDesc4,
    required this.prodDesc2,
    required this.prodTitel,
    required this.productType,
    required this.productId,
    required this.prodDesc3,
    required this.productQuantity,
    required this.productStarratting,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    productDescription: json["product_description"]?? "",
    productColor: json["product_color"]?? "",
    productImage: json["product_image"]?? "",
    productPrice: json["product_price"].toString()?? "",
    productDiscount: json["product_discount"].toString()?? "",
    prodDesc1: json["prod_desc1"]?? "",
    productName: json["product_name"]?? "",
    productBarcode: json["product_barcode"].toString()?? "",
    prodDesc4: json["prod_desc4"]?? "",
    prodDesc2: json["prod_desc2"]?? "",
    prodTitel: json["prod_titel"]?? "",
    productType: json["product_type"]?? "",
    productId: json["product_Id"].toString()?? "",
    prodDesc3: json["prod_desc3"]?? "",
    productQuantity: json["product_quantity"].toString()?? "",
    productStarratting: json["product_starratting"].toString()?? "",
  );

  Map<String, dynamic> toJson() => {
    "product_description": productDescription,
    "product_color": productColor,
    "product_image": productImage,
    "product_price": productPrice,
    "product_discount": productDiscount,
    "prod_desc1": prodDesc1,
    "product_name": productName,
    "product_barcode": productBarcode,
    "prod_desc4": prodDesc4,
    "prod_desc2": prodDesc2,
    "prod_titel": prodTitel,
    "product_type": productType,
    "product_Id": productId,
    "prod_desc3": prodDesc3,
    "product_quantity": productQuantity,
    "product_starratting": productStarratting,
  };
}
