import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextHome extends StatefulWidget {
  const NextHome({super.key});

  @override
  State<NextHome> createState() => _NextHomeState();
}

class _NextHomeState extends State<NextHome> {
  List<Todo> todos = [];
  Home h = Home();

  TextEditingController Nametxt = TextEditingController();
  TextEditingController Mobiletxt = TextEditingController();
  void addTodo() {
    String Name = Nametxt.text;
    String Mobile = Mobiletxt.text;

    Todo newAdd = Todo(Name: Name, mobile: Mobile);

    setState(() {
      todos.add(newAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    Home h = Home();
    
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(40),
            child: Center(
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    TableCell(child: Text(" Name")),
                    TableCell(child: Text(" Age")),
                  ]),
                  TableRow(children: [
                    TableCell(child: Text("")),
                    TableCell(child: Text("")),
                  ]),
                ],
              ),
              
            ),
          ),
          ElevatedButton(
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                          
                        }),
                        child: const Text("CollBack")),
          
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> form_key = GlobalKey();
  TextEditingController Nametxt = TextEditingController();
  TextEditingController Passtxt = TextEditingController();
  TextEditingController ConfirmPasstxt = TextEditingController();
  TextEditingController Mobiletxt = TextEditingController();
  List<Todo> todos = [];
  void addTodo() {
    String Name = Nametxt.text;
    String Mobile = Mobiletxt.text;

    Todo newAdd = Todo(Name: Name, mobile: Mobile);

    setState(() {
      todos.add(newAdd);
      Nametxt.clear();
      Mobiletxt.clear();
      ConfirmPasstxt.clear();
      Passtxt.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADD Widget Dynamically"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Form(
            key: form_key,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.length < 3) {
                      return "the Title must at least 3 characters";
                    } else {
                      return null;
                    }
                  },
                  controller: Nametxt,
                  decoration: InputDecoration(
                    label: const Text("Name"),
                    hintText: "Enter Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: Mobiletxt,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    label: const Text("Mobile No"),
                    hintText: "Enter Mobile",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != ConfirmPasstxt.text) {
                      return "Pass!=ConfirmPass";
                    } else {
                      return null;
                    }
                  },
                  controller: Passtxt,
                  decoration: InputDecoration(
                    label: const Text("Pass"),
                    hintText: "Enter Pass",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != Passtxt.text) {
                      return "Pass!=ConfirmPass";
                    } else {
                      return null;
                    }
                  },
                  controller: ConfirmPasstxt,
                  decoration: InputDecoration(
                    label: const Text("Confirm Pass"),
                    hintText: "Enter Confirm Pass",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: (() {
                          Nametxt.clear();
                          Mobiletxt.clear();
                          Passtxt.clear();
                          ConfirmPasstxt.clear();
                        }),
                        child: const Text("reset")),
                    ElevatedButton(
                        onPressed: Nametxt.clear,
                        child: const Text("Clear name only")),
                    InkWell(
                      onTap: () {
                        if (form_key.currentState!.validate()) {
                          print("Email : ${Nametxt.text}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NextHome(),
                              ));
                        }
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 70),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.blue),
                          child: IconButton(
                            onPressed: null,

                            //     onPressed: () {
                            //       if (form_key.currentState!.validate()) {

                            //   print("Email : ${Nametxt.text}");

                            // }
                            //     },
                            icon: Icon(Icons.add, color: Colors.white),
                          )),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class Todo {
  String Name;
  String mobile;

  Todo({
    required this.Name,
    required this.mobile,
  });
}
