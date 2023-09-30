import 'CourseModel.dart';

class StudentModel {
  static int lastid = 0;
  late int id;
  late double feespaid;
  //late double feesPaid;

  late String name;
  late double fees;
  StudentModel() {
    lastid++;
    id = lastid;
  }
}
