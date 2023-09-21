import 'Person.dart';

class Suppliers extends Person {
  late String companyName;
  Suppliers.person(
      {required super.name, required super.mobile, required this.companyName})
      : super.person();

  @override
  displayinformation() {
    print(id);
    print(name);
    print(mobile);
    print(companyName);
  }

   displaySuppliers(List<Suppliers> m) {
    m.forEach((element) {
      print(element.id);
      print(element.name);
      print(element.mobile);
      print(element.companyName);
      
      
    });
  }
}
