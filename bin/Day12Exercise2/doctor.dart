import 'Person.dart';

class Doctor extends person {
  late String _specialty;
  Doctor(
      {required super.id,
      required super.firstname,
      required super.lastname,
      required String specialty}) {
    this._specialty = specialty;
    }

    @override
  displayinfo() {
    // TODO: implement displayinfo
    return super.displayinfo()+" specialty =$_specialty";
  }
}
