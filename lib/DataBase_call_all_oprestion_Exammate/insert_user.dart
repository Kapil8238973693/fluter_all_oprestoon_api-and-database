import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_page_design_project_assignment/database/my_database.dart';

import '../model/city_model.dart';

class insertUserPage_database extends StatefulWidget {
  insertUserPage_database(this.map);

  Map<String,Object?>? map;

  @override
  State<insertUserPage_database> createState() =>
      _insertUserPage_databaseState();
}

class _insertUserPage_databaseState extends State<insertUserPage_database> {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text =
        widget.map == null ? '' : widget.map!['UserName'].toString();
    ageController.text =
        widget.map == null ? '' : widget.map!['Age'].toString();

  }
     CityModel? _ddSelectedValue;
    bool  isCityListGet = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formkey,
          child: Column(
            children: [
              FutureBuilder<List<CityModel>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if(isCityListGet){
                      _ddSelectedValue = snapshot.data![0];
                      isCityListGet = false;
                    }

                    return DropdownButton(
                      value: _ddSelectedValue,
                      items: snapshot.data!.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.Name.toString(),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState((){
                          _ddSelectedValue = value;
                        });

                      },
                    );
                  } else {
                    return Container();
                  }
                },
                future:isCityListGet?MyDatabase().getCityList():null,
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter Valid Name";
                  }
                },
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "Enter Age",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter Valid Age";
                  }
                },
              ),
              TextButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      if (widget.map == null) {
                        insertUserDB()
                            .then((value) => Navigator.of(context).pop(true));
                      } else {
                        updateUserDB(widget.map!['UserID'])
                            .then((value) => Navigator.of(context).pop(true));
                      }
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.green),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateUser(id) async {
    Map map = {};
    map["title"] = nameController.text;
    map["Star_number"] = ageController.text;
    var respons1 = await http.put(
        Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories/$id"),
        body: map);
    print("data::::${respons1.body}");
  }

  Future<void> insertUser() async {
    Map map = {};
    map["title"] = nameController.text;
    map["Star_number"] = ageController.text;
    var respons1 = await http.post(
        Uri.parse("https://630ee8a9498924524a816c9a.mockapi.io/Categories"),
        body: map);
    print("data::::${respons1.body}");
  }

  Future<int> insertUserDB() async {
    Map<String, Object?> map = {};
    map["Name"] = nameController.text;
    map["Age"] = ageController.text;
    map["CityId"] = _ddSelectedValue!.CityId!;
     
    int userID = await MyDatabase().insertUserDetail(map);
    return userID;
  }

  Future<int> updateUserDB(id) async {
    Map<String, Object?> map = {};
    map["Name"] = nameController.text.toString();
    map["Age"] = ageController.text;
    map["CityId"] = _ddSelectedValue!.CityId!;

    int userID = await MyDatabase().updateUserDetail(map,id);
    return userID;
  }


}
