import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Booking.dart';
import 'package:car_booking/Entitis/Cars.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookingPageScreen extends StatefulWidget {
  const BookingPageScreen({super.key});

  @override
  State<BookingPageScreen> createState() => _BookingPageScreenState();
}

class _BookingPageScreenState extends State<BookingPageScreen> {
  int price = 20;
  int total1 = 0;
  int total2 = 0;
  int totalz0 = 0;
  int totalz1 = 0;
  int totalz2 = 0;
  int totalx0 = 0;
  int totalx1 = 0;
  int totalx2 = 0;
  DateTime? startDate;
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController dateStartController = TextEditingController();
  TextEditingController dateLastController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /* final int? carId;
  final int? userId;
  final String? from;
  final String? to;
  final int? total; */
  @override
  Widget build(BuildContext context) {
    Car? dataCar = ModalRoute.of(context)!.settings.arguments as Car;
    //int carId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Page Screen"),
        backgroundColor: c2,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Text("تاريخ بداية الحجز"),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff8f9fb),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "value is Empty";
                          }
                        },
                        readOnly: true,
                        controller: dateStartController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? startDate = await showDatePicker(
                                      builder: (context, child) {
                                        return Theme(
                                            data: ThemeData.dark(),
                                            child: child!);
                                      },
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2100));
                                  this.startDate = startDate;
                                  String x = dateStartController.text = this
                                      .startDate
                                      .toString()
                                      .split(' 00:00:00.000')
                                      .join();
                                  List<String> y = x.split('-');
                                  int x0 = int.parse(y[0]);
                                  int x1 = int.parse(y[1]);
                                  int x2 = int.parse(y[2]);
                                  totalx0 = x0;
                                  totalx1 = x1;
                                  totalx2 = x2;
                                  int z = int.parse(y[2]);
                                  total1 = z;
                                  setState(() {});
                                },
                                icon: Icon(Icons.calendar_month)),
                            hintText: "ادخل تاريخ الحجز",
                            // label: Text("تاريخ الميلاد"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("تاريخ نهاية الحجز"),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xfff8f9fb),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "value is Empty";
                          }
                        },
                        readOnly: true,
                        controller: dateLastController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  DateTime? startDate = await showDatePicker(
                                      builder: (context, child) {
                                        return Theme(
                                            data: ThemeData.dark(),
                                            child: child!);
                                      },
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2023),
                                      lastDate: DateTime(2100));
                                  this.startDate = startDate;
                                  String x = dateLastController.text = this
                                      .startDate
                                      .toString()
                                      .split(' 00:00:00.000')
                                      .join();
                                  print(x);
                                  List<String> y = x.split('-');
                                  int z = int.parse(y[2]);
                                  int z0 = int.parse(y[0]);
                                  int z1 = int.parse(y[1]);
                                  int z2 = int.parse(y[2]);
                                  totalz0 = z0;
                                  totalz1 = z1;
                                  totalz2 = z2;
                                  setState(() {});
                                },
                                icon: Icon(Icons.calendar_month)),
                            hintText: "ادخل تاريخ نهاية الحجز",
                            // label: Text("تاريخ الميلاد"),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FutureBuilder(
                    future: DBHelper.database.carDao.getOneCar(dataCar.id!),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        int x = (((totalz0 - totalx0) * 360) +
                                ((totalz1 - totalx1) * 30) +
                                (totalz2 - totalx2)) *
                            snapshot.data!.price!;
                        totalAmountController.text = x.toString();
                        print(
                            "totalAmountController.text ${totalAmountController.text}");

                        print("price = $x");

                        return Column(
                          children: [
                            //Text("${totalAmountController.text}"),
                            Text(
                              snapshot.data! == null
                                  ? "0"
                                  : " ${(((totalz0 - totalx0) * 360) + ((totalz1 - totalx1) * 30) + (totalz2 - totalx2)) * snapshot.data!.price!}  =تكلفة حجز السيارة لمدة ${((totalz0 - totalx0) * 360) + ((totalz1 - totalx1) * 30) + (totalz2 - totalx2)} أيام",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            // Text("carId = ${snapshot.data!.id.toString()}",
                            //     style: TextStyle(
                            //         fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        );
                      }
                      return Text("data is not");
                    },
                  ),

                  // Text(
                  //   "total=${((totalz0 - totalx0) * 360) + ((totalz1 - totalx1) * 30) + (totalz2 - totalx2)}",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  // Text(
                  //   "day=${((totalz0 - totalx0) * 360) + ((totalz1 - totalx1) * 30) + (totalz2 - totalx2)}",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if ((totalz0 >= totalx0) &&
                              ((totalz0 == totalx0 && totalz1 >= totalx1) &&
                                  (totalz0 == totalx0 &&
                                      totalz1 == totalx1 &&
                                      totalz2 >= totalx2)) &&
                              (dateStartController.text != "null" &&
                                  dateLastController.text != "null" &&
                                  dateStartController != "null" &&
                                  dateLastController != "null")) {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("Enter OK to Complete Booking"),
                                  title: Text("Are you sure"),
                                  actions: [
                                    FutureBuilder(
                                      future: DBHelper.database.carDao
                                          .updatesCar(dataCar),
                                      builder: (context, snapshot) {
                                        return ElevatedButton(
                                            onPressed: () async {
                                              //dataCar.active = true;
                                              Booking b = Booking(
                                                from: dateStartController.text,
                                                to: dateLastController.text,
                                                total: int.parse(
                                                    totalAmountController.text),
                                                userId: 2,
                                                carId: dataCar.id,
                                              );
                                              int checkadd = await DBHelper
                                                  .database.bookingDao
                                                  .addBooking(b);
                                              await ScaffoldMessenger.of(
                                                      context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                      "ok my friend create Succsufully Booking process"),
                                                ),
                                              );
                                              print(
                                                  "${checkadd} is succsuflly ok");
                                              totalAmountController.clear();
                                              dateLastController.clear();
                                              dateStartController.clear();
                                              Navigator.pop(context);

                                              setState(() {});
                                            },
                                            child: Text("OK"));
                                      },
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Cancel"))
                                  ],
                                );
                              },
                            );
                          } else {
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"))
                                    ],
                                    title: Text(
                                        "💕 لايمكن أن تكون  سنة بداية الحجز أكبر من سنة نهاية الحجز او لايمكن أن يكون شهر بداية الحجز أكبر من نهاية الحجز في نفس السنة أو قد تحتوي على قيمة غير صحيحة .تأكد من المعلومات وشكرا لك"));
                              },
                            );
                          }
                        }
                      },
                      child: Text("ADD Booking")),
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.pushNamed(
                            context, '/BookingDetealsPageScreen',
                            arguments: dataCar);
                      },
                      child: Text("View Booking deteals")),
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: FutureBuilder(
                      future:
                          DBHelper.database.imageDao.getOneImage(dataCar.id!),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              // Text("data"),
                              //Text("${snapshot.data!.carId.toString()}"),
                              Expanded(
                                  child: Image.memory(snapshot.data!.name!))
                              // Text(snapshot.data!.from.toString()),
                              // Text(snapshot.data!.to.toString()),
                              // Text(snapshot.data!.total.toString()),
                              // Text(snapshot.data!.userId.toString()),
                            ],
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),

                  // IconButton(
                  //                                 onPressed: () async {
                  //                                   DateTime? startDate =
                  //                                       await showDatePicker(
                  //                                           builder:
                  //                                               (context,
                  //                                                   child) {
                  //                                             return Theme(
                  //                                                 data: ThemeData
                  //                                                     .dark(),
                  //                                                 child:
                  //                                                     child!);
                  //                                           },
                  //                                           context:
                  //                                               context,
                  //                                           initialDate:
                  //                                               DateTime
                  //                                                   .now(),
                  //                                           firstDate:
                  //                                               DateTime(
                  //                                                   1900),
                  //                                           lastDate:
                  //                                               DateTime(
                  //                                                   2100));
                  //                                   this.startDate =
                  //                                       startDate;
                  //                                   dateController.text =
                  //                                       this
                  //                                           .startDate
                  //                                           .toString();
                  //                                   setState(() {});
                  //                                 },
                  //                                 icon: Icon(Icons
                  //                                     .calendar_month)),
                ],
              ),
            )),
      ),
    );
  }
}
