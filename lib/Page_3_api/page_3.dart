import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page_design_project_assignment/Page_2_api/page_2.dart';

class Page_3 extends StatelessWidget {
  int? starnumber;
  String? hotelname,cityname;

  Page_3(this.starnumber,this.hotelname,this.cityname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder<List<dynamic>> (
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),

                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:Colors.white,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                                    return Page_2(snapshot.data![0]['star_number'],snapshot.data![0]['hotel_name'],snapshot.data![0]['dellar_number'],snapshot.data![0]['City_name']);
                                  },));
                                },
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 40,

                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 650,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:Colors.white,
                              ),padding: EdgeInsets.only(left: 300,right: 300,bottom: 9),
                              child: Center(
                                child: Text("detail Booking",style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),),
                              ),
                            )
                          ],
                        ),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.only(left: 10,right: 10,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return Card(
                          elevation: 11,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0,right: 30,top: 20,bottom: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      snapshot.data![0]["imageurl"].toString(),
                                      fit: BoxFit.cover,

                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "$hotelname",
                                    style: TextStyle(
                                      fontSize: 25 ,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                        height: 150,
                                      ),
                                      Container(
                                        child: Text(
                                          "$cityname",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
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
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        child: Text(
                                          "5k Reviews",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                            ],
                          ),
                        );
                      }
                      else{
                        return CircularProgressIndicator();
                      }
                    },
                    future: getCategoriesFromApi2(),
                  ),
                ),
                Container(
                  height: 330,
                  child: Card(
                    elevation: 11,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Reschedule",style: TextStyle(color: Colors.black,fontSize: 15,),),
                            Icon(Icons.keyboard_arrow_down),

                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Colors.blue.shade200,
                              ),
                              child: Column(
                                children: [
                                  Text("New Date",style: TextStyle(color: Colors.grey,fontSize: 10,),),
                                  Row(
                                    children: [
                                      Icon(Icons.date_range_rounded,size: 20,color: Colors.blue,),
                                      Text("28th jan,2023",style: TextStyle(color: Colors.black,),)

                                    ],


                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Colors.blue.shade200,
                              ),
                              child: Column(
                                children: [
                                  Text("Previous Date",style: TextStyle(color: Colors.grey,fontSize: 10,),),
                                  Row(
                                    children: [
                                      Icon(Icons.date_range_rounded,size: 20,color: Colors.blue,),
                                      Text("1st Feb,2023",style: TextStyle(color: Colors.black,),)

                                    ],


                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),

                  ),
                ),
                Container(

                  margin: EdgeInsets.only(left: 20,right: 20,),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:  BorderRadius.circular(50),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      ButtonBar(
                        children: [
                          Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 40),)),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            );
          }
          else{
            return CircularProgressIndicator();
          }
        },
        future: getCategoriesFromApi2(),
      ),

    );
  }


  Future<List<dynamic>> getCategoriesFromApi1() async {
    http.Response res = await http.get(
        Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories"));
    List<dynamic> jsondata = jsonDecode(res.body.toString());
    // List<Page1Model> list = [];
    // for(int i=0;i<jsondata.length;i++){
    //   list.add(Page1Model.fromJson(jsondata[i]));
    // }
    return jsondata;
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
