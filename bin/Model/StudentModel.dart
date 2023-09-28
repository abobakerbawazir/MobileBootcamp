class StudentModel {
  static int lastid = 0;
  late int id;

  late String name;
  StudentModel() {
    lastid++;
    id = lastid;
  }
}
