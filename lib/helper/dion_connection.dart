import 'package:dio/dio.dart';

class DioConnection{
  static  Dio? _connection;
  DioConnection._Dio();

  static Dio connect(){
    if(_connection==null)
      _connection=Dio();
    return _connection!;
  }

}