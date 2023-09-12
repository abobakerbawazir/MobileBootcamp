//3) Write a program to create a method that takes an integer as a parameter and throws
//an exception (Custom Exception) if the number is odd.
import 'dart:io';

void checkNumber(int number) {
  if (number % 2 != 0) {
    /*condition for number is ood */
    throw Exception("number is odd,rejected"); /*message Exception*/
  }
}

void main() {
  int number = 11; //varuable from type int and value=11
  try {
    checkNumber(
        number); //checkNumber is function and checkNumber(number) ,number is value for checkNumber function
    print(
        "number is correct"); //print massage number is correct if number is even
  } catch (e) {
    print(e); //print message Exception
  }
}
