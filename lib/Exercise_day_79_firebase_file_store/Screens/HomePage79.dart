import 'package:firebase_app/Exercise_day_79_firebase_file_store/Models/Note.dart';
import 'package:firebase_app/Exercise_day_79_firebase_file_store/NoteVM/NoteVM.dart';
import 'package:firebase_app/Exercise_day_79_firebase_file_store/Widgets/MyTextFormField.dart';
import 'package:firebase_app/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/Exercise_day_79_firebase_file_store/Screens/enum/enumStatus.dart';
import 'package:provider/provider.dart';

class HomePage79 extends StatefulWidget {
  const HomePage79({super.key});

  @override
  State<HomePage79> createState() => _HomePage79State();
}

class _HomePage79State extends State<HomePage79> {
  status? type;
  //bool isActive = false;
  TextEditingController titleTxt = TextEditingController();
  TextEditingController descriptinTxt = TextEditingController();
  TextEditingController statusTxt = TextEditingController();
  status? selectedValue;
  List<status> listStatues = status.values;
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteVM>(context);

    return ChangeNotifierProvider(
      create: (context) => NoteVM(),
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
                          onPressed: () {
                            noteProvider.addNote(
                              Note(
                                  id: 4,
                                  title: titleTxt.text,
                                  description: descriptinTxt.text,
                                  status: statusTxt.text),
                            );
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
                      child: ListView.builder(
                        itemCount: noteProvider.allNote.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(noteProvider.allNote[index].title!),
                            subtitle:
                                Text(noteProvider.allNote[index].description!),
                            trailing: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Card(
                                      child: Text(
                                          "  ${noteProvider.allNote[index].status!}  "),
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
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    title:
                                                        Text("Status Update"),
                                                    actions: [
                                                      Column(
                                                          children:
                                                              List.generate(
                                                        status.values.length,
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
                                                              Radio<status>(
                                                                value: size,
                                                                groupValue:
                                                                    selectedValue,
                                                                onChanged:
                                                                    (value) {
                                                                  selectedValue =
                                                                      value!;
                                                                  y = value.name
                                                                      .toString();
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              Text(
                                                                "${status.values[indexRadio].name}",
                                                              ),
                                                              SizedBox(
                                                                height: 10,
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
                                                          onPressed: () async {
                                                            print(y);
                                                            await noteProvider
                                                                .updateStates(
                                                                    y, index);
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text("Update"))
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
                                          descriptinTxt.text = noteProvider
                                              .allNote[index].description!;
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text("Edit"),
                                                actions: [
                                                  MyTextFormField(
                                                    controller: titleTxt,
                                                    hintText: "Title",
                                                  ),
                                                  MyTextFormField(
                                                    controller: descriptinTxt,
                                                    hintText: "Description",
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(),
                                                      onPressed: () async {
                                                        noteProvider.updateNoteByObject(
                                                            Note(
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
                                                                    .status),
                                                            index);
                                                        // noteProvider.updateNote(
                                                        //     titleTxt.text,
                                                        //     descriptinTxt.text,
                                                        //     index);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Icon(Icons.note_add),
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
                                          noteProvider.deleteNote(
                                              noteProvider.allNote[index]);
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
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}
