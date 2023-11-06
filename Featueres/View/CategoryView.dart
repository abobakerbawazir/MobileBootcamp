import 'package:day_48_exercise/Exercise49/Featueres/Controller/CategoryController.dart';
import 'package:day_48_exercise/Exercise49/Featueres/View/ProductView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryController categoryController = CategoryController();
  List<String>? listCategory = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: categoryController.getCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              print(snapshot.data);
              listCategory = snapshot.data;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Center(
                          child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ProductView(name: listCategory![index],);
                                  },
                                ));
                              },
                              child: Container(padding: EdgeInsets.all(20),child: Text(listCategory![index]))))
                    ],
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
