import 'package:flutter/material.dart';
import 'package:car_booking/Views/Widgets/MyColors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  late String title;
  void Function()? onPressed;

  AppBarWidget({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      backgroundColor: c2,
      title: Text(title),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
