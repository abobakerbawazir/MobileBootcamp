
// import 'package:flutter/material.dart';

// class AppBarHomePage extends StatelessWidget {
//   const AppBarHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         backgroundColor: const Color.fromARGB(255, 49, 48, 48),
//         actions: [
//           Center(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                     onTap: (() {
//                       Navigator.pushNamed(context, "/sd");
//                     }),
//                     child: const Text(
//                       "TRENDING",
//                       style: TextStyle(fontSize: 10),
//                     )),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                     onTap: (() {
//                       Navigator.pushNamed(context, "/sd");
//                     }),
//                     child: const Text(
//                       "NEWEST",
//                       style: TextStyle(fontSize: 10),
//                     )),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                     onTap: (() {
//                       Navigator.pushNamed(context, "/sd");
//                     }),
//                     child: const Text(
//                       "FOR YOU",
//                       style: TextStyle(fontSize: 10),
//                     )),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                     onTap: (() {
//                       Navigator.pushNamed(context, "/UserProvider");
//                     }),
//                     child: const Text(
//                       "POPULAR",
//                       style: TextStyle(fontSize: 10),
//                     )),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 InkWell(
//                     onTap: (() {
//                       Navigator.pushNamed(context, "/list_Empty");
//                     }),
//                     child: const CircleAvatar(
//                       backgroundImage: AssetImage("assets/images/1.jpg"),
//                       minRadius: 15,
//                     )),
//                 const SizedBox(
//                   width: 15,
//                 ),
//               ],
//             ),
//           )
//         ],
//       );
//   }
// }