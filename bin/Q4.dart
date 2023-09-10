import 'dart:io';

List<String> tasks = [];

void addTask(String title) {
  tasks.add(title);
  print("Task added successfully!");
}

void removeTask(String title) {
  if (tasks.contains(title)) {
    tasks.remove(title);
    print("Task removed successfully!");
  } else {
    print("Task not found!");
  }
}

void viewTasks() {
  if (tasks.isNotEmpty) {
    print("Tasks:");
    tasks.forEach((task) => print("- $task"));
  } else {
    print("No tasks found.");
  }
}

void filterTasksByTitle(String title) {
  List<String> filteredTasks =
      tasks.where((task) => task.contains(title)).toList();
  if (filteredTasks.isNotEmpty) {
    print("Filtered tasks:");
    filteredTasks.forEach((task) => print("- $task"));
  } else {
    print("No tasks found with the provided title.");
  }
}

void main() {
  while (true) {
    print("=====================================================");
    print("Welcome To To-Do List System ");
    print("1. Add Task");
    print("2. Remove Task");
    print("3. View Tasks");
    print("4. Filter Tasks by Title");
    print("q. Quit");

    stdout.write("Your Choise: ");
    String choice = stdin.readLineSync()!;

    if (choice == "1") {
      stdout.write("Enter task title: ");
      String title = stdin.readLineSync()!;
      addTask(title);
    } else if (choice == "2") {
      stdout.write("Enter task title: ");
      String title = stdin.readLineSync()!;
      removeTask(title);
    } else if (choice == "3") {
      viewTasks();
    } else if (choice == "4") {
      stdout.write("Enter task title to filter: ");
      String title = stdin.readLineSync()!;
      filterTasksByTitle(title);
    } else if (choice == "q") {
      print("Goodbye!");
      break;
    } else {
      print("Invalid choice. Please try again.");
    }
  }
}
