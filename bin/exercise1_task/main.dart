import 'task.dart';

void main(List<String> args) {
  List<Task> tasks = [];
  Task t = Task("asd", 'asdf');
  Task t1 = Task("123", '1234456gg');
  Task t3 = Task("12as", 'IT and Cs');
  tasks.add(t);
  tasks.add(t1);
  tasks.add(t3);
  tasks.remove(t1);
  //t3.addTask(t3);
  //t2.addTask(t2);

  tasks.forEach((element) {
    print(element.Title + element.Description);
  });
  //print(t.Title + t.Description);
}
