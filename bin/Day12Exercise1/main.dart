import 'classStaff.dart';
import 'classStudent.dart';
import 'classperson.dart';

void main(List<String> args) {
  Person p = Person("w", "as");
  //p.toString();
  print(p.toString());
  Student s = Student("a", "as", "ass", 12, 13.3);
  //s.toString();
  print(s.toString());
  Staff st = Staff("as", "sdg", "asdf", 4.56);
  print(st.toString());
}
