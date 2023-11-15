import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mukalla_store/EX_day_54/Helpers/DBMAnager.dart';
import 'package:mukalla_store/EX_day_54/Helpers/FileManager.dart';
import 'package:mukalla_store/EX_day_54/constant/FileConstant.dart';
import 'package:mukalla_store/EX_day_54/core/ViewModel/ActorsViewModel.dart';

class ActorsScreen extends StatefulWidget {
  const ActorsScreen({super.key});

  @override
  State<ActorsScreen> createState() => _ActorsScreenState();
}

class _ActorsScreenState extends State<ActorsScreen> {
  TextEditingController nametxt = TextEditingController();
  GlobalKey formkey = GlobalKey();

  ActorsViewModel aVM = ActorsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
              child: Container(
            height: 40,
            width: 140,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () async {},
              child: Text("initializedDB"),
            ),
          )),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: FutureBuilder(
              future: aVM.getAllActors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width / 2,
                            height: 50,
                            child: Text("${snapshot.data![index].name}"),
                          ),
                        );
                      },
                    );
                  }
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          onPressed: () async {
            setState(() {});
            nametxt.clear();
            await showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 500,
                    child: Column(
                      children: [
                        TextField(
                          controller: nametxt,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple),
                            onPressed: () {
                              Navigator.of(context).pop();
                              aVM.AddActor({"name": nametxt.text});
                            },
                            child: Text("Create new"))
                      ],
                    ),
                  );
                });

            setState(() {});
          },
          child: Text("Add")),
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<dynamic> _items = [];

// // Fetch content from the json file
//   Future<void> readJson() async {
//     final String response = await rootBundle.loadString('assets/actors.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = data;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Kindacode.com',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           children: [
//             ElevatedButton(
//               child: const Text('Load Data'),
//               onPressed: readJson,
//             ),

//             // Display the data loaded from sample.json
//             _items.isNotEmpty
//                 ? Expanded(
//                     child: ListView.builder(
//                       itemCount: _items.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           margin: const EdgeInsets.all(10),
//                           child: ListTile(
//                             //leading: Text(_items[index]["id"]),
//                             title: Text(_items[index]["name"]),
//                             //subtitle: Text(_items[index]["description"]),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 : Container()
//           ],
//         ),
//       ),
//     );
//   }
// }
