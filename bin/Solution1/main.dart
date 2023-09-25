import 'Manager.dart';

import 'Programmer.dart';
import 'TeamLead.dart';

void main(List<String> args) {
  Manager m = Manager();
  TeamLead t = TeamLead();
  Programmer p = Programmer();
  m.AssignTask();
  m.CreateSubTask();
  t.AssignTask();
  t.CreateSubTask();
  t.WorkOnTask();
  p.WorkOnTask();
}
