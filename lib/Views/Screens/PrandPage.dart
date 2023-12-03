import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Prand.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrandPage extends StatefulWidget {
  const PrandPage({super.key});

  @override
  State<PrandPage> createState() => _PrandPageState();
}

class _PrandPageState extends State<PrandPage> {
  String? userName;
  String? password;
  loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  loadPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  isSetState() {
    Future.delayed(
      Duration(seconds: 1),
      () {
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
    super.initState();
  }

  TextEditingController namePrandTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 1),(){
//   setState(() {

//   });

// });
    return Scaffold(
        appBar: AppBarWidget(
          title: "Prand Page",
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
        body: userName == 'MyAdmin' && password == '123456789'
            ? SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      FutureBuilder(
                        future: loadUserName(),
                        builder: (context, snapshot) {
                          userName = snapshot.data.toString();
                          print(userName);
                          return Column(
                            children: [
                              FutureBuilder(
                                future: loadPassword(),
                                builder: (context, snapshot) {
                                  password = snapshot.data.toString();
                                  print(password);
                                  return SizedBox(
                                    height: 1,
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Example BMW", label: Text("Name Prand")),
                        controller: namePrandTxt,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: c4),
                          onPressed: () async {
                            int x = await DBHelper.database.prandDao
                                .addPrand(Prand(name: namePrandTxt.text));
                            print(x);
                            setState(() {});
                            namePrandTxt.clear();
                          },
                          child: Text("Add new Prand")),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Card(
                          color: c3,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: FutureBuilder(
                              future: DBHelper.database.prandDao.getAllPrands(),
                              builder: (context,
                                  AsyncSnapshot<List<Prand>> snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data!.isEmpty
                                      ? Center(child: Text("Empty"))
                                      : Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.7,
                                              child: ListView.builder(
                                                itemCount:
                                                    snapshot.data!.length,
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    child: Card(
                                                      // color: index.isEven
                                                      //     ? Colors.tealAccent
                                                      //     : Colors.pink,
                                                      margin:
                                                          EdgeInsets.all(15),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: IconButton(
                                                                onPressed:
                                                                    () async {
                                                                  namePrandTxt
                                                                          .text =
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .name!;

                                                                  bool? v =
                                                                      await showModalBottomSheet(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return SizedBox(
                                                                        child: Container(
                                                                            padding: EdgeInsets.all(15),
                                                                            child: Column(
                                                                              children: [
                                                                                TextFormField(
                                                                                  controller: namePrandTxt,
                                                                                ),
                                                                                ElevatedButton(
                                                                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                                                                                    onPressed: () async {
                                                                                      // Department
                                                                                      //     department =
                                                                                      //     Department(
                                                                                      //         name:
                                                                                      //             nameDepTxt.text);

                                                                                      int? x = await DBHelper.database.prandDao.updatesPrand(Prand(id: snapshot.data![index].id, name: namePrandTxt.text));
                                                                                      print(x);

                                                                                      Navigator.pop(context, true);
                                                                                    },
                                                                                    child: Text("Create New"))
                                                                              ],
                                                                            )),
                                                                      );
                                                                    },
                                                                  );

                                                                  setState(
                                                                      () {});
                                                                  if (v !=
                                                                          null &&
                                                                      v) {
                                                                    setState(
                                                                        () {});
                                                                  }
                                                                  print(v);
                                                                },
                                                                icon: Icon(
                                                                  Icons.edit,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          13,
                                                                          121,
                                                                          16),
                                                                )),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                                child: InkWell(
                                                              onTap: () async {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    "/car",
                                                                    arguments: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id);
                                                              },
                                                              child: Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .name!),
                                                            )),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                                child: InkWell(
                                                              onTap: () async {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    "/car",
                                                                    arguments: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id);
                                                              },
                                                              child: Text(snapshot
                                                                  .data![index]
                                                                  .id!
                                                                  .toString()),
                                                            )),
                                                          ),
                                                          Expanded(
                                                            child: IconButton(
                                                                onPressed:
                                                                    () async {
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        title:
                                                                            Card(
                                                                          color:
                                                                              Colors.cyanAccent,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              "Remove ${snapshot.data![index].name}",
                                                                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        content:
                                                                            Card(
                                                                          color:
                                                                              Colors.amber,
                                                                          child:
                                                                              Text(
                                                                            "Do you remove ${snapshot.data![index].name} Prand",
                                                                            style:
                                                                                TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        actions: [
                                                                          ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                                              onPressed: () async {
                                                                                int? x = await DBHelper.database.prandDao.deletePrand(snapshot.data![index].id!);
                                                                                print(x);
                                                                                setState(() {});
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Center(
                                                                                child: Text('Yes'),
                                                                              )),
                                                                          ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              child: Center(child: Text('No')))
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  // int? x = await DBHelper
                                                                  //     .database.departmentDao
                                                                  //     .deleteDepartment(
                                                                  //         snapshot
                                                                  //             .data![index]
                                                                  //             .id!);
                                                                  // print(x);
                                                                  // setState(() {});
                                                                },
                                                                icon: Icon(Icons
                                                                    .delete)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                } else {
                                  return Text("data is no");
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ])))
            : SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      FutureBuilder(
                        future: loadUserName(),
                        builder: (context, snapshot) {
                          userName = snapshot.data.toString();
                          print(userName);
                          return Column(
                            children: [
                              FutureBuilder(
                                future: loadPassword(),
                                builder: (context, snapshot) {
                                  password = snapshot.data.toString();
                                  print(password);
                                  return SizedBox(
                                    height: 1,
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Card(
                          color: Color.fromARGB(255, 149, 148, 144),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: FutureBuilder(
                              future: DBHelper.database.prandDao.getAllPrands(),
                              builder: (context,
                                  AsyncSnapshot<List<Prand>> snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data!.isEmpty
                                      ? Center(child: Text("Empty"))
                                      : Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  1.3,
                                              child: ListView.builder(
                                                itemCount:
                                                    snapshot.data!.length,
                                                itemBuilder: (context, index) {
                                                  return SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    child: Card(
                                                      // color: index.isEven
                                                      //     ? Colors.tealAccent
                                                      //     : Colors.pink,
                                                      margin:
                                                          EdgeInsets.all(15),
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Center(
                                                                child: InkWell(
                                                              onTap: () async {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    "/car",
                                                                    arguments: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id);
                                                              },
                                                              child: SizedBox(
                                                                height: 30,
                                                                child: Text(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .id!
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            )),
                                                          ),
                                                          Expanded(
                                                            child: Center(
                                                                child: InkWell(
                                                              onTap: () async {
                                                                Navigator.pushNamed(
                                                                    context,
                                                                    "/car",
                                                                    arguments: snapshot
                                                                        .data![
                                                                            index]
                                                                        .id);
                                                              },
                                                              child: SizedBox(
                                                                height: 30,
                                                                child: Center(
                                                                  child: Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .name!,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                } else {
                                  return Text("data is no");
                                }
                              },
                            ),
                          ),
                        ),
                      )
                    ]))));
  }
}
