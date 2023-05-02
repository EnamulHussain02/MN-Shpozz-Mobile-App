import 'dart:convert';

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
    required this.products,
  });

  List<Product> products;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    required this.prodDesc4,
    required this.productType,
    required this.productDescription,
    required this.productDiscount,
    required this.productPrice,
    required this.productImage,
    required this.productQuantity,
    required this.productBarcode,
    required this.prodDesc1,
    required this.prodDesc2,
    required this.prodDesc3,
    this.productStatus,
    required this.productColor,
    required this.productName,
    required this.productId,
    required this.prodTitel,
    required this.productStarratting,
  });

  String prodDesc4;
  String productType;
  String productDescription;
  String productDiscount;
  String productPrice;
  String productImage;
  String productQuantity;
  String productBarcode;
  String prodDesc1;
  String prodDesc2;
  String prodDesc3;
  String? productStatus;
  String productColor;
  String productName;
  String productId;
  String prodTitel;
  String productStarratting;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    prodDesc4: json["prod_desc4"]?? "",
    productType: json["product_type"]?? "",
    productDescription: json["product_description"]?? "",
    productDiscount: json["product_discount"].toString() ?? "",
    productPrice: json["product_price"].toString() ?? "",
    productImage: json["product_image"]?? "",
    productQuantity: json["product_quantity"].toString() ?? "",
    productBarcode: json["product_barcode"].toString() ?? "",
    prodDesc1: json["prod_desc1"]?? "",
    prodDesc2: json["prod_desc2"]?? "",
    prodDesc3: json["prod_desc3"]?? "",
    productStatus: json["product_status"]?? "",
    productColor: json["product_color"]?? "",
    productName: json["product_name"]?? "",
    productId: json["product_Id"].toString() ?? "",
    prodTitel: json["prod_titel"]?? "",
    productStarratting: json["product_starratting"].toString() ?? "",
  );

  Map<String, dynamic> toJson() => {
    "prod_desc4": prodDesc4,
    "product_type": productType,
    "product_description": productDescription,
    "product_discount": productDiscount,
    "product_price": productPrice,
    "product_image": productImage,
    "product_quantity": productQuantity,
    "product_barcode": productBarcode,
    "prod_desc1": prodDesc1,
    "prod_desc2": prodDesc2,
    "prod_desc3": prodDesc3,
    "product_status": productStatus,
    "product_color": productColor,
    "product_name": productName,
    "product_Id": productId,
    "prod_titel": prodTitel,
    "product_starratting": productStarratting,
  };
}
