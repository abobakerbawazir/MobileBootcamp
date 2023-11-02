
import 'package:flutter/material.dart';
import 'package:task1_day45/core/controllers/user_controller.dart';
import 'package:task1_day45/core/repositories/online_data.dart';
import 'package:task1_day45/utils/constants/api_routes.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  UserController uController=UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  FutureBuilder(future: uController.loadUsers(OnlineDataRepo(), APIRoutes.USERS_PAGE),
        builder: (ctx,snapShot){
          if(snapShot.connectionState==ConnectionState.done){
            if(snapShot.hasData){
              return ListView.builder(itemBuilder:(ctx,index){
                return Card(child: Image.network(snapShot.data![index].image!),);
              },itemCount:  snapShot.data!.length);

            }
            else
              return Center(child: Text("NO dta"),);
          }
          else
            return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
