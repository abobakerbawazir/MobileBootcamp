import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Cars.dart';
import 'package:car_booking/Entitis/Images.dart';
import 'package:car_booking/Entitis/Users.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:car_booking/Views/Widgets/ackgroundImage.dart';
import 'package:flutter/material.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class carsScreen extends StatefulWidget {
  const carsScreen({super.key});

  @override
  State<carsScreen> createState() => _carsScreenState();
}

/* final int? id;
  final int? prandId;
  final String? name;
  final String? model;
  final bool? active;
  final int? price; */

class _carsScreenState extends State<carsScreen> {
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

  int? type;
  //int size = 25;
  List<int> modelList = List.generate(25, (index) => index + 2000);
  bool isActive = false;
  TextEditingController nameTxt = TextEditingController();
  TextEditingController modelTxt = TextEditingController();
  TextEditingController namePrandTxt = TextEditingController();
  TextEditingController priceTxt = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadPassword();
    loadUserName();
    // Future<User?> userOB =
    //     ModalRoute.of(context)!.settings.arguments as Future<User?>;
    int? idPrand = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: AppBarWidget(title: "Cars Page",onPressed: () => Navigator.pushNamed(context, '/prand'),),
        body: userName == 'MyAdmin' && password == '123456789'
            ? StatefulBuilder(
                builder: (context, setState) {
                  return SingleChildScrollView(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        child: Column(
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
                            // FutureBuilder(
                            //   future: DBHelper.database.imageDao.getAllImages(),
                            //   builder: (context, snapshot) {
                            //     return Image.memory(snapshot.data![1].name!);
                            //   },
                            // ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: c4),
                                onPressed: () async {
                                  setState(() {});
                                  await showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xfff8f9fb),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: TextFormField(
                                                    controller: nameTxt,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "value is Empty";
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        suffixIcon: IconButton(
                                                            onPressed:
                                                                () async {
                                                              setState(() {});
                                                            },
                                                            icon: Icon(Icons
                                                                .car_crash)),
                                                        hintText: "Car Name",
                                                        // label: Text("تاريخ الميلاد"),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xfff8f9fb),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly
                                                    ],
                                                    controller: priceTxt,
                                                    //maxLength: 4,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "value is Empty";
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        suffixIcon: IconButton(
                                                            onPressed:
                                                                () async {
                                                              setState(() {});
                                                            },
                                                            icon: Icon(Icons
                                                                .price_check)),
                                                        hintText: "Car Price",
                                                        // label: Text("تاريخ الميلاد"),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xfff8f9fb),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: TextFormField(
                                                    controller: modelTxt,
                                                    readOnly: true,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return "value is Empty";
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                        suffixIcon:
                                                            DropdownButton(
                                                          // icon: Icon(Icons
                                                          //     .arrow_drop_down_circle_outlined),
                                                          value: type,
                                                          items: modelList.map(
                                                            (e) {
                                                              return DropdownMenuItem(
                                                                  value: e,
                                                                  child: Text(
                                                                      e
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black)));
                                                            },
                                                          ).toList(),
                                                          onChanged: (value) {
                                                            type = value!;
                                                            modelTxt.text =
                                                                type!
                                                                    .toString();
                                                          },
                                                        ),
                                                        hintText: "Car Model",
                                                        // label: Text("تاريخ الميلاد"),
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)))),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 10,
                                            // ),
                                            // Expanded(
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //         color: Color(0xfff8f9fb),
                                            //         borderRadius:
                                            //             BorderRadius.circular(10)),
                                            //     child: TextFormField(
                                            //         validator: (value) {
                                            //           if (value == null ||
                                            //               value.isEmpty) {
                                            //             return "value is Empty";
                                            //           }
                                            //         },
                                            //         decoration: InputDecoration(
                                            //             suffixIcon: IconButton(
                                            //                 onPressed: () async {
                                            //                   setState(() {});
                                            //                 },
                                            //                 icon: Icon(Icons.car_crash)),
                                            //             hintText: "Car Name",
                                            //             // label: Text("تاريخ الميلاد"),
                                            //             border: OutlineInputBorder(
                                            //                 borderRadius:
                                            //                     BorderRadius.circular(
                                            //                         10)))),
                                            //   ),
                                            // ),

                                            // SizedBox(
                                            //   height: 10,
                                            // ),
                                            // Expanded(
                                            //   child: TextFormField(
                                            //     decoration: InputDecoration(
                                            //         hintText: "Example corolla",
                                            //         label: Text("Name cars")),
                                            //     controller: namePrandTxt,
                                            //   ),
                                            // ),

                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text("is Active"),
                                                  StatefulBuilder(
                                                    builder:
                                                        (context, setState) {
                                                      return IconButton(
                                                          onPressed: () async {
                                                            if (isActive) {
                                                              isActive = false;
                                                              print(isActive);
                                                            } else {
                                                              isActive = true;
                                                              print(isActive);
                                                            }
                                                            setState(() {});
                                                          },
                                                          icon: isActive ==
                                                                  false
                                                              ? Icon(Icons
                                                                  .check_box_outline_blank)
                                                              : Icon(Icons
                                                                  .check_box));
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                            ElevatedButton(
                                                child: Text("Add New Car"),
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: c4),
                                                onPressed: () async {
                                                  int x = await DBHelper
                                                      .database.carDao
                                                      .addCar(Car(
                                                          name: nameTxt.text,
                                                          prandId: idPrand,
                                                          active: isActive,
                                                          model: modelTxt.text,
                                                          price: int.parse(
                                                              priceTxt.text)));
                                                  print(x);
                                                  setState(() {});
                                                  nameTxt.clear();
                                                  priceTxt.clear();
                                                  modelTxt.clear();
                                                  Navigator.pop(context);
                                                }),
                                            SizedBox(
                                              height: 30,
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                  // int x = await DBHelper.database.carDao.addCar(Car(
                                  //     name: namePrandTxt.text,
                                  //     prandId: 1,
                                  //     active: isActive,
                                  //     model: "2012",
                                  //     price: 3000));
                                  // print(x);
                                  // setState(() {});
                                  // namePrandTxt.clear();
                                },
                                child: Text("Add new Car")),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Card(
                                color: c3,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: FutureBuilder(
                                    future: DBHelper.database.carDao
                                        .getAllCarsByPrandIdOnly(idPrand),
                                    builder: (context,
                                        AsyncSnapshot<List<Car>> snapshot) {
                                      if (snapshot.hasData) {
                                        return snapshot.data!.isEmpty
                                            ? Center(child: Text("Empty"))
                                            : Column(
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            1.3,
                                                    child: ListView.builder(
                                                      itemCount:
                                                          snapshot.data!.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return Card(
                                                          // color: index.isEven
                                                          //     ? Colors.tealAccent
                                                          //     : Colors.pink,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  15),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Center(
                                                                        child: InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            "/AddImageCarpage",
                                                                            arguments:
                                                                                snapshot.data![index].id);
                                                                      },
                                                                      child:
                                                                          Card(
                                                                        color: Color.fromRGBO(
                                                                            149,
                                                                            210,
                                                                            239,
                                                                            1),
                                                                        child:
                                                                            Text(
                                                                          "   أضف صورة للسيارة   ",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          250,
                                                                      width:
                                                                          300,
                                                                      child:
                                                                          FutureBuilder(
                                                                        future: DBHelper
                                                                            .database
                                                                            .imageDao
                                                                            .getOneImage(snapshot.data![index].id!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          if (snapshot
                                                                              .hasData) {
                                                                            return Column(
                                                                              children: [
                                                                                // Text("data"),
                                                                                // Text(
                                                                                //     "${snapshot.data!.carId.toString()}"),
                                                                                Expanded(
                                                                                  child: Image.memory(snapshot.data!.name!),
                                                                                )
                                                                                // Text(snapshot.data!.from.toString()),
                                                                                // Text(snapshot.data!.to.toString()),
                                                                                // Text(snapshot.data!.total.toString()),
                                                                                // Text(snapshot.data!.userId.toString()),
                                                                              ],
                                                                            );
                                                                          }
                                                                          return Text(
                                                                              "لم يتم تحديد الصورة");
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            "/booking",
                                                                            arguments:
                                                                                snapshot.data![index]);
                                                                      },
                                                                      child: Expanded(
                                                                          child: Card(
                                                                        color: Color.fromRGBO(
                                                                            149,
                                                                            210,
                                                                            239,
                                                                            1),
                                                                        child:
                                                                            Text(
                                                                          "   أحجز السيارة   ",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ))),
                                                                  InkWell(
                                                                      onTap:
                                                                          () {
                                                                        // Navigator.pushNamed(
                                                                        //     context,
                                                                        //     "/booking",
                                                                        //     arguments:
                                                                        //         snapshot.data![
                                                                        //             index]
                                                                        //             );
                                                                      },
                                                                      child: Expanded(
                                                                          child: Card(
                                                                        color: Color.fromRGBO(
                                                                            111,
                                                                            210,
                                                                            143,
                                                                            1),
                                                                        child:
                                                                            Text(
                                                                          " \$ ${snapshot.data![index].price} ",
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ))),
                                                                ],
                                                              ),

                                                              // index <= 6
                                                              //     ? InkWell(
                                                              //         onTap: () {
                                                              //           Navigator.pushNamed(
                                                              //               context,
                                                              //               "/booking",
                                                              //               arguments: snapshot
                                                              //                       .data![
                                                              //                   index]);
                                                              //         },
                                                              //         child: Image.asset(
                                                              //                 'assets/${index + 1}.png') ??
                                                              //             Image.asset(
                                                              //                 'assets/${4}.png'),
                                                              //       )
                                                              //     : Image.asset(
                                                              //         'assets/${1}.png'),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: IconButton(
                                                                        onPressed: () async {
                                                                          nameTxt.text = snapshot
                                                                              .data![index]
                                                                              .name!;
                                                                          priceTxt.text = snapshot
                                                                              .data![index]
                                                                              .price!
                                                                              .toString();
                                                                          modelTxt.text = snapshot
                                                                              .data![index]
                                                                              .model!;

                                                                          bool?
                                                                              v =
                                                                              await showModalBottomSheet(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Container(
                                                                                padding: EdgeInsets.all(10),
                                                                                child: Column(
                                                                                  children: [
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(color: Color(0xfff8f9fb), borderRadius: BorderRadius.circular(10)),
                                                                                        child: TextFormField(
                                                                                            controller: nameTxt,
                                                                                            validator: (value) {
                                                                                              if (value == null || value.isEmpty) {
                                                                                                return "value is Empty";
                                                                                              }
                                                                                            },
                                                                                            decoration: InputDecoration(
                                                                                                suffixIcon: IconButton(
                                                                                                    onPressed: () async {
                                                                                                      setState(() {});
                                                                                                    },
                                                                                                    icon: Icon(Icons.car_crash)),
                                                                                                hintText: "Car Name",
                                                                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(color: Color(0xfff8f9fb), borderRadius: BorderRadius.circular(10)),
                                                                                        child: TextFormField(
                                                                                            keyboardType: TextInputType.number,
                                                                                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                                                                            controller: priceTxt,
                                                                                            //maxLength: 4,
                                                                                            validator: (value) {
                                                                                              if (value == null || value.isEmpty) {
                                                                                                return "value is Empty";
                                                                                              }
                                                                                            },
                                                                                            decoration: InputDecoration(
                                                                                                suffixIcon: IconButton(
                                                                                                    onPressed: () async {
                                                                                                      setState(() {});
                                                                                                    },
                                                                                                    icon: Icon(Icons.price_check)),
                                                                                                hintText: "Car Price",
                                                                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(color: Color(0xfff8f9fb), borderRadius: BorderRadius.circular(10)),
                                                                                        child: TextFormField(
                                                                                            controller: modelTxt,
                                                                                            readOnly: true,
                                                                                            validator: (value) {
                                                                                              if (value == null || value.isEmpty) {
                                                                                                return "value is Empty";
                                                                                              }
                                                                                            },
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
                                                                                                    modelTxt.text = type!.toString();
                                                                                                  },
                                                                                                ),
                                                                                                hintText: "Car Model",
                                                                                                // label: Text("تاريخ الميلاد"),
                                                                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Row(
                                                                                        children: [
                                                                                          Text("is Active"),
                                                                                          StatefulBuilder(
                                                                                            builder: (context, setState) {
                                                                                              return IconButton(
                                                                                                  onPressed: () async {
                                                                                                    if (isActive) {
                                                                                                      isActive = false;
                                                                                                      print(isActive);
                                                                                                    } else {
                                                                                                      isActive = true;
                                                                                                      print(isActive);
                                                                                                    }
                                                                                                    setState(() {});
                                                                                                  },
                                                                                                  icon: isActive == false ? Icon(Icons.check_box_outline_blank) : Icon(Icons.check_box));
                                                                                            },
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    ElevatedButton(
                                                                                        child: Text("Update Car"),
                                                                                        style: ElevatedButton.styleFrom(backgroundColor: c4),
                                                                                        onPressed: () async {
                                                                                          int? x = await DBHelper.database.carDao.updatesCar(Car(id: snapshot.data![index].id, name: nameTxt.text, prandId: snapshot.data![index].prandId, active: isActive, price: int.parse(priceTxt.text), model: modelTxt.text));
                                                                                          Navigator.pop(context, true);
                                                                                          print(x);
                                                                                          setState(() {});
                                                                                          nameTxt.clear();
                                                                                          priceTxt.clear();
                                                                                          modelTxt.clear();
                                                                                          Navigator.of(context);
                                                                                        }),
                                                                                    SizedBox(
                                                                                      height: 30,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          );

                                                                          //     await showModalBottomSheet(
                                                                          //   context:
                                                                          //       context,
                                                                          //   builder:
                                                                          //       (context) {
                                                                          //     return SizedBox(
                                                                          //       child: Container(
                                                                          //           padding: EdgeInsets.all(15),
                                                                          //           child: Column(
                                                                          //             children: [
                                                                          //               TextFormField(
                                                                          //                 controller: namePrandTxt,
                                                                          //               ),
                                                                          //               ElevatedButton(
                                                                          //                   style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                                                                          //                   onPressed: () async {
                                                                          //                     // Department
                                                                          //                     //     department =
                                                                          //                     //     Department(
                                                                          //                     //         name:
                                                                          //                     //             nameDepTxt.text);

                                                                          //                     int? x = await DBHelper.database.carDao.updatesCar(Car(id: snapshot.data![index].id, name: namePrandTxt.text, prandId: snapshot.data![index].prandId));
                                                                          //                     print(x);

                                                                          //                     Navigator.pop(context, true);
                                                                          //                   },
                                                                          //                   child: Text("Create New"))
                                                                          //             ],
                                                                          //           )),
                                                                          //     );
                                                                          //   },
                                                                          // );

                                                                          setState(
                                                                              () {});
                                                                          if (v != null &&
                                                                              v) {
                                                                            setState(() {});
                                                                          }
                                                                          print(
                                                                              v);
                                                                        },
                                                                        icon: Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              13,
                                                                              121,
                                                                              16),
                                                                        )),
                                                                  ),
                                                                  // Expanded(
                                                                  //   child: Center(
                                                                  //       child: Text(snapshot
                                                                  //           .data![index]
                                                                  //           .id!
                                                                  //           .toString())),
                                                                  // ),
                                                                  Expanded(
                                                                    child: Center(
                                                                        child: InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        Navigator.pushNamed(
                                                                            context,
                                                                            "/AddImageCarpage",
                                                                            arguments:
                                                                                snapshot.data![index].id);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "${snapshot.data![index].name!}",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    )),
                                                                  ),
                                                                  // Expanded(
                                                                  //   child: Center(
                                                                  //       child: Text(snapshot
                                                                  //           .data![index]
                                                                  //           .prandId!
                                                                  //           .toString())),
                                                                  // ),
                                                                  // Expanded(
                                                                  //   child: Center(
                                                                  //       child: Text(snapshot
                                                                  //           .data![index]
                                                                  //           .active!
                                                                  //           .toString())),
                                                                  // ),
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
                                                                                      "Remove ${snapshot.data![index].name}",
                                                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                content: Card(
                                                                                  color: Colors.amber,
                                                                                  child: Text(
                                                                                    "Do you remove ${snapshot.data![index].name} car",
                                                                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                ),
                                                                                actions: [
                                                                                  ElevatedButton(
                                                                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                                                                      onPressed: () async {
                                                                                        int? x = await DBHelper.database.carDao.deleteCar(snapshot.data![index].id!);
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
                                                                          //     .database.carDao
                                                                          //     .deleteCarOfObject(
                                                                          //         snapshot
                                                                          //             .data![index]
                                                                          //             );
                                                                          // print(x);
                                                                          // setState(() {});
                                                                        },
                                                                        icon: Icon(Icons.delete)),
                                                                  ),
                                                                ],
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
                              ),
                            ),
                            // SizedBox(
                            //   height: 100,
                            //   width: MediaQuery.of(context).size.width,
                            //   child: FutureBuilder(
                            //     future: DBHelper.database.carDao.getAllImagesAndCars(),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.hasData) {
                            //         return ListView.builder(
                            //           itemCount: snapshot.data!.length,
                            //           itemBuilder: (context, index) {
                            //             return Column(
                            //               children: [
                            //                 Text("data"),
                            //                 Text(snapshot.data![index].images!.id
                            //                     .toString()),
                            //                 Image.memory(
                            //                     snapshot.data![index].nameImages!),
                            //               ],
                            //             );
                            //           },
                            //         );
                            //       }
                            //       return Text("الصورة غير موجودة");
                            //     },
                            //   ),
                            // )
                            // SizedBox(
                            //   height: 200,
                            //   width: 300,
                            //   child: FutureBuilder(
                            //     future: DBHelper.database.imageDao.getAllImages(),
                            //     builder: (context, snapshot) {
                            //       return ListView.builder(
                            //         itemCount: snapshot.data!.length,
                            //         itemBuilder: (context, index) {
                            //           return Column(
                            //             children: [
                            //               Text("${snapshot.data![index].carId!}"),
                            //               Image.memory(snapshot.data![index].name!),
                            //             ],
                            //           );
                            //         },
                            //       );
                            //     },
                            //   ),
                            // )
                          ],
                        )),
                  );
                },
              )
            : SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Column(
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
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Card(
                            color: c3,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.1,
                              child: FutureBuilder(
                                future: DBHelper.database.carDao
                                    .getAllCarsByPrandIdOnly(idPrand),
                                builder: (context,
                                    AsyncSnapshot<List<Car>> snapshot) {
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
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Card(
                                                      margin:
                                                          EdgeInsets.all(15),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Center(
                                                                    child:
                                                                        InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        "/AddImageCarpage",
                                                                        arguments: snapshot
                                                                            .data![index]
                                                                            .id);
                                                                  },
                                                                  child: Card(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            149,
                                                                            210,
                                                                            239,
                                                                            1),
                                                                    child: Text(
                                                                      "   شاهد باقي الصور للسيارة  ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                )),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Center(
                                                                child: SizedBox(
                                                                  height: 250,
                                                                  width: 300,
                                                                  child:
                                                                      FutureBuilder(
                                                                    future: DBHelper
                                                                        .database
                                                                        .imageDao
                                                                        .getOneImage(snapshot
                                                                            .data![index]
                                                                            .id!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      if (snapshot
                                                                          .hasData) {
                                                                        return Column(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Image.memory(snapshot.data!.name!),
                                                                            )
                                                                          ],
                                                                        );
                                                                      }
                                                                      return Text(
                                                                          "لم يتم تحديد الصورة");
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              InkWell(
                                                                  onTap: () {
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        "/booking",
                                                                        arguments:
                                                                            snapshot.data![index]);
                                                                  },
                                                                  child:
                                                                      Expanded(
                                                                          child:
                                                                              Card(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            149,
                                                                            210,
                                                                            239,
                                                                            1),
                                                                    child: Text(
                                                                      "   أحجز السيارة   ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ))),
                                                              InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Expanded(
                                                                          child:
                                                                              Card(
                                                                    color: Color
                                                                        .fromRGBO(
                                                                            111,
                                                                            210,
                                                                            143,
                                                                            1),
                                                                    child: Text(
                                                                      " \$ ${snapshot.data![index].price} ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ))),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child: Center(
                                                                    child:
                                                                        InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    Navigator.pushNamed(
                                                                        context,
                                                                        "/AddImageCarpage",
                                                                        arguments: snapshot
                                                                            .data![index]
                                                                            .id);
                                                                  },
                                                                  child: Text(
                                                                    "${snapshot.data![index].name!}",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                )),
                                                              ),
                                                            ],
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
                          ),
                        ),
                      ],
                    )),
              ));
  }
}
