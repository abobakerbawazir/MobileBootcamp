

import 'Manager.dart';
import 'Programmer.dart';
/*1- We applied principle Single responsiple Each method has only one action 
2- We applied principle Open_Closed method has ploygramipsm
3- We applied principle Liskov substitution all Any Super class then Conncrete class works*/
class TeamLead extends Programmer implements Manager {
  @override
  void AssignTask() {
    // TODO: implement AssignTask
  }

  @override
  void CreateSubTask() {
    
    // TODO: implement CreateSubTask
  }
  @override
  void WorkOnTask() {
    // TODO: implement WorkOnTask
    super.WorkOnTask();
  }
}
