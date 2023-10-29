import 'package:mvc_flutter/MVC/Model/OrderModel.dart';
import 'package:mvc_flutter/databaes/DatabaseOB.dart';

class OrderController {
  late Order order;
   List<Order> allOrders=[];
  Future<List<Order>?> fatchOrders() async {
    Database dbObject = Database();
     print(dbObject.cartItems);
    await Future.delayed(Duration(seconds: 5));

    allOrders = dbObject.cartItems.map((e) => Order.fromJson(e)).toList();
    print(allOrders);
    return allOrders;
    //return null;
  }

  bool SaveDB() {
    Database dbObject = Database();
    if (order.id != null &&
        dbObject.cartItems
                .firstWhere((element) => element['id'] == order.id)['id'] ==
            null) return dbObject.insert(order.toJson());

    return false;
  }
}
