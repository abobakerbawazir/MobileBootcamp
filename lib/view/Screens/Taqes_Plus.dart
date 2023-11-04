import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';

class Taqes_PlusPage extends StatefulWidget {
  const Taqes_PlusPage({super.key});

  @override
  State<Taqes_PlusPage> createState() => _Taqes_PlusPageState();
}

class _Taqes_PlusPageState extends State<Taqes_PlusPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  MyHomePageClipPath(),
                  Positioned(
                    top: 60,
                    right: 130,
                    child: Text(
                      "طلقة بلس",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 120,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("من"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                ),
                                Icon(Icons.arrow_back_ios_new_outlined)
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("إلى"),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                ),
                                Icon(Icons.arrow_back_ios_new_outlined)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Card(
                child: ListTile(
                  trailing: Icon(Icons.arrow_back_ios_new_outlined),
                  title: Text("نوع المنقولات"),
                  subtitle: Text("يرجى تحديد نوع المنقولات"),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Card(
                child: ListTile(
                  trailing: Icon(Icons.arrow_back_ios_new_outlined),
                  title: Text("وسيلة التوصيل"),
                  subtitle: Text("دراجة"),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
