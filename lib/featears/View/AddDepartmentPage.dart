import 'package:day_48_exercise/featears/Controller/ControllerDepartments.dart';
import 'package:day_48_exercise/featears/Model/DepartmentModel.dart';
import 'package:day_48_exercise/featears/View/HomePage.dart';
import 'package:flutter/material.dart';

class AddDepartmentPage extends StatefulWidget {
  const AddDepartmentPage({super.key});

  @override
  State<AddDepartmentPage> createState() => _AddDepartmentPageState();
}

class _AddDepartmentPageState extends State<AddDepartmentPage> {
  int id = 1;
  bool isSelectedIcon = false;
  TextEditingController _controller = TextEditingController();
  late ControllerDepartment controllerDepartment;

  @override
  void didChangeDependencies() {
    controllerDepartment = ControllerDepartment();
    controllerDepartment.listsDep;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //ModalRoute.of(context)!.settings.arguments as List<ModelDepartMent>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Add Department"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(hintText: "Nmae"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Active Department"),
                IconButton(
                    onPressed: () {
                      if (isSelectedIcon == false) {
                        isSelectedIcon = true;
                      } else {
                        isSelectedIcon = false;
                      }
                      setState(() {});
                    },
                    icon: Icon(isSelectedIcon == false
                        ? Icons.check_box_outline_blank
                        : Icons.check_box))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controllerDepartment.addDeparetment("$id", _controller.text);
                  setState(() {});
                  //controllerDepartment.addDeparetment("1", _controller.text);

                  id++;
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     // return HomePage(list: controllerDepartment.listsDep);
                  //   },
                  // ));
                  // Navigator.pushNamed(context, "/",
                  //     arguments: controllerDepartment.listsDep);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
