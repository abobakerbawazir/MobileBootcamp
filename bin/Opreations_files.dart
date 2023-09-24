import 'dart:convert';
import 'dart:io';

import 'DBFile.dart';

class Opreations{
  //factory Opreations() => _this;
  //late DBfile d = DBfile._();
  saveDB() {
    DBfile databaseItem = DBfile.createObject();
    databaseItem.saveTable("users", {"id": 1,"username":"Abobaker"});
  }
  late List<Map<String, dynamic>> tasks = loadTasks();
  //late List<Map<String, dynamic>> taskss;

  List<Map<String, dynamic>> loadTasks() {
    try {
      final file = File('tasks.json');
      if (file.existsSync()) {
        final contents = file.readAsStringSync();
        return jsonDecode(contents).cast<Map<String, dynamic>>();
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  void saveTasks(List<Map<String, dynamic>> tasks) {
    try {
      final file = File('tasks.json');
      final contents = jsonEncode(tasks);
      file.writeAsStringSync(contents);
    } catch (e) {
      print(e);
    }
  }

  InfoDB(List<Map<String, dynamic>> Tasks) {
    print("Welcome To Do Tasks File :");
    for (var i in Tasks) {
      print({i['title'], i['description']});
    }
  }

  //static final Opreations _this = Opreations._();
  //late List<Map<String, dynamic>> tasks = DBfile;
  void addTask(List<Map<String, dynamic>> tasks) {
    print('Enter a titie task ');
    final title = stdin.readLineSync();
    print('Enter a description task ');
    final description = stdin.readLineSync();
    tasks.add({'title': title, 'description': description});
    print('Add task succesfuly ');
  }

  void removeTask(List<Map<String, dynamic>> tasks) {
    print('Enter index task');
    final index = int.parse(stdin.readLineSync()!);

    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index - 1);
      print('Remove task successfuly');
    } else {
      print('index of task unvalid');
    }
  }

  void viewTasks(List<Map<String, dynamic>> tasks) {
    if (tasks.isEmpty) {
      print('Task is Empty');
    } else {
      print('List of Task : ');
      for (var i = 0; i < tasks.length; i++) {
        final task = tasks[i];
        print('${i + 1}. ${task['title']} - ${task['description']}');
      }
    }
  }

  void filterTasksByTitle(List<Map<String, dynamic>> tasks) {
    print('Enter title taske to searach');
    String title = stdin.readLineSync()!;
    final filteredTasks = tasks
        .where((task) => task['title'].contains(title.toLowerCase()))
        .toList();
    if (filteredTasks.isEmpty) {
      print('No tasks were found with the specified title');
    } else {
      print('Tasks with the specified title : ');
      for (var i = 0; i < filteredTasks.length; i++) {
        final task = filteredTasks[i];
        print('${i + 1}. ${task['title']} - ${task['description']}');
      }
    }
  }
}
