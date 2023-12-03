import 'package:car_booking/Database/db_helper.dart';
import 'package:car_booking/Entitis/Users.dart';
import 'package:car_booking/Views/Widgets/AppBarWidget.dart';
import 'package:car_booking/Views/Widgets/MyElevetedButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({super.key, this.id});
  int? idRole;
  int? id;

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String? userName;
  String? password;
  int? User_id;

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 1),
      () {
        setState(() {});
      },
    );
    if (widget.id != null) {
      User_id = widget.id;
    } else {
      User_id = 2;
    }
    setState(() {});
    super.initState();
  }

  String x = "123";
  Future<List<String>>? loadToken() async {
    final prefs = await SharedPreferences.getInstance();

    Future<List<String>>? x =
        prefs.getStringList('login') as Future<List<String>>?;
    return x!;
  }

  loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  loadPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  loadRoute() async {
    return await ModalRoute.of(context)!.settings.arguments as Future<User?>;
  }

  // List<String> xxxx = [];

  @override
  Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 5),(){
//   Navigator.pushReplacementNamed(context, "/prand");
// });
    loadRoute();
    //loadToken();
    // List<String> xxx =
    //     ModalRoute.of(context)!.settings.arguments as List<String>;
    // xxxx.add(xxx[0]);
    // xxxx.add(xxx[1]);
    // Future<User?> x =
    //     ModalRoute.of(context)!.settings.arguments as Future<User?>;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("back from Home Page"),
                        title: Text("Are you sure"),
                        actions: [
                          ElevatedButton(
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setBool('token', false);
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: Text("OK")),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"))
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.logout))
          ],
          backgroundColor: c2,
          title: Text("Home Page Screen")),
      body: userName == 'MyAdmin' && password == '123456789'?
      SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                FutureBuilder(
                  future: loadUserName(),
                  builder: (context, snapshot) {
                    userName = snapshot.data.toString();
                    print(userName);
                    return Column(
                      children: [
                        // Text(snapshot.data.toString()),
                        FutureBuilder(
                          future: loadPassword(),
                          builder: (context, snapshot) {
                            password = snapshot.data.toString();
                            print(password);
                            return SizedBox(
                              height: 1,
                            );
                            // return Text(snapshot.data.toString());
                          },
                        ),
                      ],
                    );
                  },
                ),
                // FutureBuilder(
                //   future: DBHelper.database.userDao
                //       .getOneUserByuserNameAndPassword(xxxx[0], xxxx[1]),
                //   builder: (context, snapshot) {
                //     return Column(
                //       children: [
                //         Text("${snapshot.data!.username}"),
                //         Text("${snapshot.data!.password}"),
                //         Text("${snapshot.data!.phone}"),
                //         Text("${snapshot.data!.id}"),
                //         Text("${snapshot.data!.roleId}"),
                //       ],
                //     );
                //   },
                // ),
                //Text(User_id.toString()),
                // widget.id != null
                //     ? Text(User_id.toString())
                //     : Text(User_id.toString()),
//                 if (true) ... [
// Text('')
//                 ] else if(1==9) ...[
//                   Text('')

//                 ] else...[
//                   Text('')

//                 ]
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Welcome my friend ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Image.asset('assets/1.png'),

                SizedBox(
                  height: 30,
                ),
                Card(
                    color: Colors.amber,
                    child: Center(
                        child: Text(
                      """توجد العديد من السيارات الفاخرة في إنتظارك . ماذا تنتظر أحجز سياراتك المفضلة الأن لحجز سياراتك أضغط على زر في الأسفل""",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ))),
                SizedBox(
                  height: 10,
                ),

                MyElevatedButton(
                    backgroundColor: Color.fromRGBO(149, 210, 239, 1),
                    foregroundColor: Colors.black,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context, "/prand",
                        // arguments:
                        //     DBHelper.database.userDao.getOneUser(User_id!)
                      );
                    },
                    text: "Go to Prand page"),
                SizedBox(
                  height: 20,
                ),
                MyElevatedButton(
                    fontSize: 13,
                    backgroundColor: Color.fromRGBO(149, 210, 239, 1),
                    foregroundColor: Colors.black,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context, "/BookingDetealsAdmin",
                        // arguments:
                        //     DBHelper.database.userDao.getOneUser(User_id!)
                      );
                    },
                    text: "Go to Booking Deteals Coustomer page"),
                // FutureBuilder(
                //   future: loadUserName(),
                //   builder: (context, snapshot) {
                //     return Text("${snapshot.data}");
                //   },
                // ),
                // FutureBuilder(
                //   future: loadPassword(),
                //   builder: (context, snapshot) {
                //     return Text("${snapshot.data}");
                //   },
                // ),
                // FutureBuilder(
                //   future: DBHelper.database.userDao.getOneUser(3),
                //   builder: (context, snapshot) {
                //     return Text(snapshot.data!.roleId.toString());
                //   },
                // )
                //Text(loadPassword())
                // FutureBuilder(
                //   future: loadPassword(),
                //   builder: (context, snapshot) {
                //     x = snapshot.data! as String;
                //     return Text("${snapshot.data}");
                //   },
                // ),
                // FutureBuilder(
                //   future: DBHelper.database.userDao
                //       .getOneUserByuserNameAndPassword(
                //           "12345",x!),
                //   builder: (context, snapshot) {
                //     return Text("${snapshot.data!.password!}");
                //   },
                // )
                // FutureBuilder(
                //   future: loadToken(),
                //   builder: (context, snapshot) {
                //     ListView.builder(
                //       itemCount: snapshot.data!.length,
                //       itemBuilder: (context, index) {
                //         return Text(snapshot.data![index][1]);
                //       },
                //     );
                //     return Text("xcfvg");
                //   },
                // )
              ],
            )),
      ):SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                FutureBuilder(
                  future: loadUserName(),
                  builder: (context, snapshot) {
                    userName = snapshot.data.toString();
                    print(userName);
                    return Column(
                      children: [
                        // Text(snapshot.data.toString()),
                        FutureBuilder(
                          future: loadPassword(),
                          builder: (context, snapshot) {
                            password = snapshot.data.toString();
                            print(password);
                            return SizedBox(
                              height: 1,
                            );
                            // return Text(snapshot.data.toString());
                          },
                        ),
                      ],
                    );
                  },
                ),
                // FutureBuilder(
                //   future: DBHelper.database.userDao
                //       .getOneUserByuserNameAndPassword(xxxx[0], xxxx[1]),
                //   builder: (context, snapshot) {
                //     return Column(
                //       children: [
                //         Text("${snapshot.data!.username}"),
                //         Text("${snapshot.data!.password}"),
                //         Text("${snapshot.data!.phone}"),
                //         Text("${snapshot.data!.id}"),
                //         Text("${snapshot.data!.roleId}"),
                //       ],
                //     );
                //   },
                // ),
                //Text(User_id.toString()),
                // widget.id != null
                //     ? Text(User_id.toString())
                //     : Text(User_id.toString()),
//                 if (true) ... [
// Text('')
//                 ] else if(1==9) ...[
//                   Text('')

//                 ] else...[
//                   Text('')

//                 ]
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "Welcome my friend ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Image.asset('assets/1.png'),

                SizedBox(
                  height: 30,
                ),
                Card(
                    color: Colors.amber,
                    child: Center(
                        child: Text(
                      """توجد العديد من السيارات الفاخرة في إنتظارك . ماذا تنتظر أحجز سياراتك المفضلة الأن لحجز سياراتك أضغط على زر في الأسفل""",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ))),
                SizedBox(
                  height: 10,
                ),

                MyElevatedButton(
                    backgroundColor: Color.fromRGBO(149, 210, 239, 1),
                    foregroundColor: Colors.black,
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context, "/prand",
                        // arguments:
                        //     DBHelper.database.userDao.getOneUser(User_id!)
                      );
                    },
                    text: "Go to Prand page"),
                SizedBox(
                  height: 20,
                ),
               
                // FutureBuilder(
                //   future: loadUserName(),
                //   builder: (context, snapshot) {
                //     return Text("${snapshot.data}");
                //   },
                // ),
                // FutureBuilder(
                //   future: loadPassword(),
                //   builder: (context, snapshot) {
                //     return Text("${snapshot.data}");
                //   },
                // ),
                // FutureBuilder(
                //   future: DBHelper.database.userDao.getOneUser(3),
                //   builder: (context, snapshot) {
                //     return Text(snapshot.data!.roleId.toString());
                //   },
                // )
                //Text(loadPassword())
                // FutureBuilder(
                //   future: loadPassword(),
                //   builder: (context, snapshot) {
                //     x = snapshot.data! as String;
                //     return Text("${snapshot.data}");
                //   },
                // ),
                // FutureBuilder(
                //   future: DBHelper.database.userDao
                //       .getOneUserByuserNameAndPassword(
                //           "12345",x!),
                //   builder: (context, snapshot) {
                //     return Text("${snapshot.data!.password!}");
                //   },
                // )
                // FutureBuilder(
                //   future: loadToken(),
                //   builder: (context, snapshot) {
                //     ListView.builder(
                //       itemCount: snapshot.data!.length,
                //       itemBuilder: (context, index) {
                //         return Text(snapshot.data![index][1]);
                //       },
                //     );
                //     return Text("xcfvg");
                //   },
                // )
              ],
            )),
      ),
   
    );
  }
}
