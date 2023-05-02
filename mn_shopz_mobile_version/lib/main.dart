
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'API/loginApi.dart';
import 'API/registerApi.dart';
import 'Splash.dart';
import 'landing.dart';

void main() {
  runApp( MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));
}

class  MyApp extends StatefulWidget {
  const MyApp ({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var myInitialItem1 = 'User';
  List<String> myItems1 = ['User', 'Seller'];

  String selectedValue="";

  String name="";
  String number="";
  String password="";
  String address="";


  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController addressController=TextEditingController();

  bool _showLoginContent = true;
  bool _showRegisterContent = false;

  final login=Login();
  final register=Register();

  @override
  void initState() {
    super.initState();
  }

Future<void> userLogin(BuildContext context, String number, String password) async{
  String result =login.checkLogin(context, number, password) as String;
}

  Future<void> userRegister(BuildContext context, String name, String number, String password, String address, String type) async{
    String result =register.checkRegister(context,name, number, password,address,type) as String;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffffffff),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 400,
                      height: 350,
                      child: Image.asset('assets/images/loginBack.jpg', fit: BoxFit.fill,),
                    ),
                    Container(
                      width: 360,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF03433B),
                      ),
                      margin: EdgeInsets.only(left: 19,top: 340),
                      child:  Row(
                        children: [
                          Container(
                            width: 160,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_showLoginContent ? 0 : 4),
                              color: _showLoginContent ? Color(0xFFFFFFFF) : Color(0xFF03433B) ,
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _showLoginContent = true;
                                  _showRegisterContent = false;
                                });
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: _showLoginContent ? Color(0xFF03433B) : Color(0xFFFFFFFF) ,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Container(
                            width: 160,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _showRegisterContent ? Color(0xFFFFFFFF) : Color(0xFF03433B),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _showLoginContent = false;
                                  _showRegisterContent = true;
                                });
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: _showRegisterContent ? Color(0xFF03433B) : Color(0xFFFFFFFF),
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 400),
                          padding: EdgeInsets.all(20),
                          child: _showLoginContent ?
                              //code for login form
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Login text
                                Container(
                                  child: Text('Login',
                                  style: TextStyle(
                                    color: Color(0xff03433B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  ),),
                                ),
                                SizedBox(height: 14,),
                                //number text
                                Container(
                                  child: Text('Mobile Number',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff707070)
                                  ),),
                                ),
                                SizedBox(height: 5,),
                                //number feild
                                Container(
                    padding: EdgeInsets.only(left:20),
                    decoration: BoxDecoration(
                      color: Color(0xffEFF9F8),
                      border: Border.all(
                        color: Color(0xffEFF9F8),
                        width: 2.0,
                      ),
                    ),

                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                                SizedBox(height: 14,),
                                //password text
                                Container(
                                  child: Text('Password',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff707070)
                                    ),),
                                ),
                                SizedBox(height: 5,),
                                //password feild
                                Container(
                                  padding: EdgeInsets.only(left:20),
                                  decoration: BoxDecoration(
                                    color: Color(0xffEFF9F8),
                                    border: Border.all(
                                      color: Color(0xffEFF9F8),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
            Container(
              width: 360,
              color: Color(0xff03433B),
              child: TextButton(
                onPressed: () {
                  number=numberController.text;
                  password=passwordController.text;
                  userLogin(context,number,password);
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xffFFFFFF)
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
            )



            ],
                            )
                          ) :
                          //code for register form
                          Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //register text
                                  Container(
                                    child: Text('Register',
                                      style: TextStyle(
                                          color: Color(0xff03433B),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),),
                                  ),
                                  SizedBox(height: 14,),


                                  //name text
                                  Container(
                                    child: Text('User Name',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff707070)
                                      ),),
                                  ),
                                  SizedBox(height: 5,),


                                  //name feild
                                  Container(
                                    padding: EdgeInsets.only(left:20),
                                    decoration: BoxDecoration(
                                      color: Color(0xffEFF9F8),
                                      border: Border.all(
                                        color: Color(0xffEFF9F8),
                                        width: 2.0,
                                      ),
                                    ),

                                    child: TextField(
                                      controller: nameController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14,),

                                  //number text
                                  Container(
                                    child: Text('Mobile Number',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff707070)
                                      ),),
                                  ),
                                  SizedBox(height: 5,),

                                  //number feild
                                  Container(
                                    padding: EdgeInsets.only(left:20),
                                    decoration: BoxDecoration(
                                      color: Color(0xffEFF9F8),
                                      border: Border.all(
                                        color: Color(0xffEFF9F8),
                                        width: 2.0,
                                      ),
                                    ),

                                    child: TextField(
                                      controller: numberController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14,),

                                  //password text
                                  Container(
                                    child: Text('Password',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff707070)
                                      ),),
                                  ),
                                  SizedBox(height: 5,),

                                  //password feild
                                  Container(
                                    padding: EdgeInsets.only(left:20),
                                    decoration: BoxDecoration(
                                      color: Color(0xffEFF9F8),
                                      border: Border.all(
                                        color: Color(0xffEFF9F8),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14,),

                                  //address text
                                  Container(
                                    child: Text('Address',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff707070)
                                      ),),
                                  ),
                                  SizedBox(height: 5,),

                                  //address feild
                                  Container(
                                    padding: EdgeInsets.only(left:20),
                                    decoration: BoxDecoration(
                                      color: Color(0xffEFF9F8),
                                      border: Border.all(
                                        color: Color(0xffEFF9F8),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: TextField(
                                      controller: addressController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14,),

                                  //Customer text
                                  Container(
                                    child: Text('Customer Type',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff707070)
                                      ),),
                                  ),
                                  SizedBox(height: 5,),

                                  //Customer Type feild
                                  Container(
                                    padding: EdgeInsets.only(left:20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffEFF9F8),
                                        width:1.0,
                                      ),
                                      color: Color(0xffEFF9F8),
                                    ),
                                    child: DropdownButtonFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          myInitialItem1 = value.toString();
                                          selectedValue=value.toString();
                                        });
                                      },
                                      disabledHint: Text('Select Category'),
                                      value: myInitialItem1,
                                      items: myItems1.map((items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items,),
                                        );
                                      }).toList(),
                                      focusColor: Color(0xffEFF9F8),
                                      dropdownColor: Color(0xffEFF9F8),
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent),
                                        ),
                                        disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30,),

                                  //button
                                  Container(
                                    width: 360,
                                    color: Color(0xff03433B),
                                    child: TextButton(
                                      onPressed: () {
                                        name=nameController.text;
                                        number=numberController.text;
                                        password=passwordController.text;
                                        address=addressController.text;
                                        userRegister(context,name,number,password,address,selectedValue);
                                      },
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            color: Color(0xffFFFFFF)
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          )
                        )
                      ],
                    )
                    ],
                )
              ],
            ),
          ),
        )
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 56,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFffffff),
              border: Border(
                top: BorderSide(
                  color: Color(0xff00000014),
                  width: 4,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 56,
                  child:
                      IconButton(
                        icon: Icon(
                          Icons.home_outlined,
                          size: 30,
                          color: Color(0Xff575757),
                        ),
                        onPressed: () {},
                      ),

                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      size: 30,
                      color: Color(0Xff575757),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.chat_outlined,
                      size: 30,
                      color: Color(0Xff575757),
                    ),
                    onPressed: () {

                    },
                  ),
                ),
                Container(
                  height: 56,
                  child: Column(
                    children: [
                      Container(
                        height: 4,
                        width: 46,
                        decoration: BoxDecoration(
                          color: Color(0Xff03433B),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.account_circle_outlined,
                          size: 30,
                          color: Color(0Xff03433B),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


}
