import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class insertUserPage extends StatefulWidget {


    insertUserPage(this.map);

    Map? map;

  @override
  State<insertUserPage> createState() => _insertUserPageState();
}

class _insertUserPageState extends State<insertUserPage> {
  var formkey = GlobalKey<FormState>();

  var titalController = TextEditingController();
  var starnumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titalController.text = widget.map ==null?'':widget.map!['title'].toString();
    starnumberController.text = widget.map==null?'':widget.map!['Star_number'].toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              controller: titalController,
              decoration: InputDecoration(
                hintText: "Enter Tital",
              ),
              validator: (value) {
                if(value !=null && value.isEmpty){
                  return "Enter Valid Tital";
                }
              },
            ),
            TextFormField(
              controller: starnumberController,
              decoration: InputDecoration(
                hintText: "Enter Star_number",
              ),
              validator: (value) {
                if(value !=null && value.isEmpty){
                  return "Enter Valid Star_number";
                }
              },
            ),
            TextButton(
                onPressed: () {
                  if(formkey.currentState!.validate()){
                    if(widget.map == null){
                      insertUser().then((value) =>Navigator.of(context).pop(true));
                    }
                    else{
                      updateUser(widget.map!['id']).then((value) => Navigator.of(context).pop(true));
                    }

                  }
                },
                child: Text("Submit",style:TextStyle(color: Colors.white,backgroundColor: Colors.green) ,))
          ],
        ),
      ),
    );
  }

  Future<void> updateUser(id) async {
    Map map = {};
    map["title"] = titalController.text;
    map["Star_number"] = starnumberController.text;
    var respons1= await  http.put(Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories/$id"),body: map);
    print("data::::${respons1.body}");
  }

  Future<void> insertUser() async {
    Map map = {};
    map["title"] = titalController.text;
    map["Star_number"] = starnumberController.text;
    var respons1= await  http.post(Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories"),body: map);
    print("data::::${respons1.body}");
  }
}
