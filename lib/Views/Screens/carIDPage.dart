import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Cars.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:car_booking/Views/Widgets/ackgroundImage.dart';
import 'package:flutter/material.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';

class CarIdPage extends StatefulWidget {
  const CarIdPage({super.key});

  @override
  State<CarIdPage> createState() => _CarIdPageState();
}

class _CarIdPageState extends State<CarIdPage> {
  TextEditingController namePrandTxt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    int idPrand = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
        appBar: AppBarWidget(title: "Cars Page id"),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Example corolla", label: Text("Name cars")),
                    controller: namePrandTxt,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: c4),
                      onPressed: () async {
                        int x = await DBHelper.database.carDao
                            .addCar(Car(name: namePrandTxt.text, prandId: 1));
                        print(x);
                        setState(() {});
                        namePrandTxt.clear();
                      },
                      child: Text("Add new Car")),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Card(
                      color: c3,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: FutureBuilder(
                          future: DBHelper.database.carDao
                              .getAllCarsByPrandIdOnly(idPrand),
                          builder:
                              (context, AsyncSnapshot<List<Car>> snapshot) {
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
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              return Card(
                                                // color: index.isEven
                                                //     ? Colors.tealAccent
                                                //     : Colors.pink,
                                                margin: EdgeInsets.all(15),
                                                child: Column(
                                                  children: [
                                                    index <= 6
                                                        ? InkWell(
                                                            onTap: () async {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  "/booking",
                                                                  arguments: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                            },
                                                            child: Image.asset(index <=
                                                                        6
                                                                    ? 'assets/${index + 1}.png'
                                                                    : 'assets/${1}.png') ??
                                                                Image.asset(
                                                                    'assets/${4}.png'),
                                                          )
                                                        : Image.asset(
                                                            'assets/${1}.png'),
                                                    Text(snapshot.data![index]
                                                                .price !=
                                                            null
                                                        ? "${snapshot.data![index].price} for to day"
                                                        : "لم يتم تحديد السعر بعد"),
                                                    Row(
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

                                                                                    int? x = await DBHelper.database.carDao.updatesCar(Car(id: snapshot.data![index].id, name: namePrandTxt.text, prandId: snapshot.data![index].prandId));
                                                                                    print(x);

                                                                                    Navigator.pop(context, true);
                                                                                  },
                                                                                  child: Text("Create New"))
                                                                            ],
                                                                          )),
                                                                    );
                                                                  },
                                                                );

                                                                setState(() {});
                                                                if (v != null &&
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
                                                              child: Text(snapshot
                                                                  .data![index]
                                                                  .id!
                                                                  .toString())),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                              child: InkWell(
                                                            onTap: () async {
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  "/AddImageCarpage",
                                                                  arguments: snapshot
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                            },
                                                            child: Text(snapshot
                                                                .data![index]
                                                                .name!),
                                                          )),
                                                        ),
                                                        Expanded(
                                                          child: Center(
                                                              child: Text(snapshot
                                                                  .data![index]
                                                                  .prandId!
                                                                  .toString())),
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
                                                                        color: Colors
                                                                            .cyanAccent,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Text(
                                                                            "Remove ${snapshot.data![index].name}",
                                                                            style:
                                                                                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      content:
                                                                          Card(
                                                                        color: Colors
                                                                            .amber,
                                                                        child:
                                                                            Text(
                                                                          "Do you remove ${snapshot.data![index].name} car",
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      actions: [
                                                                        ElevatedButton(
                                                                            style:
                                                                                ElevatedButton.styleFrom(backgroundColor: Colors.green),
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
                                                                            style:
                                                                                ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
                  )
                ],
              )),
        ));
  }
}
