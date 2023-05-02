
import 'package:flutter/material.dart';
import 'package:mn_shopz_mobile_version/viewproduct.dart';

import 'API/productApi.dart';
import 'Modal/productModal.dart';
import 'add_product.dart';




class  Landing extends StatefulWidget {

  final String cusNumber;
  final String type;

  const Landing({Key? key, required this.cusNumber, required this.type, }) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  final prodDetails = Products();
  List<Product> productList=[];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async{
    ProductDetails productDetails = await prodDetails.getProducts();
    setState((){
      productList= productDetails.products;
    });
    print(productList[0].productName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xFFFFFFFF),
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 6),
                      child: Image.asset('assets/images/logo.jpg',width: 100,height: 25),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                //search bar
                Row(
                  children: [
                    Container(
                      width: 362,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFEFF9F8),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 6,
                              color: Colors.white,
                            ),
                          ),
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
                    )
                  ],
                ),
                // Ad box after search
                Row(
                  children: [
                    // Ad box after search
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.all(0),
                      width: 362,
                      color: Color(0xFFBEDBD7),
                      child: Row(
                        children: [
                          //image
                          Container(
                            margin: EdgeInsets.only(left: 12,),
                            child: Image.asset('assets/images/asusRog.jpg',width: 120,height: 143, ),
                          ),
                          //text
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, bottom: 19),
                                child: Text('Buy Up to 50% off on \nSelected Laptops',
                                  style: TextStyle(
                                      color: Color(0xFF03433B),
                                      fontFamily: 'Arial',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),),
                              ),
                              Container(
                                width: 113,
                                height: 38,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('Buy Now',
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 16,
                                        fontFamily: 'Arial'
                                    ),),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF03433B)),
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(top: 10,left: 25, right: 24, bottom: 10),
                                    ),
                                  ),
                                ),

                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 18,),
                // text After Ad box
                Row(
                  children: [
                    Container(
                        child: Text('All',
                        style: TextStyle(
                          color: Color(0xFF1D1D1D),
                          fontSize: 15,
                        ),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('Electronics',
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 15,
                          ),)
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('Shoes',
                          style: TextStyle(
                            color: Color(0xFF1D1D1D),
                            fontSize: 15,
                          ),)),
                    Container(
                        margin: EdgeInsets.only(left: 15),child: Text('Jackets',
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 15,
                      ),)),
                    Container(
                        margin: EdgeInsets.only(left: 15),child: Text('Shirts',
                      style: TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontSize: 15,
                      ),)),
                    SizedBox(width: 55,),
                    Container(
                      child: Icon(Icons.filter_alt_outlined,color: Color(0xFF6B6B6B),),
                    )
                  ],
                ),
                SizedBox(
                  height: 217.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length < 2 ? productList.length : 2,
                    itemBuilder: (BuildContext context, int index){
                      return Row(
                        crossAxisAlignment:
                      CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 186.0,
                            height: 217.0,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //image container
                                GestureDetector(
                                  onTap: () {
                                    String productId=
                                    productList[index].productId.toString();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewProduct(cusNumber:widget.cusNumber, productId: productId,type: widget.type),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 165,
                                    child: Image.network(
                                      productList[index].productImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),

                                //product name
                                Container(
                                  width: 186,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          productList[index].productName,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold,
                                            color: Color(0xFF1D1D1D)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //price
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color: Color(0xFF03433B),
                                            ),
                                            Text(
                                              productList[index].productPrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Arial',
                                                color: Color(0xFF03433B)
                                              ),

                                            ),
                                          ],
                                        ),
                                      )


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],


                      );
                    },
                  ),


                ),
                SizedBox(
                  height: 217,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length < 2 ? productList.length : 2,
                    itemBuilder: (BuildContext context, int index){
                      return Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 186.0,
                            height: 217.0,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //image container
                                GestureDetector(
                                  onTap: () {
                                    String productId=
                                    productList[index+2].productId.toString();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewProduct(cusNumber:widget.cusNumber,productId: productId, type: widget.type),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 165,
                                    child: Image.network(
                                      productList[index+2].productImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                //product name
                                Container(
                                  width: 186,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          productList[index + 2].productName,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1D1D1D)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //price
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color: Color(0xFF03433B),
                                            ),
                                            Text(
                                              productList[index + 2].productPrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Arial',
                                                  color: Color(0xFF03433B)
                                              ),

                                            ),
                                          ],
                                        ),
                                      )


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],


                      );
                    },
                  ),


                ),
                SizedBox(
                  height: 217,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length < 2 ? productList.length : 2,
                    itemBuilder: (BuildContext context, int index){
                      return Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 186.0,
                            height: 217.0,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //image container
                                GestureDetector(
                                  onTap: () {
                                    String productId=
                                    productList[index+4].productId.toString();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewProduct(cusNumber:widget.cusNumber,productId: productId,type: widget.type),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 165,
                                    child: Image.network(
                                      productList[index+4].productImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                //product name
                                Container(
                                  width: 186,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          productList[index + 4].productName,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1D1D1D)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //price
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color: Color(0xFF03433B),
                                            ),
                                            Text(
                                              productList[index + 4].productPrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Arial',
                                                  color: Color(0xFF03433B)
                                              ),

                                            ),
                                          ],
                                        ),
                                      )


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],


                      );
                    },
                  ),


                ),
                SizedBox(
                  height: 217,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length < 2 ? productList.length : 2,
                    itemBuilder: (BuildContext context, int index){
                      return Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 186.0,
                            height: 217.0,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //image container
                                GestureDetector(
                                  onTap: () {
                                    String productId=
                                    productList[index+6].productId.toString();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewProduct(cusNumber:widget.cusNumber,productId: productId,type: widget.type),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 165,
                                    child: Image.network(
                                      productList[index+6].productImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                //product name
                                Container(
                                  width: 186,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          productList[index + 6].productName,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1D1D1D)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //price
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color: Color(0xFF03433B),
                                            ),
                                            Text(
                                              productList[index + 6].productPrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Arial',
                                                  color: Color(0xFF03433B)
                                              ),

                                            ),
                                          ],
                                        ),
                                      )


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],


                      );
                    },
                  ),


                ),
                SizedBox(
                  height: 217,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length < 2 ? productList.length : 2,
                    itemBuilder: (BuildContext context, int index){
                      return Row(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 186.0,
                            height: 217.0,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //image container
                                GestureDetector(
                                  onTap: () {
                                    String productId=
                                    productList[index+8].productId.toString();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewProduct(cusNumber:widget.cusNumber,productId: productId,type: widget.type),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 186,
                                    height: 165,
                                    child: Image.network(
                                      productList[index+8].productImage,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                //product name
                                Container(
                                  width: 186,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          productList[index + 8].productName,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1D1D1D)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //price
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.currency_rupee,
                                              color: Color(0xFF03433B),
                                            ),
                                            Text(
                                              productList[index + 8].productPrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Arial',
                                                  color: Color(0xFF03433B)
                                              ),

                                            ),
                                          ],
                                        ),
                                      )


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],


                      );
                    },
                  ),


                ),

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
                //home icon and line indicator
                Container(
                  height: 56,
                  child: Column(
                    children: [
                      //green line indicator
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
                      //home icon
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
                //Add Product icon
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      size: 30,
                      color: Color(0Xff575757),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                      AppProduct()));
                    },
                  ),
                ),
                // order history icon
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
                //account icon
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
