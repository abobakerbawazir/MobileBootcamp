import 'package:flutter/material.dart';
import 'package:video/HomeWok_Video/core/components/HomeScreen_Compontents/HomePage_Counainer_Button.dart';
import 'package:video/HomeWok_Video/core/components/HomeScreen_Compontents/ListViewBiulderHomePage.dart';
import 'package:video/HomeWok_Video/core/components/HomeScreen_Compontents/ListviewBuilderHomePage_180_8_2.dart';
import 'package:video/HomeWok_Video/core/components/HomeScreen_Compontents/ListviewBuilderHomePage_button.dart';
import 'package:video/HomeWok_Video/features/Veiw/Drawer/My_drawer.dart';

class HomeNav extends StatefulWidget {
  const HomeNav({super.key});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  
  @override
  Widget build(BuildContext context) {
//     Future.delayed(Duration(seconds: 10),(){
//   Navigator.pushReplacementNamed(context, "/page9_Splash");
// });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 48, 48),
        actions: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/page_1_2_3");
                    }),
                    child: const Text(
                      "TRENDING",
                      style: TextStyle(fontSize: 10),
                    )),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: const Text(
                      "NEWEST",
                      style: TextStyle(fontSize: 10),
                    )),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/sd");
                    }),
                    child: const Text(
                      "FOR YOU",
                      style: TextStyle(fontSize: 10),
                    )),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      //Navigator.pushNamed(context, '/aaa', arguments: );
                       Navigator.pushNamed(context, "/UserProvider");
                    }),
                    child: const Text(
                      "POPULAR",
                      style: TextStyle(fontSize: 10),
                    )),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: (() {
                      Navigator.pushNamed(context, "/list_Empty");
                    }),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/1.jpg"),
                      minRadius: 15,
                    )),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          )
        ],
      ),
      drawer: My_drawerScreen(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListViewBiulderHomePage(),
          ListViewBuilderHomePage_button(),
          const SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.black,
            height: 3,
          ),
          Countainer_button(
              name_text: "RENDING IN VIMU", name_button: "SEE ALL"),
          ListViewBuilderHomePage_180_8_2(),
          Container(
            color: Colors.black,
            height: 3,
          ),
          Countainer_button(name_text: "NEWEST", name_button: "SEE ALL"),
          ListViewBuilderHomePage_180_8_2()
        ],
      )),
    );
  }
}
