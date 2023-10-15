// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class Producet {
  late String name;
  late String description;
  late double price;
  bool? iselected;
  Producet({
    required this.name,
    required this.description,
    required this.price,
    this.iselected,
  });
}

class ListProduct {
  List<Producet> li = [];
  getList() {
    li = List.generate(
        10,
        (index) => Producet(
            name: "name ",
            description: "description",
            price: 3,
            iselected: false));

    return li;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListProduct listProduct = ListProduct();
  @override
  initState() {
    listProduct.getList();
    super.initState();
  }

  var selectedItem = '';
  @override
  Widget build(BuildContext context) {
    List<Producet> p = [];

    IconData x = Icons.check_box;
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(

              // your logic
              onSelected: (value) {
            // your logic
            setState(() {
              selectedItem = value.toString();
            });
            print(value);
            Navigator.pushNamed(context, value.toString());
          }, itemBuilder: (BuildContext bc) {
            return [
              PopupMenuItem(
                child: Text("View cart"),
                value: '/hello',
              ),
              PopupMenuItem(
                child: Text("Clear Cart"),
                value: '/about',
                onTap: () {
                  // p.li.forEach((element) {
                  //   setState(() {
                  //     bool d = false;
                  //   element.iselected=d;
                  //   });
                  //   bool d = false;
                  //   element.iselected=d;
                  // });
                  // setState(() {

                  // });
                },
              ),
            ];
          })
        ],
      ),
      body: Column(
        children: [
          // Center(
          //  child: Icon(x),
          // ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: listProduct.li.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    // SizedBox(height: 20.0),
                    ListTile(
                        onTap: () {
                          {
                            if (listProduct.li[index].iselected == false) {
                              //x = Icon(Icons.check_box_outline_blank);
                              listProduct.li[index].iselected = true;
                              
                               p.add(Producet(
                                  name: listProduct.li[index].name,
                                  description:
                                      listProduct.li[index].description,
                                  price: listProduct.li[index].price));
                              
                             
                              setState(() {});
                              //p.add(listProduct.li[index].name);
                            } else if (listProduct.li[index].iselected ==
                                true) {
                              listProduct.li[index].iselected = false;
                              setState(() {});
                            }
                          }
                        },
                        title: Text("${listProduct.li[index].name}"),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${listProduct.li[index].description}"),
                              Text("${listProduct.li[index].price.toString()}"),
                              Text("${listProduct.li[index].iselected}")
                            ])),

                    Icon(
                      listProduct.li[index].iselected == true ? x : null,
                      color: Colors.green,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
