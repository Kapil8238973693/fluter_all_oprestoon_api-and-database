import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import '../model/page1_model.dart';

class CetegoryApi extends StatelessWidget {
  const CetegoryApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: FutureBuilder<List<Page1Model>> (
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return Card(
                  margin:EdgeInsets.only(left:5,right: 5,bottom: 670) ,
                  elevation: 9,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 2.0,right: 2,top: 0,bottom: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(snapshot.data![index].imageUrl.toString(),height: 50,width: 50,),
                        Text(snapshot.data![index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
                itemCount: snapshot.data!.length,
              );
            }
            else{
              return Center(child: CircularProgressIndicator(backgroundColor: Colors.amber,color: Colors.blue,));
            }
          },
          future: getCategoriesFromApi(),
        ),
      ),
    );
  }

  Future<List<Page1Model>> getCategoriesFromApi() async {
    http.Response res = await http.get(Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories"));
    List<dynamic> jsondata = jsonDecode(res.body.toString());
    List<Page1Model> list = [];
    for(int i=0;i<jsondata.length;i++){
      list.add(Page1Model.fromJson(jsondata[i]));
    }
    return list;
  }
}


// Container(
// height:50,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// ),
// child:ListView.builder(
// scrollDirection: Axis.horizontal,
// itemBuilder:(context, index) {
// return Card(
// color: Colors.blue,
// elevation: 5,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Column(
// children: [
// Container(
// child: Icon(
// Icons.house_sharp,
// size: 35,
//
// ),
// ),
// ],
// ),
// Column(
// children: [
// Text(
// "Hostelry",
// style: TextStyle(
// fontSize: 35,
// ),
// ),
// ],
// ),
// ],
// ),
// );
// },
// ),
// ),
