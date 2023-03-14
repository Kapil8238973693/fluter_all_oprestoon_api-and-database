import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login_page_design_project_assignment/Page_1_api/page_1.dart';

import 'package:login_page_design_project_assignment/Page_3_api/page_3.dart';
class Page_2 extends StatelessWidget {
  int? starnumber,dollarnumber;
  String? hotelname,cityname;

  Page_2(this.starnumber,this.hotelname,this.dollarnumber,this.cityname);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            print("Demo${snapshot.data!}");
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        snapshot.data![0]["imageurl"].toString(),
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                      return Page_1();
                                    },));
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(left: 20,right: 10,top: 10,),
                                      width: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(90),
                                      ),
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        size: 40,
                                      )),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 20,right: 10,top: 10,),
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child: Icon(
                                      Icons.save,
                                      size: 40,
                                    )),
                              ]),
                          Expanded(child: Container()),
                          Container(
                            padding: EdgeInsets.only(left: 25,right: 25,bottom: 10),


                            margin: EdgeInsets.only(left: 25,right: 25,bottom: 10),
                            child: Container(
                              height: 131,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(30),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "$hotelname",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.black,
                                                      fontSize: 30),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Icon(
                                                    Icons.location_on,
                                                    color: Colors.blue,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                Container(
                                                  child: Text(
                                                    "$cityname",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15.5,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 280,
                                      ),
                                      Container(
                                        height: 70,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(90.0),
                                        ),
                                        child: Card(
                                          elevation: 9,
                                          margin: EdgeInsets.only(left: 20,),
                                          color: Colors.blue,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "$starnumber",
                                                      style: TextStyle(
                                                          fontSize: 30,
                                                          color: Colors.yellow),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Very Good",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                        fontSize: 30),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Surrounded by the ocean with white sand. Clean ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "blue ocean and lost of cocount trees. Breakfast is",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "available. There are 2 restaurants and ... ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Read more",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 21,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Location",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$$dollarnumber",style:TextStyle(color: Colors.blue,),),
                                      Text(
                                        "/night",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return Page_3(snapshot.data![0]['star_number'],snapshot.data![0]['hotel_name'],snapshot.data![0]['City_name']);
                                      },));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 60,
                                  child: Container(
                                    child: Center(
                                        child: Text(
                                          "Booking Now",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 20),
                                        )),
                                  ),
                                ),
                              ),

                            ),
                            flex: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
        future: getCategoriesFromApi2(),
      ),
    );
  }

  Future<List<dynamic>> getCategoriesFromApi2() async {
    http.Response res = await http.get(
        Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/categories2"));
    List<dynamic> jsondata = jsonDecode(res.body.toString());
    // List<Page1Model> list = [];
    // for(int i=0;i<jsondata.length;i++){
    //   list.add(Page1Model.fromJson(jsondata[i]));
    // }
    return jsondata;
  }
}
