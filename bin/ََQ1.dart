/* Exercise 1
For this exercise, we will keep track of when user friend’s birthdays are, and be able to find that 
information based on their name. */

import 'dart:convert';
import 'dart:io';

void main() {
  /* 1) Create a List of Maps (in birthdays.json file ) with name and birthday key’s (at least 3 items). When 
you run your program must load the file content in list and display it for user. */

  //Load the contents from "birthdays.json" file and convert them into a list of maps , i am Call function loadBirthdays()
  List<Map<String, dynamic>> birthdaysData = loadBirthdays();

/* 2) let the user choose the filtering criteria , filtering based on the name (part of it) or based on 
year(part of it), and return the birthdays to him/her. */
  //Print a popular welcome message with the names of friends on the list
  print("Welcome to the Birthday Program. We know the birthdays of friends :");
  for (var friend in birthdaysData) {
    print(friend['name']);
  }

  /* 3) Loop this action until user enter q for quiet */
  // Create a loop that asks the user the name of the friend to search for his or her birthday
  while (true) {
    print("\n=========================================================================");
    stdout.write(
        "Who's birthday do you want to look up? (Enter 'q' to quit) : ");
    var name = stdin.readLineSync();

    // If the user enters 'q' then the loop ends or finish of loop
    if (name == 'q') {
      break;
    }

    var found = false;
    //Check if the entered name is present in the list and if so print the corresponding date of birth
    for (var friend in birthdaysData) {
      var friendName = friend['name'].toString().toLowerCase();
      var searchName = name!.toLowerCase();
      if (friendName.contains(searchName)) {
        print("${friend['name']}'s birthday is ${friend['birthday']}.");
        found = true;
        break;
      }
    }

    // If the name is not found in the list, print a message stating that the name does not exist or Name not found
    if (!found) {
      print("Name not found.");
    }
  }

  /* 4) Ask the user for another name and birthday to add to the list. As well as you will refresh your file. 
Tolerate with your file as database */
//Request a new name and date of birth to be added to the list =>"birthdaysData"
  stdout.write("\nEnter another name and birthday to add to the list: ");
  try {
    var name = stdin.readLineSync()!;
    var birthday = stdin.readLineSync()!;
    birthdaysData.add({'name': name, 'birthday': birthday});
  } catch (e) {
    print(e);
  }

  //Save the updated data to a file "birthdays.json"
  saveBirthdays(birthdaysData);
}

/* 1) Create a List of Maps (in birthdays.json file ) with name and birthday key’s (at least 3 items). When 
you run your program must load the file content in list and display it for user. */

//Load the contents from "birthdays.json" file and convert them into a list of maps
List<Map<String, dynamic>> loadBirthdays() {
  try {
    final file = File('birthdays.json');
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
    final file = File('birthdays.json');
    final contents = jsonEncode(birthdaysData);
    file.writeAsStringSync(contents);
  } catch (e) {
    print(e);
  }
}
