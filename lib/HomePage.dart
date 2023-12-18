import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailtxt = TextEditingController();
  TextEditingController passtxt = TextEditingController();
  FirebaseAuth authu = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Text("FireBase"),
        TextFormField(
          controller: emailtxt,
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          controller: passtxt,
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () async {
              FirebaseAuth auth = FirebaseAuth.instance;
              await auth.createUserWithEmailAndPassword(
                  email: emailtxt.text, password: passtxt.text);
            },
            child: Text("Create user")),
        SizedBox(
          height: 30,
        ),
        Text("${authu.currentUser?.uid}")
      ]),
    );
  }
}
