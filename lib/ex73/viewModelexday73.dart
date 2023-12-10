import 'package:day73/ex73/ModelProduct.dart';
import 'package:flutter/foundation.dart';

class VMProfider with ChangeNotifier {
  VMProfider() {
    //changeIcon;
  }
  List<Product> _allproductsPageOne = [];
  List<Product> _allproductsPageTow = [
    Product(title: 'SAR', price: 350, isSelected: false),
    Product(title: 'US', price: 1580, isSelected: false),
    Product(title: 'EURO', price: 400, isSelected: false),
  ];
  // List<dynamic> _allproducts = [
  //   {"title": "SAR", "price": 350, "isSelected": false},
  //   {"title": "US", "price": 1580, "isSelected": false},
  //   {"title": "EURO", "price": 400, "isSelected": false}
  // ];
  //List<dynamic> _allproductstow = [];
  List<Product> get allproductsPageOne => _allproductsPageOne;
  List<Product> get allproductsPageTow => _allproductsPageTow;

  //List<dynamic> get allproductstow => _allproductstow;
  //List<dynamic> get allproducts => _allproducts;

  bool _isDisable = false;
  set isDisable(bool x) {
    if (_allproductsPageOne.length > 0) {
      x = false;
      _isDisable = x;
     
    } else {
      x = true;
      _isDisable = x;
      
    }
    // _isDisable = x;

    notifyListeners();
  }

  bool get isDisable => _isDisable;

  int _number = 0;
  set number(int x) {
    x = _allproductsPageOne.length;
    _number = x;
    notifyListeners();
  }

  int get number => _number;
  changeIcon(int index) {
    if (_allproductsPageTow[index].isSelected == false) {
      _allproductsPageTow[index].isSelected = true;
      _allproductsPageOne.add(_allproductsPageTow[index]);
      notifyListeners();
    } else {
      _allproductsPageTow[index].isSelected = false;
      _allproductsPageOne.remove(_allproductsPageTow[index]);
      notifyListeners();
    }
  }

  
}
