import 'package:flutter/material.dart';

class Radio_Componetns1 extends StatefulWidget {
  Radio_Componetns1({super.key, required this.listRadio});

  late List<String> listRadio;

  @override
  State<Radio_Componetns1> createState() => _Radio_Componetns1State();
}

class _Radio_Componetns1State extends State<Radio_Componetns1> {
  int countter = 0;
  late String selectedValue;
  late List<String> listsOfText; // List<NameItems> list = [
  //   NameItems(nmae: "nmaef"),
  //   NameItems(nmae: "nmaed"),
  //   NameItems(nmae: "nmae")
  // ];
  @override
  void initState() {
    listsOfText = widget.listRadio;
    selectedValue = widget.listRadio.first;
    //selectedValue = list[0].nmae;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(listsOfText.length, (index) {
        final size = listsOfText[index];

        return Container(
          width: MediaQuery.of(context).size.width / 2.4,
          height: 60,
          decoration: BoxDecoration(
              color: countter == index
                  ? Color(0xff245389)
                  : Color.fromARGB(255, 157, 164, 157),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio<String>(
                activeColor: Colors.white,
                // overlayColor: MaterialStateProperty.all(Colors.red),
                //fillColor: MaterialStateProperty.all(Colors.red),
                // activeColor: Colors.white,
                // focusColor: Colors.white,
                value: size,
                groupValue: selectedValue,
                onChanged: (value) {
                  countter = index;
                  print("index=$index and Counter=$countter");

                  selectedValue = value!;
                  setState(() {});
                },
              ),
              Center(
                child: Text(
                  "${listsOfText[index]}",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
