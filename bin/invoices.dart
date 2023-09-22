import 'dart:math';

import 'Medicine.dart';
import 'client.dart';
import 'invoiceofdeatiles.dart';

class Invoise {
  List<Client>y=[];
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
  ////
  ///
  // Search for invoices for client 1 and with Medicine 1 name
  invoicesforclient1andwithMedicine1name(List<Invoise> ii){
    ii.where((element) => element.x.any((element) => 
    element.Name=="Medicine 1"));
    print('Invoices for Client 1 with Medicine 1:');
    for(var i in y){
      i.displayinformation();
      print("");
    }
  }
  
 
}
