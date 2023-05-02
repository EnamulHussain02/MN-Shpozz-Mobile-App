import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modal/productModal.dart';


class Products{
  Future <ProductDetails> getProducts() async{
    final response =await http.post(Uri.parse('http://10.0.2.2:8080/home/products'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.body);
    return ProductDetails.fromJson(jsonDecode(response.body));

  }


}