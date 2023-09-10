//6 - Write a program which accepts the radius of a circle from the user and compute
//the area
import 'dart:io';

void main() {
  stdout.write("Enter a radius of a circle :");
  double radius = double.parse(stdin.readLineSync()!);
  double area = 3.14 * radius * radius;
  print("area of circle = $area");
}
