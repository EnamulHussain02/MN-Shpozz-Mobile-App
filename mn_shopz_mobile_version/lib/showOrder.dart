import 'package:flutter/material.dart';
import 'package:mn_shopz_mobile_version/landing.dart';
import 'package:mn_shopz_mobile_version/main.dart';

import 'API/orderHistoryApi.dart';
import 'Modal/orderHistoryModal.dart';

class Orders extends StatefulWidget {

  final String cusNumber;
  final String type;

  const Orders({Key? key, required this.cusNumber, required this.type}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  final showOrders=OrderHistory();
  List<Order> orderData=[];

  @override
  void initState(){
    super.initState();
    getData();
  }


  Future<void> getData()async {
    OrdersEmpty result=await showOrders.getOrders(widget.cusNumber) ;
    setState(() {
      orderData=result.orders;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFEFF9F8),
                            
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF707070),
                            ),
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric( horizontal: 10)
                        ),
                      ),
                    ),
                    Icon(Icons.filter_alt_outlined,
                    size: 30,
                    color: Color(0xff6B6B6B),)
                  ],
                ),
                SizedBox(height:22 ,),
                SizedBox(
                  height: 78 * orderData.length.toDouble() ,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: orderData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  orderData[index].productImage,
                                  fit: BoxFit.fill,
                                  width: 91,
                                  height: 78,
                                ),
                              ),
                              Container(
                                height: 78,
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(orderData[index].prodTitel),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                size: 16,
                                                color: Color(0xff03433B),
                                              ),
                                              Container(
                                                child: Text(
                                                  orderData[index].total.toString(),
                                                  style: TextStyle(
                                                    color: Color(0xff03433B),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 40),
                                                child: Text(
                                                  orderData[index].paymentDate,
                                                  style: TextStyle(
                                                    color: Color(0xff03433B),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 27, left: 20),
                                child: Transform.rotate(
                                  angle: 270 * 3.14 / 180,
                                  child: Icon(
                                    Icons.expand_more,
                                    size: 24,
                                    color: Color(0xff4A4A4A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 3,
                            color: Color(0xff03433B),
                          ),
                        ],
                      );
                    },
                  )

                )
              ],
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
                  child:    IconButton(
                        icon: Icon(
                          Icons.home_outlined,
                          size: 30,
                          color: Color(0Xff575757),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          Landing(cusNumber: widget.cusNumber, type: widget.type)));
                        },
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
                          Icons.chat_outlined,
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
                      Icons.account_circle_outlined,
                      size: 30,
                      color: Color(0Xff575757),
                    ),
                    onPressed: () {

                    },
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
