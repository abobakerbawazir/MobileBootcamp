import 'dart:convert';
import 'dart:io';

void main() {
  final bookstore = loadbookstore();
  //viewbookstore(bookstore);
  while (true) {
    print('\n********Welcome to BookStore Application**************');
    print('1. View Books');
    print('2. Add Book');
    print('3. Remove Book');
    print('4. Search Books');
    print('5. Add To Shopping Cart');
    print('6. Manage Shopping Cart');
    print('3.View Task ');
    print('7. Confirm Payment');
    print('3.View Task ');
    print('9. Get Details of One book');
    print('q. Exit');
    stdout.write('your choice : ');

    final choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        viewbookstore(bookstore);
        break;
      case '2':
        addBook(bookstore);
        break;
      case '3':
        removebook(bookstore);
        break;
      case '4':
        searcbook(bookstore);
        break;
      case '9':
        detailsonebook(bookstore);
        break;

      case 'q':
        detailsonebook(bookstore);
        return;

      default:
        print('enter right again input is unvalid');
    }
  }
}

//Load the contents from "birthdays.json" file and convert them into a list of maps
List<Map<String, dynamic>> loadbookstore() {
  try {
    final file = File('bookData-5.json');
    if (file.existsSync()) {
      final contents = file.readAsStringSync();
      return jsonDecode(contents).cast<Map<String, dynamic>>();
    }
  } catch (e) {
    print(e);
  }
  return [];
}

//Save the data to a file "birthdays.json"
void saveBirthdays(List<Map<String, dynamic>> birthdaysData) {
  try {
    final file = File('bookData-5.json');
    final contents = jsonEncode(birthdaysData);
    file.writeAsStringSync(contents);
  } catch (e) {
    print(e);
  }
}

void savebookstore(List<Map<String, dynamic>> bookstore) {
  try {
    final file = File('bookData-5.json');
    final contents = jsonEncode(bookstore);
    file.writeAsStringSync(contents);
  } catch (e) {
    print(e);
  }
}

// view book
void viewbookstore(List<Map<String, dynamic>> bookstore) {
  if (bookstore.isEmpty) {
    print('Task is Empty');
  } else {
    for (var i = 0; i < bookstore.length; i++) {
      final task = bookstore[i].cast();
      print(
          "[Book ${i + 1}] (${task['id']}) - ${task['name']} - ${task['author']} - ${task['category']} - ${task['price']} - ${task['quantity']}");
    }
  }
}

//Add task
void addBook(List<Map<String, dynamic>> bookstore) {
  stdout.write('Enter a id ');
  final id = stdin.readLineSync();
  stdout.write('Enter a name book ');
  final name = stdin.readLineSync();
  stdout.write('enter Book Author :');
  final author = stdin.readLineSync();
  stdout.write('Enter a description task ');
  final category = stdin.readLineSync();
  stdout.write('Enter a titie task ');
  final price = stdin.readLineSync();
  stdout.write('Enter a description task ');
  final quantity = stdin.readLineSync();

  bookstore.add({
    'title': id,
    'description': name,
    'author': author,
    'category': category,
    'price': price,
    'quantity': quantity
  });
  print('Add task succesfuly ');
}

// remove book
void removebook(List<Map<String, dynamic>> bookstore) {
  print('Enter index task');
  final index = int.parse(stdin.readLineSync()!);

  if (index >= 0 && index < bookstore.length) {
    bookstore.removeAt(index - 1);
    print('Remove task successfuly');
  } else {
    print('index of task unvalid');
  }
}

//search book of name
void searcbook(List<Map<String, dynamic>> bookstore) {
  print('Enter name book to searach');
  String name = stdin.readLineSync()!;
  final serchTbook = bookstore
      .where((task) => task['name'].contains(name.toLowerCase()))
      .toList();
  if (serchTbook.isEmpty) {
    print('is empty');
  } else {
    print('book information  : ');
    for (var i = 0; i < serchTbook.length; i++) {
      final task = serchTbook[i];
      print(
          "${i + 1}. ${task['id']} - ${task['name']} - ${task['author']} - ${task['category']} - ${task['price']} - ${task['quantity']}");
    }
  }
}

//9  Display one book details
void detailsonebook(List<Map<String, dynamic>> bookstore) {
  stdout.write("Enter Book Number / ID :");
  var input = int.parse(stdin.readLineSync()!);
  print(bookstore[input]);
  
  
}
