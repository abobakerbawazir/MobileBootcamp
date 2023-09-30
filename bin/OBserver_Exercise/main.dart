import 'CoffreMaker.dart';
import 'Notification.dart';

void main(List<String> args) {
  CoffreMaker coffreMaker = CoffreMaker();
  
  coffreMaker.addOBserver(
      obServer: Notification(
          message: "Coffee`s done!", timestamp: DateTime.now(), name: "Tyler"));
  coffreMaker.addOBserver(
      obServer: Notification(
          message: "Coffee`s done!", timestamp: DateTime.now(), name: "Kate"));
  coffreMaker.prepareCoffee();
  // Notification notification = Notification(
  // message: "Coffee`s done!", timestamp: DateTime.now(), name: "Tyler");
  // coffreMaker.addOBserver(obServer: notification);

  // coffreMaker.removeOBserver(obServer: notification);
  // coffreMaker.prepareCoffee();
}
