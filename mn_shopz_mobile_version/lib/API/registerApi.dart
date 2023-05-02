import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../landing.dart';
import '../main.dart';

class Register{
  Future<void> checkRegister(BuildContext context,String name,String number, String password,String address,String selectedValue,)async {

    Map<String, dynamic> requestBody = {
      'cname': name,
      'cnumber': number,
      'cpassword': password,
      'caddress': address,
      'c_type': selectedValue
    };
    String requestBodyJson = json.encode(requestBody);

    final response =await http.post(
      Uri.parse('http://10.0.2.2:8080/home/newUser'),
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

    if(status=='200'){
      showDialog(context: context,
          builder: (BuildContext context)=>
              AlertDialog(
                content: Text(
                  'You are Registred Successfully Please Login to continue',
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 16,
                      color: Color(0xFF03433B)
                  ),
                ),
                actions: [
                  TextButton( onPressed:(){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>
                        MyApp()));
                  }, child: Text('ok',
                    style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: Color(0xFF03433B)
                    ),))
                ],
              )
      );
    }
    else
    {
      showDialog(context: context, builder: (BuildContext context)=>
          AlertDialog(
            content: Text(
              'Already Registered User Login to Continue',
              style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16,
                  color: Color(0xFF03433B)
              ),
            ),
            actions: [
              TextButton( onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyApp()));
              }, child: Text('ok'))
            ],
          )
      );
    }
  }

}