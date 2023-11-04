import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff285A95),
              title: Center(
                child: Text(
                  "الإشعارات",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text("😍طلقة ليس مجرد تطبيق بل رفيق الحياة"),
                        subtitle: Text(
                            " لعاد تهم بعد اليوم كل احتياجاتط اليومية في مكان واحد خضروات فواكة لحوم حتى لو تشتي أي وجبة من أكثر من 200 مطعم في تطبيق طلقة"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("😍طلقة ليس مجرد تطبيق بل رفيق الحياة"),
                        subtitle: Text(
                            " لعاد تهم بعد اليوم كل احتياجاتط اليومية في مكان واحد خضروات فواكة لحوم حتى لو تشتي أي وجبة من أكثر من 200 مطعم في تطبيق طلقة"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("😍طلقة ليس مجرد تطبيق بل رفيق الحياة"),
                        subtitle: Text(
                            " لعاد تهم بعد اليوم كل احتياجاتط اليومية في مكان واحد خضروات فواكة لحوم حتى لو تشتي أي وجبة من أكثر من 200 مطعم في تطبيق طلقة"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("😍طلقة ليس مجرد تطبيق بل رفيق الحياة"),
                        subtitle: Text(
                            " لعاد تهم بعد اليوم كل احتياجاتط اليومية في مكان واحد خضروات فواكة لحوم حتى لو تشتي أي وجبة من أكثر من 200 مطعم في تطبيق طلقة"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("😍طلقة ليس مجرد تطبيق بل رفيق الحياة"),
                        subtitle: Text(
                            " لعاد تهم بعد اليوم كل احتياجاتط اليومية في مكان واحد خضروات فواكة لحوم حتى لو تشتي أي وجبة من أكثر من 200 مطعم في تطبيق طلقة"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("😍طلقة ليس مجرد تطبيق بل رفيق الحياة"),
                        subtitle: Text(
                            " لعاد تهم بعد اليوم كل احتياجاتط اليومية في مكان واحد خضروات فواكة لحوم حتى لو تشتي أي وجبة من أكثر من 200 مطعم في تطبيق طلقة"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: Text("😍طلقة ليس مجرد تطبيق بل رفيق الحياة"),
                        subtitle: Text(
                            " لعاد تهم بعد اليوم كل احتياجاتط اليومية في مكان واحد خضروات فواكة لحوم حتى لو تشتي أي وجبة من أكثر من 200 مطعم في تطبيق طلقة"),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
