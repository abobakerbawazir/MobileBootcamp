//14- Create a program to construct the following pattern, using nested for loop
//*
//* *
//* * *
//* * * *
//* * * * *

void main() {
  int rows = 5;
  for (int i = 1; i <= rows; i++) {
    for (int j = 1; j <= i; j++) {
      print("* ");
    }
    print("");
  }
}
