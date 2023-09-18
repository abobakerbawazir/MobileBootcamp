import 'classperson.dart';

class Staff extends Person {
  late String _school;
  late double _pay;

  Staff(super.name, super.address,this._school,this._pay);

  String get School {
    return _school;
  }
 void set Scho0l(String school) {
    this._school = school;
  }

  void set Pay(double pay) {
    this._pay = pay;
  }
  double get Pay {
    return _pay;
  }
  
  @override
  String toString() {
    // TODO: implement toString
    return super.toString()+"$_school , $_pay";
  }
  
}
