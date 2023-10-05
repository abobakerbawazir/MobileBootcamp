import 'package:flutter/material.dart';
import 'package:tranning_4/lib/productModel.dart';

class SelectedStudentsPage extends StatelessWidget {
  final List<ProductModel> proudects;

  SelectedStudentsPage({required this.proudects});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Students'),
      ),
      body: ListView.builder(
        itemCount: proudects.length,
        itemBuilder: (BuildContext context, int index) {
          final student = proudects[index];
          return Container(child: Image.asset(
                                 "${pController.products[index].thumbnail}"),
            child: ListTile(
              title: Text(proudects.title),
              subtitle: Text(proudects.description),
            ),
          );
        },
      ),
    );
  }
}