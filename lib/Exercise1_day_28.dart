import 'package:flutter/material.dart';
//lib\Exercise1_day_28.dart
class CurrncyConvert extends StatefulWidget {
  const CurrncyConvert({super.key});

  @override
  State<CurrncyConvert> createState() => _CurrncyConvertState();
}

class _CurrncyConvertState extends State<CurrncyConvert> {
  GlobalKey<FormState> convert_key = GlobalKey();
  int selectedGender = 1;
  double counter = 0;
  TextEditingController convertrial = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: convert_key,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text("Currncy Convert 😎"),
              const SizedBox(
                height: 15,
                width: 10,
              ),
              TextFormField(
                controller: convertrial,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(
                height: 50,
                width: 100,
              ),
              Row(
                children: [
                  const Text("Yemen rial"),
                  Radio(
                      value: 1,
                      groupValue: selectedGender,
                      onChanged: (x) {
                        selectedGender = x!;
                        counter = double.parse(convertrial.text) * 380;
                        //double y = double.parse(convertrial.text) / 380;
                        //print("${double.parse(convertrial.text) * 380}");
                        // selectedGender = x!;
                        setState(() {});
                      }),
                  const Text("Saudi rial"),
                  Radio(
                      value: 2,
                      groupValue: selectedGender,
                      onChanged: (x) {
                        selectedGender = x!;
                        //selectedGender = x!;
                        counter = double.parse(convertrial.text) / 380;
                        //print("${double.parse(convertrial.text) / 380}");
                        setState(() {});
                      })
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    //selectedGender++;
                    setState(() {});
                  },
                  child: const Text("")),
              Expanded(
                child: Center(
                  child: Text(
                    "$counter",
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
