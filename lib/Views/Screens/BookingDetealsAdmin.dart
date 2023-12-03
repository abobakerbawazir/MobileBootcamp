import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:flutter/material.dart';

class BookingDetealsAdmin extends StatefulWidget {
  const BookingDetealsAdmin({super.key});

  @override
  State<BookingDetealsAdmin> createState() => _BookingDetealsAdminState();
}

class _BookingDetealsAdminState extends State<BookingDetealsAdmin> {
  bool isAcsept = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: "BookingDeteals of Customer",
        onPressed: () => Navigator.pushNamed(context, '/home'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text("تفاصيل حجز العملاء"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                width: 300,
                child: FutureBuilder(
                  future: DBHelper.database.bookingDao.getAllBooking(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          print(
                              "${snapshot.data!.length} Abobaker>>>>>>>>>>>>>>>>>>++++++++++++++++");

                          return Card(
                            color: isAcsept == false
                                ? Color.fromARGB(255, 225, 207, 207)
                                : Colors.green,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    isAcsept == false
                                        ? ElevatedButton(
                                            onPressed: () {
                                              if (isAcsept == false) {
                                                isAcsept = true;
                                              }
                                              setState(() {});
                                            },
                                            child:
                                                Text("أضغط هناء لقبول الحجز"))
                                        : Text(""),
                                    IconButton(
                                        onPressed: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        DBHelper
                                                            .database.bookingDao
                                                            .deleteBookingOfObject(
                                                                snapshot.data![
                                                                    index]);
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("OK")),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      },
                                                      child: Text("Cancel"))
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                FutureBuilder(
                                  future: DBHelper.database.userDao.getOneUser(
                                      snapshot.data![index].userId!),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        children: [
                                          Text(
                                            "User : ${snapshot.data!.username.toString()}",
                                          ),
                                          Text(
                                              "Phone No : ${snapshot.data!.phone.toString()}")
                                        ],
                                      );
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                                FutureBuilder(
                                  future: DBHelper.database.carDao
                                      .getOneCar(snapshot.data![index].carId!),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Column(
                                        children: [
                                          Text(
                                            "Model of Car : ${snapshot.data!.model.toString()}",
                                          ),
                                          Text(
                                            "Name of Car : ${snapshot.data!.name.toString()}",
                                          ),
                                          //Text(snapshot.data!.images.toString())
                                        ],
                                      );
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                                Text(
                                    "from date : ${snapshot.data![index].from.toString()}"),
                                Text(
                                    "to date : ${snapshot.data![index].to.toString()}"),
                                Text(
                                    "total : ${snapshot.data![index].total.toString()}"),
                                SizedBox(
                                  height: 5,
                                ),
                                //Text(snapshot.data![index].userId.toString()),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
