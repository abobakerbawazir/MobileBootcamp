import 'Person.dart';
import 'bill.dart';
import 'doctor.dart';
import 'patient.dart';

void main(List<String> args) {
  person p = person(id: "1234as", firstname: "Ali", lastname: "Salem");
  p.displayinfo();
  print(p.displayinfo());
  Doctor d = Doctor(
      id: "asdfgg",
      firstname: "ahmed",
      lastname: "bawazer",
      specialty: "canser");
  print(d.displayinfo());
  Patient pa = Patient(
      id: "ASDFGH",
      firstname: "omer",
      lastname: "bin meenif",
      birthdate: "14/11/2019",
      physician_name: "sofian");

  Bill bi = Bill(
      doctorFees: 34, pharmacyChargesFees: 40, roomRentFees: 50, discount: 30);
  print(bi.displayinfoBill());
  (bi.getBillTotalAmount(60));
}
