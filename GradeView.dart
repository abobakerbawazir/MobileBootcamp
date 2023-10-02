import 'Course.dart';
import 'gradeControler.dart';

class GradeView {
  GrdeControler grdeControler = GrdeControler();
  addGradeRecode() {
    grdeControler.addGradeRecode();
  }

  updateMark({int? id, String? name, double mark = 0.0}) {
    grdeControler.updateMark();
  }
}
