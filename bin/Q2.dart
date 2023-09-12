/*2) Write function that accept the user age as a required named parameter. if the passed
age under 0 just throw an exception and display message that says : “Age Can’t be
Negative”*/
import 'dart:io';

//checkOfage is function accepts the user age as a required named parameter
void checkOfage({required int age}) {
  if (age < 0) {
    //condition age < 0 to check age less than zero
    throw Exception(
        "Age Can’t be Negative"); //age < 0 Exception with print mesaage Age Can’t be Negative
  } else {
    print("Age is correct"); //else print Age is correct
  }
}

void main() {
  try {
    //to handle exception
    stdout.write(
        "Please, Enter your age : "); //print Please, Enter your age : in same line to input user
    int input = int.parse(stdin
        .readLineSync()!); //input of user & int.parse ,convert String to int
    checkOfage(
        age:
            input); //checkOfage(age: input) ,age:input , beacuse age is required
  } catch (e) {
    print(e); //print exception
  }
}
