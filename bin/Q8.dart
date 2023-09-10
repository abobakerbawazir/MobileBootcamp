//8- Write a program to accept a filename from the user and print the extension of
//that. Sample filename: abc.java Output: java
import 'dart:io';

void main() {
  stdout.write("Enter a file name : ");
  String filename = stdin.readLineSync()!;
  List<String> parts = filename.split('.');
  print(parts);
  String extension = parts[parts.length - 1];
  print("extension : $extension");
}
