import 'package:flutter/material.dart';

class Exercise3 extends StatelessWidget {
  const Exercise3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Material App Bar",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: ListTile(
                            leading: Icon(Icons.feed),
                          ),
                        ),
                        Container(
                          child: ListTile(
                              title: Text(
                            "profile",
                          )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Column(children: [
                            ListTile(
                                leading: Icon(Icons.account_circle_outlined)),
                          ]),
                        ),
                        Container(
                          child: ListTile(
                              title: Text(
                            "Feeds",
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 2,
              color: Color.fromARGB(255, 154, 151, 151),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 25, bottom: 25,left: 20,right: 20),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(padding: EdgeInsets.only(right: 10),
                          child: Image.asset("assets/images/f1.png"),
                        ),
                      ),
                      
                      Expanded(
                        child: Container(
                          
                          height: 70,
                          child: Text("5\nPosts"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          
                          height: 70,
                          child: Text("10\nFollowers"),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          
                          height: 70,
                          child: Text("12\nFollowing"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(padding: EdgeInsets.all(20),
              height: 2,
              color: Color.fromARGB(255, 154, 151, 151),
            ),Expanded(
              child: Container(
                child: Column(
                  children: [Row(
                    children: [Expanded(
                      child: Container(padding: EdgeInsets.all(2),
                        child: Image.asset("assets/images/s2.jpg"),
                      ),
                    ),Expanded(
                      child: Container(
                        child: Image.asset("assets/images/s3.jpg"),
                      ),
                    ),Expanded(
                      child: Container(
                        child: Image.asset("assets/images/s1.jpg"),
                      ),
                    )],
                  ),Row(
                    children: [Expanded(
                      child: Container(padding: EdgeInsets.all(2),
                        child: Image.asset("assets/images/s2.jpg"),
                      ),
                    ),Expanded(
                      child: Container(
                        child: Image.asset("assets/images/s3.jpg"),
                      ),
                    ),Expanded(
                      child: Container(
                        child: Image.asset("assets/images/s1.jpg"),
                      ),
                    )],
                  ),Row(
                    children: [Expanded(
                      child: Container(padding: EdgeInsets.all(2),
                        child: Image.asset("assets/images/s2.jpg"),
                      ),
                    ),Expanded(
                      child: Container(
                        child: Image.asset("assets/images/s3.jpg"),
                      ),
                    ),Expanded(
                      child: Container(
                        child: Image.asset("assets/images/s1.jpg"),
                      ),
                    )],
                  ),],
                ),
              ),
            )
          ],
        ));
  }
}
