import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  late String title;
  AppBarWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(backgroundColor: const Color.fromARGB(255, 33, 91, 137),
      title: Text(title),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  
}

