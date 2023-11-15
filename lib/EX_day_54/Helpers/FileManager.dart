import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:mukalla_store/EX_day_54/constant/FileConstant.dart';

// Future<String> loadAsset(String sourse) async {
//   return await rootBundle.loadString(sourse);
// }

// Future loadVault(String sourse) async {
//   String jsonString = await loadAsset(sourse);
//   final jsonResponse = jsonDecode(jsonString);
//   var add = jsonResponse.toString();
//   return add;

// //   add = add.replaceFirst(new RegExp(r'}]'), "},"+content.toString()+"]");

// //   print(add); //shows the full json string that I want.

// // //How to add/replace (add) into the json file?
// }

Future<List<dynamic>> readjson(String sourse) async {
  final String response =await loadAsset(sourse);
  List<dynamic> data = await json.decode(response);
  return data;
}

Future<String> loadAsset(String sourse) async {
  return await rootBundle.loadString(sourse);
}
