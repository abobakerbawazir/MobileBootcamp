// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pizaa {
  final String name;
  final List<String> subPizaa;
  Pizaa({
    required this.name,
    required this.subPizaa,
  });
}

class PizaaPage extends StatefulWidget {
  const PizaaPage({super.key});

  @override
  State<PizaaPage> createState() => _PizaaPageState();
}

class _PizaaPageState extends State<PizaaPage> {
  final List<Pizaa> listOfpizza = [
    Pizaa(name: "a", subPizaa: [
      "sub a",
      "sub b",
      "sub c",
      "sub d",
      "sub e",
      "sub f",
      "sub g"
    ]),
    Pizaa(name: "b", subPizaa: [
      "sub ab",
      "sub bb",
      "sub cb",
      "sub db",
      "sub eb",
      "sub fb",
      "sub gb"
    ]),
    Pizaa(name: "c", subPizaa: [
      "sub ac",
      "sub bc",
      "sub cc",
      "sub dc",
      "sub ec",
      "sub fc",
      "sub gc"
    ]),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listOfpizza.length,
        itemBuilder: (context, index) {
          final ListsPizza = listOfpizza[index];
          return Column(
            children: [
              ListTile(
                title: Text(ListsPizza.name),
              ),
              ListView.builder(
                itemCount: ListsPizza.subPizaa.length,
                itemBuilder: (context, index) {
                  final subListPizza = ListsPizza.subPizaa[index];
                  return ListTile(
                    title: Text(subListPizza),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
