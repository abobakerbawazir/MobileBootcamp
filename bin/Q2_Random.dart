//2- You, the user, will have in your head a number between 0 and 100. The program
//will guess a number, and you, the user, will say whether it is too high, too low, or
//your number.
import 'dart:math';
import 'dart:io';

void main() {
  Random random = Random();
  int randomnumber = random.nextInt(50);
  do {
    print("enter your Guessed Number : ");
    int number = int.parse(stdin.readLineSync()!);
    if (number > randomnumber) {
      print("largest");
      continue;
    }
    if (number < randomnumber) {
      print("smallest");
      continue;
    }
    if (number == randomnumber) {
      print("ok, good");
      break;
    }
  } while (true);
}
