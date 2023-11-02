import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task1_day45/core/repositories/data_repo.dart';
import 'package:task1_day45/helper/dion_connection.dart';

class OnlineDataRepo extends DataRepo {
  @override
  Future<Map<String, dynamic>> getData({required String source}) async {
    try {
      Response<String> serverResponse =
          await DioConnection.connect().get(source);
      //Response<String> serverResponse=await Dio().get(source);

      Map<String, dynamic> content = jsonDecode(serverResponse.data!);
      // print(content);
      return content;
    } catch (ex) {
      print(ex);
      return {};
    }
  }

  @override
  Future<Map<String, dynamic>> postData(
      Map<String, dynamic> dataToSend, String source) async {
    try {
      Response<String> serverResponse =
          await DioConnection.connect().post(source, data: dataToSend);

      if (serverResponse.statusCode == 201) {
        Map<String, dynamic> info = jsonDecode(serverResponse.data!);
        return info;
      } 
      // else if (serverResponse.statusCode == 404) {
      //   Map<String, dynamic> info = jsonDecode(serverResponse.data!);
      //   return info;
      // } 
      else if (serverResponse.statusCode == 404) {
        return {"id": 1};
      } else {
        return {"id": -1};
      }
    } catch (e) {
      print(e);
    }

    throw UnimplementedError();
  }
}
