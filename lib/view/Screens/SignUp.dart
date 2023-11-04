import 'package:flutter/material.dart';
import 'package:talqa_design/view/Widget/Clip_Path/MyHomePageClipPath.dart';
import 'package:talqa_design/view/Widget/Elevated_Button/Elevated_button_signUp.dart';
import 'package:talqa_design/view/Widget/Radio_Widget/Radio_Componetns1.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DateTime? startDate;

  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    MyHomePageClipPath(),
                    Positioned(
                        top: 30,
                        left: 2,
                        child: SizedBox(
                            height: 180,
                            width: 180,
                            child:
                                Image.asset("assets/imagesFoots/Cycle.png"))),
                    Positioned(
                        top: 50,
                        right: 20,
                        child: Text(
                          "إنشاء حساب جديد",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                    Positioned(
                        top: 90,
                        right: 20,
                        child: Text(
                          "نسعد بإنضمامك إلينا 😍",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("أسم المستخدم"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff8f9fb),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "ادخل اسم المستخدم مثلا علي احمد",
                                  //border: InputBorder.none,
                                  //label: Text("أسم المستخدم"),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                        ),
                        Text("البريد الإلكتروني"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff8f9fb),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "ادخل البريد الإلكتروني",
                                  //label: Text("البريد الإلكتروني"),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("تاريخ الميلاد"),
                        Container(
                          decoration: BoxDecoration(
                              color: Color(0xfff8f9fb),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                              readOnly: true,
                              controller: dateController,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      onPressed: () async {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) {
                                            return Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () async {
                                                          DateTime? startDate =
                                                              await showDatePicker(
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return Theme(
                                                                        data: ThemeData
                                                                            .dark(),
                                                                        child:
                                                                            child!);
                                                                  },
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      DateTime
                                                                          .now(),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2100));
                                                          this.startDate =
                                                              startDate;
                                                          dateController.text =
                                                              this
                                                                  .startDate
                                                                  .toString();
                                                          setState(() {});
                                                        },
                                                        icon: Icon(Icons
                                                            .calendar_month)),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon:
                                                            Icon(Icons.close)),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.calendar_month)),
                                  hintText: "ادخل تاريخ الميلاد",
                                  // label: Text("تاريخ الميلاد"),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("الجنس"),
                        Radio_Componetns1(listRadio: ["ذكر", "أنثى"]),
                        SizedBox(
                          height: 20,
                        ),
                        Elevated_button_signUp(
                            backgroundColor: Color(0xffF2902F),
                            foregroundColor: Colors.white,
                            onPressed: () {
                            },
                            text: "إنشاء حساب جديد",
                            width: MediaQuery.of(context).size.width,
                            height: 70),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Container(
                                child: Center(
                                    child: Text(
                              "بالنقر على إنشاء حساب جديد فأنت توافق على",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))),
                            Container(
                                child: Center(
                                    child: Text(
                              "شروط الخدمة وسياسة الخصوصية",
                              style: TextStyle(
                                  color: Color(0xff255489),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ))),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
