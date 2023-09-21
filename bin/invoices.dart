import 'dart:math';

import 'Medicine.dart';
import 'invoiceofdeatiles.dart';

class Invoise {
  // late double totalamont;
  late double omunt;
  List<Invoice_details> x = [];
  // late int quantity;
  // late double price;
  //List<Medicine> m = [];
  late int id;
  //List<Invoice_details> l = [];

  Invoise({required this.x}) {
    Random r = Random();
    this.id = r.nextInt(1000) + 1;
  }
  // addInvoice(List<Invoice_details> l) {
  //   double toatalamount = 0;
  //   double total = 0;
  //   l.forEach((element) {
  //     print(element.Quantity);
  //     element.m.forEach((element) {
  //       double total = 0;
  //       print(element.unitPrice);
  //       print(element.name);
  //       total += element.unitPrice;
  //     });
  //     print(total);

  //     total *= 1;
  //     toatalamount += total;
  //   });
  //   print(total);
  //   print(toatalamount);
  // }

  invouseInfo(List<Invoise> i) {
    i.forEach((element) {
      double c = 0;
      element.x.forEach((element) {
        c += element.Toatl;
      });
      print(c);
      if(c>=4000){}
    });
  }
}
