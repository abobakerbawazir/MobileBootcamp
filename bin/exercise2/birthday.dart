//"name":"Ahmed","birthday":"2000/11/11"

class Birthdays {
  late String _name;
  late String _birthday;

  Birthdays( this._name, this._birthday);

  String get Nmae {
    return _name;
  }

  void set Name(String name) {
    this._name = name;
  }

  String get Birthday {
    return this._birthday;
  }

  void set Birthday(String birthday) {
    this._birthday = birthday;
  }
}
