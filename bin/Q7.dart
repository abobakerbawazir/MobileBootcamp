//7- Write a program which accepts the user's first and last name and print them in
//reverse order with a space between them
import 'dart:io';

void main() {
  stdout.write("Enter your first name : ");
  String firstname = stdin.readLineSync()!;
  stdout.write("Enter your last name : ");
  String lastname = stdin.readLineSync()!;
  String reversname = lastname + " " + firstname;
  print(reversname);
}
