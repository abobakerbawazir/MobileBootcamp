import 'dart:io';

import 'DBFile.dart';
import 'Opreations_files.dart';

void main(List<String> args) async {
  // List<Map<String, dynamic>> tasks = [
  //   {'title': 3, 'description': "Ahmed"}
  // ];
  // DBfile DBf = DBfile();
  Opreations DBf = Opreations();
  DBf.saveDB();

  DBf.loadTasks();
  final listTask = DBf.loadTasks();
  DBf.saveTasks(listTask);
  DBf.InfoDB(listTask);

  while (true) {
    print('==============================================================');
    print('\nWelcome TO-DO-List System');
    print('1.Add Task ');
    print('3.Remove Task ');
    print('3.View Task ');

    print('4. quete');
    stdout.write('your choice : ');

    final choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        DBf.addTask(listTask);
        break;
      case '2':
        DBf.removeTask(listTask);
        break;
      case '3':
        DBf.viewTasks(listTask);
        break;
      case '4':
        print("s");
        return;
      default:
        print('enter right again input is unvalid');
    }
  }
}
