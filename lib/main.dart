import 'dart:collection';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:search_faker/Exercise3_day_29.dart';

import 'Exercise1_day_29.dart';
import 'No_task_day_29.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: BottomTabBarApp(),
    );
  }
}

class Person {
  late String name;
  late String email;
  late String id;
  late String phone;

  Person(
      {required this.name,
      required this.email,
      required this.id,
      required this.phone});
}

class listx {
  static Faker faker = Faker();
  List<Person> li = [];
  getList() {
    li = List.generate(
        20,
        (index) => Person(
              name: faker.person.name(),
              email: faker.internet.email(),
              id: faker.guid.guid(),
              phone: faker.phoneNumber.us(),
            ));

    return li;
  }
}

class HomeFaker extends StatefulWidget {
  const HomeFaker({super.key});

  @override
  State<HomeFaker> createState() => _HomeFakerState();
}

class _HomeFakerState extends State<HomeFaker> {
  listx lists = listx();
  List<Person> searchPersons(String query) {
    List<Person> allPersons = lists.getList();
    List<Person> searchResults = [];
    searchResults = allPersons.where((person) {
      return person.name.contains(query.toLowerCase());
    }).toList();
    return searchResults;
  }

  initState() {
    lists.getList();
    super.initState();
  }

  void searchpro() {
    setState(() {
      searchPersons(query);
    });
  }

  String query = '';

  @override
  Widget build(BuildContext context) {
    // String x = '';
    String query = '';

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  onChanged: (value) {
                    searchPersons(value);
                    // setState(() {
                    //   value = x;
                    // });
                  },
                  decoration: InputDecoration(
                      labelText: 'Search',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          searchPersons;
                        },
                      )),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                  itemCount: lists.li.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        // SizedBox(height: 20.0),
                        ListTile(
                            title: Text("${lists.li[index].name}"),
                            subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${lists.li[index].email}"),
                                  Text("${lists.li[index].phone.toString()}")
                                ])),
                      ],
                    );
                  })),
            ),
          ]),
        ));
  }
}
/* Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
                decoration: InputDecoration(
                    labelText: 'Search',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                       
                        
                      },
                    )),
              ),
            ) */


