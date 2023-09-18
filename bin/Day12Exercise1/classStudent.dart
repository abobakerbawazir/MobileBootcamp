import 'classperson.dart';

class Student extends Person {
  late String _program;
  late int _year;
  late double _fee;
  Student(super.name, super.address,this._program,this._year,this._fee);

  String get Program {
    return _program;
  }

 void set Program(String program) {
    this._program = program;
  }

  int get Year {
    return _year;
  }

 void set Year(int year) {
    this._year = year;
  }

  void set Fee(double fee) {
    this._fee = fee;
  }
  double get Fee {
    return _fee;
  }
  @override
  String toString() {
    // TODO: implement toString
    return super.toString()+"$_program , $_year , $_fee";
  }

 
}
