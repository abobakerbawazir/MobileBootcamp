import 'package:flutter/material.dart';
import 'package:taskmanagerprovider/Views/Screens/RealationShipPage.dart';
import 'package:taskmanagerprovider/Views/Screens/ViewAllTask.dart';
import 'package:taskmanagerprovider/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagerprovider/provider/TaskUserVM.dart';
import 'package:taskmanagerprovider/provider/TaskVM.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TaskVM(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserTaskVM(),
          )
        ],
        child: ChangeNotifierProvider(
            create: (context) => TaskVM(),
            child: Consumer<TaskVM>(
              builder: (context, value, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: ViewAllTask(),
                );
              },
            )));
    // ChangeNotifierProvider(
    //     create: (context) => TaskVM(),
    //     child: Consumer<TaskVM>(
    //       builder: (context, value, child) {
    //         return MaterialApp(
    //           debugShowCheckedModeBanner: false,

    //           home: ActorApp(),
    //         );
    //       },
    //     ));
  }
}

class ActorApp extends StatelessWidget {
  const ActorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewAllTask();
  }
}
