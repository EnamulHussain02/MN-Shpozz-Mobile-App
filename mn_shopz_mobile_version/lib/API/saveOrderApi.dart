import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mn_shopz_mobile_version/showOrder.dart';

class SaveOrder {
  Future<void> saveOrders(BuildContext context, String Payment, String prodId,String cusNumber,String total, String type)async {
    Map<String, dynamic> requestBody={
      "payment_via":Payment,
      "customer_number": cusNumber,
      "product_detail_id": prodId,
      "total": total
    };
    String requestBodyJson= json.encode(requestBody);
    final response =await http.post(
      Uri.parse('http://10.0.2.2:8080/home/setOrders'),
      headers: {
        'Content-Type':'application/json'
      },
      body: requestBodyJson,
    );
    Map<String, dynamic> responseBody =
    json.decode(response.body);

    var status = responseBody['status'];
    if(status=="200"){
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            height: 140,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 47),
                    decoration: BoxDecoration(),
                    child: Icon(Icons.check_circle, size: 50, color: Color(0xff067000))
                ),
                SizedBox(height: 14,),
                Container(
                    child: Text('Your Order Placed Successfully', style: TextStyle(color: Color(0xff3F3F57)))
                ),
              ],
            ),
          ),
          actions: [
            Center(
              child: Container(
                width: 245,
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xff03433B),
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.only(bottom: 30),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Orders(cusNumber: cusNumber,type: type)));
                  },
                  child: Text('Done', style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16)),
                ),
              ),
            ),
          ],
        )

      );

    }
  }
}