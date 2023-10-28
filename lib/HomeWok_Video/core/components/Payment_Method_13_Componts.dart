// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:video/HomeWok_Video/features/Controller/ControllerPayment_13/ControllerPayment_13.dart';

class Payment_Method_13_Componts extends StatefulWidget {
  Payment_Method_13_Componts({
    super.key,
  });

  @override
  State<Payment_Method_13_Componts> createState() =>
      _Payment_Method_13_CompontsState();
}

class _Payment_Method_13_CompontsState
    extends State<Payment_Method_13_Componts> {
  ControllerPayment_13_model controllerPayment_13_model =
      ControllerPayment_13_model();

  late String selectedValue;
  //late List<Payment_13_model> x; // List<NameItems> list = [
  //   NameItems(nmae: "nmaef"),
  //   NameItems(nmae: "nmaed"),
  //   NameItems(nmae: "nmae")
  // ];
  @override
  void initState() {
    controllerPayment_13_model.list;
    selectedValue = controllerPayment_13_model.list[0].title;
    //selectedValue = list[0].nmae;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(controllerPayment_13_model.list.length, (index) {
        final size = controllerPayment_13_model.list[index].title;
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Radio<String>(
                value: size,
                groupValue: selectedValue,
                onChanged: (value) {
                  selectedValue = value!;
                  setState(() {});
                },
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text("${controllerPayment_13_model.list[index].title}"),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${controllerPayment_13_model.list[index].subtitle}"),
                ],
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: Image.asset(
                          "${controllerPayment_13_model.list[index].image_path}")),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: Colors.white,
            )
          ],
        );

        // return Column(
        //   children: [
        //     Radio<String>(
        //       value: size,
        //       groupValue: selectedValue,
        //       onChanged: (value) {
        //         selectedValue = value!;
        //         setState(() {});
        //       },
        //     ),
        //     Text(
        //       "${controllerPayment_13_model.list[index].title}",
        //       style: TextStyle(fontSize: 10),
        //     ),
        //   ],
        // );
      }),
    );
  }
}
