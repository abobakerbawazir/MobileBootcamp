import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mukalla_store/EX_day_54/Helpers/DBMAnager.dart';
import 'package:mukalla_store/EX_day_54/Helpers/FileManager.dart';
import 'package:mukalla_store/EX_day_54/constant/FileConstant.dart';
import 'package:mukalla_store/EX_day_54/core/Model/Actos.dart';

class ActorsViewModel {
  DBManager dbManager = DBManager();
  List<ModelActors> _allActorts = [];
  //List<dynamic> _items = [];

  add_Name_fromfile() async {
    //flm.readJson(FilesPath.ACTORS);
    List<dynamic> li = await readjson(FileConstant_Path.Actors);
    List<Map<String, dynamic>> li2 =
        li.map((e) => e as Map<String, dynamic>).toList();
    dbManager.addAllbatch(DBManager.TBL_ACTORS, li2);
  }

  // Future<void> readJson(String source) async {
  //   final String response = await rootBundle.loadString(source);
  //   final data = await json.decode(response);
  //   _allActorts = data["name"];
  // }

  List<ModelActors> allincome = [];
  // Note? note;
  Future<List<ModelActors>> fetchAllactors() async {
    try {
      List<Map<String, dynamic>> fetchedData =
          await dbManager.getAllData(DBManager.TBL_ACTORS);
      allincome = fetchedData.map((e) => ModelActors.fromJson(e)).toList();
      return allincome;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<int> saveactors(ModelActors actors) {
    return dbManager.insertData(DBManager.TBL_ACTORS, actors.toJson());
  }

  Future<int> updateactor(ModelActors actors) async {
    return dbManager.updataeData(DBManager.TBL_ACTORS, actors.toJson());
  }

  Future<int> deleteactor(int actor) async {
    return dbManager.deleteData(DBManager.TBL_ACTORS, actor);
  }

  // Future readfile() async {
  //   String actors = await rootBundle.loadString(FileConstant_Path.Actors);
  //   List<Map<String, dynamic>> res = jsonDecode(actors);
  // }
  Future<List<ModelActors>> getAllActors() async {
    try {
      List<Map<String, dynamic>> lists =
          await dbManager.getAllData(DBManager.TBL_ACTORS);
      _allActorts = lists.map((e) => ModelActors.fromJson(e)).toList();
      return _allActorts;
    } catch (e) {
      print(e);
      return [];
    }
  }

  

  Future AddActor(Map<String, dynamic> actor) async {
    return await dbManager.insertData(DBManager.TBL_ACTORS, actor);
  }

  // Future<List<ModelActors>> featcActors() async {
  //   try {
  //     List<dynamic> Actorts = await readjson(FileConstant_Path.Actors);
  //     _allActorts = Actorts.map((e) => ModelActors.fromJson(e)).toList();
  //     return _allActorts;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }
}
