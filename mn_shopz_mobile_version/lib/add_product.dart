import 'dart:core';
import 'package:flutter/material.dart';

import 'API/addProductApi.dart';

class AppProduct extends StatefulWidget {
  const AppProduct({Key? key}) : super(key: key);

  @override
  State<AppProduct> createState() => _AppProductState();
}

class _AppProductState extends State<AppProduct> {

  String name="";
  String price="";
  String quantity="";
  String type="";
  String color="";
  String discount="";
  String barcode="";
  String image="";
  String desc1="";
  String desc2="";
  String desc3="";
  String desc4="";

  TextEditingController nameController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController quantityController=TextEditingController();
  TextEditingController typeController=TextEditingController();
  TextEditingController colorController=TextEditingController();
  TextEditingController discountController=TextEditingController();
  TextEditingController barcodeController=TextEditingController();
  TextEditingController imageController=TextEditingController();
  TextEditingController desc1Controller=TextEditingController();
  TextEditingController desc2Controller=TextEditingController();
  TextEditingController desc3Controller=TextEditingController();
  TextEditingController desc4Controller=TextEditingController();

  final addNew=NewProducts();

  Future<void> setProducts(String name,String price,String quantity,String type,String color,String discount,String barcode,String image,String desc1,String desc2,String desc3,String desc4)async {
    String result=addNew.addNew(name,price,quantity,type,color,discount,barcode,image,desc1,desc2,desc3,desc4) as String;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //line on top
                Container(
                  margin: EdgeInsets.only(left: 130),
                  width: 100,
                  height: 3,
                  decoration: BoxDecoration(
                    color: Color(0xff03433B),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                //Add products text
                SizedBox(height: 7,),
                Container(
                  margin: EdgeInsets.only(left: 120),
                  child: Text('Add Products',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff03433B)
                  ),),
                ),
                //product name text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product name',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff707070)
                  ),),
                ),
                //productname Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product price text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product price',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product price Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: priceController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product quantity text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product quantity',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product quantity Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product Type text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product Type',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product Type Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: typeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product Color text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product Color',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product Color Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: colorController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product discount text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product discount',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product discount Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: discountController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product barcode text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product barcode',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product barcode Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: barcodeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product Image text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product Image',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product Image Field
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 240,
                      height: 48,
                      child: TextField(
                        controller: imageController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffEFF9F8),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      width: 95,
                      height: 48,
                      color: Color(0xffEFF9F8),
                      child: Row(
                        children: [
                          Icon(Icons.file_upload_outlined,
                          color: Color(0xff03433B),),
                          Text('Upload',
                          style: TextStyle(
                              color: Color(0xff03433B)
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
                //Product Description 1 text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product Description 1',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product Description 1 Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: desc1Controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product Description 2 text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product Description 2',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product Description 2 Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: desc2Controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product Description 3 text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product Description 3',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product Description 3 Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: desc3Controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //Product Description 4 text
                SizedBox(height: 10,),
                Container(
                  child: Text('Product Description 4',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070)
                    ),),
                ),
                //Product Description 4 Field
                SizedBox(height: 10,),
                Container(
                  height: 48,
                  child: TextField(
                    controller: desc4Controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffEFF9F8),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                //buttons
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                  width: 130,
                child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Color(0xff03433B),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Color(0xffffffff),
                    border: Border.all(
                      color: Color(0xff03433B),
                      width: 2.0,
                    ),
                  ),
                ),
                    Container(
                      width: 130,
                      child: TextButton(
                        onPressed: () {
                          name=nameController.text;
                          price=priceController.text;
                          quantity=quantityController.text;
                          type=typeController.text;
                          color=colorController.text;
                          discount=discountController.text;
                          barcode=barcodeController.text;
                          image=imageController.text;
                          desc1=desc1Controller.text;
                          desc2=desc2Controller.text;
                          desc3=desc3Controller.text;
                          desc4=desc4Controller.text;
                          setProducts(name,price,quantity,type,color,discount,barcode,image,desc1,desc2,desc3,desc4);
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Color(0xff03433B),
                        border: Border.all(
                          color: Color(0xff03433B),
                          width: 2.0,
                        ),
                      ),
                    ),

                ],
                ),
              ],
            ),
          )

        ),
      ),
    );
  }
}
