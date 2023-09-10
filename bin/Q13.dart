//13 - Write a program to sum of the first 5 even integers after user input
import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int userInput = int.parse(stdin.readLineSync()!);

  int sum = 0;
  int count = 0;
  int currentNumber = userInput + 1;

  while (count < 5) {
    if (currentNumber % 2 == 0) {
      sum += currentNumber;
      count++;
    }
    currentNumber++;
  }

  print('The sum of the first 5 even integers after $userInput is: $sum');
}