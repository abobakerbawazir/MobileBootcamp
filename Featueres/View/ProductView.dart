import 'package:day_48_exercise/Exercise49/Featueres/Controller/ProductController.dart';
import 'package:day_48_exercise/Exercise49/Featueres/Model/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductView extends StatefulWidget {
  String name;
   ProductView({super.key,required this.name});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductController productController = ProductController();
  List<Products>? listsProducts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: productController.getPoduct(widget.name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              listsProducts = snapshot.data;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [Text(listsProducts![index].title!)],
                  );
                },
              );
            } else {
              return Center(
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                ),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
