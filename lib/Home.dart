import 'package:day27/HotelModel.dart';
import 'package:flutter/material.dart';

import 'HotelController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  HotelModel hotelModel = HotelModel();
  HotelController hotelController = HotelController();
  HotelController pController = HotelController();
  @override
  Widget build(BuildContext context) {
    pController.getAllProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotels List"),
      ),
      // drawer: Drawer(child: Column(children: [
      //   UserAccountsDrawerHeader(
      //     currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/images/logo.jpg"),),
      //     accountEmail: Text("mokhtar.ghaleb@gmail.com"),
      //   accountName: Text("Mokhtar Ghaleb"),
      //   ),
      //   ListTile(
      //     leading: Icon(Icons.home),
      //     title: Text("Home Page"),onTap: (){
      //     Navigator.pushReplacementNamed(context, "/home");
      //   },),ListTile(
      //     leading: Icon(Icons.lock),
      //     title: Text("Login"),onTap: (){
      //     Navigator.pushReplacementNamed(context, "/login");
      //   },),
      // ],)),
      body: ListView.builder(
        itemCount: pController.products.length,
        itemBuilder: (BuildContext context, int index) {
          final student = pController.products[index];
          return ListTile(
            title: Text(student.title!),
            subtitle: Text(student.description!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailsPage(student: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
