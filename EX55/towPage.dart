import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mukalla_store/EX55/ColorsPage.dart';
import 'package:mukalla_store/EX55/User2ViewModels.dart';

class TowPage extends StatefulWidget {
  const TowPage({super.key});

  @override
  State<TowPage> createState() => _TowPageState();
}

class _TowPageState extends State<TowPage> {
  UserViewModel2 uVM2 = UserViewModel2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return ColorsPage();
                      },
                    ));
          }, icon: Icon(Icons.settings))],
        ),
        body: SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  child: FutureBuilder(
                    future: uVM2.getUsernameorEmailBykey("username"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: Column(
                            children: [
                              Center(child: Text(snapshot.data!)),
                            ],
                          ),
                        );
                      }
                      return Text("data");
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: FutureBuilder(
                    future: uVM2.getUsernameorEmailBykey("email"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          child: Column(
                            children: [
                              Center(child: Text(snapshot.data!)),
                            ],
                          ),
                        );
                      }
                      return Text("data");
                    },
                  ),
                ),
              ),
            ],
          ),
        )
        // Container(
        //   padding: EdgeInsets.all(10),
        //   child: Column(
        //     children: [
        //       Center(child: Text("${uVM2.getUsernameorEmailBykey("username")}")),
        //       Text("${uVM2.getUsernameorEmailBykey("email")}"),
        //     ],
        //   ),
        // ),
        );
  }
}
