
import 'package:task1_day45/core/models/user.dart';
import 'package:task1_day45/core/repositories/data_repo.dart';

class UserController{
  Future<List<User>>loadUsers(DataRepo repo,String source)async{
    Map<String,dynamic>data=await repo.getData(source: source);
    List<dynamic>users=data["users"];
    List<User>allUsers=users.map((e) => User.fromJson(e)).toList();
    return allUsers;


  }
}