//Hostel السكن
class Hostel {
  late String roomNumber;
  late bool _type;
  List<String> rooms = [];
  String get type {
    if (_type == false) {
      return "booy";
    } else if (_type == true) {
      return  "girl";
    } else {
      return type;
    }
  }
}
