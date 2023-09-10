//11 - Write a program to test whether a passed letter is a vowel or not
import 'dart:io';

void main() {
  stdout.write("enter the letter : ");
  String letter = stdin.readLineSync()!.toLowerCase();
  if (letter == "a" ||
      letter == "e" ||
      letter == "i" ||
      letter == "o" ||
      letter == "u") {
    print(" $letter letter is a vowel");
    
  }else{
    print(" $letter letter is not a vowel");
  }
}
