import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/day_floor/Database/db_helper.dart';
import 'package:flutter_application_2/day_floor/Entites/department.dart';

class DepartmentHomePage extends StatefulWidget {
  const DepartmentHomePage({super.key});

  @override
  State<DepartmentHomePage> createState() => _DepartmentHomePageState();
}

class _DepartmentHomePageState extends State<DepartmentHomePage> {
  TextEditingController nameDepTxt = TextEditingController();
  TextEditingController nameDepUpdateTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Department Home"),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Icon(Icons.add),
        onPressed: () async {
          int x = await DBHelper.database.departmentDao
              .addDepartment(Department(name: nameDepTxt.text));
          print(x);
          setState(() {});
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () async {
                 List<Department> x=   await DBHelper.database.departmentDao
              .searchByName(nameDepTxt.text);
          print(x);
          setState(() {});
                }, icon: Icon(Icons.search)),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                      controller: nameDepTxt,
                      decoration: InputDecoration(
                        hintText: 'Department Name',
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 1.2,
                child: FutureBuilder(
                  future: DBHelper.database.departmentDao.getAllDepartments(),
                  builder: (context, AsyncSnapshot<List<Department>> snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isEmpty
                          ? Center(child: Text("Empty"))
                          : Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: index.isEven
                                            ? Colors.amber
                                            : Colors.pink,
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () async {
                                                    nameDepUpdateTxt.text =
                                                        snapshot
                                                            .data![index].name!;

                                                    bool? v =
                                                        await showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return SizedBox(
                                                          child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(15),
                                                              child: Column(
                                                                children: [
                                                                  TextFormField(
                                                                    controller:
                                                                        nameDepUpdateTxt,
                                                                  ),
                                                                  ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors
                                                                              .purple),
                                                                      onPressed:
                                                                          () async {
                                                                        // Department
                                                                        //     department =
                                                                        //     Department(
                                                                        //         name:
                                                                        //             nameDepTxt.text);

                                                                        int? x = await DBHelper
                                                                            .database
                                                                            .departmentDao
                                                                            .updatesDepartment(Department(
                                                                                id: snapshot.data![index].id,
                                                                                name: nameDepUpdateTxt.text));
                                                                        print(
                                                                            x);

                                                                        Navigator.pop(
                                                                            context,
                                                                            true);
                                                                      },
                                                                      child: Text(
                                                                          "Create New"))
                                                                ],
                                                              )),
                                                        );
                                                      },
                                                    );

                                                    setState(() {});
                                                    if (v != null && v) {
                                                      setState(() {});
                                                    }
                                                    print(v);
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Color.fromARGB(
                                                        255, 13, 121, 16),
                                                  )),
                                            ),
                                            Expanded(
                                              child: Center(
                                                  child: Text(snapshot
                                                      .data![index].name!)),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () async {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return AlertDialog(
                                                          content: Card(
                                                            color: Colors.amber,
                                                            child: Text(
                                                              "Do you remove ${snapshot.data![index].name} Department",
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          actions: [
                                                            ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .green),
                                                                onPressed:
                                                                    () async {
                                                                  int? x = await DBHelper
                                                                      .database
                                                                      .departmentDao
                                                                      .deleteDepartment(snapshot
                                                                          .data![
                                                                              index]
                                                                          .id!);
                                                                  print(x);
                                                                  setState(
                                                                      () {});
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                      'Yes'),
                                                                )),
                                                            ElevatedButton(
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .red),
                                                                onPressed: () {
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
                                                    // int? x = await DBHelper
                                                    //     .database.departmentDao
                                                    //     .deleteDepartment(
                                                    //         snapshot
                                                    //             .data![index]
                                                    //             .id!);
                                                    // print(x);
                                                    // setState(() {});
                                                  },
                                                  icon: Icon(Icons.delete)),
                                            ),
                                          ],
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
            )
          ],
        ),
      ),
    );
  }
}
