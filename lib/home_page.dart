import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:task1_day45/core/controllers/product_controller.dart';
import 'package:task1_day45/core/repositories/online_data.dart';
import 'package:task1_day45/utils/constants/api_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductController pController=ProductController();
    return Scaffold(
      body:

      FutureBuilder(future: pController.loadProduct(OnlineDataRepo(), APIRoutes.PRODUCT_PAGE),
      builder: (ctx,snapShot){
        if(snapShot.connectionState==ConnectionState.done){
        if(snapShot.hasData){
          return ListView.builder(itemBuilder:(ctx,index){
            return Card(child: Image.network(snapShot.data![index].thumbnail!),);
          },itemCount:  snapShot.data!.length);

        }
        else
          return Center(child: Text("NO dta"),);
        }
        else
          return Center(child: CircularProgressIndicator(),);
      },
      )
    );
  }

}
