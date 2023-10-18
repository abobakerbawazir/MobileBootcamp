import 'package:flutter/material.dart';

enum SizeofSelected { smaill,smail, medium, large }

class Ex1_35 extends StatefulWidget {
  const Ex1_35({super.key});

  @override
  State<Ex1_35> createState() => _Ex1_35State();
}

class _Ex1_35State extends State<Ex1_35> {
  // late SizeofSelected enumSize;

  SizeofSelected sizeAS = SizeofSelected.smaill;
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              child: Text("Pizza Order 😍",style: TextStyle(fontSize: 20),)),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: (() {
              
            }),
            child: Text("size"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Radio(
                    value: SizeofSelected.smail,
                    groupValue: sizeAS,
                    onChanged: (value) {
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) {
                      //     return Exercise1_34_day();
                      //   },
                      // ));
                      setState(() {
                        sizeAS = value!;
                      });
                    },
                  ),
                ),
                Text(SizeofSelected.smail.name),
                Expanded(
                  child: Radio(toggleable: true,
                    value: SizeofSelected.medium,
                    groupValue: sizeAS,
                    onChanged: (value) {
                      setState(() {
                        sizeAS = value!;
                      });
                    },
                  ),
                ),
                Text(SizeofSelected.medium.name),
                Expanded(
                  child: Radio(
                    value: SizeofSelected.large,
                    groupValue: sizeAS,
                    onChanged: (value) {
                      setState(() {
                        sizeAS = value!;
                      });
                    },
                  ),
                ),
                Text(SizeofSelected.large.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
