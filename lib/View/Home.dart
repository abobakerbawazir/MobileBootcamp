import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvc_flutter/MVC/Controller/OrderController.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late OrderController _orderController;
  @override
  void initState() {
    _orderController = OrderController();
    //_orderController.fatchOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: _orderController.fatchOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //  return ListView.builder(
            //     itemCount: _orderController.allOrders.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         child: Column(
            //           children: [
            //             Row(
            //               children: [
            //                 Text("${_orderController.allOrders[index].totalProducts}")
            //               ],
            //             )
            //           ],
            //         ),
            //       );
            //     },
            //   );
            //return Center(child: Container(width: 100,height: 100,color: Colors.red,),);
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("${snapshot.data![index].id}")
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }
             else {
              return Center(
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
