import 'package:flutter/material.dart';
import 'package:talqa_design/view/Screens/AddAddressPage.dart';
import 'package:talqa_design/view/Screens/HomePage.dart';
import 'package:talqa_design/view/Screens/NotificationPage.dart';
import 'package:talqa_design/view/Screens/ReaStarentPage.dart';
import 'package:talqa_design/view/Screens/Taqes_Plus.dart';
import 'package:talqa_design/view/Screens/WaselenyPage.dart';
import 'package:talqa_design/view/Widget/BottomnavWidget/Account.dart';
import 'package:talqa_design/view/Widget/Restaurantscarousel_slider.dart';
import 'package:talqa_design/view/Screens/SignUp.dart';
import 'package:talqa_design/view/Screens/VervicationCode.dart';
import 'package:talqa_design/view/Screens/BottomNavPage.dart';
import 'package:talqa_design/view/Widget/BottomnavWidget/Cart.dart';
import 'package:talqa_design/view/Widget/BottomnavWidget/Fovrite.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';
import 'package:talqa_design/view/Widget/carousel_slider/CoursolSliderWidget.dart';

import 'view/Widget/Staggered_Gred_view/Staggered1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavPage(),
    );
  }
}


// class SnackBarDemo extends StatelessWidget {
//   const SnackBarDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SnackBar Demo',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SnackBar Demo'),
//         ),
//         body: const SnackBarPage(),
//       ),
//     );
//   }
// }

// class SnackBarPage extends StatelessWidget {
//   const SnackBarPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         onPressed: () {
//           final snackBar = SnackBar(
//             content: const Text('Yay! A SnackBar!'),
//             action: SnackBarAction(
//               label: 'Undo',
//               onPressed: () {
//                 // Some code to undo the change.
//               },
//             ),
//           );

//           // Find the ScaffoldMessenger in the widget tree
//           // and use it to show a SnackBar.
//           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         },
//         child: const Text('Show SnackBar'),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
 
// void main() => runApp(const MyApp());
 
// // This is the main application widget.
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
 
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GeeksforGeeks',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('GeeksforGeeks'),
//           backgroundColor: Colors.green,
//         ),
//         body: const ModalBottomSheetDemo(),
//       ),
//     );
//   }
// }
 
// class ModalBottomSheetDemo extends StatelessWidget {
//   const ModalBottomSheetDemo({Key? key}) : super(key: key);
 
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         child: const Text('showModalBottomSheet'),
//         onPressed: () {
//           // when raised button is pressed
//           // we display showModalBottomSheet
//           showModalBottomSheet<void>(
//             // context and builder are
//             // required properties in this widget
//             context: context,
//             builder: (BuildContext context) {
//               // we set up a container inside which
//               // we create center column and display text
 
//               // Returning SizedBox instead of a Container
//               return SizedBox(
//                 height: 200,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const <Widget>[
//                       Text('GeeksforGeeks'),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
 
//       // RaisedButton is deprecated and should not be used
//       // Use ElevatedButton instead.
 
//       // child: RaisedButton(
//       //     child: const Text('showModalBottomSheet'),
//       //     onPressed: () {
 
//       //     // when raised button is pressed
//       //     // we display showModalBottomSheet
//       //     showModalBottomSheet<void>(
 
//       //         // context and builder are
//       //         // required properties in this widget
//       //         context: context,
//       //         builder: (BuildContext context) {
 
//       //         // we set up a container inside which
//       //         // we create center column and display text
//       //         return Container(
//       //             height: 200,
//       //             child: Center(
//       //             child: Column(
//       //                 mainAxisAlignment: MainAxisAlignment.center,
//       //                 children: <Widget>[
//       //                 const Text('GeeksforGeeks'),
//       //                 ],
//       //             ),
//       //             ),
//       //         );
//       //         },
//       //     );
//       //     },
//       // ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
 
// void main() => runApp(const MyApp());
 
// /// This is the main application widget.
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
 
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GeeksforGeeks',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('GeeksforGeeks'),
//           backgroundColor: Colors.green,
//         ),
//         body: const ModalBottomSheetDemo(),
//       ),
//     );
//   }
// }
 
// class ModalBottomSheetDemo extends StatelessWidget {
//   const ModalBottomSheetDemo({Key? key}) : super(key: key);
 
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       // REPLACED: RaisedButton class with Elevated button class.
//       // Raisedbutton is deprecatred and shouldn't be used.
       
//       child: ElevatedButton(
//         child: const Text('showModalBottomSheet'),
//         onPressed: () {
//           // adding some properties
//           showModalBottomSheet(
//             context: context,
//             // color is applied to main screen when modal bottom screen is displayed
//             barrierColor: Colors.greenAccent,
//             //background color for modal bottom screen
//             backgroundColor: Colors.yellow,
//             //elevates modal bottom screen
//             elevation: 10,
//             // gives rounded corner to modal bottom screen
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             builder: (BuildContext context) {
//               // UDE : SizedBox instead of Container for whitespaces
//               return SizedBox(
//                 height: 200,
//                 child: Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const <Widget>[
//                       Text('GeeksforGeeks'),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// void main()
// {
//   runApp(MyApp());
// }
 
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Learning',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
 
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState()
//   {
//     return _MyHomePageState();
//   }
// }
 
// class _MyHomePageState extends State<MyHomePage> {
//   bool _show = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Bottom Sheet"),
//       ),
//       body:Center(
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   _show = true;
//                   setState(() {
 
//                   });
 
//                 },
//                 child: Text("Show Bottom Sheet"),
//             )
//           ],
//         )
//       ),
//       bottomSheet: _showBottomSheet()
//     );
//   }
 
//   Widget _showBottomSheet()
//   {
//     if(_show)
//     {
//       return BottomSheet(
//         onClosing: () {
 
//         },
//         builder: (context) {
//           return Container(
//             height: 200,
//             width: double.infinity,
//             color: Colors.grey.shade200,
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               child: Text("Close Bottom Sheet"),
//               style: ElevatedButton.styleFrom(
//                 onPrimary: Colors.white,
//                 primary: Colors.green,
 
//               ),
//               onPressed: () {
//                 _show = false;
//                 setState(() {
 
//                 });
//               },
//             ),
//           );
//         },
//       );
//     }
//     else{
//       return Text("");
//     }
//   }
// }


// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// void main()
// {
//   runApp(MyApp());
// }
 
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Learning',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: SnackbarsDemo(),
//     );
//   }
// }

 
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState()
//   {
//     return _MyHomePageState();
//   }
// }
 
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter Bottom Sheet"),
//       ),
//       body:Center(
//         child:Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   _showModalBottomSheet();
//                 },
//                 child: Text("Show Bottom Sheet"),
//             )
//           ],
//         )
//       ),
//     );
//   }
 
//   _showModalBottomSheet()
//   {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) {
//           return Container(
//             height: 200,
//             width: double.infinity,
//             color: Colors.grey.shade200,
//             alignment: Alignment.center,
//             child: ElevatedButton(
//               child: Text("Close Bottom Sheet"),
//               style: ElevatedButton.styleFrom(
//                 onPrimary: Colors.white,
//                 primary: Colors.green,
 
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           );
//         },
//     );
//   }
// }


// class SnackbarsDemo extends StatelessWidget {
//   const SnackbarsDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Snackbars'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide any previous snackbar
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar( // Show a new snackbar
//               content: const Text('This is snackbar'),
//               action: SnackBarAction(
//                 label: 'Action',
//                 onPressed: () {
//                   ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hide the current snackbar
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar( // Show another snackbar
//                       content: Text(
//                         'Action',
//                       )));
//                 },
//               ),
//             ));
//           },
//           child: const Text('Show Snackbar'),
//         ),
//       ),
//     );
//   }
// }