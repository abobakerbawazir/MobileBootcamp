class Person {
  late String _name;
  late String _address;
  Person(this._name, this._address);

  // set Name(String name) {
  //   this._name = name;
  // }

  String get Name {
    return _name;
  }

  String get Address {
    return _address;
  }

  void set Address(String address) {
    this._name = address;
  }

  @override
  String toString() {
    
    // TODO: implement toString
    return "$_name , $_address ,";
  }
}
