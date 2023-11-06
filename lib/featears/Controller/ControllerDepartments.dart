import 'package:day_48_exercise/featears/Model/DepartmentModel.dart';
import 'package:day_48_exercise/repository/constant.dart';
import 'package:dio/dio.dart';

class ControllerDepartment {
  List<ModelDepartMent> listsDep = [];

  addDeparetment(String id, name) {
    ModelDepartMent NewmodelDepartMent = ModelDepartMent(id: id, name: name);
    listsDep.add(NewmodelDepartMent);
  }

  Future<List<ModelDepartMent>> loadDepartments() async {
    Dio d = Dio();
    try {
      Response response = await d.get(APIRoutes.department_URL);
      List<ModelDepartMent> lists = (response.data as List)
          .map((e) => ModelDepartMent.fromJson(e))
          .toList();
      print(response);
      print(lists);
      return lists;
    } catch (e) {
      print(e);
      return [];
    }
  }

  
}
