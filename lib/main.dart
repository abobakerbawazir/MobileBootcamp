import 'package:flutter/material.dart';

import 'Exercise2_day_28.dart';
import 'Exercise3_day28/TodoListApp.dart';

void main(List<String> args) {
  runApp(TodoListApp());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Exercise_2_day_28(),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int number = 0;
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Text("$number",style: const TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.lightBlue),),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           number++;
//           setState(() {
            
//           });
//         },child: const Icon(Icons.add,size: 30,),
//       ),
//     );
//   }
// }
