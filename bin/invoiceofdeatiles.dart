import 'dart:math';

import 'Medicine.dart';

class Invoice_details {
  late String _name;
  late int _quantity;
  late double _price;
  late double _total;
  //List<Medicine> m = [];
  late int id;

  Invoice_details() {
    Random r = Random();
    this.id = r.nextInt(1000) + 1;
  }
  double get Price {
    return this._price;
  }

  void set Price(double price) {
    this._price = _price;
  }

  int get Quantity {
    return this._quantity;
  }

  void set Quantity(int quantity) {
    this._quantity = quantity;
  }

  double get Toatl {
    return this._total;
  }

  void set Total(double total) {
    this._total = Quantity * Price;
  }
  String get Name {
    return this._name;
  }

  void set Name(String name) {
    this._name = name;
  }
}
