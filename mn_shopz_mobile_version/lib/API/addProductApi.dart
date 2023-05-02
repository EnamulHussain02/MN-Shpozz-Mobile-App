import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewProducts{
  Future<void> addNew(String name,String price,String quantity,String type,String color,String discount,String barcode,String image,String desc1,String desc2,String desc3,String desc4)async {
    Map<String, dynamic> requestBody= {
      'product_name':name,
      'product_price':price,
      'product_quantity': quantity,
      'product_type':type,
      'product_color':color,
      'product_discount':discount,
      'product_barcode': barcode,
      'product_image':image,
      'prod_desc1':desc1,
      'prod_desc2':desc2,
      'prod_desc3':desc3,
      'prod_desc4':desc4
    };
    String requestBodyJson = json.encode(requestBody);

    final response =await http.post(
      Uri.parse('http://10.0.2.2:8080/home/addNewProducts'),
      headers: {
        'Content-Type':'application/json'
      },
      body: requestBodyJson,
    );
  }
}