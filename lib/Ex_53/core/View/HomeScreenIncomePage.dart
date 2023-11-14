import 'package:day_53/Ex_53/core/ViewModels/NotiferModel.dart';
import 'package:day_53/Ex_53/core/models/IncomeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreenIncomePage extends StatefulWidget {
  const HomeScreenIncomePage({super.key});

  @override
  State<HomeScreenIncomePage> createState() => _HomeScreenIncomePageState();
}

class _HomeScreenIncomePageState extends State<HomeScreenIncomePage> {
  var listitems = ["Increase", "Descrise"];
  String? type;
  late NotifierModel notifierModel = NotifierModel();
  TextEditingController operatortxt = TextEditingController();
  TextEditingController amounttxt = TextEditingController();
  GlobalKey formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("aqlite CRUD"),
        backgroundColor: Colors.purple,
      ),
      body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ListTile(
                            title: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [Text("70"), Text("Expenses")],
                              ),
                            ),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ListTile(
                              title: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [Text("70"), Text("Income")],
                            ),
                          )))
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: FutureBuilder(
                    future: notifierModel.fetchAllIncome(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Column(
                                  children: [IconButton(onPressed: () {
                                    
                                  }, icon: Icon(Icons.edit)),
                                    IconButton(
                                            onPressed: () async {setState(() {
                                              
                                            });
                                              await notifierModel.deleteIncome(
                                                  snapshot.data![index].id!);
                                            },
                                            icon: Icon(Icons.delete)),
                                  ],
                                ),
                                trailing: Text("${snapshot.data![index].id}"),
                                title: Text(snapshot.data![index].opreator!),
                                
                                subtitle:
                                    Text("${snapshot.data![index].amount}"),
                              );
                            },
                          );
                        }
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(
                //         builder: (context) {
                //           return HomeScreenIncomePage1();
                //         },
                //       ));
                //     },
                //     child: Text("go page"))
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
           await showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        controller: amounttxt,
                      ),
                      TextFormField(
                        readOnly: true,

                        // keyboardType: TextInputType.number,
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly
                        // ],
                        controller: operatortxt,
                      ),
                      DropdownButton(
                        value: type,
                        items: listitems.map((String items) {
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        onChanged: (String? newvalue) {
                          type = newvalue;
                          //operatortxt.text = type!;
                          if (type == "Increase") {
                            operatortxt.text = "+";
                          } else {
                            operatortxt.text = "-";
                          }

                          setState(() {});
                        },
                      )
                      // DropdownButton<String>(
                      //   items: <String>["Increase", "Descrise"]
                      //       .map((String value) {
                      //     return DropdownMenuItem<String>(
                      //       child: Text(value),
                      //       value: value,
                      //     );
                      //   }).toList(),
                      //   onChanged: (v) {
                      //     amounttxt.text = v!;
                      //     v = type;
                      //   },
                      // ),

                      ,
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple),
                          onPressed: () async {
                            // setState(() {});
                            IncomeModel incomeModel = IncomeModel(
                                opreator: operatortxt.text,
                                amount: int.parse(amounttxt.text));
                            int res =
                                await notifierModel.saveIncome(incomeModel);
                            String msg = '';
                            if (res > 0)
                              msg = "row insert";
                            else
                              msg = " an erroe";
                            setState(() {});

                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(msg)));
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return HomeScreenIncomePage1();
                            //   },
                            // ));
                          },
                          child: Text("Create New"))
                    ],
                  ));
            },
          );
          // setState(() {});
          // IncomeModel incomeModel = IncomeModel(
          //     opreator: operatortxt.text, amount: int.parse(amounttxt.text));
          // int res = await notifierModel.saveIncome(incomeModel);
          // String msg = '';
          // if (res > 0)
          //   msg = "row insert";
          // else
          //   msg = " an erroe";
          // setState(() {});

          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(msg)));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomeScreenIncomePage1 extends StatefulWidget {
  HomeScreenIncomePage1({super.key});

  @override
  State<HomeScreenIncomePage1> createState() => _HomeScreenIncomePage1State();
}

class _HomeScreenIncomePage1State extends State<HomeScreenIncomePage1> {
  NotifierModel notifierModel = NotifierModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: notifierModel.fetchAllIncome(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: Text("${snapshot.data![index].id}"),
                    title: Text(snapshot.data![index].opreator!),
                    subtitle: Text("${snapshot.data![index].amount}"),
                  );
                },
              );
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
