
import 'package:flutter/material.dart';
import 'package:task_1/Exercise3_day28/Todo.dart';


class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  GlobalKey<FormState> To_do_key = GlobalKey();
  List<Todo> todos = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int selectedIndex = -1;

  void addTodo() {
    String title = titleController.text;
    String description = descriptionController.text;

    Todo newTodo = Todo(
      title: title,
      description: description,
    );

    setState(() {
      todos.add(newTodo);
      titleController.clear();
      descriptionController.clear();
    });
  }

  void deleteTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void editTodoAtIndex(int index) {
    setState(() {
      selectedIndex = index;
      Todo todo = todos[index];
      titleController.text = todo.title;
      descriptionController.text = todo.description;
    });
  }

  void updateTodo() {
    if (selectedIndex != -1) {
      String newTitle = titleController.text;
      String newDescription = descriptionController.text;

      setState(() {
        Todo todo = todos[selectedIndex];
        todo.title = newTitle;
        todo.description = newDescription;

        titleController.clear();
        descriptionController.clear();
        selectedIndex = -1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: To_do_key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value!.length < 3) {
                      return "the Title must be at least 3 characters";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value!.length < 10) {
                      return "the Title must at least 10 characters";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  //onPressed: selectedIndex == -1 ? addTodo : updateTodo,
                  onPressed: () {
                    if (To_do_key.currentState!.validate()) {
                      if (selectedIndex == -1) {
                        return addTodo();
                      } else {
                        updateTodo();
                      }
                    }
                  },

                  child: Text(selectedIndex == -1 ? 'Add Todo' : 'Update Todo'),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      Todo todo = todos[index];
                      bool isEditing = selectedIndex == index;

                      return ListTile(
                        title: isEditing
                            ? TextFormField(
                                controller: titleController,
                                decoration: const InputDecoration(
                                  labelText: 'Title',
                                //  hintText: "Enter Your Title...",
                                ),
                              )
                            : Text(todo.title),

                        subtitle: isEditing
                            ? TextFormField(
                                controller: descriptionController,
                                decoration: const InputDecoration(
                                  labelText: 'Description',
                                  // hintText: "Enter Your Description...",
                                ),
                              )
                            : Text(todo.description),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("${index + 1}",style: const TextStyle(fontSize: 20   ,fontWeight: FontWeight.bold),),
                            if (isEditing)
                              //Text("$index"),
                              IconButton(
                                icon: const Icon(Icons.check),
                                onPressed: updateTodo,
                              ),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => editTodoAtIndex(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => deleteTodoAtIndex(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

