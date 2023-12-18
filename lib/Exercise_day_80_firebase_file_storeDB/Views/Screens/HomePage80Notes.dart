import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Exercise_day_80_firebase_file_storeDB/Models/Note80.dart';
import 'package:firebase_app/Exercise_day_80_firebase_file_storeDB/ViewModels/Note80VM.dart';
import 'package:firebase_app/Exercise_day_80_firebase_file_storeDB/Views/Widgets/MyTextFormField.dart';
import 'package:firebase_app/Exercise_day_80_firebase_file_storeDB/enum/enumStates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage80Notes extends StatefulWidget {
  const HomePage80Notes({super.key});

  @override
  State<HomePage80Notes> createState() => _HomePage80NotesState();
}

class _HomePage80NotesState extends State<HomePage80Notes> {
  status? type;
  //bool isActive = false;
  FirebaseFirestore dbObjectFirebaseFirestore = FirebaseFirestore.instance;
  Note80VM noteProvider = Note80VM();
  TextEditingController titleTxt = TextEditingController();
  TextEditingController descriptinTxt = TextEditingController();
  TextEditingController statusTxt = TextEditingController();
  status? selectedValue;
  List<status> listStatues = status.values;
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<Note80VM>(context);

    return ChangeNotifierProvider(
      create: (context) => Note80VM(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add New Note"),
                    actions: [
                      MyTextFormField(
                        controller: titleTxt,
                        hintText: "Title",
                      ),
                      MyTextFormField(
                        controller: descriptinTxt,
                        hintText: "Description",
                      ),
                      MyTextFormField(
                          controller: statusTxt,
                          hintText: "Status",
                          suffixIcon: DropdownButton<status>(
                            value: type,
                            onChanged: (value) {
                              type = value;
                              statusTxt.text = type!.value;
                              type = null;

                              // setState(() {
                              //   type = null;
                              // });
                            },
                            items: status.values.map<DropdownMenuItem<status>>(
                              (status e) {
                                return DropdownMenuItem<status>(
                                  child: Text("${e.value}"),
                                  value: e,
                                );
                              },
                            ).toList(),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () async {
                            await dbObjectFirebaseFirestore
                                .collection('Notes')
                                .add(noteProvider.addClollectioForStudent(Note(
                                    title: titleTxt.text,
                                    description: descriptinTxt.text,
                                    status: statusTxt.text)))
                                .whenComplete(
                              () {
                                titleTxt.clear();
                                descriptinTxt.clear();
                                statusTxt.clear();
                              },
                            ).catchError(() {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Feailde")));
                            });

                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.note_add),
                              Text(
                                "Add New Note",
                              )
                            ],
                          ))
                    ],
                  );
                },
              );
            },
            child: Text("1+")),
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Firebase Firestom"),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: FutureBuilder(
                          future: noteProvider.loadNotes(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(snapshot.data![index].title!),
                                    subtitle: Text(
                                        snapshot.data![index].description!),
                                    // leading: Text(snapshot.data![index].title!),
                                    trailing: Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Card(
                                              child: Text(
                                                  "  ${snapshot.data![index].status!}  "),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: PopupMenuButton<String>(
                                          onSelected: (value) {
                                            switch (value) {
                                              case '1':
                                                {
                                                  var y;
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return StatefulBuilder(
                                                        builder: (context,
                                                            setState) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                "Status Update"),
                                                            actions: [
                                                              Column(
                                                                  children: List
                                                                      .generate(
                                                                status.values
                                                                    .length,
                                                                (indexRadio) {
                                                                  var xx = status
                                                                      .values[
                                                                          indexRadio]
                                                                      .name;
                                                                  final size =
                                                                      listStatues[
                                                                          indexRadio];
                                                                  return Row(
                                                                    children: [
                                                                      Radio<
                                                                          status>(
                                                                        value:
                                                                            size,
                                                                        groupValue:
                                                                            selectedValue,
                                                                        onChanged:
                                                                            (value) {
                                                                          setState(
                                                                              () {
                                                                            selectedValue =
                                                                                value!;
                                                                            y = value.name.toString();
                                                                          });

                                                                          // if (noteProvider
                                                                          //     .disableOptions
                                                                          //     .contains(status.values[indexRadio].name)) {}
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        "${status.values[indexRadio].name}",
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      // ElevatedButton(
                                                                      //     onPressed:
                                                                      //         () {
                                                                      //       print(y);

                                                                      //       noteProvider.updateStates(
                                                                      //           status
                                                                      //               .values[indexRadio]
                                                                      //               .name,
                                                                      //           index);
                                                                      //     },
                                                                      //     child: Text(
                                                                      //         "Update"))
                                                                    ],
                                                                  );
                                                                },
                                                              )),
                                                              ElevatedButton(
                                                                  onPressed:
                                                                      () async {
                                                                    if (y !=
                                                                        null) {
                                                                      await dbObjectFirebaseFirestore
                                                                          .collection(
                                                                              'Notes')
                                                                          .doc(
                                                                              "${snapshot.data![index].id}")
                                                                          .update(noteProvider.addClollectioForStudent(Note(
                                                                              id: noteProvider.allNote[index].id,
                                                                              title: noteProvider.allNote[index].title,
                                                                              description: noteProvider.allNote[index].description,
                                                                              status: y)))
                                                                          .whenComplete(
                                                                        () {
                                                                          titleTxt
                                                                              .clear();
                                                                          descriptinTxt
                                                                              .clear();
                                                                          statusTxt
                                                                              .clear();
                                                                        },
                                                                      ).catchError(() {
                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                            content:
                                                                                Text("Feailde")));
                                                                      });
                                                                      Navigator.pop(
                                                                          context);
                                                                      print(y);
                                                                      selectedValue =
                                                                          null;
                                                                    } else {
                                                                      showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text("لايمكن ان لا تحدد اي قيمة من الخيارات المتاحة"),
                                                                            actions: [
                                                                              ElevatedButton(
                                                                                  onPressed: () {
                                                                                    Navigator.pop(context);
                                                                                  },
                                                                                  child: Text("تمام"))
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                      "Update"))
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                }
                                              case '2':
                                                {
                                                  titleTxt.text = noteProvider
                                                      .allNote[index].title!;
                                                  descriptinTxt.text =
                                                      noteProvider
                                                          .allNote[index]
                                                          .description!;
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: Text("Edit"),
                                                        actions: [
                                                          MyTextFormField(
                                                            controller:
                                                                titleTxt,
                                                            hintText: "Title",
                                                          ),
                                                          MyTextFormField(
                                                            controller:
                                                                descriptinTxt,
                                                            hintText:
                                                                "Description",
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(),
                                                              onPressed:
                                                                  () async {
                                                                await dbObjectFirebaseFirestore
                                                                    .collection(
                                                                        'Notes')
                                                                    .doc(
                                                                        "${snapshot.data![index].id}")
                                                                    .update(noteProvider.addClollectioForStudent(Note(
                                                                        id: noteProvider
                                                                            .allNote[
                                                                                index]
                                                                            .id,
                                                                        title: titleTxt
                                                                            .text,
                                                                        description:
                                                                            descriptinTxt
                                                                                .text,
                                                                        status: noteProvider
                                                                            .allNote[
                                                                                index]
                                                                            .status)))
                                                                    .whenComplete(
                                                                  () {
                                                                    titleTxt
                                                                        .clear();
                                                                    descriptinTxt
                                                                        .clear();
                                                                    statusTxt
                                                                        .clear();
                                                                  },
                                                                ).catchError(
                                                                        () {
                                                                  ScaffoldMessenger.of(
                                                                          context)
                                                                      .showSnackBar(SnackBar(
                                                                          content:
                                                                              Text("Feailde")));
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Icon(Icons
                                                                      .note_add),
                                                                  Text(
                                                                    "Update Note",
                                                                  )
                                                                ],
                                                              ))
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              case '3':
                                                {
                                                  dbObjectFirebaseFirestore
                                                      .collection('Notes')
                                                      .doc(snapshot
                                                          .data![index].id)
                                                      .delete();
                                                }
                                            }
                                            print(value);
                                          },
                                          icon: Icon(Icons.settings),
                                          itemBuilder: (context) {
                                            return <PopupMenuItem<String>>[
                                              PopupMenuItem(
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.update),
                                                      Text("Update Status")
                                                    ],
                                                  ),
                                                  value: '1'),
                                              PopupMenuItem(
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.edit),
                                                      Text("Edit")
                                                    ],
                                                  ),
                                                  value: '2'),
                                              PopupMenuItem(
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.delete),
                                                      Text("Delete")
                                                    ],
                                                  ),
                                                  value: '3'),
                                            ];
                                          },
                                        )),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ))
                  ],
                ))),
      ),
    );
  }
}
