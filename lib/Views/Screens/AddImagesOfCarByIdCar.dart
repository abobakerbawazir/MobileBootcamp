import 'dart:typed_data';

import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddImageCarpage extends StatefulWidget {
  AddImageCarpage();

  @override
  _AddImageCarpageState createState() => _AddImageCarpageState();
}

class _AddImageCarpageState extends State<AddImageCarpage> {
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

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
    super.initState();
  }

  Uint8List? _imageBytes;

  Future<void> _pickImage(int? idCar) async {
    //idCar = ModalRoute.of(context)!.settings.arguments as int;
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final pickedImageBytes = await pickedImage.readAsBytes();
      setState(() {
        _imageBytes = Uint8List.fromList(pickedImageBytes);
      });

      final imageModel = ImageCar(id: null, name: _imageBytes!, carId: idCar);
      await DBHelper.database.imageDao.addImage(imageModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    loadPassword();
    loadUserName();
    int? idCar = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: AppBar(
          title: Text('تحميل الصورة'),
        ),
        body: userName == 'MyAdmin' && password == '123456789'
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    // if (_imageBytes != null)
                    //   Image.memory(_imageBytes!)
                    // else
                    //   Text('لم يتم اختيار صورة.'),
                    ElevatedButton(
                      onPressed: () {
                        _pickImage(idCar);
                      },
                      child: Text('اختر صورة'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                        future: DBHelper.database.imageDao
                            .getAllImagesOfCarId(idCar),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await DBHelper.database.imageDao
                                              .deleteImage(
                                                  snapshot.data![index].id!);
                                          setState(() {});
                                        },
                                        icon: Icon(Icons.delete)),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Image.memory(
                                              snapshot.data![index].name!)),
                                    ),
                                    // Expanded(
                                    //   child: Container(
                                    //       padding: EdgeInsets.all(10),
                                    //       child: Text(
                                    //           snapshot.data![index].carId!.toString())),
                                    // ),
                                    // Expanded(
                                    //   child: Container(
                                    //       padding: EdgeInsets.all(10),
                                    //       child: Text(
                                    //           snapshot.data![index].id!.toString())),
                                    //),
                                  ],
                                );
                              },
                            );
                          }
                          return Text("No data avaliable");
                        },
                      ),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                    // if (_imageBytes != null)
                    //   Image.memory(_imageBytes!)
                    // else
                    //   Text('لم يتم اختيار صورة.'),

                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width,
                      child: FutureBuilder(
                        future: DBHelper.database.imageDao
                            .getAllImagesOfCarId(idCar),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Image.memory(
                                              snapshot.data![index].name!)),
                                    ),
                                    // Expanded(
                                    //   child: Container(
                                    //       padding: EdgeInsets.all(10),
                                    //       child: Text(
                                    //           snapshot.data![index].carId!.toString())),
                                    // ),
                                    // Expanded(
                                    //   child: Container(
                                    //       padding: EdgeInsets.all(10),
                                    //       child: Text(
                                    //           snapshot.data![index].id!.toString())),
                                    //),
                                  ],
                                );
                              },
                            );
                          }
                          return Text("No data avaliable");
                        },
                      ),
                    ),
                  ],
                ),
              ));
  }
}
