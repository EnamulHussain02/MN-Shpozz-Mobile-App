import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mn_shopz_mobile_version/showOrder.dart';

import 'API/saveOrderApi.dart';
import 'API/viewPriductAPI.dart';
import 'Modal/ViewProductModal.dart';
class ViewProduct extends StatefulWidget {

  final String productId;
  final String cusNumber;
  final String type;

  const ViewProduct({ Key? key,required this.cusNumber, required this.productId, required this.type, }): super(key: key);
  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  String? ValueChoose;
  List myItems1 = ['Google Pay', 'PhonePe', 'Paytm'];
  bool isTextFieldEnabled= false;
  String upiId="";

  final products=SelectedProducts();
  List<Products> productOne=[];
  
  final saveOrders=SaveOrder();

  @override
  void initState(){
    super.initState();
    getData();
  }

  Future<void> getData() async{
    ProductEmpty empty= await products.getSpecficProduct(widget.productId);
    setState(() {
      productOne=empty.product;

    });
  }

  Future<void> confirmOrder(String Payment, String prodId, String cusNumber,String total
      ) async{
      String result=saveOrders.saveOrders(context, Payment, prodId, cusNumber, total, widget.type) as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF), // set background color
        elevation: 0, // remove box shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Color(0xFF707070),),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(productOne[0].productName,
          style: TextStyle(
            color: Color(0xFF707070),
            fontWeight: FontWeight.bold

          ),),
        ),
      ),
      body:
       SafeArea(
         child: SingleChildScrollView(
           child: Container(
             color: Color(0xFFFFFFFF),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 300,
                    width: 362,
                    child: Image.network(productOne[0].productImage, fit: BoxFit.fill,),
                  ),
                  Container(
                    child: Text(productOne[0].productName,
                    style: TextStyle(
                      fontSize:  16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D1D1D)
                    ),),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.currency_rupee_sharp,
                      color: Color(0xFF03433B),
                      size: 24,),
                      Text(productOne[0].productPrice,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                          color: Color(0xFF03433B)
                      ),)
                    ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Text('Color:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1D1D1D)
                        ),),
                        SizedBox(width: 10,),
                        Icon(Icons.circle,
                        size: 16,)
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text('Details',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1D1D1D)
                    ),),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(productOne[0].prodDesc1,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(productOne[0].prodDesc2,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(productOne[0].prodDesc3,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(productOne[0].prodDesc4,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF000000)
                      ),),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 362,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Color(0xFF03433B),
                      ),
                      borderRadius: BorderRadius.circular(0.5),
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text('Add to Cart',
                      style: TextStyle(
                        color: Color(0xFF03433B)
                      ),),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 362,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xFF03433B),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFF03433B)
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: (){
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      //order summarry text
                                      Container(
                                        child: Text('Order Summary (1 item)',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff03433B)
                                        ),
                                        ),
                                      ),
                                      //price
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text('Original Price',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff2C2C2C)
                                            ),),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.currency_rupee,
                                              size: 16,
                                              color: Color(0xff2C2C2C),),
                                              Container(
                                                child: Text(productOne[0].productPrice,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff2C2C2C),
                                                ),),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      //Delivery fees
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text('Delivery Fees',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff2C2C2C)
                                              ),),
                                          ),
                                          Container(
                                            child: Text('Free',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff2C2C2C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      //Amount
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text('Total Amount',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff2C2C2C)
                                              ),),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.currency_rupee,
                                                size: 16,
                                                color: Color(0xff2C2C2C),),
                                              Container(
                                                child: Text(productOne[0].productPrice,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xff2C2C2C),
                                                  ),),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      //line
                                      Container(
                                        width: 365,
                                        height: 1,
                                        color: Color(0xff03433B),
                                      ),
                                      //Payment method text
                                      Container(
                                        child: Text('Select Payment Method',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff03433B)
                                        ),),
                                      ),
                                      //Drop downs
                                      StatefulBuilder(builder: (BuildContext context, void Function(void Function()) setState) {
                                        return
                                       Container(
                                          width: 566,
                                          height: 50,
                                          padding: EdgeInsets.only(left: 20),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFFFFF),
                                            border: Border.all(
                                              color: Color(0xFF707070),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: DropdownButtonFormField(
                                            decoration: InputDecoration(
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.transparent)
                                              )
                                            ),
                                            hint: Text('Select UPI Id'),

                                            value: ValueChoose,
                                            onChanged: (value) {
                                              setState(() {
                                                ValueChoose =
                                                    value.toString();
                                                isTextFieldEnabled=true;
                                              });
                                            },
                                            items: myItems1.map((valueItem){
                                              return DropdownMenuItem(
                                                  value: valueItem,
                                                  child: Text(valueItem));
                                            }).toList(),

                                            focusColor: Color(0xFFFFFFFF),
                                            dropdownColor:
                                            Color(0xFFFFFFFF),
                                          ),
                                        ); },

                                      ),
                                      Container(
                                        child: Text(
                                          'Enter UPI Id',
                                          style: TextStyle(
                                              fontFamily: 'Arial',
                                              fontSize: 16,
                                              color: Color(0xFF2C2C2C)),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            fillColor:
                                            Color(0xFFFFFFFF),
                                            filled: true,
                                            enabledBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                Color(0xFF707070),
                                                style:
                                                BorderStyle.solid,
                                              ),
                                            ),
                                            focusedBorder:
                                            OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color:
                                                  Color(0xFF707070),
                                                  style:
                                                  BorderStyle.solid,
                                                  width: 1.0),
                                            ),
                                          ),
                                          enabled: isTextFieldEnabled,
                                          onChanged: (value) {
                                            setState(() {
                                              upiId = value;
                                            });
                                          },
                                        ),
                                      ),
                                      //Buttons
                                      Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          //CANCEL BUTTON
                                          Container(
                                            width:130,
                                            child: TextButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Color(0xff03433B)
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xffFFFFFF),
                                              border: Border.all(
                                                color: Color(0xff03433B), // Change this to desired color
                                                width: 1.0, // Change this to desired width
                                              ),
                                            ),
                                          ),
                                          //confirm button
                                          Container(
                                            width:130,
                                            child: TextButton(
                                              onPressed: (){
                                                String Payment='UPI';
                                                String prodId=productOne[0].productId;
                                                String cusNumber=widget.cusNumber;
                                                String total=productOne[0].productPrice;
                                                confirmOrder(Payment,prodId,cusNumber,total);
                                              },
                                              child: Text(
                                                'Confirm',
                                                style: TextStyle(
                                                    color: Color(0xffffffff)
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xff03433B),
                                              border: Border.all(
                                                color: Color(0xff03433B),
                                                width: 3.0,
                                              ),
                                            ),
                                          ),


                                        ],
                                      )


                                    ],
                                  ),

                              ),
                            );
                          },
                        );

                      },
                      child: Text('Buy',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF)
                        ),),
                    ),
                  )
                ],
              ),
            ),
      ),
         ),
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
                              Icons.home_outlined,
                              size: 30,
                              color: Color(0Xff03433B),
                            ),
                            onPressed: () {},
                          ),
                        ],
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      Orders(cusNumber: widget.cusNumber, type:widget.type)));
                    },
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      size: 30,
                      color: Color(0Xff575757),
                    ),
                    onPressed: () {},
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
