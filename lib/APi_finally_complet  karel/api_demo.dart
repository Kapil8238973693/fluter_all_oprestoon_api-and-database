import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'insert_user.dart';

class ApiDemo_finally extends StatefulWidget {
  @override
  State<ApiDemo_finally> createState() => _ApiDemo_finallyState();
}

class _ApiDemo_finallyState extends State<ApiDemo_finally> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Indert User",
            style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return insertUserPage(null);
                    },
                  )).then((value) {
                    if (value == true) {
                      setState(() {});
                    }
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                )),
          ],
        ),
        body: FutureBuilder<http.Response>(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> datas =
              jsonDecode(snapshot.data!.body.toString());
              datas.reversed;
              return ListView.builder(
                itemCount: jsonDecode(snapshot.data!.body.toString()).length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      // color: index%2==0?Colors.amber:Colors.blue,
                      elevation: 9,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    jsonDecode(snapshot.data!.body.toString())[
                                        index]['title'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    jsonDecode(snapshot.data!.body.toString())[
                                            index]['Star_number']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                showDeleteAlert(jsonDecode(snapshot.data!.body.toString())[index]['id']);
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return insertUserPage(
                                      jsonDecode(snapshot.data!.body.toString())[index]);
                                },
                              )).then((value) {
                                if (value = true) {
                                  setState(() {});
                                }
                              });
                            },
                            child: Icon(
                              Icons.chevron_right,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                  backgroundColor: Colors.yellow,
                ),
              );
            }
          },
          future: getDataFromWebServer(),
        ),
      ),
    );
  }

  void showDeleteAlert(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Alert!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
          content: Text("Are you sure Want to delete this record?"),
          actions: [
            TextButton(
                onPressed: () async {
              http.Response res= await deleteUserFromWeb(id);
              if(res.statusCode == 200){
                setState(() {

                });
              }
              Navigator.of(context).pop();
            },
                child: Text("Yes",style: TextStyle(color: Colors.white,backgroundColor: Colors.green,),)),
            TextButton(onPressed: () {
              Navigator.of(context).pop();
            },
                child: Text("No",style: TextStyle(color: Colors.white,backgroundColor: Colors.red,),)),
            ]
        );
      },
    );
  }

  Future<http.Response> deleteUserFromWeb(id) async {
    var responce = await http.delete(
        Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories/$id"));
    // print(responce.toString());\
    print("::Responce1::1::$responce");
    return responce;
  }
  Future<http.Response> getDataFromWebServer() async {
    var responce = await http.get(
        Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories"));
    // print(responce.toString());\
    print("::Responce1::1::$responce");
    return responce;
  }
}
