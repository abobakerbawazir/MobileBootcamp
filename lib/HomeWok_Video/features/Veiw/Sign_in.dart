import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/Sign_in_Components/elevated_button.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.4,
        ),
        Icon(
          Icons.receipt_outlined,
          color: Colors.yellow,
          size: 100,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text("START BY CREATING AN",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Center(
          child: Text("ACCOUNT.",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text("I am an early bird and i am a night owl",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 185, 183, 183),
                  fontWeight: FontWeight.normal)),
        ),
        Center(
          child: Text("so i am wise and I have worms.",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 185, 183, 183),
                  fontWeight: FontWeight.normal)),
        ),
        SizedBox(
          height: 30,
        ),
        Elevated_button_sign_in(
            height: 70,
            backgroundColor: Color.fromARGB(255, 222, 201, 9),
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/createAnAccount');
            },
            text: "CREATE AN ACOUTN"),
        // Container(
        //   padding: EdgeInsets.only(bottom: 5, top: 5, right: 20, left: 20),
        //   height: 70,
        //   child: ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //           backgroundColor: Color.fromARGB(255, 222, 201, 9),
        //           foregroundColor: Colors.black),
        //       onPressed: () {
        //         // Navigator.push(context, MaterialPageRoute(
        //         //   builder: (context) {
        //         //     return CreateAnAcount();
        //         //   },
        //         // ));
        //       },
        //       child: Text("CREATE AN ACOUTN")),
        // ),
        Elevated_button_sign_in(
            height: 70,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, "/loginPage");
            },
            text: "SIGN IN"),
        // Container(
        //   padding: EdgeInsets.only(bottom: 5, top: 5, right: 20, left: 20),
        //   height: 70,
        //   child: ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //           backgroundColor: Colors.white, foregroundColor: Colors.black),
        //       onPressed: () {},
        //       child: Text("SIGN IN")),
        // )
      ]),
    );
  }
}
