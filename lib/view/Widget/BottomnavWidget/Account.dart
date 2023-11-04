import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 205,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    MyHomePageClipPath(),
                    Positioned(
                        top: 40,
                        right: 20,
                        child: SizedBox(
                            width: 60,
                            height: 65,
                            child: Image.asset("assets/imagesFoots/logo.png"))),
                    Positioned(
                      top: 55,
                      right: 100,
                      child: Text(
                        "Abobaker",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      right: 100,
                      child: Text(
                        "775630183",
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                    Positioned(
                      top: 110,
                      right: 12,
                      child: Card(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text("0"), Text("طلباتي الحالية")],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [Text("0"), Text("إجمالي الطلبات")],
                              )
                            ],
                          ),
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: 90,
                          padding: EdgeInsets.all(15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("عن المستخدم"),
                      Card(
                        child: ListTile(
                          title: Text(
                            "بياناتي",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_back_ios_new_outlined),
                          subtitle: Text("قم بتغيير بياناتك الشخصية"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            "العناوين",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_back_ios_new_outlined),
                          subtitle: Text("قم بتغيير بيانات العناوين"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            "الإعدادات",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_back_ios_new_outlined),
                          subtitle: Text("اللغة سياسةالخصوصية الشروط والأحكام"),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("أخرى"),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            "الدعم الفني",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_back_ios_new_outlined),
                          subtitle: Text("تواصل مع فريق الدعم"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            "مطور التطبيق",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_back_ios_new_outlined),
                          subtitle: Text("تعرف على الشركة المطورة للتطبيق"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            "مشاركة التطبيق",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_back_ios_new_outlined),
                          subtitle: Text("شارك التطبيق مع أصدقائك"),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text(
                            "التحديثات",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_back_ios_new_outlined),
                          subtitle: Text("1.9.1"),
                        ),
                      ),
                    ],
                  ))
            ],
          ))),
    );
  }
}
