import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video/HomeWok_Video/core/components/Notification_Costom_ListTile.dart';

class Notification_page extends StatefulWidget {
  const Notification_page({super.key});

  @override
  State<Notification_page> createState() => _Notification_pageState();
}

class _Notification_pageState extends State<Notification_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTIFICATION"),
      ),
      body: SingleChildScrollView(
          child: Container(
        //margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(padding: EdgeInsets.all(10), child: Text("Today")),
                  CostomNotificationListTile(),CostomNotificationListTile(),CostomNotificationListTile() ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height/2,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(padding: EdgeInsets.all(10), child: Text("Yasterday")),
                  CostomNotificationListTile(),CostomNotificationListTile(),CostomNotificationListTile() ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
