import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/Controller/BottomNavController/BottomNavController.dart';
import 'package:talqa_design/view/Screens/HomePage.dart';
import 'package:talqa_design/view/Widget/BottomnavWidget/Account.dart';
import 'package:talqa_design/view/Widget/BottomnavWidget/Cart.dart';
import 'package:talqa_design/view/Widget/BottomnavWidget/Fovrite.dart';
import 'package:talqa_design/view/Widget/BottomnavWidget/Order.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  late BottomNavController _bottomNavController;
  String labeltext = "الرئيسية";
  int _currentIndex = 0;
  final List<Widget> secerrns = [
    HomePage(),
    OrderPage(),
    CartWidget(),
    FovriteWidget(),
    AccountPage()
  ];
  @override
  void initState() {
    _bottomNavController = BottomNavController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: secerrns[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              labeltext =
                  _bottomNavController.labeltextlistOblect[index].labelText;
            });
          },
          items: _bottomNavController.labeltextlistOblect.map((e) {
            return BottomNavigationBarItem(
                icon: Icon(e.icon), label: e.labelText);
          }).toList(),
        ),
      ),
    );
  }
}
