import 'dart:io';

import 'package:flutter/services.dart';
import 'package:login_page_design_project_assignment/model/city_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {

  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'database_exammate.db');
    return await openDatabase(databasePath);
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database_exammate.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data = await rootBundle.load(join('assets/database', 'database_exammate.db'));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return true;
    }
    return false;
  }

  Future<List<Map<String, Object?>>> getUserListFromUserTable() async {
       Database db =await initDatabase();
       List<Map<String, Object?>> data =await db.rawQuery('select'
           ' Tbl_User.Name as UserName,'
           ' Tbl_City.Name as CityName,'
           ' UserID,Age from Tbl_User Inner join Tbl_City'
           ' on Tbl_User.CItyId = Tbl_City.CityID');
       return data;
  }

  Future<List<CityModel>> getCityList() async {
    Database db =await initDatabase();
    List<Map<String, Object?>> data =await db.rawQuery('select * from Tbl_City');
    List<CityModel> cityList = [];
    for(int i=0;i<data.length;i++){
       CityModel model = CityModel();
       model.CityId= int.parse(data[i]['CityID'].toString());
       model.Name = data[i]['Name'].toString();
       cityList.add(model);
    }
    return cityList;
  }

  Future<int> insertUserDetail(Map<String, Object?> map) async {
    Database db =await initDatabase();
    int userId =await db.insert('Tbl_User', map);
    return userId;
  }


  Future<int> updateUserDetail(map,id) async {
    Database db =await initDatabase();
    int userId =await db.update('Tbl_User', map,where: 'UserID = ?',whereArgs: [id]);
    return userId;
  }

  Future<int> deleteUser(id) async {
     Database db =await initDatabase();
    int userId =await db.delete('Tbl_User',where: 'UserID = ?',whereArgs: [id]);
    return userId;
  }
}
