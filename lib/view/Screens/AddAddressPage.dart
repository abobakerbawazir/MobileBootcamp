import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  int countter = -1;
  List<String> categories = ["منزل", "محل", "مكتب", "مطعم", "أحرى"];
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          bottomSheet: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.only(left: 12, right: 12),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {},
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text(
                        "حفظ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                    ],
                  )),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xff285A95),
            title: Center(
              child: Text(
                "إضافة عنوان",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25),
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "بيانات التوصيل",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "تعديل الموقع",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/imagesFoots/location1.png")),
                Text(
                  "بيانات التوصيل",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                    decoration: InputDecoration(
                  hintText: "أسم المكان",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                )),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: SizedBox(
                          height: 70,
                          width: 150,
                          child: Image.asset(
                              "assets/imagesFoots/yemenNumber.png")),
                      hintText: "رقم الجوال للتواصل (اختياري)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    )),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: countter == index
                                ? Color(0xff285A95)
                                : Color.fromARGB(255, 247, 246, 246),
                            borderRadius: BorderRadius.circular(15)),
                        margin: EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            print("object");
                            countter = index;
                            setState(() {});
                          },
                          child: Center(
                            child: Row(
                              children: [
                                CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/imagesFoots/4.jpeg")),
                                Center(
                                    child: Text(
                                  categories[index],
                                  style: TextStyle(
                                      color: countter == index
                                          ? Colors.white
                                          : null),
                                )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
