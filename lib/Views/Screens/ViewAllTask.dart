import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagerprovider/Entites/Task.dart';
import 'package:taskmanagerprovider/Views/Screens/RealationShipPage.dart';
import 'package:taskmanagerprovider/database/db_helper.dart';
import 'package:taskmanagerprovider/provider/TaskVM.dart';

class ViewAllTask extends StatelessWidget {
  ViewAllTask({super.key});
  TextEditingController titletxt = TextEditingController();
  TextEditingController descriptionTxt = TextEditingController();
  TextEditingController isActiveTxt = TextEditingController();
  bool? isActiveTask;
  String? type;
  List<String> modelList = ['مكتملة', 'غير مكتملة'];
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskVM>(context);

    return ChangeNotifierProvider(
        create: (context) => TaskVM(),
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return RealationShipPage();
                        },
                      ));
                    },
                    icon: Icon(Icons.navigate_next_outlined))
              ],
            ),
            body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff8f9fb),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            controller: titletxt,
                            decoration: InputDecoration(
                                hintText: "ادخل العنوان",
                                // label: Text("تاريخ الميلاد"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff8f9fb),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            controller: descriptionTxt,
                            decoration: InputDecoration(
                                hintText: "ادخل الوصف",
                                // label: Text("تاريخ الميلاد"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff8f9fb),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                            controller: isActiveTxt,
                            decoration: InputDecoration(
                                suffixIcon: DropdownButton(
                                  value: type,
                                  items: modelList.map(
                                    (e) {
                                      return DropdownMenuItem(
                                          value: e,
                                          child: Text(e.toString(),
                                              style: TextStyle(
                                                  color: Colors.black)));
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    type = value!;
                                    isActiveTxt.text = type!.toString();
                                    if (isActiveTxt.text == 'مكتملة') {
                                      isActiveTask = true;
                                    } else {
                                      isActiveTask = false;
                                    }
                                  },
                                ),
                                hintText: "ادخل الحالة",
                                // label: Text("تاريخ الميلاد"),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFc1121f)),
                          onPressed: () {
                            taskProvider.addTask(titletxt.text,
                                descriptionTxt.text, isActiveTask!);
                          },
                          child: Text("Add Task")),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Card(
                          color: Colors.amber,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: FutureBuilder(
                              future: DBHelper.database.taskDao.getAlltasks(),
                              builder: (context,
                                  AsyncSnapshot<List<Task>> snapshot) {
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
                                                            5,
                                                    child: Card(
                                                      // color: index.isEven
                                                      //     ? Colors.tealAccent
                                                      //     : Colors.pink,
                                                      margin:
                                                          EdgeInsets.all(15),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      IconButton(
                                                                          onPressed:
                                                                              () async {
                                                                            titletxt.text =
                                                                                snapshot.data![index].title!;
                                                                            descriptionTxt.text =
                                                                                snapshot.data![index].description!;
                                                                            isActiveTxt.text =
                                                                                snapshot.data![index].active!.toString();

                                                                            bool?
                                                                                v =
                                                                                await showModalBottomSheet(
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return SizedBox(
                                                                                  child: Container(
                                                                                      padding: EdgeInsets.all(15),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          TextFormField(
                                                                                            controller: titletxt,
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 20,
                                                                                          ),
                                                                                          TextFormField(
                                                                                            controller: descriptionTxt,
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 20,
                                                                                          ),
                                                                                          TextFormField(
                                                                                              controller: isActiveTxt,
                                                                                              decoration: InputDecoration(
                                                                                                  suffixIcon: DropdownButton(
                                                                                                    value: type,
                                                                                                    items: modelList.map(
                                                                                                      (e) {
                                                                                                        return DropdownMenuItem(value: e, child: Text(e.toString(), style: TextStyle(color: Colors.black)));
                                                                                                      },
                                                                                                    ).toList(),
                                                                                                    onChanged: (value) {
                                                                                                      type = value!;
                                                                                                      isActiveTxt.text = type!.toString();
                                                                                                      if (isActiveTxt.text == 'مكتملة') {
                                                                                                        isActiveTask = true;
                                                                                                      } else {
                                                                                                        isActiveTask = false;
                                                                                                      }
                                                                                                    },
                                                                                                  ),
                                                                                                  hintText: "ادخل الحالة",
                                                                                                  // label: Text("تاريخ الميلاد"),
                                                                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                                                                                          ElevatedButton(
                                                                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                                                                                              onPressed: () async {
                                                                                                taskProvider.updateTask(snapshot.data![index].id!, titletxt.text, descriptionTxt.text, isActiveTask!);
                                                                                                Navigator.pop(context, true);
                                                                                              },
                                                                                              child: Text("Update New"))
                                                                                        ],
                                                                                      )),
                                                                                );
                                                                              },
                                                                            );
                                                                            print(v);
                                                                          },
                                                                          icon:
                                                                              Icon(
                                                                            Icons.edit,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                13,
                                                                                121,
                                                                                16),
                                                                          )),
                                                                ),
                                                                Expanded(
                                                                  child: Center(
                                                                      child:
                                                                          InkWell(
                                                                    onTap:
                                                                        () async {},
                                                                    child: Text(snapshot
                                                                        .data![
                                                                            index]
                                                                        .title!),
                                                                  )),
                                                                ),
                                                                Expanded(
                                                                  child: Center(
                                                                      child:
                                                                          InkWell(
                                                                    onTap:
                                                                        () async {},
                                                                    child: Text(snapshot
                                                                        .data![
                                                                            index]
                                                                        .active!
                                                                        .toString()),
                                                                  )),
                                                                ),
                                                                Expanded(
                                                                  child: Center(
                                                                      child:
                                                                          InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      Navigator.pushNamed(
                                                                          context,
                                                                          "/car",
                                                                          arguments: snapshot
                                                                              .data![index]
                                                                              .id);
                                                                    },
                                                                    child: Text(snapshot
                                                                        .data![
                                                                            index]
                                                                        .id!
                                                                        .toString()),
                                                                  )),
                                                                ),
                                                                Expanded(
                                                                  child: IconButton(
                                                                      onPressed: () async {
                                                                        showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return AlertDialog(
                                                                              title: Card(
                                                                                color: Colors.cyanAccent,
                                                                                child: Center(
                                                                                  child: Text(
                                                                                    "Remove ${snapshot.data![index].title}",
                                                                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              content: Card(
                                                                                color: Colors.amber,
                                                                                child: Text(
                                                                                  "Do you remove ${snapshot.data![index].title} Task",
                                                                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                ),
                                                                              ),
                                                                              actions: [
                                                                                ElevatedButton(
                                                                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                                                    onPressed: () async {
                                                                                      taskProvider.deleteTask(snapshot.data![index].id!);
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
                                                                      },
                                                                      icon: Icon(Icons.delete)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Text(snapshot
                                                                  .data![index]
                                                                  .description!))
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
                    ])))));
  }
}
