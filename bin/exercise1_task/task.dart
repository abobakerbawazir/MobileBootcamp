class Task {
  late String _title, _description;
  //List<Task> tasks = [];

  Task(this._title, this._description);

  String get Title {
    return _title;
  }

  void set Title(String title) {
    this._title = title;
  }

  //
  String get Description {
    return _description;
  }

  void set Description(String description) {
    this._description = description;
  }

  //
  // void addTask(Task task) {
  //   tasks.add(task);

  //   print("tasks added successfully");
  // }

  // void removeTask(Task task) {
  //   tasks.remove(task);

  //   print("tasks Remove task successfully");
  // }
}
