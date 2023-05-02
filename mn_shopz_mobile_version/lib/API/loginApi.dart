import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../landing.dart';
import '../main.dart';

class Login{
Future<void> checkLogin(BuildContext context,String number, String password)async {

  Map<String, dynamic> requestBody= {
    'cnumber':number,
    'cpassword':password
  };
  String requestBodyJson = json.encode(requestBody);

  final response =await http.post(
    Uri.parse('http://10.0.2.2:8080/home/userLogin'),
    headers: {
      'Content-Type':'application/json'
    },
    body: requestBodyJson,
  );

  Map<String, dynamic> responseBody =
  json.decode(response.body);
  var status = responseBody['status'];
  var userNumber=responseBody['mobilenumber'.toString()];
  var userType=responseBody['type'];
  String receivednumber=userNumber.toString();
  print("status:$status");
  print("number:$userNumber");
  print("type:$userType");

  if (status=='201') {

    Navigator.push(context,MaterialPageRoute(builder: (context) =>
        Landing(cusNumber: receivednumber,type: userType,),)

    ); } else {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content:
        Text('Failed to login. Please try again.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

}