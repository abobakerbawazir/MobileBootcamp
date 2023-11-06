import 'dart:convert';

import 'package:day_48_exercise/featears/Model/DepartmentModel.dart';
import 'package:dio/dio.dart';

class DioConnection {
  static Dio? _connection;
  DioConnection._Dio();

  static Dio connect() {
    if (_connection == null) _connection = Dio();
    return _connection!;
  }
}

class APIRoutes {
  static const String BASE_URL =
      "https://654679c2fe036a2fa955bee7.mockapi.io/api/v1/";
  static const String department_URL = BASE_URL + "departments";
}
