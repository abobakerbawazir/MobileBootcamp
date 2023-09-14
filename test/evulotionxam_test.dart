//Exercise 2
//To-do Application File version

import 'dart:io';
import 'dart:convert';

void main() {
  final tasks = loadTasks();

  while (true) {
    print('==============================================================');
    print('\n********Welcome to BookStore Application**************');
    print('1.Add Task ');
    print('2.Remove Task ');
    print('3.View Task ');
    print('4.Filter Tasks based on Title ');
    print('5. quete');
    print('5. Add To Shopping Cart');
    print('6. Manage Shopping Cart');
    print('7. Confirm Payment');
    print('9. Get Details of One book');
    print('q. Exit');
    stdout.write('your choice : ');

    final choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        addTask(tasks);
        break;
      case '2':
        removeTask(tasks);
        break;
      case '3':
        viewTasks(tasks);
        break;
      case '4':
        filterTasksByTitle(tasks);
        break;
      case '5':
        saveTasks(tasks);
        return;
      default:
        print('enter right again input is unvalid');
    }
  }
}

List<Map<String, dynamic>> loadTasks() {
  try {
    final file = File('bookData-5.json');
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      return jsonDecode(contents);
    }
  } catch (e) {
    print(e);
  }
  return [];
}

void saveTasks(List<Map<String, dynamic>> tasks) {
  try {
    final file = File('bookData-5.json');
    final contents = jsonEncode(tasks);
    file.writeAsStringSync(contents);
  } catch (e) {
    print(e);
  }
}

void addTask(List<Map<String, dynamic>> tasks) {
  print('Enter a id ');
  final id = stdin.readLineSync();
  print('Enter a description task ');
  final description = stdin.readLineSync();
  tasks.add({'id': id, 'description': description});
  print('Add task succesfuly ');
}

void removeTask(List<Map<String, dynamic>> tasks) {
  print('Enter index task');
  final index = int.parse(stdin.readLineSync()!);

  if (index >= 0 && index < tasks.length) {
    tasks.removeAt(index-1);
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
      print("[Book ${i + 1}] (${task['id']}) - ${task['name']} - ${task['author']} - ${task['category']} - ${task['price']} - ${task['quantity']}");
    }
  }
}

void filterTasksByTitle(List<Map<String, dynamic>> tasks) {
  print('Enter title taske to searach');
  String title = stdin.readLineSync()!;
  final filteredTasks = tasks
      .where(
          (task) => task['title'].contains(title.toLowerCase()))
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
