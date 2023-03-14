import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:login_page_design_project_assignment/Page_2_api/page_2.dart';


class Page_1 extends StatefulWidget {
  const Page_1({Key? key}) : super(key: key);

  @override
  State<Page_1> createState() => Page_1State();
}

class Page_1State extends State<Page_1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.grey[170],
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'data:image/jpeg;base64,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'),
                        radius: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Welcome Back!',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Sabrina Meliya',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.search,
                          size: 30,
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.add_alert_outlined,
                          size: 30,
                          color: Colors.blueGrey,
                        )),
                  ],
                ),
                Card(
                  elevation: 9,
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Category",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: FutureBuilder<List<dynamic>>(
                    builder: (context, snapshot) {
                      print(snapshot.data.toString().length);
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    snapshot.data![index]['imageUrl']
                                         .toString(),
                                    height: 50,
                                    width: 50,
                                  ),
                                  Text(
                                    snapshot.data![index]['title'].toString(),
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          },

                        );
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.amber,
                              color: Colors.blue,
                            ));
                      }
                    },
                    future: getCategoriesFromApi1(),
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: FutureBuilder <List<dynamic>>(
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap:() {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                  return Page_2(snapshot.data![index]['star_number'],snapshot.data![index]['hotel_name'],snapshot.data![index]['dellar_number'],snapshot.data![index]['City_name']);
                                },));
                              },
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.network(snapshot
                                              .data![index]['imageurl'].toString()
                                            ,width: 345,height: 200,),
                                        ),
                                        Card(
                                          color: Colors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          50),
                                                    ),
                                                    child: Icon(
                                                      Icons.star,
                                                      size: 20,
                                                      color: Colors.yellow,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    snapshot.data![index]
                                                    ['star_number']
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index]['hotel_name'].toString(),
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(left: 10),
                                                child: Row(
                                                  children: [
                                                    Text('\$${
                                                        snapshot.data![index]['dellar_number'].toString()}',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      "/night",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 220,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                  BorderRadius.circular(40),
                                                ),
                                                child: Icon(
                                                  Icons.home_outlined,
                                                  size: 30,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }else{
                        return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.amber,
                              color: Colors.blue,
                            )); ;
                      }
                    },
                    future: getCategoriesFromApi2(),
                  ),

                ),
                Card(
                  elevation: 9,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Travel Group",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'View All',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:FutureBuilder<List<dynamic>>(
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return  ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 11,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                          snapshot.data![index]['imageurl'].toString(),
                                          height: 250,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "jaqcues Villa",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Due:20thFeb,2023",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'data:image/jpeg;base64,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'),
                                          radius: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                      else{
                        return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.amber,
                              color: Colors.blue,
                            ));
                      }
                    },
                    future:getCategoriesFromApi2() ,
                  ),

                ),
                Card(
                  elevation: 9,
                  margin: EdgeInsets.only(top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Text(
                              "Popular Destination",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Column(
                          children: [
                            Text(
                              'View All',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Card(
        elevation: 9,
        margin: EdgeInsets.only(
          left: 15,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.blueGrey,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.save),
                label: 'save',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
              ),
            ],
          ),
        ),
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
