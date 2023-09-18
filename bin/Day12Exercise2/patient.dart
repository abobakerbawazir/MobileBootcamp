import 'Person.dart';

class Patient extends person {
  // with birthdate (dd/mm/yyyy), physician name
  late String _birthdate;
  late String _physician_name;

  Patient(
      {required super.id,
      required super.firstname,
      required super.lastname,
      required String birthdate,
      required String physician_name}) {
    this._birthdate = birthdate;
    this._physician_name = physician_name;
    if (this.Id.length != 6) {
      print("Id is required is lenght =6");
    }
  }
  // @override
  // displayinfo() {
  //   // TODO: implement displayinfo
  //   return super.displayinfo()+" birthdate = $_birthdate , Physicial name = $_physician_name";
  // }
}
