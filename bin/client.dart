import 'Person.dart';
import 'pharmacist.dart';

class Client extends Person {
  late String address, Birth_Date;
  Client.person(
      {required super.name,
      required super.mobile,
      required this.address,
      required this.Birth_Date})
      : super.person();

  @override
  displayinformation() {
    print(id);
    print(name);
    print(mobile);
    print(address);
    print(Birth_Date);
    
  }

displayClient(List<Client> m) {
    m.forEach((element) {
      print(element.id);
      print(element.name);
      print(element.mobile);
      print(element.address);
      print(element.Birth_Date);
      
    });
  }
  
}
