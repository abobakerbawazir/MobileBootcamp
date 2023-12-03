import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Booking.dart';
import 'package:car_booking/Entitis/Cars.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookingDetealsPageScreen extends StatefulWidget {
  const BookingDetealsPageScreen({super.key});

  @override
  State<BookingDetealsPageScreen> createState() =>
      _BookingDetealsPageScreenState();
}

class _BookingDetealsPageScreenState extends State<BookingDetealsPageScreen> {
  /* final int? carId;
  final int? userId;
  final String? from;
  final String? to;
  final int? total; */
  @override
  Widget build(BuildContext context) {
    Car? carId = ModalRoute.of(context)!.settings.arguments as Car;
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Deteals Page "),
        backgroundColor: c2,
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                      color: Color.fromARGB(255, 225, 207, 207),
                      child: Text(
                        "from=تاريخ بداية الحجز",
                        style: TextStyle(fontSize: 20),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Card(
                    color: Color.fromARGB(255, 225, 207, 207),
                    child: Text(
                      "to=تاريخ نهاية الحجز",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: FutureBuilder(
                      future: DBHelper.database.bookingDao
                          .getAllBookingOfCar(carId.id!),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Card(
                                color: Color.fromARGB(255, 225, 207, 207),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Row(
                                    //   children: [
                                    //     IconButton(
                                    //         onPressed: () async {
                                    //           int? x = await DBHelper
                                    //               .database.bookingDao
                                    //               .deleteBooking(snapshot
                                    //                   .data![index].carId!);
                                    //           setState(() {});
                                    //           print(x);
                                    //         },
                                    //         icon: Icon(Icons.delete))
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.attach_money_rounded,
                                          color: Colors.green,
                                        ),
                                        Text(
                                            "total ${snapshot.data![index].total.toString()}"),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "  from date ${snapshot.data![index].from.toString()}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "  to date ${snapshot.data![index].to.toString()}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Text(
                                    //     "  CarID ${snapshot.data![index].carId.toString()}"),
                                    // SizedBox(
                                    //   height: 5,
                                    // ),
                                    // Text(
                                    //     "  UserID ${snapshot.data![index].userId.toString()}"),
                                    // Text(
                                    //     "  ID ${snapshot.data![index].id.toString()}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  )

                  // SizedBox(
                  //   height: 300,
                  //   width: 300,
                  //   child: FutureBuilder(
                  //     future: DBHelper.database.bookingDao.getOneBooking(carId),
                  //     builder: (context, snapshot) {
                  //       return Column(
                  //             children: [
                  //               Text(snapshot.data!.carId.toString()),
                  //               Text(snapshot.data!.from.toString()),
                  //               Text(snapshot.data!.to.toString()),
                  //               Text(snapshot.data!.total.toString()),
                  //               Text(snapshot.data!.userId.toString()),
                  //             ],
                  //           );
                  //     },
                  //   ),
                  // ),

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
              )),
        ),
      ),
    );
  }
}
