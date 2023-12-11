import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagerprovider/Entites/Task.dart';
import 'package:taskmanagerprovider/Entites/TaskUser.dart';
import 'package:taskmanagerprovider/Entites/User.dart';
import 'package:taskmanagerprovider/database/db_helper.dart';
import 'package:taskmanagerprovider/provider/TaskUserVM.dart';
import 'package:taskmanagerprovider/provider/TaskVM.dart';

class RealationShipPage extends StatelessWidget {
  RealationShipPage({super.key});
  TextEditingController userIdTxt = TextEditingController();
  TextEditingController taskIdTxt = TextEditingController();
  int? typeTask;
  int? typeUser;
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<UserTaskVM>(context);

    return ChangeNotifierProvider(
        create: (context) => UserTaskVM(),
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            child: FutureBuilder(
                              future: DBHelper.database.userDao.getAllusers(),
                              builder: (context,
                                  AsyncSnapshot<List<User>> snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data!.isEmpty
                                      ? Center(child: Text("Users are Empty"))
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 198, 193, 191)),
                                          child: DropdownButton(
                                            value: typeUser,
                                            items: snapshot.data!.map((item) {
                                              return DropdownMenuItem(
                                                child: Text(
                                                  item.username.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                value: item.id,
                                              );
                                            }).toList(),
                                            onChanged: (newvalue) {
                                              typeUser = newvalue!;
                                              userIdTxt.text =
                                                  typeUser!.toString();
                                            },
                                          ),
                                        );
                                } else {
                                  return Text("data is no");
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            readOnly: true,
                            controller: userIdTxt,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            child: FutureBuilder(
                              future: DBHelper.database.taskDao.getAlltasks(),
                              builder: (context,
                                  AsyncSnapshot<List<Task>> snapshot) {
                                if (snapshot.hasData) {
                                  return snapshot.data!.isEmpty
                                      ? Center(child: Text("Task are Empty"))
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 198, 193, 191)),
                                          child: DropdownButton(
                                            value: typeTask,
                                            items: snapshot.data!.map((item) {
                                              return DropdownMenuItem(
                                                child: Text(
                                                  item.title.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                value: item.id,
                                              );
                                            }).toList(),
                                            onChanged: (newvalue) {
                                              typeTask = newvalue!;
                                              taskIdTxt.text =
                                                  typeTask!.toString();
                                            },
                                          ),
                                        );
                                } else {
                                  return Text("data is no");
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: taskIdTxt,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFc1121f)),
                        onPressed: () {
                          taskProvider.addTaskUser(
                              UserId: int.parse(userIdTxt.text),
                              TaskId: int.parse(taskIdTxt.text));
                        },
                        child: Text("Add TaskforUser")),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.8,
                      child: FutureBuilder(
                        future: DBHelper.database.taskUserDao.getAllTaskUsers(),
                        builder:
                            (context, AsyncSnapshot<List<TaskUser>> snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data!.isEmpty
                                ? Center(child: Text("Empty "))
                                : ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        child: Card(
                                          color: index.isEven
                                              ? Colors.amber
                                              : Colors.pink,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () async {
                                                        userIdTxt.text =
                                                            snapshot
                                                                .data![index]
                                                                .UserId!
                                                                .toString();
                                                        taskIdTxt.text =
                                                            snapshot
                                                                .data![index]
                                                                .TaskId!
                                                                .toString();
                                                        bool? v =
                                                            await showModalBottomSheet(
                                                          context: context,
                                                          builder: (context) {
                                                            return SizedBox(
                                                              child: Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            15),
                                                                child: Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              SizedBox(
                                                                            child:
                                                                                FutureBuilder(
                                                                              future: DBHelper.database.userDao.getAllusers(),
                                                                              builder: (context, AsyncSnapshot<List<User>> snapshot) {
                                                                                if (snapshot.hasData) {
                                                                                  return snapshot.data!.isEmpty
                                                                                      ? Center(child: Text("Usres are Empty"))
                                                                                      : Container(
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 198, 193, 191)),
                                                                                          child: DropdownButton(
                                                                                            value: typeUser,
                                                                                            items: snapshot.data!.map((item) {
                                                                                              return DropdownMenuItem(
                                                                                                child: Text(
                                                                                                  item.username.toString(),
                                                                                                  style: TextStyle(color: Colors.black),
                                                                                                ),
                                                                                                value: item.id,
                                                                                              );
                                                                                            }).toList(),
                                                                                            onChanged: (newvalue) {
                                                                                              typeUser = newvalue!;
                                                                                              userIdTxt.text = typeUser!.toString();
                                                                                            },
                                                                                          ),
                                                                                        );
                                                                                } else {
                                                                                  return Text("data is no");
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 3,
                                                                            child: Card(
                                                                                color: Colors.amber,
                                                                                child: TextFormField(
                                                                                  textAlign: TextAlign.center,
                                                                                  readOnly: true,
                                                                                  controller: userIdTxt,
                                                                                  decoration: InputDecoration(border: InputBorder.none),
                                                                                )),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          20,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              SizedBox(
                                                                            child:
                                                                                FutureBuilder(
                                                                              future: DBHelper.database.taskDao.getAlltasks(),
                                                                              builder: (context, AsyncSnapshot<List<Task>> snapshot) {
                                                                                if (snapshot.hasData) {
                                                                                  return snapshot.data!.isEmpty
                                                                                      ? Center(child: Text("Tasks are Empty"))
                                                                                      : Container(
                                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 198, 193, 191)),
                                                                                          child: DropdownButton(
                                                                                            value: typeTask,
                                                                                            items: snapshot.data!.map((item) {
                                                                                              return DropdownMenuItem(
                                                                                                child: Text(
                                                                                                  item.title.toString(),
                                                                                                  style: TextStyle(color: Colors.black),
                                                                                                ),
                                                                                                value: item.id,
                                                                                              );
                                                                                            }).toList(),
                                                                                            onChanged: (newvalue) {
                                                                                              typeTask = newvalue!;
                                                                                              taskIdTxt.text = typeTask!.toString();
                                                                                            },
                                                                                          ),
                                                                                        );
                                                                                } else {
                                                                                  return Text("data is no");
                                                                                }
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                MediaQuery.of(context).size.width / 3,
                                                                            child: Card(
                                                                                color: Colors.amber,
                                                                                child: TextFormField(
                                                                                  textAlign: TextAlign.center,
                                                                                  readOnly: true,
                                                                                  controller: taskIdTxt,
                                                                                  decoration: InputDecoration(border: InputBorder.none),
                                                                                )),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor: Colors
                                                                                .purple),
                                                                        onPressed:
                                                                            () async {
                                                                          taskProvider.updateteTaskUser(
                                                                              int.parse(userIdTxt.text),
                                                                              int.parse(taskIdTxt.text));

                                                                          Navigator.pop(
                                                                              context,
                                                                              true);
                                                                        },
                                                                        child: Text(
                                                                            "Update New"))
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                       
                                                        print(v);
                                                      },
                                                      icon: Icon(Icons.edit)),
                                                  Text(snapshot
                                                      .data![index].TaskId!
                                                      .toString()),
                                                  Text(snapshot
                                                      .data![index].UserId!
                                                      .toString()),
                                                  IconButton(
                                                      onPressed: () async {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              content: Card(
                                                                color: Colors
                                                                    .amber,
                                                                child: Text(
                                                                  "Do you remove ${snapshot.data![index].TaskId} TaskId and ${snapshot.data![index].UserId} UserId for Users",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                              actions: [
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .green),
                                                                    onPressed:
                                                                        () async {
                                                                           taskProvider
                                                                          .deleteTaskUser(
                                                                              snapshot
                                                                              .data![index].UserId!);
                                                                      
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child: Text(
                                                                          'Yes'),
                                                                    )),
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .red),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: Center(
                                                                        child: Text(
                                                                            'No')))
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                      icon: Icon(Icons.delete)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                          } else {
                            return Text("data is no");
                          }
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ));
  }
}
