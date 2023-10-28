import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CostomNotificationListTile extends StatefulWidget {
  const CostomNotificationListTile({super.key});

  @override
  State<CostomNotificationListTile> createState() =>
      _CostomNotificationListTileState();
}

class _CostomNotificationListTileState
    extends State<CostomNotificationListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        ListTile(
          leading: SizedBox(
            height: 50,
            width: 50,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff3E3F42),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Color(0xffF1C730),
                ),
                onPressed: () {},
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Singal up deep line", style: TextStyle(fontSize: 14)),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Contrary to popular belife, Lorem Ipsum is not Simply random text",
                  style: TextStyle(fontSize: 10)),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [];
                },
              ),
            ],
          ),
        ),SizedBox(
          height: 5,
        ),Container(margin: EdgeInsets.only(right: 160),child: Text("11:50 am")),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.all(10),
          color: Color(0xff626366),
          height: 1,
        )
      ],
    );
  }
}
