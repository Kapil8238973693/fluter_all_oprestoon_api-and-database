import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login_page_design_project_assignment/database/my_database.dart';
import 'package:sqflite/sqflite.dart';
import 'insert_user.dart';

class Database_Demo extends StatefulWidget {
  @override
  State<Database_Demo> createState() => _Database_DemoState();
}

class _Database_DemoState extends State<Database_Demo> {
  @override
  void initState() {
    super.initState();
  }

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
                      return insertUserPage_database(null);
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
        body: FutureBuilder<bool>(
          builder: (context, snapshot1) {
            if (snapshot1.hasData) {
              return FutureBuilder<List<Map<String, Object?>>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // List<dynamic> datas =
                    // jsonDecode(snapshot.data!.body.toString());
                    // datas.reversed;
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return insertUserPage_database(
                                      snapshot.data![index]);
                                },
                              )).then((value) {
                                if (value == true) {
                                  setState(() {});
                                }
                              });
                            },
                            child: Card(
                              // color: index%2==0?Colors.amber:Colors.blue,
                              elevation: 9,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (snapshot.data![index]['UserName'])
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          (snapshot.data![index]['CityName'])
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                        Text(
                                          (snapshot.data![index]['Age'])
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: InkWell(
                                        onTap: () {
                                          showDeleteAlert(snapshot
                                              .data![index]['UserID']);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ),
                                  // InkWell(
                                  //   onTap: () {
                                  //     Navigator.of(context).push(MaterialPageRoute(
                                  //       builder: (context) {
                                  //         return insertUserPage_database(
                                  //             jsonDecode(snapshot.data!.body.toString())[index]);
                                  //       },
                                  //     )).then((value) {
                                  //       if (value = true) {
                                  //         setState(() {});
                                  //       }
                                  //     });
                                  //   },
                                  //   child: Icon(
                                  //     Icons.chevron_right,
                                  //     color: Colors.grey.shade300,
                                  //   ),
                                  // ),
                                ],
                              ),
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
                future: MyDatabase().getUserListFromUserTable(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
          future: MyDatabase().copyPasteAssetFileToRoot(),
        ),
      ),
    );
  }

  void showDeleteAlert(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(
              "Alert!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text("Are you sure Want to delete this record?"),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    MyDatabase().deleteUser(id).then((value) {
                      setState(() {});
                    });
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                  )),
            ]);
      },
    );
  }
// Future<int> deleteUser(id) async {
//   Database db =await initDatabase();
//   int userId =await db.delete('Tbl_User',where: 'UserID = ?',whereArgs: [id]);
//   return userId;
}
// showAlertDialog(BuildContext context, index) {
//   Widget yesButton = TextButton(
//     child: Text("Yes"),
//     onPressed: () async {
//       int deletedPersonID = await MyDatabase()
//           .deleteUser();
//       if (deletedPersonID > 0) {
//         searchList.removeAt(index);
//         print('Person on index ${index} is  Successfully Deleted');
//       }
//       Navigator.pop(context);
//       setState(() {});
//     },
//   );
//   Widget noButton = TextButton(
//     child: Text("No"),
//     onPressed: () {
//       Navigator.pop(context);
//     },
//   );
//   AlertDialog alert = AlertDialog(
//     title: Text("Alert"),
//     content: Text("Are you sure want to delete?"),
//     actions: [
//       yesButton,
//       noButton,
//     ],
//   );
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
//
//   Future<http.Response> deleteUserFromWeb(id) async {
//     var responce = await http.delete(
//         Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories/$id"));
//     // print(responce.toString());\
//     print("::Responce1::1::$responce");
//     return responce;
//   }
//   Future<http.Response> getDataFromWebServer() async {
//     var responce = await http.get(
//         Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories"));
//     // print(responce.toString());\
//     print("::Responce1::1::$responce");
//     return responce;
//   }
// }
