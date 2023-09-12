//Exceptions Part
//1) When we use (~/) notation that’s mean that we return integer division result. if we
//divided number by zero we will get an exception. Try to handle it.
import 'dart:io';

void main() {
  try {
    stdout.write("Enter the number :");//for print Enter the number :
    int input = int.parse(stdin.readLineSync()!);//for user input and int.parse for convert int to string

    print(input ~/ 0);//comand print divided number by zero
  } catch (e) {
    print(e);//to print handle Exceptions  
  }
}